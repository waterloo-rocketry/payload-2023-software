#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-default.mk)" "nbproject/Makefile-local-default.mk"
include nbproject/Makefile-local-default.mk
endif
endif

# Environment
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=default
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/kalman_board.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/kalman_board.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

ifeq ($(COMPARE_BUILD), true)
COMPARISON_BUILD=-mafrlcsj
else
COMPARISON_BUILD=
endif

ifdef SUB_IMAGE_ADDRESS

else
SUB_IMAGE_ADDRESS_COMMAND=
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=canlib/util/can_rcv_buffer.c canlib/util/can_tx_buffer.c canlib/util/safe_ring_buffer.c canlib/util/timing_util.c canlib/can_common.c ../src/config/default/peripheral/can/plib_can2.c ../src/config/default/peripheral/clk/plib_clk.c ../src/config/default/peripheral/evic/plib_evic.c ../src/config/default/peripheral/gpio/plib_gpio.c ../src/config/default/peripheral/uart/plib_uart6.c ../src/config/default/stdio/xc32_monitor.c ../src/config/default/exceptions.c ../src/config/default/initialization.c ../src/config/default/interrupts.c ../src/main.c kalman_lib/data.c kalman_lib/gps_conversion.c kalman_lib/kalman_lib.c kalman_lib/orientation_conversion.c ../src/config/default/peripheral/tmr/plib_tmr2.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/canlib/util/can_rcv_buffer.o ${OBJECTDIR}/canlib/util/can_tx_buffer.o ${OBJECTDIR}/canlib/util/safe_ring_buffer.o ${OBJECTDIR}/canlib/util/timing_util.o ${OBJECTDIR}/canlib/can_common.o ${OBJECTDIR}/_ext/60165182/plib_can2.o ${OBJECTDIR}/_ext/60165520/plib_clk.o ${OBJECTDIR}/_ext/1865200349/plib_evic.o ${OBJECTDIR}/_ext/1865254177/plib_gpio.o ${OBJECTDIR}/_ext/1865657120/plib_uart6.o ${OBJECTDIR}/_ext/163028504/xc32_monitor.o ${OBJECTDIR}/_ext/1171490990/exceptions.o ${OBJECTDIR}/_ext/1171490990/initialization.o ${OBJECTDIR}/_ext/1171490990/interrupts.o ${OBJECTDIR}/_ext/1360937237/main.o ${OBJECTDIR}/kalman_lib/data.o ${OBJECTDIR}/kalman_lib/gps_conversion.o ${OBJECTDIR}/kalman_lib/kalman_lib.o ${OBJECTDIR}/kalman_lib/orientation_conversion.o ${OBJECTDIR}/_ext/60181895/plib_tmr2.o
POSSIBLE_DEPFILES=${OBJECTDIR}/canlib/util/can_rcv_buffer.o.d ${OBJECTDIR}/canlib/util/can_tx_buffer.o.d ${OBJECTDIR}/canlib/util/safe_ring_buffer.o.d ${OBJECTDIR}/canlib/util/timing_util.o.d ${OBJECTDIR}/canlib/can_common.o.d ${OBJECTDIR}/_ext/60165182/plib_can2.o.d ${OBJECTDIR}/_ext/60165520/plib_clk.o.d ${OBJECTDIR}/_ext/1865200349/plib_evic.o.d ${OBJECTDIR}/_ext/1865254177/plib_gpio.o.d ${OBJECTDIR}/_ext/1865657120/plib_uart6.o.d ${OBJECTDIR}/_ext/163028504/xc32_monitor.o.d ${OBJECTDIR}/_ext/1171490990/exceptions.o.d ${OBJECTDIR}/_ext/1171490990/initialization.o.d ${OBJECTDIR}/_ext/1171490990/interrupts.o.d ${OBJECTDIR}/_ext/1360937237/main.o.d ${OBJECTDIR}/kalman_lib/data.o.d ${OBJECTDIR}/kalman_lib/gps_conversion.o.d ${OBJECTDIR}/kalman_lib/kalman_lib.o.d ${OBJECTDIR}/kalman_lib/orientation_conversion.o.d ${OBJECTDIR}/_ext/60181895/plib_tmr2.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/canlib/util/can_rcv_buffer.o ${OBJECTDIR}/canlib/util/can_tx_buffer.o ${OBJECTDIR}/canlib/util/safe_ring_buffer.o ${OBJECTDIR}/canlib/util/timing_util.o ${OBJECTDIR}/canlib/can_common.o ${OBJECTDIR}/_ext/60165182/plib_can2.o ${OBJECTDIR}/_ext/60165520/plib_clk.o ${OBJECTDIR}/_ext/1865200349/plib_evic.o ${OBJECTDIR}/_ext/1865254177/plib_gpio.o ${OBJECTDIR}/_ext/1865657120/plib_uart6.o ${OBJECTDIR}/_ext/163028504/xc32_monitor.o ${OBJECTDIR}/_ext/1171490990/exceptions.o ${OBJECTDIR}/_ext/1171490990/initialization.o ${OBJECTDIR}/_ext/1171490990/interrupts.o ${OBJECTDIR}/_ext/1360937237/main.o ${OBJECTDIR}/kalman_lib/data.o ${OBJECTDIR}/kalman_lib/gps_conversion.o ${OBJECTDIR}/kalman_lib/kalman_lib.o ${OBJECTDIR}/kalman_lib/orientation_conversion.o ${OBJECTDIR}/_ext/60181895/plib_tmr2.o

# Source Files
SOURCEFILES=canlib/util/can_rcv_buffer.c canlib/util/can_tx_buffer.c canlib/util/safe_ring_buffer.c canlib/util/timing_util.c canlib/can_common.c ../src/config/default/peripheral/can/plib_can2.c ../src/config/default/peripheral/clk/plib_clk.c ../src/config/default/peripheral/evic/plib_evic.c ../src/config/default/peripheral/gpio/plib_gpio.c ../src/config/default/peripheral/uart/plib_uart6.c ../src/config/default/stdio/xc32_monitor.c ../src/config/default/exceptions.c ../src/config/default/initialization.c ../src/config/default/interrupts.c ../src/main.c kalman_lib/data.c kalman_lib/gps_conversion.c kalman_lib/kalman_lib.c kalman_lib/orientation_conversion.c ../src/config/default/peripheral/tmr/plib_tmr2.c



CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

.build-conf:  ${BUILD_SUBPROJECTS}
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-default.mk ${DISTDIR}/kalman_board.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=32MZ2048EFM144
MP_LINKER_FILE_OPTION=,--script="..\src\config\default\p32MZ2048EFM144.ld"
# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assembleWithPreprocess
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/canlib/util/can_rcv_buffer.o: canlib/util/can_rcv_buffer.c  .generated_files/flags/default/93f07496345eeafa064ec5e8b87db7725225344b .generated_files/flags/default/21e5712e9da6f15e7f2c3a93091791477ef2790
	@${MKDIR} "${OBJECTDIR}/canlib/util" 
	@${RM} ${OBJECTDIR}/canlib/util/can_rcv_buffer.o.d 
	@${RM} ${OBJECTDIR}/canlib/util/can_rcv_buffer.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -DBOARD_UNIQUE_ID=0x11 -I"../src" -I"../src/config/default" -Wall -MP -MMD -MF "${OBJECTDIR}/canlib/util/can_rcv_buffer.o.d" -o ${OBJECTDIR}/canlib/util/can_rcv_buffer.o canlib/util/can_rcv_buffer.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/canlib/util/can_tx_buffer.o: canlib/util/can_tx_buffer.c  .generated_files/flags/default/cad7d7da9d4c148cc1f6a4fd244cebe1eab677de .generated_files/flags/default/21e5712e9da6f15e7f2c3a93091791477ef2790
	@${MKDIR} "${OBJECTDIR}/canlib/util" 
	@${RM} ${OBJECTDIR}/canlib/util/can_tx_buffer.o.d 
	@${RM} ${OBJECTDIR}/canlib/util/can_tx_buffer.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -DBOARD_UNIQUE_ID=0x11 -I"../src" -I"../src/config/default" -Wall -MP -MMD -MF "${OBJECTDIR}/canlib/util/can_tx_buffer.o.d" -o ${OBJECTDIR}/canlib/util/can_tx_buffer.o canlib/util/can_tx_buffer.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/canlib/util/safe_ring_buffer.o: canlib/util/safe_ring_buffer.c  .generated_files/flags/default/3592576bc9fb7314a038bf7a29fc740e83078c52 .generated_files/flags/default/21e5712e9da6f15e7f2c3a93091791477ef2790
	@${MKDIR} "${OBJECTDIR}/canlib/util" 
	@${RM} ${OBJECTDIR}/canlib/util/safe_ring_buffer.o.d 
	@${RM} ${OBJECTDIR}/canlib/util/safe_ring_buffer.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -DBOARD_UNIQUE_ID=0x11 -I"../src" -I"../src/config/default" -Wall -MP -MMD -MF "${OBJECTDIR}/canlib/util/safe_ring_buffer.o.d" -o ${OBJECTDIR}/canlib/util/safe_ring_buffer.o canlib/util/safe_ring_buffer.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/canlib/util/timing_util.o: canlib/util/timing_util.c  .generated_files/flags/default/d03b75569ded40acbc7b8780e8fe8954b5ac1194 .generated_files/flags/default/21e5712e9da6f15e7f2c3a93091791477ef2790
	@${MKDIR} "${OBJECTDIR}/canlib/util" 
	@${RM} ${OBJECTDIR}/canlib/util/timing_util.o.d 
	@${RM} ${OBJECTDIR}/canlib/util/timing_util.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -DBOARD_UNIQUE_ID=0x11 -I"../src" -I"../src/config/default" -Wall -MP -MMD -MF "${OBJECTDIR}/canlib/util/timing_util.o.d" -o ${OBJECTDIR}/canlib/util/timing_util.o canlib/util/timing_util.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/canlib/can_common.o: canlib/can_common.c  .generated_files/flags/default/7d6d5bf03f2f5fc41871e03a72d04de7e374e5fe .generated_files/flags/default/21e5712e9da6f15e7f2c3a93091791477ef2790
	@${MKDIR} "${OBJECTDIR}/canlib" 
	@${RM} ${OBJECTDIR}/canlib/can_common.o.d 
	@${RM} ${OBJECTDIR}/canlib/can_common.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -DBOARD_UNIQUE_ID=0x11 -I"../src" -I"../src/config/default" -Wall -MP -MMD -MF "${OBJECTDIR}/canlib/can_common.o.d" -o ${OBJECTDIR}/canlib/can_common.o canlib/can_common.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/60165182/plib_can2.o: ../src/config/default/peripheral/can/plib_can2.c  .generated_files/flags/default/cd2f5f7d9ee3d144c95bbc439d42193b5c1f42ed .generated_files/flags/default/21e5712e9da6f15e7f2c3a93091791477ef2790
	@${MKDIR} "${OBJECTDIR}/_ext/60165182" 
	@${RM} ${OBJECTDIR}/_ext/60165182/plib_can2.o.d 
	@${RM} ${OBJECTDIR}/_ext/60165182/plib_can2.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -DBOARD_UNIQUE_ID=0x11 -I"../src" -I"../src/config/default" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/60165182/plib_can2.o.d" -o ${OBJECTDIR}/_ext/60165182/plib_can2.o ../src/config/default/peripheral/can/plib_can2.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/60165520/plib_clk.o: ../src/config/default/peripheral/clk/plib_clk.c  .generated_files/flags/default/445141922fc67f125a7c7fc38f6f563376b5a6ef .generated_files/flags/default/21e5712e9da6f15e7f2c3a93091791477ef2790
	@${MKDIR} "${OBJECTDIR}/_ext/60165520" 
	@${RM} ${OBJECTDIR}/_ext/60165520/plib_clk.o.d 
	@${RM} ${OBJECTDIR}/_ext/60165520/plib_clk.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -DBOARD_UNIQUE_ID=0x11 -I"../src" -I"../src/config/default" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/60165520/plib_clk.o.d" -o ${OBJECTDIR}/_ext/60165520/plib_clk.o ../src/config/default/peripheral/clk/plib_clk.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1865200349/plib_evic.o: ../src/config/default/peripheral/evic/plib_evic.c  .generated_files/flags/default/8569dc66c2e08981590fe94bdcc766feaeb4dd55 .generated_files/flags/default/21e5712e9da6f15e7f2c3a93091791477ef2790
	@${MKDIR} "${OBJECTDIR}/_ext/1865200349" 
	@${RM} ${OBJECTDIR}/_ext/1865200349/plib_evic.o.d 
	@${RM} ${OBJECTDIR}/_ext/1865200349/plib_evic.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -DBOARD_UNIQUE_ID=0x11 -I"../src" -I"../src/config/default" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1865200349/plib_evic.o.d" -o ${OBJECTDIR}/_ext/1865200349/plib_evic.o ../src/config/default/peripheral/evic/plib_evic.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1865254177/plib_gpio.o: ../src/config/default/peripheral/gpio/plib_gpio.c  .generated_files/flags/default/2541a386df5e5d42c25c0d3a60bd41e7abd8ad8b .generated_files/flags/default/21e5712e9da6f15e7f2c3a93091791477ef2790
	@${MKDIR} "${OBJECTDIR}/_ext/1865254177" 
	@${RM} ${OBJECTDIR}/_ext/1865254177/plib_gpio.o.d 
	@${RM} ${OBJECTDIR}/_ext/1865254177/plib_gpio.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -DBOARD_UNIQUE_ID=0x11 -I"../src" -I"../src/config/default" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1865254177/plib_gpio.o.d" -o ${OBJECTDIR}/_ext/1865254177/plib_gpio.o ../src/config/default/peripheral/gpio/plib_gpio.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1865657120/plib_uart6.o: ../src/config/default/peripheral/uart/plib_uart6.c  .generated_files/flags/default/bbb61f9918036211323c33e789c9569e08d02d15 .generated_files/flags/default/21e5712e9da6f15e7f2c3a93091791477ef2790
	@${MKDIR} "${OBJECTDIR}/_ext/1865657120" 
	@${RM} ${OBJECTDIR}/_ext/1865657120/plib_uart6.o.d 
	@${RM} ${OBJECTDIR}/_ext/1865657120/plib_uart6.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -DBOARD_UNIQUE_ID=0x11 -I"../src" -I"../src/config/default" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1865657120/plib_uart6.o.d" -o ${OBJECTDIR}/_ext/1865657120/plib_uart6.o ../src/config/default/peripheral/uart/plib_uart6.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/163028504/xc32_monitor.o: ../src/config/default/stdio/xc32_monitor.c  .generated_files/flags/default/2952d195f1d1d114b75adde54aa8f882690f0733 .generated_files/flags/default/21e5712e9da6f15e7f2c3a93091791477ef2790
	@${MKDIR} "${OBJECTDIR}/_ext/163028504" 
	@${RM} ${OBJECTDIR}/_ext/163028504/xc32_monitor.o.d 
	@${RM} ${OBJECTDIR}/_ext/163028504/xc32_monitor.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -DBOARD_UNIQUE_ID=0x11 -I"../src" -I"../src/config/default" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/163028504/xc32_monitor.o.d" -o ${OBJECTDIR}/_ext/163028504/xc32_monitor.o ../src/config/default/stdio/xc32_monitor.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1171490990/exceptions.o: ../src/config/default/exceptions.c  .generated_files/flags/default/122fd32ffb9aa0c84a35e37b88d842cb80ae1f05 .generated_files/flags/default/21e5712e9da6f15e7f2c3a93091791477ef2790
	@${MKDIR} "${OBJECTDIR}/_ext/1171490990" 
	@${RM} ${OBJECTDIR}/_ext/1171490990/exceptions.o.d 
	@${RM} ${OBJECTDIR}/_ext/1171490990/exceptions.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -DBOARD_UNIQUE_ID=0x11 -I"../src" -I"../src/config/default" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1171490990/exceptions.o.d" -o ${OBJECTDIR}/_ext/1171490990/exceptions.o ../src/config/default/exceptions.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1171490990/initialization.o: ../src/config/default/initialization.c  .generated_files/flags/default/e2c2ee01be980e51206caec1d55124ae028ec5ec .generated_files/flags/default/21e5712e9da6f15e7f2c3a93091791477ef2790
	@${MKDIR} "${OBJECTDIR}/_ext/1171490990" 
	@${RM} ${OBJECTDIR}/_ext/1171490990/initialization.o.d 
	@${RM} ${OBJECTDIR}/_ext/1171490990/initialization.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -DBOARD_UNIQUE_ID=0x11 -I"../src" -I"../src/config/default" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1171490990/initialization.o.d" -o ${OBJECTDIR}/_ext/1171490990/initialization.o ../src/config/default/initialization.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1171490990/interrupts.o: ../src/config/default/interrupts.c  .generated_files/flags/default/a630e84b2097c710cd4e8190ebcb14f84c7cb765 .generated_files/flags/default/21e5712e9da6f15e7f2c3a93091791477ef2790
	@${MKDIR} "${OBJECTDIR}/_ext/1171490990" 
	@${RM} ${OBJECTDIR}/_ext/1171490990/interrupts.o.d 
	@${RM} ${OBJECTDIR}/_ext/1171490990/interrupts.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -DBOARD_UNIQUE_ID=0x11 -I"../src" -I"../src/config/default" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1171490990/interrupts.o.d" -o ${OBJECTDIR}/_ext/1171490990/interrupts.o ../src/config/default/interrupts.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1360937237/main.o: ../src/main.c  .generated_files/flags/default/a38a8401e9d2bdac653ff0469f5391adc8759501 .generated_files/flags/default/21e5712e9da6f15e7f2c3a93091791477ef2790
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -DBOARD_UNIQUE_ID=0x11 -I"../src" -I"../src/config/default" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/main.o.d" -o ${OBJECTDIR}/_ext/1360937237/main.o ../src/main.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/kalman_lib/data.o: kalman_lib/data.c  .generated_files/flags/default/e60680ee6be2ea6e1d790e3e0bea8c773d40f5ce .generated_files/flags/default/21e5712e9da6f15e7f2c3a93091791477ef2790
	@${MKDIR} "${OBJECTDIR}/kalman_lib" 
	@${RM} ${OBJECTDIR}/kalman_lib/data.o.d 
	@${RM} ${OBJECTDIR}/kalman_lib/data.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -DBOARD_UNIQUE_ID=0x11 -I"../src" -I"../src/config/default" -Wall -MP -MMD -MF "${OBJECTDIR}/kalman_lib/data.o.d" -o ${OBJECTDIR}/kalman_lib/data.o kalman_lib/data.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/kalman_lib/gps_conversion.o: kalman_lib/gps_conversion.c  .generated_files/flags/default/583f4eb1babf21a7c714be4313d2bc82c589c5f3 .generated_files/flags/default/21e5712e9da6f15e7f2c3a93091791477ef2790
	@${MKDIR} "${OBJECTDIR}/kalman_lib" 
	@${RM} ${OBJECTDIR}/kalman_lib/gps_conversion.o.d 
	@${RM} ${OBJECTDIR}/kalman_lib/gps_conversion.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -DBOARD_UNIQUE_ID=0x11 -I"../src" -I"../src/config/default" -Wall -MP -MMD -MF "${OBJECTDIR}/kalman_lib/gps_conversion.o.d" -o ${OBJECTDIR}/kalman_lib/gps_conversion.o kalman_lib/gps_conversion.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/kalman_lib/kalman_lib.o: kalman_lib/kalman_lib.c  .generated_files/flags/default/230faa34cb7ac1205540e8f9fb3ffc7e5dfda23e .generated_files/flags/default/21e5712e9da6f15e7f2c3a93091791477ef2790
	@${MKDIR} "${OBJECTDIR}/kalman_lib" 
	@${RM} ${OBJECTDIR}/kalman_lib/kalman_lib.o.d 
	@${RM} ${OBJECTDIR}/kalman_lib/kalman_lib.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -DBOARD_UNIQUE_ID=0x11 -I"../src" -I"../src/config/default" -Wall -MP -MMD -MF "${OBJECTDIR}/kalman_lib/kalman_lib.o.d" -o ${OBJECTDIR}/kalman_lib/kalman_lib.o kalman_lib/kalman_lib.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/kalman_lib/orientation_conversion.o: kalman_lib/orientation_conversion.c  .generated_files/flags/default/71fa0109eb876e81ca6898bb91be713458d845ed .generated_files/flags/default/21e5712e9da6f15e7f2c3a93091791477ef2790
	@${MKDIR} "${OBJECTDIR}/kalman_lib" 
	@${RM} ${OBJECTDIR}/kalman_lib/orientation_conversion.o.d 
	@${RM} ${OBJECTDIR}/kalman_lib/orientation_conversion.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -DBOARD_UNIQUE_ID=0x11 -I"../src" -I"../src/config/default" -Wall -MP -MMD -MF "${OBJECTDIR}/kalman_lib/orientation_conversion.o.d" -o ${OBJECTDIR}/kalman_lib/orientation_conversion.o kalman_lib/orientation_conversion.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/60181895/plib_tmr2.o: ../src/config/default/peripheral/tmr/plib_tmr2.c  .generated_files/flags/default/90689d73a5e8a96984667c3513fc828d8c1a6e80 .generated_files/flags/default/21e5712e9da6f15e7f2c3a93091791477ef2790
	@${MKDIR} "${OBJECTDIR}/_ext/60181895" 
	@${RM} ${OBJECTDIR}/_ext/60181895/plib_tmr2.o.d 
	@${RM} ${OBJECTDIR}/_ext/60181895/plib_tmr2.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -DBOARD_UNIQUE_ID=0x11 -I"../src" -I"../src/config/default" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/60181895/plib_tmr2.o.d" -o ${OBJECTDIR}/_ext/60181895/plib_tmr2.o ../src/config/default/peripheral/tmr/plib_tmr2.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
else
${OBJECTDIR}/canlib/util/can_rcv_buffer.o: canlib/util/can_rcv_buffer.c  .generated_files/flags/default/264bdb53c8ee4085a69405e2be1a97409575c3b5 .generated_files/flags/default/21e5712e9da6f15e7f2c3a93091791477ef2790
	@${MKDIR} "${OBJECTDIR}/canlib/util" 
	@${RM} ${OBJECTDIR}/canlib/util/can_rcv_buffer.o.d 
	@${RM} ${OBJECTDIR}/canlib/util/can_rcv_buffer.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -DBOARD_UNIQUE_ID=0x11 -I"../src" -I"../src/config/default" -Wall -MP -MMD -MF "${OBJECTDIR}/canlib/util/can_rcv_buffer.o.d" -o ${OBJECTDIR}/canlib/util/can_rcv_buffer.o canlib/util/can_rcv_buffer.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/canlib/util/can_tx_buffer.o: canlib/util/can_tx_buffer.c  .generated_files/flags/default/c4ed9aa5f011c6fd8f865f1fd80f483a044b3bae .generated_files/flags/default/21e5712e9da6f15e7f2c3a93091791477ef2790
	@${MKDIR} "${OBJECTDIR}/canlib/util" 
	@${RM} ${OBJECTDIR}/canlib/util/can_tx_buffer.o.d 
	@${RM} ${OBJECTDIR}/canlib/util/can_tx_buffer.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -DBOARD_UNIQUE_ID=0x11 -I"../src" -I"../src/config/default" -Wall -MP -MMD -MF "${OBJECTDIR}/canlib/util/can_tx_buffer.o.d" -o ${OBJECTDIR}/canlib/util/can_tx_buffer.o canlib/util/can_tx_buffer.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/canlib/util/safe_ring_buffer.o: canlib/util/safe_ring_buffer.c  .generated_files/flags/default/49d58f1ca2f9fa9e178ba8dcaf7e161a49107edc .generated_files/flags/default/21e5712e9da6f15e7f2c3a93091791477ef2790
	@${MKDIR} "${OBJECTDIR}/canlib/util" 
	@${RM} ${OBJECTDIR}/canlib/util/safe_ring_buffer.o.d 
	@${RM} ${OBJECTDIR}/canlib/util/safe_ring_buffer.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -DBOARD_UNIQUE_ID=0x11 -I"../src" -I"../src/config/default" -Wall -MP -MMD -MF "${OBJECTDIR}/canlib/util/safe_ring_buffer.o.d" -o ${OBJECTDIR}/canlib/util/safe_ring_buffer.o canlib/util/safe_ring_buffer.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/canlib/util/timing_util.o: canlib/util/timing_util.c  .generated_files/flags/default/4a783ae6565847d78058e32a8b876b7ee3ac9c90 .generated_files/flags/default/21e5712e9da6f15e7f2c3a93091791477ef2790
	@${MKDIR} "${OBJECTDIR}/canlib/util" 
	@${RM} ${OBJECTDIR}/canlib/util/timing_util.o.d 
	@${RM} ${OBJECTDIR}/canlib/util/timing_util.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -DBOARD_UNIQUE_ID=0x11 -I"../src" -I"../src/config/default" -Wall -MP -MMD -MF "${OBJECTDIR}/canlib/util/timing_util.o.d" -o ${OBJECTDIR}/canlib/util/timing_util.o canlib/util/timing_util.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/canlib/can_common.o: canlib/can_common.c  .generated_files/flags/default/7919890c763e1f6ae3b04dc1815c60bb91c2e670 .generated_files/flags/default/21e5712e9da6f15e7f2c3a93091791477ef2790
	@${MKDIR} "${OBJECTDIR}/canlib" 
	@${RM} ${OBJECTDIR}/canlib/can_common.o.d 
	@${RM} ${OBJECTDIR}/canlib/can_common.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -DBOARD_UNIQUE_ID=0x11 -I"../src" -I"../src/config/default" -Wall -MP -MMD -MF "${OBJECTDIR}/canlib/can_common.o.d" -o ${OBJECTDIR}/canlib/can_common.o canlib/can_common.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/60165182/plib_can2.o: ../src/config/default/peripheral/can/plib_can2.c  .generated_files/flags/default/ef020231c15d7843612fecee846d06ca9aeb21ed .generated_files/flags/default/21e5712e9da6f15e7f2c3a93091791477ef2790
	@${MKDIR} "${OBJECTDIR}/_ext/60165182" 
	@${RM} ${OBJECTDIR}/_ext/60165182/plib_can2.o.d 
	@${RM} ${OBJECTDIR}/_ext/60165182/plib_can2.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -DBOARD_UNIQUE_ID=0x11 -I"../src" -I"../src/config/default" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/60165182/plib_can2.o.d" -o ${OBJECTDIR}/_ext/60165182/plib_can2.o ../src/config/default/peripheral/can/plib_can2.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/60165520/plib_clk.o: ../src/config/default/peripheral/clk/plib_clk.c  .generated_files/flags/default/170905d18a4220d64e2859eaaba31bf830b7571f .generated_files/flags/default/21e5712e9da6f15e7f2c3a93091791477ef2790
	@${MKDIR} "${OBJECTDIR}/_ext/60165520" 
	@${RM} ${OBJECTDIR}/_ext/60165520/plib_clk.o.d 
	@${RM} ${OBJECTDIR}/_ext/60165520/plib_clk.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -DBOARD_UNIQUE_ID=0x11 -I"../src" -I"../src/config/default" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/60165520/plib_clk.o.d" -o ${OBJECTDIR}/_ext/60165520/plib_clk.o ../src/config/default/peripheral/clk/plib_clk.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1865200349/plib_evic.o: ../src/config/default/peripheral/evic/plib_evic.c  .generated_files/flags/default/c6b1278595d603267024816860a14270e3efc1f5 .generated_files/flags/default/21e5712e9da6f15e7f2c3a93091791477ef2790
	@${MKDIR} "${OBJECTDIR}/_ext/1865200349" 
	@${RM} ${OBJECTDIR}/_ext/1865200349/plib_evic.o.d 
	@${RM} ${OBJECTDIR}/_ext/1865200349/plib_evic.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -DBOARD_UNIQUE_ID=0x11 -I"../src" -I"../src/config/default" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1865200349/plib_evic.o.d" -o ${OBJECTDIR}/_ext/1865200349/plib_evic.o ../src/config/default/peripheral/evic/plib_evic.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1865254177/plib_gpio.o: ../src/config/default/peripheral/gpio/plib_gpio.c  .generated_files/flags/default/3667cce87871d132603fafb94050e202c5272da6 .generated_files/flags/default/21e5712e9da6f15e7f2c3a93091791477ef2790
	@${MKDIR} "${OBJECTDIR}/_ext/1865254177" 
	@${RM} ${OBJECTDIR}/_ext/1865254177/plib_gpio.o.d 
	@${RM} ${OBJECTDIR}/_ext/1865254177/plib_gpio.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -DBOARD_UNIQUE_ID=0x11 -I"../src" -I"../src/config/default" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1865254177/plib_gpio.o.d" -o ${OBJECTDIR}/_ext/1865254177/plib_gpio.o ../src/config/default/peripheral/gpio/plib_gpio.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1865657120/plib_uart6.o: ../src/config/default/peripheral/uart/plib_uart6.c  .generated_files/flags/default/b4059e819818f756cb7a68ee885d53b189e3f114 .generated_files/flags/default/21e5712e9da6f15e7f2c3a93091791477ef2790
	@${MKDIR} "${OBJECTDIR}/_ext/1865657120" 
	@${RM} ${OBJECTDIR}/_ext/1865657120/plib_uart6.o.d 
	@${RM} ${OBJECTDIR}/_ext/1865657120/plib_uart6.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -DBOARD_UNIQUE_ID=0x11 -I"../src" -I"../src/config/default" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1865657120/plib_uart6.o.d" -o ${OBJECTDIR}/_ext/1865657120/plib_uart6.o ../src/config/default/peripheral/uart/plib_uart6.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/163028504/xc32_monitor.o: ../src/config/default/stdio/xc32_monitor.c  .generated_files/flags/default/c2f51def09e361220e007812f87d1944160be6b .generated_files/flags/default/21e5712e9da6f15e7f2c3a93091791477ef2790
	@${MKDIR} "${OBJECTDIR}/_ext/163028504" 
	@${RM} ${OBJECTDIR}/_ext/163028504/xc32_monitor.o.d 
	@${RM} ${OBJECTDIR}/_ext/163028504/xc32_monitor.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -DBOARD_UNIQUE_ID=0x11 -I"../src" -I"../src/config/default" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/163028504/xc32_monitor.o.d" -o ${OBJECTDIR}/_ext/163028504/xc32_monitor.o ../src/config/default/stdio/xc32_monitor.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1171490990/exceptions.o: ../src/config/default/exceptions.c  .generated_files/flags/default/faa591dd22097fb81f79dc319e5e0e888a3a6382 .generated_files/flags/default/21e5712e9da6f15e7f2c3a93091791477ef2790
	@${MKDIR} "${OBJECTDIR}/_ext/1171490990" 
	@${RM} ${OBJECTDIR}/_ext/1171490990/exceptions.o.d 
	@${RM} ${OBJECTDIR}/_ext/1171490990/exceptions.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -DBOARD_UNIQUE_ID=0x11 -I"../src" -I"../src/config/default" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1171490990/exceptions.o.d" -o ${OBJECTDIR}/_ext/1171490990/exceptions.o ../src/config/default/exceptions.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1171490990/initialization.o: ../src/config/default/initialization.c  .generated_files/flags/default/b93d6f34ab572f5fdf5a5490e761b9e6f81b74f6 .generated_files/flags/default/21e5712e9da6f15e7f2c3a93091791477ef2790
	@${MKDIR} "${OBJECTDIR}/_ext/1171490990" 
	@${RM} ${OBJECTDIR}/_ext/1171490990/initialization.o.d 
	@${RM} ${OBJECTDIR}/_ext/1171490990/initialization.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -DBOARD_UNIQUE_ID=0x11 -I"../src" -I"../src/config/default" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1171490990/initialization.o.d" -o ${OBJECTDIR}/_ext/1171490990/initialization.o ../src/config/default/initialization.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1171490990/interrupts.o: ../src/config/default/interrupts.c  .generated_files/flags/default/2fc1d2c5c60f8740ffcac38eccf8d6e718e44acb .generated_files/flags/default/21e5712e9da6f15e7f2c3a93091791477ef2790
	@${MKDIR} "${OBJECTDIR}/_ext/1171490990" 
	@${RM} ${OBJECTDIR}/_ext/1171490990/interrupts.o.d 
	@${RM} ${OBJECTDIR}/_ext/1171490990/interrupts.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -DBOARD_UNIQUE_ID=0x11 -I"../src" -I"../src/config/default" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1171490990/interrupts.o.d" -o ${OBJECTDIR}/_ext/1171490990/interrupts.o ../src/config/default/interrupts.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1360937237/main.o: ../src/main.c  .generated_files/flags/default/bcd76f5b05ccb71f8c4860ab0fb4d08a5c081422 .generated_files/flags/default/21e5712e9da6f15e7f2c3a93091791477ef2790
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -DBOARD_UNIQUE_ID=0x11 -I"../src" -I"../src/config/default" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/main.o.d" -o ${OBJECTDIR}/_ext/1360937237/main.o ../src/main.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/kalman_lib/data.o: kalman_lib/data.c  .generated_files/flags/default/52d40e415b237c87826af8e6a6beae050444b8a7 .generated_files/flags/default/21e5712e9da6f15e7f2c3a93091791477ef2790
	@${MKDIR} "${OBJECTDIR}/kalman_lib" 
	@${RM} ${OBJECTDIR}/kalman_lib/data.o.d 
	@${RM} ${OBJECTDIR}/kalman_lib/data.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -DBOARD_UNIQUE_ID=0x11 -I"../src" -I"../src/config/default" -Wall -MP -MMD -MF "${OBJECTDIR}/kalman_lib/data.o.d" -o ${OBJECTDIR}/kalman_lib/data.o kalman_lib/data.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/kalman_lib/gps_conversion.o: kalman_lib/gps_conversion.c  .generated_files/flags/default/8ef0c0a86f18b655832d86bc2de95f9941f3ab14 .generated_files/flags/default/21e5712e9da6f15e7f2c3a93091791477ef2790
	@${MKDIR} "${OBJECTDIR}/kalman_lib" 
	@${RM} ${OBJECTDIR}/kalman_lib/gps_conversion.o.d 
	@${RM} ${OBJECTDIR}/kalman_lib/gps_conversion.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -DBOARD_UNIQUE_ID=0x11 -I"../src" -I"../src/config/default" -Wall -MP -MMD -MF "${OBJECTDIR}/kalman_lib/gps_conversion.o.d" -o ${OBJECTDIR}/kalman_lib/gps_conversion.o kalman_lib/gps_conversion.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/kalman_lib/kalman_lib.o: kalman_lib/kalman_lib.c  .generated_files/flags/default/c49884f56ec9c9a51bc1111dc5c2f3a4a6aacfc1 .generated_files/flags/default/21e5712e9da6f15e7f2c3a93091791477ef2790
	@${MKDIR} "${OBJECTDIR}/kalman_lib" 
	@${RM} ${OBJECTDIR}/kalman_lib/kalman_lib.o.d 
	@${RM} ${OBJECTDIR}/kalman_lib/kalman_lib.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -DBOARD_UNIQUE_ID=0x11 -I"../src" -I"../src/config/default" -Wall -MP -MMD -MF "${OBJECTDIR}/kalman_lib/kalman_lib.o.d" -o ${OBJECTDIR}/kalman_lib/kalman_lib.o kalman_lib/kalman_lib.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/kalman_lib/orientation_conversion.o: kalman_lib/orientation_conversion.c  .generated_files/flags/default/6d0ba9bf767ed59251c12f195974565deda1bbe2 .generated_files/flags/default/21e5712e9da6f15e7f2c3a93091791477ef2790
	@${MKDIR} "${OBJECTDIR}/kalman_lib" 
	@${RM} ${OBJECTDIR}/kalman_lib/orientation_conversion.o.d 
	@${RM} ${OBJECTDIR}/kalman_lib/orientation_conversion.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -DBOARD_UNIQUE_ID=0x11 -I"../src" -I"../src/config/default" -Wall -MP -MMD -MF "${OBJECTDIR}/kalman_lib/orientation_conversion.o.d" -o ${OBJECTDIR}/kalman_lib/orientation_conversion.o kalman_lib/orientation_conversion.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/60181895/plib_tmr2.o: ../src/config/default/peripheral/tmr/plib_tmr2.c  .generated_files/flags/default/235a9d871c636fe0e2327e23e1d950fea9c606e .generated_files/flags/default/21e5712e9da6f15e7f2c3a93091791477ef2790
	@${MKDIR} "${OBJECTDIR}/_ext/60181895" 
	@${RM} ${OBJECTDIR}/_ext/60181895/plib_tmr2.o.d 
	@${RM} ${OBJECTDIR}/_ext/60181895/plib_tmr2.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -DBOARD_UNIQUE_ID=0x11 -I"../src" -I"../src/config/default" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/60181895/plib_tmr2.o.d" -o ${OBJECTDIR}/_ext/60181895/plib_tmr2.o ../src/config/default/peripheral/tmr/plib_tmr2.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compileCPP
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${DISTDIR}/kalman_board.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    ../src/config/default/p32MZ2048EFM144.ld
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -g   -mprocessor=$(MP_PROCESSOR_OPTION)  -o ${DISTDIR}/kalman_board.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)   -mreserve=data@0x0:0x37F   -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,-D=__DEBUG_D,--defsym=_min_heap_size=512,--gc-sections,--no-code-in-dinit,--no-dinit-in-serial-mem,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,${DISTDIR}/memoryfile.xml -mdfp="${DFP_DIR}"
	
else
${DISTDIR}/kalman_board.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   ../src/config/default/p32MZ2048EFM144.ld
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -mprocessor=$(MP_PROCESSOR_OPTION)  -o ${DISTDIR}/kalman_board.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=_min_heap_size=512,--gc-sections,--no-code-in-dinit,--no-dinit-in-serial-mem,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,${DISTDIR}/memoryfile.xml -mdfp="${DFP_DIR}"
	${MP_CC_DIR}\\xc32-bin2hex ${DISTDIR}/kalman_board.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} 
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r ${OBJECTDIR}
	${RM} -r ${DISTDIR}

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(shell mplabwildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
