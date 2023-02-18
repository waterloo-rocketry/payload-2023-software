#include <xc.h>

//SPI module config
void spi_init(){

    SPI1CON0bits.EN = 0; //Turn off the SPI module to change config
   
    SPI1INTE = 0x00; //disable SPI interrupts - we have a hardware interrupt for CAN Rx
    
     //Set SCK freq = base clock = 12 MHz (1:1 prescaler)
     SPI1CLK = 0;
     SPI1BAUD = 0x00;
    
    SPI1CON0bits.LSBF = 0; //Send most significant bit first
    SPI1CON0bits.MST = 1; //This is the SPI bus master device
    
    //MCP2515 supports either 0,0 or 1,1 clock settings. We use 0,0 arbitrarily
     SPI1CON1bits.CKP = 0; // Idle state for SCK is low level
     SPI1CON1bits.CKE = 0; // Output data changes on transition from active to idle clock state
    
     SPI1CON0bits.EN = 1; //Turn SPI module on again
    
    
    //Set SPI pins
     TRISC1 = 0; //CS pin as output
     TRISC2 = 0; //MOSI pin as output
     TRISC3 = 0; //SCK pin as output
     TRISC4 = 1; //MISO as input
     
    //bits 0->2 of ANSELC need to be low
     ANSELC &= ~(0x07);
     
     //SPI module has a Slave Select function but I'm not using it for now
     //We just treat CS as a GPIO and let canlib drive it
     RC2PPS = 0b011111; //Set pin C2 as SDO (MOSI)
     RC3PPS = 0b011110; //Set pin C3 as SCK
     SPI1SDIPPS = 0b10100; //Set pin C4 as SDI (MISO)
}
