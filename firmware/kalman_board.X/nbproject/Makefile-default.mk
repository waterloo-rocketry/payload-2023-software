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
${OBJECTDIR}/canlib/util/can_rcv_buffer.o: canlib/util/can_rcv_buffer.c  .generated_files/flags/default/ce0bb9f540eae77932b8e0c27340bf4391b9ff7b .generated_files/flags/default/21e5712e9da6f15e7f2c3a93091791477ef2790
	@${MKDIR} "${OBJECTDIR}/canlib/util" 
	@${RM} ${OBJECTDIR}/canlib/util/can_rcv_buffer.o.d 
	@${RM} ${OBJECTDIR}/canlib/util/can_rcv_buffer.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -DBOARD_UNIQUE_ID=0x11 -I"../src" -I"../src/config/default" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/canlib/util/can_rcv_buffer.o.d" -o ${OBJECTDIR}/canlib/util/can_rcv_buffer.o canlib/util/can_rcv_buffer.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/canlib/util/can_tx_buffer.o: canlib/util/can_tx_buffer.c  .generated_files/flags/default/bfb7af359a87bef4a41806093c59d437c25f1099 .generated_files/flags/default/21e5712e9da6f15e7f2c3a93091791477ef2790
	@${MKDIR} "${OBJECTDIR}/canlib/util" 
	@${RM} ${OBJECTDIR}/canlib/util/can_tx_buffer.o.d 
	@${RM} ${OBJECTDIR}/canlib/util/can_tx_buffer.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -DBOARD_UNIQUE_ID=0x11 -I"../src" -I"../src/config/default" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/canlib/util/can_tx_buffer.o.d" -o ${OBJECTDIR}/canlib/util/can_tx_buffer.o canlib/util/can_tx_buffer.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/canlib/util/safe_ring_buffer.o: canlib/util/safe_ring_buffer.c  .generated_files/flags/default/5b6caa50f1f5661deebad9a38676c0c81d22118e .generated_files/flags/default/21e5712e9da6f15e7f2c3a93091791477ef2790
	@${MKDIR} "${OBJECTDIR}/canlib/util" 
	@${RM} ${OBJECTDIR}/canlib/util/safe_ring_buffer.o.d 
	@${RM} ${OBJECTDIR}/canlib/util/safe_ring_buffer.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -DBOARD_UNIQUE_ID=0x11 -I"../src" -I"../src/config/default" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/canlib/util/safe_ring_buffer.o.d" -o ${OBJECTDIR}/canlib/util/safe_ring_buffer.o canlib/util/safe_ring_buffer.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/canlib/util/timing_util.o: canlib/util/timing_util.c  .generated_files/flags/default/34997ddc377a2c2b66042f12f5fbc0e85a92a11f .generated_files/flags/default/21e5712e9da6f15e7f2c3a93091791477ef2790
	@${MKDIR} "${OBJECTDIR}/canlib/util" 
	@${RM} ${OBJECTDIR}/canlib/util/timing_util.o.d 
	@${RM} ${OBJECTDIR}/canlib/util/timing_util.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -DBOARD_UNIQUE_ID=0x11 -I"../src" -I"../src/config/default" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/canlib/util/timing_util.o.d" -o ${OBJECTDIR}/canlib/util/timing_util.o canlib/util/timing_util.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/canlib/can_common.o: canlib/can_common.c  .generated_files/flags/default/63ce2ed5e35ee8619649da06c7d01e2a9b47db94 .generated_files/flags/default/21e5712e9da6f15e7f2c3a93091791477ef2790
	@${MKDIR} "${OBJECTDIR}/canlib" 
	@${RM} ${OBJECTDIR}/canlib/can_common.o.d 
	@${RM} ${OBJECTDIR}/canlib/can_common.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -DBOARD_UNIQUE_ID=0x11 -I"../src" -I"../src/config/default" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/canlib/can_common.o.d" -o ${OBJECTDIR}/canlib/can_common.o canlib/can_common.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/60165182/plib_can2.o: ../src/config/default/peripheral/can/plib_can2.c  .generated_files/flags/default/5ecdbf12c8129a55ea5ca1abbce2098ece34738f .generated_files/flags/default/21e5712e9da6f15e7f2c3a93091791477ef2790
	@${MKDIR} "${OBJECTDIR}/_ext/60165182" 
	@${RM} ${OBJECTDIR}/_ext/60165182/plib_can2.o.d 
	@${RM} ${OBJECTDIR}/_ext/60165182/plib_can2.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -DBOARD_UNIQUE_ID=0x11 -I"../src" -I"../src/config/default" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/60165182/plib_can2.o.d" -o ${OBJECTDIR}/_ext/60165182/plib_can2.o ../src/config/default/peripheral/can/plib_can2.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/60165520/plib_clk.o: ../src/config/default/peripheral/clk/plib_clk.c  .generated_files/flags/default/fc81ec87797e279f234d60b4c5f7d24957b0a5c6 .generated_files/flags/default/21e5712e9da6f15e7f2c3a93091791477ef2790
	@${MKDIR} "${OBJECTDIR}/_ext/60165520" 
	@${RM} ${OBJECTDIR}/_ext/60165520/plib_clk.o.d 
	@${RM} ${OBJECTDIR}/_ext/60165520/plib_clk.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -DBOARD_UNIQUE_ID=0x11 -I"../src" -I"../src/config/default" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/60165520/plib_clk.o.d" -o ${OBJECTDIR}/_ext/60165520/plib_clk.o ../src/config/default/peripheral/clk/plib_clk.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1865200349/plib_evic.o: ../src/config/default/peripheral/evic/plib_evic.c  .generated_files/flags/default/a059c9bfe70b74896484a42b1c7ff605b9a3dd7c .generated_files/flags/default/21e5712e9da6f15e7f2c3a93091791477ef2790
	@${MKDIR} "${OBJECTDIR}/_ext/1865200349" 
	@${RM} ${OBJECTDIR}/_ext/1865200349/plib_evic.o.d 
	@${RM} ${OBJECTDIR}/_ext/1865200349/plib_evic.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -DBOARD_UNIQUE_ID=0x11 -I"../src" -I"../src/config/default" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1865200349/plib_evic.o.d" -o ${OBJECTDIR}/_ext/1865200349/plib_evic.o ../src/config/default/peripheral/evic/plib_evic.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1865254177/plib_gpio.o: ../src/config/default/peripheral/gpio/plib_gpio.c  .generated_files/flags/default/c64505cb73ec173c988ae663768fbf7f8c3b4575 .generated_files/flags/default/21e5712e9da6f15e7f2c3a93091791477ef2790
	@${MKDIR} "${OBJECTDIR}/_ext/1865254177" 
	@${RM} ${OBJECTDIR}/_ext/1865254177/plib_gpio.o.d 
	@${RM} ${OBJECTDIR}/_ext/1865254177/plib_gpio.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -DBOARD_UNIQUE_ID=0x11 -I"../src" -I"../src/config/default" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1865254177/plib_gpio.o.d" -o ${OBJECTDIR}/_ext/1865254177/plib_gpio.o ../src/config/default/peripheral/gpio/plib_gpio.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1865657120/plib_uart6.o: ../src/config/default/peripheral/uart/plib_uart6.c  .generated_files/flags/default/9c62fb193750f2ba1f3177dac12f32e382c033c6 .generated_files/flags/default/21e5712e9da6f15e7f2c3a93091791477ef2790
	@${MKDIR} "${OBJECTDIR}/_ext/1865657120" 
	@${RM} ${OBJECTDIR}/_ext/1865657120/plib_uart6.o.d 
	@${RM} ${OBJECTDIR}/_ext/1865657120/plib_uart6.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -DBOARD_UNIQUE_ID=0x11 -I"../src" -I"../src/config/default" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1865657120/plib_uart6.o.d" -o ${OBJECTDIR}/_ext/1865657120/plib_uart6.o ../src/config/default/peripheral/uart/plib_uart6.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/163028504/xc32_monitor.o: ../src/config/default/stdio/xc32_monitor.c  .generated_files/flags/default/ca32a6c4d2452bd237e840b310cc6078f5108ca5 .generated_files/flags/default/21e5712e9da6f15e7f2c3a93091791477ef2790
	@${MKDIR} "${OBJECTDIR}/_ext/163028504" 
	@${RM} ${OBJECTDIR}/_ext/163028504/xc32_monitor.o.d 
	@${RM} ${OBJECTDIR}/_ext/163028504/xc32_monitor.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -DBOARD_UNIQUE_ID=0x11 -I"../src" -I"../src/config/default" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/163028504/xc32_monitor.o.d" -o ${OBJECTDIR}/_ext/163028504/xc32_monitor.o ../src/config/default/stdio/xc32_monitor.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1171490990/exceptions.o: ../src/config/default/exceptions.c  .generated_files/flags/default/6efeb7dd2f2bddf87ba96a6759aa71bf18355d92 .generated_files/flags/default/21e5712e9da6f15e7f2c3a93091791477ef2790
	@${MKDIR} "${OBJECTDIR}/_ext/1171490990" 
	@${RM} ${OBJECTDIR}/_ext/1171490990/exceptions.o.d 
	@${RM} ${OBJECTDIR}/_ext/1171490990/exceptions.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -DBOARD_UNIQUE_ID=0x11 -I"../src" -I"../src/config/default" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1171490990/exceptions.o.d" -o ${OBJECTDIR}/_ext/1171490990/exceptions.o ../src/config/default/exceptions.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1171490990/initialization.o: ../src/config/default/initialization.c  .generated_files/flags/default/84f6ad6319702f6eaaafb83f5060ebf622950e58 .generated_files/flags/default/21e5712e9da6f15e7f2c3a93091791477ef2790
	@${MKDIR} "${OBJECTDIR}/_ext/1171490990" 
	@${RM} ${OBJECTDIR}/_ext/1171490990/initialization.o.d 
	@${RM} ${OBJECTDIR}/_ext/1171490990/initialization.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -DBOARD_UNIQUE_ID=0x11 -I"../src" -I"../src/config/default" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1171490990/initialization.o.d" -o ${OBJECTDIR}/_ext/1171490990/initialization.o ../src/config/default/initialization.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1171490990/interrupts.o: ../src/config/default/interrupts.c  .generated_files/flags/default/275df40f573b5112a16ffda5d847a44258c7824 .generated_files/flags/default/21e5712e9da6f15e7f2c3a93091791477ef2790
	@${MKDIR} "${OBJECTDIR}/_ext/1171490990" 
	@${RM} ${OBJECTDIR}/_ext/1171490990/interrupts.o.d 
	@${RM} ${OBJECTDIR}/_ext/1171490990/interrupts.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -DBOARD_UNIQUE_ID=0x11 -I"../src" -I"../src/config/default" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1171490990/interrupts.o.d" -o ${OBJECTDIR}/_ext/1171490990/interrupts.o ../src/config/default/interrupts.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1360937237/main.o: ../src/main.c  .generated_files/flags/default/6c6f859f4a64d5276bc9fafce5ee58224e380174 .generated_files/flags/default/21e5712e9da6f15e7f2c3a93091791477ef2790
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -DBOARD_UNIQUE_ID=0x11 -I"../src" -I"../src/config/default" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/main.o.d" -o ${OBJECTDIR}/_ext/1360937237/main.o ../src/main.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/kalman_lib/data.o: kalman_lib/data.c  .generated_files/flags/default/e241d0b41fbcd0b15bcb4ec665146ee911efd842 .generated_files/flags/default/21e5712e9da6f15e7f2c3a93091791477ef2790
	@${MKDIR} "${OBJECTDIR}/kalman_lib" 
	@${RM} ${OBJECTDIR}/kalman_lib/data.o.d 
	@${RM} ${OBJECTDIR}/kalman_lib/data.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -DBOARD_UNIQUE_ID=0x11 -I"../src" -I"../src/config/default" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/kalman_lib/data.o.d" -o ${OBJECTDIR}/kalman_lib/data.o kalman_lib/data.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/kalman_lib/gps_conversion.o: kalman_lib/gps_conversion.c  .generated_files/flags/default/c7e56e9bd48edff4e56b4c69bd1e1ab4dec12d3b .generated_files/flags/default/21e5712e9da6f15e7f2c3a93091791477ef2790
	@${MKDIR} "${OBJECTDIR}/kalman_lib" 
	@${RM} ${OBJECTDIR}/kalman_lib/gps_conversion.o.d 
	@${RM} ${OBJECTDIR}/kalman_lib/gps_conversion.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -DBOARD_UNIQUE_ID=0x11 -I"../src" -I"../src/config/default" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/kalman_lib/gps_conversion.o.d" -o ${OBJECTDIR}/kalman_lib/gps_conversion.o kalman_lib/gps_conversion.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/kalman_lib/kalman_lib.o: kalman_lib/kalman_lib.c  .generated_files/flags/default/379ddc78a0e50c3059e69df6b71f774e8b204105 .generated_files/flags/default/21e5712e9da6f15e7f2c3a93091791477ef2790
	@${MKDIR} "${OBJECTDIR}/kalman_lib" 
	@${RM} ${OBJECTDIR}/kalman_lib/kalman_lib.o.d 
	@${RM} ${OBJECTDIR}/kalman_lib/kalman_lib.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -DBOARD_UNIQUE_ID=0x11 -I"../src" -I"../src/config/default" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/kalman_lib/kalman_lib.o.d" -o ${OBJECTDIR}/kalman_lib/kalman_lib.o kalman_lib/kalman_lib.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/kalman_lib/orientation_conversion.o: kalman_lib/orientation_conversion.c  .generated_files/flags/default/576e08611aebbe89eb395511b849d22eba37a4ce .generated_files/flags/default/21e5712e9da6f15e7f2c3a93091791477ef2790
	@${MKDIR} "${OBJECTDIR}/kalman_lib" 
	@${RM} ${OBJECTDIR}/kalman_lib/orientation_conversion.o.d 
	@${RM} ${OBJECTDIR}/kalman_lib/orientation_conversion.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -DBOARD_UNIQUE_ID=0x11 -I"../src" -I"../src/config/default" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/kalman_lib/orientation_conversion.o.d" -o ${OBJECTDIR}/kalman_lib/orientation_conversion.o kalman_lib/orientation_conversion.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/60181895/plib_tmr2.o: ../src/config/default/peripheral/tmr/plib_tmr2.c  .generated_files/flags/default/910c5d35279751091e844e6179ce4197e344eaf4 .generated_files/flags/default/21e5712e9da6f15e7f2c3a93091791477ef2790
	@${MKDIR} "${OBJECTDIR}/_ext/60181895" 
	@${RM} ${OBJECTDIR}/_ext/60181895/plib_tmr2.o.d 
	@${RM} ${OBJECTDIR}/_ext/60181895/plib_tmr2.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -DBOARD_UNIQUE_ID=0x11 -I"../src" -I"../src/config/default" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/60181895/plib_tmr2.o.d" -o ${OBJECTDIR}/_ext/60181895/plib_tmr2.o ../src/config/default/peripheral/tmr/plib_tmr2.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
else
${OBJECTDIR}/canlib/util/can_rcv_buffer.o: canlib/util/can_rcv_buffer.c  .generated_files/flags/default/41574005471b7f27c27b191cc48ca51e129394f8 .generated_files/flags/default/21e5712e9da6f15e7f2c3a93091791477ef2790
	@${MKDIR} "${OBJECTDIR}/canlib/util" 
	@${RM} ${OBJECTDIR}/canlib/util/can_rcv_buffer.o.d 
	@${RM} ${OBJECTDIR}/canlib/util/can_rcv_buffer.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -DBOARD_UNIQUE_ID=0x11 -I"../src" -I"../src/config/default" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/canlib/util/can_rcv_buffer.o.d" -o ${OBJECTDIR}/canlib/util/can_rcv_buffer.o canlib/util/can_rcv_buffer.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/canlib/util/can_tx_buffer.o: canlib/util/can_tx_buffer.c  .generated_files/flags/default/b398177c2aca695064a7f8aac8e11a3fe4488486 .generated_files/flags/default/21e5712e9da6f15e7f2c3a93091791477ef2790
	@${MKDIR} "${OBJECTDIR}/canlib/util" 
	@${RM} ${OBJECTDIR}/canlib/util/can_tx_buffer.o.d 
	@${RM} ${OBJECTDIR}/canlib/util/can_tx_buffer.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -DBOARD_UNIQUE_ID=0x11 -I"../src" -I"../src/config/default" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/canlib/util/can_tx_buffer.o.d" -o ${OBJECTDIR}/canlib/util/can_tx_buffer.o canlib/util/can_tx_buffer.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/canlib/util/safe_ring_buffer.o: canlib/util/safe_ring_buffer.c  .generated_files/flags/default/58ca1a60dae9f8c733e3d562c46f3cbf02306e65 .generated_files/flags/default/21e5712e9da6f15e7f2c3a93091791477ef2790
	@${MKDIR} "${OBJECTDIR}/canlib/util" 
	@${RM} ${OBJECTDIR}/canlib/util/safe_ring_buffer.o.d 
	@${RM} ${OBJECTDIR}/canlib/util/safe_ring_buffer.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -DBOARD_UNIQUE_ID=0x11 -I"../src" -I"../src/config/default" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/canlib/util/safe_ring_buffer.o.d" -o ${OBJECTDIR}/canlib/util/safe_ring_buffer.o canlib/util/safe_ring_buffer.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/canlib/util/timing_util.o: canlib/util/timing_util.c  .generated_files/flags/default/24b17909ba8c50ad9b2534ae5b243f31f37d35a8 .generated_files/flags/default/21e5712e9da6f15e7f2c3a93091791477ef2790
	@${MKDIR} "${OBJECTDIR}/canlib/util" 
	@${RM} ${OBJECTDIR}/canlib/util/timing_util.o.d 
	@${RM} ${OBJECTDIR}/canlib/util/timing_util.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -DBOARD_UNIQUE_ID=0x11 -I"../src" -I"../src/config/default" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/canlib/util/timing_util.o.d" -o ${OBJECTDIR}/canlib/util/timing_util.o canlib/util/timing_util.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/canlib/can_common.o: canlib/can_common.c  .generated_files/flags/default/bbe573f3a75197cd46868126a85b7855840d9c98 .generated_files/flags/default/21e5712e9da6f15e7f2c3a93091791477ef2790
	@${MKDIR} "${OBJECTDIR}/canlib" 
	@${RM} ${OBJECTDIR}/canlib/can_common.o.d 
	@${RM} ${OBJECTDIR}/canlib/can_common.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -DBOARD_UNIQUE_ID=0x11 -I"../src" -I"../src/config/default" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/canlib/can_common.o.d" -o ${OBJECTDIR}/canlib/can_common.o canlib/can_common.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/60165182/plib_can2.o: ../src/config/default/peripheral/can/plib_can2.c  .generated_files/flags/default/982dc3344dfd5be1eaa72027f41de6254a445f1 .generated_files/flags/default/21e5712e9da6f15e7f2c3a93091791477ef2790
	@${MKDIR} "${OBJECTDIR}/_ext/60165182" 
	@${RM} ${OBJECTDIR}/_ext/60165182/plib_can2.o.d 
	@${RM} ${OBJECTDIR}/_ext/60165182/plib_can2.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -DBOARD_UNIQUE_ID=0x11 -I"../src" -I"../src/config/default" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/60165182/plib_can2.o.d" -o ${OBJECTDIR}/_ext/60165182/plib_can2.o ../src/config/default/peripheral/can/plib_can2.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/60165520/plib_clk.o: ../src/config/default/peripheral/clk/plib_clk.c  .generated_files/flags/default/ad512e6be796a1771ea808f0ffe53480b0b30d0b .generated_files/flags/default/21e5712e9da6f15e7f2c3a93091791477ef2790
	@${MKDIR} "${OBJECTDIR}/_ext/60165520" 
	@${RM} ${OBJECTDIR}/_ext/60165520/plib_clk.o.d 
	@${RM} ${OBJECTDIR}/_ext/60165520/plib_clk.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -DBOARD_UNIQUE_ID=0x11 -I"../src" -I"../src/config/default" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/60165520/plib_clk.o.d" -o ${OBJECTDIR}/_ext/60165520/plib_clk.o ../src/config/default/peripheral/clk/plib_clk.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1865200349/plib_evic.o: ../src/config/default/peripheral/evic/plib_evic.c  .generated_files/flags/default/af7c9bef2481898234cbeeb487897c35c9ca534f .generated_files/flags/default/21e5712e9da6f15e7f2c3a93091791477ef2790
	@${MKDIR} "${OBJECTDIR}/_ext/1865200349" 
	@${RM} ${OBJECTDIR}/_ext/1865200349/plib_evic.o.d 
	@${RM} ${OBJECTDIR}/_ext/1865200349/plib_evic.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -DBOARD_UNIQUE_ID=0x11 -I"../src" -I"../src/config/default" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1865200349/plib_evic.o.d" -o ${OBJECTDIR}/_ext/1865200349/plib_evic.o ../src/config/default/peripheral/evic/plib_evic.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1865254177/plib_gpio.o: ../src/config/default/peripheral/gpio/plib_gpio.c  .generated_files/flags/default/b6f6d72eb6eab24f45f27d13939d0c79a6d5222e .generated_files/flags/default/21e5712e9da6f15e7f2c3a93091791477ef2790
	@${MKDIR} "${OBJECTDIR}/_ext/1865254177" 
	@${RM} ${OBJECTDIR}/_ext/1865254177/plib_gpio.o.d 
	@${RM} ${OBJECTDIR}/_ext/1865254177/plib_gpio.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -DBOARD_UNIQUE_ID=0x11 -I"../src" -I"../src/config/default" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1865254177/plib_gpio.o.d" -o ${OBJECTDIR}/_ext/1865254177/plib_gpio.o ../src/config/default/peripheral/gpio/plib_gpio.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1865657120/plib_uart6.o: ../src/config/default/peripheral/uart/plib_uart6.c  .generated_files/flags/default/a41ef36b3f288cd1469d6162d6b2f78405be6eb1 .generated_files/flags/default/21e5712e9da6f15e7f2c3a93091791477ef2790
	@${MKDIR} "${OBJECTDIR}/_ext/1865657120" 
	@${RM} ${OBJECTDIR}/_ext/1865657120/plib_uart6.o.d 
	@${RM} ${OBJECTDIR}/_ext/1865657120/plib_uart6.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -DBOARD_UNIQUE_ID=0x11 -I"../src" -I"../src/config/default" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1865657120/plib_uart6.o.d" -o ${OBJECTDIR}/_ext/1865657120/plib_uart6.o ../src/config/default/peripheral/uart/plib_uart6.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/163028504/xc32_monitor.o: ../src/config/default/stdio/xc32_monitor.c  .generated_files/flags/default/d122b1ec869d36a20f8ddc109c159b0e44cdf8af .generated_files/flags/default/21e5712e9da6f15e7f2c3a93091791477ef2790
	@${MKDIR} "${OBJECTDIR}/_ext/163028504" 
	@${RM} ${OBJECTDIR}/_ext/163028504/xc32_monitor.o.d 
	@${RM} ${OBJECTDIR}/_ext/163028504/xc32_monitor.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -DBOARD_UNIQUE_ID=0x11 -I"../src" -I"../src/config/default" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/163028504/xc32_monitor.o.d" -o ${OBJECTDIR}/_ext/163028504/xc32_monitor.o ../src/config/default/stdio/xc32_monitor.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1171490990/exceptions.o: ../src/config/default/exceptions.c  .generated_files/flags/default/b10e776d563d729ee3b6242cb75584c0a2260120 .generated_files/flags/default/21e5712e9da6f15e7f2c3a93091791477ef2790
	@${MKDIR} "${OBJECTDIR}/_ext/1171490990" 
	@${RM} ${OBJECTDIR}/_ext/1171490990/exceptions.o.d 
	@${RM} ${OBJECTDIR}/_ext/1171490990/exceptions.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -DBOARD_UNIQUE_ID=0x11 -I"../src" -I"../src/config/default" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1171490990/exceptions.o.d" -o ${OBJECTDIR}/_ext/1171490990/exceptions.o ../src/config/default/exceptions.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1171490990/initialization.o: ../src/config/default/initialization.c  .generated_files/flags/default/b1d88b0670f4990a79f828bdbd17d45454e13764 .generated_files/flags/default/21e5712e9da6f15e7f2c3a93091791477ef2790
	@${MKDIR} "${OBJECTDIR}/_ext/1171490990" 
	@${RM} ${OBJECTDIR}/_ext/1171490990/initialization.o.d 
	@${RM} ${OBJECTDIR}/_ext/1171490990/initialization.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -DBOARD_UNIQUE_ID=0x11 -I"../src" -I"../src/config/default" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1171490990/initialization.o.d" -o ${OBJECTDIR}/_ext/1171490990/initialization.o ../src/config/default/initialization.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1171490990/interrupts.o: ../src/config/default/interrupts.c  .generated_files/flags/default/ebb413496afdf2dc75e8c40c542bdbe9654f019c .generated_files/flags/default/21e5712e9da6f15e7f2c3a93091791477ef2790
	@${MKDIR} "${OBJECTDIR}/_ext/1171490990" 
	@${RM} ${OBJECTDIR}/_ext/1171490990/interrupts.o.d 
	@${RM} ${OBJECTDIR}/_ext/1171490990/interrupts.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -DBOARD_UNIQUE_ID=0x11 -I"../src" -I"../src/config/default" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1171490990/interrupts.o.d" -o ${OBJECTDIR}/_ext/1171490990/interrupts.o ../src/config/default/interrupts.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1360937237/main.o: ../src/main.c  .generated_files/flags/default/ec4d6f141ec3fb94db58fd1308da0e61b19fd2a8 .generated_files/flags/default/21e5712e9da6f15e7f2c3a93091791477ef2790
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -DBOARD_UNIQUE_ID=0x11 -I"../src" -I"../src/config/default" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/main.o.d" -o ${OBJECTDIR}/_ext/1360937237/main.o ../src/main.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/kalman_lib/data.o: kalman_lib/data.c  .generated_files/flags/default/73e2aa9feffdf561816dfa4274f8fca3440b40bf .generated_files/flags/default/21e5712e9da6f15e7f2c3a93091791477ef2790
	@${MKDIR} "${OBJECTDIR}/kalman_lib" 
	@${RM} ${OBJECTDIR}/kalman_lib/data.o.d 
	@${RM} ${OBJECTDIR}/kalman_lib/data.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -DBOARD_UNIQUE_ID=0x11 -I"../src" -I"../src/config/default" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/kalman_lib/data.o.d" -o ${OBJECTDIR}/kalman_lib/data.o kalman_lib/data.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/kalman_lib/gps_conversion.o: kalman_lib/gps_conversion.c  .generated_files/flags/default/28bf475f28af06f7fc466d822f131f1946823299 .generated_files/flags/default/21e5712e9da6f15e7f2c3a93091791477ef2790
	@${MKDIR} "${OBJECTDIR}/kalman_lib" 
	@${RM} ${OBJECTDIR}/kalman_lib/gps_conversion.o.d 
	@${RM} ${OBJECTDIR}/kalman_lib/gps_conversion.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -DBOARD_UNIQUE_ID=0x11 -I"../src" -I"../src/config/default" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/kalman_lib/gps_conversion.o.d" -o ${OBJECTDIR}/kalman_lib/gps_conversion.o kalman_lib/gps_conversion.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/kalman_lib/kalman_lib.o: kalman_lib/kalman_lib.c  .generated_files/flags/default/f4c5c306e92691ee61872f74ddbbab738ce12ad1 .generated_files/flags/default/21e5712e9da6f15e7f2c3a93091791477ef2790
	@${MKDIR} "${OBJECTDIR}/kalman_lib" 
	@${RM} ${OBJECTDIR}/kalman_lib/kalman_lib.o.d 
	@${RM} ${OBJECTDIR}/kalman_lib/kalman_lib.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -DBOARD_UNIQUE_ID=0x11 -I"../src" -I"../src/config/default" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/kalman_lib/kalman_lib.o.d" -o ${OBJECTDIR}/kalman_lib/kalman_lib.o kalman_lib/kalman_lib.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/kalman_lib/orientation_conversion.o: kalman_lib/orientation_conversion.c  .generated_files/flags/default/a55dd91e51835d0ecfa411e2e75ed104fcb8baa7 .generated_files/flags/default/21e5712e9da6f15e7f2c3a93091791477ef2790
	@${MKDIR} "${OBJECTDIR}/kalman_lib" 
	@${RM} ${OBJECTDIR}/kalman_lib/orientation_conversion.o.d 
	@${RM} ${OBJECTDIR}/kalman_lib/orientation_conversion.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -DBOARD_UNIQUE_ID=0x11 -I"../src" -I"../src/config/default" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/kalman_lib/orientation_conversion.o.d" -o ${OBJECTDIR}/kalman_lib/orientation_conversion.o kalman_lib/orientation_conversion.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/60181895/plib_tmr2.o: ../src/config/default/peripheral/tmr/plib_tmr2.c  .generated_files/flags/default/7e0f2b88fc2aab9a4747f0c50358cb3bdc95ba1d .generated_files/flags/default/21e5712e9da6f15e7f2c3a93091791477ef2790
	@${MKDIR} "${OBJECTDIR}/_ext/60181895" 
	@${RM} ${OBJECTDIR}/_ext/60181895/plib_tmr2.o.d 
	@${RM} ${OBJECTDIR}/_ext/60181895/plib_tmr2.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -DBOARD_UNIQUE_ID=0x11 -I"../src" -I"../src/config/default" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/60181895/plib_tmr2.o.d" -o ${OBJECTDIR}/_ext/60181895/plib_tmr2.o ../src/config/default/peripheral/tmr/plib_tmr2.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
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
