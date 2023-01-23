#ifndef INTERRUPT_MANAGER_H
#define INTERRUPT_MANAGER_H

#define INTERRUPT_GlobalInterruptEnable() (INTCON0bits.GIE = 1)

#define INTERRUPT_GlobalInterruptDisable() (INTCON0bits.GIE = 0)

#define INTERRUPT_PeripheralInterruptEnable() (INTCON0bits.PEIE = 1)

#define INTERRUPT_PeripheralInterruptDisable() (INTCON0bits.PEIE = 0)


#endif 