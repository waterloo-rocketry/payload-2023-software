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
SOURCEFILES_QUOTED_IF_SPACED=canlib/util/can_rcv_buffer.c canlib/util/can_tx_buffer.c canlib/util/safe_ring_buffer.c canlib/util/timing_util.c canlib/can_common.c ../src/config/default/peripheral/can/plib_can2.c ../src/config/default/peripheral/clk/plib_clk.c ../src/config/default/peripheral/evic/plib_evic.c ../src/config/default/peripheral/gpio/plib_gpio.c ../src/config/default/peripheral/uart/plib_uart6.c ../src/config/default/stdio/xc32_monitor.c ../src/config/default/exceptions.c ../src/config/default/initialization.c ../src/config/default/interrupts.c ../src/main.c ../src/config/default/peripheral/tmr/plib_tmr2.c kalman_lib/data.c kalman_lib/gps_conversion.c kalman_lib/kalman_lib.c kalman_lib/kalman_test.c kalman_lib/orientation_conversion.c kalman_lib/orientation_test.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/canlib/util/can_rcv_buffer.o ${OBJECTDIR}/canlib/util/can_tx_buffer.o ${OBJECTDIR}/canlib/util/safe_ring_buffer.o ${OBJECTDIR}/canlib/util/timing_util.o ${OBJECTDIR}/canlib/can_common.o ${OBJECTDIR}/_ext/60165182/plib_can2.o ${OBJECTDIR}/_ext/60165520/plib_clk.o ${OBJECTDIR}/_ext/1865200349/plib_evic.o ${OBJECTDIR}/_ext/1865254177/plib_gpio.o ${OBJECTDIR}/_ext/1865657120/plib_uart6.o ${OBJECTDIR}/_ext/163028504/xc32_monitor.o ${OBJECTDIR}/_ext/1171490990/exceptions.o ${OBJECTDIR}/_ext/1171490990/initialization.o ${OBJECTDIR}/_ext/1171490990/interrupts.o ${OBJECTDIR}/_ext/1360937237/main.o ${OBJECTDIR}/_ext/60181895/plib_tmr2.o ${OBJECTDIR}/kalman_lib/data.o ${OBJECTDIR}/kalman_lib/gps_conversion.o ${OBJECTDIR}/kalman_lib/kalman_lib.o ${OBJECTDIR}/kalman_lib/kalman_test.o ${OBJECTDIR}/kalman_lib/orientation_conversion.o ${OBJECTDIR}/kalman_lib/orientation_test.o
POSSIBLE_DEPFILES=${OBJECTDIR}/canlib/util/can_rcv_buffer.o.d ${OBJECTDIR}/canlib/util/can_tx_buffer.o.d ${OBJECTDIR}/canlib/util/safe_ring_buffer.o.d ${OBJECTDIR}/canlib/util/timing_util.o.d ${OBJECTDIR}/canlib/can_common.o.d ${OBJECTDIR}/_ext/60165182/plib_can2.o.d ${OBJECTDIR}/_ext/60165520/plib_clk.o.d ${OBJECTDIR}/_ext/1865200349/plib_evic.o.d ${OBJECTDIR}/_ext/1865254177/plib_gpio.o.d ${OBJECTDIR}/_ext/1865657120/plib_uart6.o.d ${OBJECTDIR}/_ext/163028504/xc32_monitor.o.d ${OBJECTDIR}/_ext/1171490990/exceptions.o.d ${OBJECTDIR}/_ext/1171490990/initialization.o.d ${OBJECTDIR}/_ext/1171490990/interrupts.o.d ${OBJECTDIR}/_ext/1360937237/main.o.d ${OBJECTDIR}/_ext/60181895/plib_tmr2.o.d ${OBJECTDIR}/kalman_lib/data.o.d ${OBJECTDIR}/kalman_lib/gps_conversion.o.d ${OBJECTDIR}/kalman_lib/kalman_lib.o.d ${OBJECTDIR}/kalman_lib/kalman_test.o.d ${OBJECTDIR}/kalman_lib/orientation_conversion.o.d ${OBJECTDIR}/kalman_lib/orientation_test.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/canlib/util/can_rcv_buffer.o ${OBJECTDIR}/canlib/util/can_tx_buffer.o ${OBJECTDIR}/canlib/util/safe_ring_buffer.o ${OBJECTDIR}/canlib/util/timing_util.o ${OBJECTDIR}/canlib/can_common.o ${OBJECTDIR}/_ext/60165182/plib_can2.o ${OBJECTDIR}/_ext/60165520/plib_clk.o ${OBJECTDIR}/_ext/1865200349/plib_evic.o ${OBJECTDIR}/_ext/1865254177/plib_gpio.o ${OBJECTDIR}/_ext/1865657120/plib_uart6.o ${OBJECTDIR}/_ext/163028504/xc32_monitor.o ${OBJECTDIR}/_ext/1171490990/exceptions.o ${OBJECTDIR}/_ext/1171490990/initialization.o ${OBJECTDIR}/_ext/1171490990/interrupts.o ${OBJECTDIR}/_ext/1360937237/main.o ${OBJECTDIR}/_ext/60181895/plib_tmr2.o ${OBJECTDIR}/kalman_lib/data.o ${OBJECTDIR}/kalman_lib/gps_conversion.o ${OBJECTDIR}/kalman_lib/kalman_lib.o ${OBJECTDIR}/kalman_lib/kalman_test.o ${OBJECTDIR}/kalman_lib/orientation_conversion.o ${OBJECTDIR}/kalman_lib/orientation_test.o

# Source Files
SOURCEFILES=canlib/util/can_rcv_buffer.c canlib/util/can_tx_buffer.c canlib/util/safe_ring_buffer.c canlib/util/timing_util.c canlib/can_common.c ../src/config/default/peripheral/can/plib_can2.c ../src/config/default/peripheral/clk/plib_clk.c ../src/config/default/peripheral/evic/plib_evic.c ../src/config/default/peripheral/gpio/plib_gpio.c ../src/config/default/peripheral/uart/plib_uart6.c ../src/config/default/stdio/xc32_monitor.c ../src/config/default/exceptions.c ../src/config/default/initialization.c ../src/config/default/interrupts.c ../src/main.c ../src/config/default/peripheral/tmr/plib_tmr2.c kalman_lib/data.c kalman_lib/gps_conversion.c kalman_lib/kalman_lib.c kalman_lib/kalman_test.c kalman_lib/orientation_conversion.c kalman_lib/orientation_test.c



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
${OBJECTDIR}/canlib/util/can_rcv_buffer.o: canlib/util/can_rcv_buffer.c  .generated_files/flags/default/d55c531dcde2f3fa98e947ae30766332908905e2 .generated_files/flags/default/21e5712e9da6f15e7f2c3a93091791477ef2790
	@${MKDIR} "${OBJECTDIR}/canlib/util" 
	@${RM} ${OBJECTDIR}/canlib/util/can_rcv_buffer.o.d 
	@${RM} ${OBJECTDIR}/canlib/util/can_rcv_buffer.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -DBOARD_UNIQUE_ID=BOARD_ID_KALMAN -I"../src" -I"../src/config/default" -Wall -MP -MMD -MF "${OBJECTDIR}/canlib/util/can_rcv_buffer.o.d" -o ${OBJECTDIR}/canlib/util/can_rcv_buffer.o canlib/util/can_rcv_buffer.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/canlib/util/can_tx_buffer.o: canlib/util/can_tx_buffer.c  .generated_files/flags/default/9cc949f6b1ed75c51885fd6376f7b9620c1d02ce .generated_files/flags/default/21e5712e9da6f15e7f2c3a93091791477ef2790
	@${MKDIR} "${OBJECTDIR}/canlib/util" 
	@${RM} ${OBJECTDIR}/canlib/util/can_tx_buffer.o.d 
	@${RM} ${OBJECTDIR}/canlib/util/can_tx_buffer.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -DBOARD_UNIQUE_ID=BOARD_ID_KALMAN -I"../src" -I"../src/config/default" -Wall -MP -MMD -MF "${OBJECTDIR}/canlib/util/can_tx_buffer.o.d" -o ${OBJECTDIR}/canlib/util/can_tx_buffer.o canlib/util/can_tx_buffer.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/canlib/util/safe_ring_buffer.o: canlib/util/safe_ring_buffer.c  .generated_files/flags/default/8b3383201e731f1ee4e30f6f30fe604160c19d8c .generated_files/flags/default/21e5712e9da6f15e7f2c3a93091791477ef2790
	@${MKDIR} "${OBJECTDIR}/canlib/util" 
	@${RM} ${OBJECTDIR}/canlib/util/safe_ring_buffer.o.d 
	@${RM} ${OBJECTDIR}/canlib/util/safe_ring_buffer.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -DBOARD_UNIQUE_ID=BOARD_ID_KALMAN -I"../src" -I"../src/config/default" -Wall -MP -MMD -MF "${OBJECTDIR}/canlib/util/safe_ring_buffer.o.d" -o ${OBJECTDIR}/canlib/util/safe_ring_buffer.o canlib/util/safe_ring_buffer.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/canlib/util/timing_util.o: canlib/util/timing_util.c  .generated_files/flags/default/a8ccdacc69528ddca80d5ae2f15d1c7445c7c5f6 .generated_files/flags/default/21e5712e9da6f15e7f2c3a93091791477ef2790
	@${MKDIR} "${OBJECTDIR}/canlib/util" 
	@${RM} ${OBJECTDIR}/canlib/util/timing_util.o.d 
	@${RM} ${OBJECTDIR}/canlib/util/timing_util.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -DBOARD_UNIQUE_ID=BOARD_ID_KALMAN -I"../src" -I"../src/config/default" -Wall -MP -MMD -MF "${OBJECTDIR}/canlib/util/timing_util.o.d" -o ${OBJECTDIR}/canlib/util/timing_util.o canlib/util/timing_util.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/canlib/can_common.o: canlib/can_common.c  .generated_files/flags/default/1abd2ccf22f61175976903e2e3b3c60850a289d .generated_files/flags/default/21e5712e9da6f15e7f2c3a93091791477ef2790
	@${MKDIR} "${OBJECTDIR}/canlib" 
	@${RM} ${OBJECTDIR}/canlib/can_common.o.d 
	@${RM} ${OBJECTDIR}/canlib/can_common.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -DBOARD_UNIQUE_ID=BOARD_ID_KALMAN -I"../src" -I"../src/config/default" -Wall -MP -MMD -MF "${OBJECTDIR}/canlib/can_common.o.d" -o ${OBJECTDIR}/canlib/can_common.o canlib/can_common.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/60165182/plib_can2.o: ../src/config/default/peripheral/can/plib_can2.c  .generated_files/flags/default/ce3e75f2d969e6cc52f4aca879aade5a3d9db679 .generated_files/flags/default/21e5712e9da6f15e7f2c3a93091791477ef2790
	@${MKDIR} "${OBJECTDIR}/_ext/60165182" 
	@${RM} ${OBJECTDIR}/_ext/60165182/plib_can2.o.d 
	@${RM} ${OBJECTDIR}/_ext/60165182/plib_can2.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -DBOARD_UNIQUE_ID=BOARD_ID_KALMAN -I"../src" -I"../src/config/default" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/60165182/plib_can2.o.d" -o ${OBJECTDIR}/_ext/60165182/plib_can2.o ../src/config/default/peripheral/can/plib_can2.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/60165520/plib_clk.o: ../src/config/default/peripheral/clk/plib_clk.c  .generated_files/flags/default/1d68f0a0292906df85045d922651b544d51cfa0f .generated_files/flags/default/21e5712e9da6f15e7f2c3a93091791477ef2790
	@${MKDIR} "${OBJECTDIR}/_ext/60165520" 
	@${RM} ${OBJECTDIR}/_ext/60165520/plib_clk.o.d 
	@${RM} ${OBJECTDIR}/_ext/60165520/plib_clk.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -DBOARD_UNIQUE_ID=BOARD_ID_KALMAN -I"../src" -I"../src/config/default" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/60165520/plib_clk.o.d" -o ${OBJECTDIR}/_ext/60165520/plib_clk.o ../src/config/default/peripheral/clk/plib_clk.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1865200349/plib_evic.o: ../src/config/default/peripheral/evic/plib_evic.c  .generated_files/flags/default/8401ca2641ae482e6c9966a5f4315c560656e5dd .generated_files/flags/default/21e5712e9da6f15e7f2c3a93091791477ef2790
	@${MKDIR} "${OBJECTDIR}/_ext/1865200349" 
	@${RM} ${OBJECTDIR}/_ext/1865200349/plib_evic.o.d 
	@${RM} ${OBJECTDIR}/_ext/1865200349/plib_evic.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -DBOARD_UNIQUE_ID=BOARD_ID_KALMAN -I"../src" -I"../src/config/default" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1865200349/plib_evic.o.d" -o ${OBJECTDIR}/_ext/1865200349/plib_evic.o ../src/config/default/peripheral/evic/plib_evic.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1865254177/plib_gpio.o: ../src/config/default/peripheral/gpio/plib_gpio.c  .generated_files/flags/default/7ce932f5b0c2e59f5d5f5017c566b7d77c7a4c6d .generated_files/flags/default/21e5712e9da6f15e7f2c3a93091791477ef2790
	@${MKDIR} "${OBJECTDIR}/_ext/1865254177" 
	@${RM} ${OBJECTDIR}/_ext/1865254177/plib_gpio.o.d 
	@${RM} ${OBJECTDIR}/_ext/1865254177/plib_gpio.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -DBOARD_UNIQUE_ID=BOARD_ID_KALMAN -I"../src" -I"../src/config/default" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1865254177/plib_gpio.o.d" -o ${OBJECTDIR}/_ext/1865254177/plib_gpio.o ../src/config/default/peripheral/gpio/plib_gpio.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1865657120/plib_uart6.o: ../src/config/default/peripheral/uart/plib_uart6.c  .generated_files/flags/default/e4860c8f9d8e211855b1331ae55feb5dc0546901 .generated_files/flags/default/21e5712e9da6f15e7f2c3a93091791477ef2790
	@${MKDIR} "${OBJECTDIR}/_ext/1865657120" 
	@${RM} ${OBJECTDIR}/_ext/1865657120/plib_uart6.o.d 
	@${RM} ${OBJECTDIR}/_ext/1865657120/plib_uart6.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -DBOARD_UNIQUE_ID=BOARD_ID_KALMAN -I"../src" -I"../src/config/default" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1865657120/plib_uart6.o.d" -o ${OBJECTDIR}/_ext/1865657120/plib_uart6.o ../src/config/default/peripheral/uart/plib_uart6.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/163028504/xc32_monitor.o: ../src/config/default/stdio/xc32_monitor.c  .generated_files/flags/default/b0d0fd6eb807446fadb33be7503cbdeb6ac2f314 .generated_files/flags/default/21e5712e9da6f15e7f2c3a93091791477ef2790
	@${MKDIR} "${OBJECTDIR}/_ext/163028504" 
	@${RM} ${OBJECTDIR}/_ext/163028504/xc32_monitor.o.d 
	@${RM} ${OBJECTDIR}/_ext/163028504/xc32_monitor.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -DBOARD_UNIQUE_ID=BOARD_ID_KALMAN -I"../src" -I"../src/config/default" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/163028504/xc32_monitor.o.d" -o ${OBJECTDIR}/_ext/163028504/xc32_monitor.o ../src/config/default/stdio/xc32_monitor.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1171490990/exceptions.o: ../src/config/default/exceptions.c  .generated_files/flags/default/e6102c6eeb5bd2c834abb27f6a8c16251cab3f6d .generated_files/flags/default/21e5712e9da6f15e7f2c3a93091791477ef2790
	@${MKDIR} "${OBJECTDIR}/_ext/1171490990" 
	@${RM} ${OBJECTDIR}/_ext/1171490990/exceptions.o.d 
	@${RM} ${OBJECTDIR}/_ext/1171490990/exceptions.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -DBOARD_UNIQUE_ID=BOARD_ID_KALMAN -I"../src" -I"../src/config/default" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1171490990/exceptions.o.d" -o ${OBJECTDIR}/_ext/1171490990/exceptions.o ../src/config/default/exceptions.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1171490990/initialization.o: ../src/config/default/initialization.c  .generated_files/flags/default/2a4c287a7b288b58a0bd77569a63bbcb61bdbd54 .generated_files/flags/default/21e5712e9da6f15e7f2c3a93091791477ef2790
	@${MKDIR} "${OBJECTDIR}/_ext/1171490990" 
	@${RM} ${OBJECTDIR}/_ext/1171490990/initialization.o.d 
	@${RM} ${OBJECTDIR}/_ext/1171490990/initialization.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -DBOARD_UNIQUE_ID=BOARD_ID_KALMAN -I"../src" -I"../src/config/default" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1171490990/initialization.o.d" -o ${OBJECTDIR}/_ext/1171490990/initialization.o ../src/config/default/initialization.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1171490990/interrupts.o: ../src/config/default/interrupts.c  .generated_files/flags/default/64d08903eab931c825e2e36476b055e3f5433807 .generated_files/flags/default/21e5712e9da6f15e7f2c3a93091791477ef2790
	@${MKDIR} "${OBJECTDIR}/_ext/1171490990" 
	@${RM} ${OBJECTDIR}/_ext/1171490990/interrupts.o.d 
	@${RM} ${OBJECTDIR}/_ext/1171490990/interrupts.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -DBOARD_UNIQUE_ID=BOARD_ID_KALMAN -I"../src" -I"../src/config/default" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1171490990/interrupts.o.d" -o ${OBJECTDIR}/_ext/1171490990/interrupts.o ../src/config/default/interrupts.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1360937237/main.o: ../src/main.c  .generated_files/flags/default/a2bd61f6c2c9c1b8008b029c4307349ee329eb9 .generated_files/flags/default/21e5712e9da6f15e7f2c3a93091791477ef2790
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -DBOARD_UNIQUE_ID=BOARD_ID_KALMAN -I"../src" -I"../src/config/default" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/main.o.d" -o ${OBJECTDIR}/_ext/1360937237/main.o ../src/main.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/60181895/plib_tmr2.o: ../src/config/default/peripheral/tmr/plib_tmr2.c  .generated_files/flags/default/815ef89879b77cf7f8fa755748f22e6cf7dcf491 .generated_files/flags/default/21e5712e9da6f15e7f2c3a93091791477ef2790
	@${MKDIR} "${OBJECTDIR}/_ext/60181895" 
	@${RM} ${OBJECTDIR}/_ext/60181895/plib_tmr2.o.d 
	@${RM} ${OBJECTDIR}/_ext/60181895/plib_tmr2.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -DBOARD_UNIQUE_ID=BOARD_ID_KALMAN -I"../src" -I"../src/config/default" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/60181895/plib_tmr2.o.d" -o ${OBJECTDIR}/_ext/60181895/plib_tmr2.o ../src/config/default/peripheral/tmr/plib_tmr2.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/kalman_lib/data.o: kalman_lib/data.c  .generated_files/flags/default/23db5d22f85cd5236485ba087cf52238259c46fe .generated_files/flags/default/21e5712e9da6f15e7f2c3a93091791477ef2790
	@${MKDIR} "${OBJECTDIR}/kalman_lib" 
	@${RM} ${OBJECTDIR}/kalman_lib/data.o.d 
	@${RM} ${OBJECTDIR}/kalman_lib/data.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -DBOARD_UNIQUE_ID=BOARD_ID_KALMAN -I"../src" -I"../src/config/default" -Wall -MP -MMD -MF "${OBJECTDIR}/kalman_lib/data.o.d" -o ${OBJECTDIR}/kalman_lib/data.o kalman_lib/data.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/kalman_lib/gps_conversion.o: kalman_lib/gps_conversion.c  .generated_files/flags/default/4b99bc0dd2a2fff4c59267043c83d561489a849a .generated_files/flags/default/21e5712e9da6f15e7f2c3a93091791477ef2790
	@${MKDIR} "${OBJECTDIR}/kalman_lib" 
	@${RM} ${OBJECTDIR}/kalman_lib/gps_conversion.o.d 
	@${RM} ${OBJECTDIR}/kalman_lib/gps_conversion.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -DBOARD_UNIQUE_ID=BOARD_ID_KALMAN -I"../src" -I"../src/config/default" -Wall -MP -MMD -MF "${OBJECTDIR}/kalman_lib/gps_conversion.o.d" -o ${OBJECTDIR}/kalman_lib/gps_conversion.o kalman_lib/gps_conversion.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/kalman_lib/kalman_lib.o: kalman_lib/kalman_lib.c  .generated_files/flags/default/214ce5e9d97000dd9ca59daac77401e56aadc8db .generated_files/flags/default/21e5712e9da6f15e7f2c3a93091791477ef2790
	@${MKDIR} "${OBJECTDIR}/kalman_lib" 
	@${RM} ${OBJECTDIR}/kalman_lib/kalman_lib.o.d 
	@${RM} ${OBJECTDIR}/kalman_lib/kalman_lib.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -DBOARD_UNIQUE_ID=BOARD_ID_KALMAN -I"../src" -I"../src/config/default" -Wall -MP -MMD -MF "${OBJECTDIR}/kalman_lib/kalman_lib.o.d" -o ${OBJECTDIR}/kalman_lib/kalman_lib.o kalman_lib/kalman_lib.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/kalman_lib/kalman_test.o: kalman_lib/kalman_test.c  .generated_files/flags/default/77583f40f065485a40851dcadcfa41923a926c61 .generated_files/flags/default/21e5712e9da6f15e7f2c3a93091791477ef2790
	@${MKDIR} "${OBJECTDIR}/kalman_lib" 
	@${RM} ${OBJECTDIR}/kalman_lib/kalman_test.o.d 
	@${RM} ${OBJECTDIR}/kalman_lib/kalman_test.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -DBOARD_UNIQUE_ID=BOARD_ID_KALMAN -I"../src" -I"../src/config/default" -Wall -MP -MMD -MF "${OBJECTDIR}/kalman_lib/kalman_test.o.d" -o ${OBJECTDIR}/kalman_lib/kalman_test.o kalman_lib/kalman_test.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/kalman_lib/orientation_conversion.o: kalman_lib/orientation_conversion.c  .generated_files/flags/default/694a173957eb7b3ba0696de50a115c2827817427 .generated_files/flags/default/21e5712e9da6f15e7f2c3a93091791477ef2790
	@${MKDIR} "${OBJECTDIR}/kalman_lib" 
	@${RM} ${OBJECTDIR}/kalman_lib/orientation_conversion.o.d 
	@${RM} ${OBJECTDIR}/kalman_lib/orientation_conversion.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -DBOARD_UNIQUE_ID=BOARD_ID_KALMAN -I"../src" -I"../src/config/default" -Wall -MP -MMD -MF "${OBJECTDIR}/kalman_lib/orientation_conversion.o.d" -o ${OBJECTDIR}/kalman_lib/orientation_conversion.o kalman_lib/orientation_conversion.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/kalman_lib/orientation_test.o: kalman_lib/orientation_test.c  .generated_files/flags/default/5c8d916a0f86141f0d79899b22a4a4a6064523be .generated_files/flags/default/21e5712e9da6f15e7f2c3a93091791477ef2790
	@${MKDIR} "${OBJECTDIR}/kalman_lib" 
	@${RM} ${OBJECTDIR}/kalman_lib/orientation_test.o.d 
	@${RM} ${OBJECTDIR}/kalman_lib/orientation_test.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -DBOARD_UNIQUE_ID=BOARD_ID_KALMAN -I"../src" -I"../src/config/default" -Wall -MP -MMD -MF "${OBJECTDIR}/kalman_lib/orientation_test.o.d" -o ${OBJECTDIR}/kalman_lib/orientation_test.o kalman_lib/orientation_test.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
else
${OBJECTDIR}/canlib/util/can_rcv_buffer.o: canlib/util/can_rcv_buffer.c  .generated_files/flags/default/21b5dee926015ccde65adfe9806efa06813114ff .generated_files/flags/default/21e5712e9da6f15e7f2c3a93091791477ef2790
	@${MKDIR} "${OBJECTDIR}/canlib/util" 
	@${RM} ${OBJECTDIR}/canlib/util/can_rcv_buffer.o.d 
	@${RM} ${OBJECTDIR}/canlib/util/can_rcv_buffer.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -DBOARD_UNIQUE_ID=BOARD_ID_KALMAN -I"../src" -I"../src/config/default" -Wall -MP -MMD -MF "${OBJECTDIR}/canlib/util/can_rcv_buffer.o.d" -o ${OBJECTDIR}/canlib/util/can_rcv_buffer.o canlib/util/can_rcv_buffer.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/canlib/util/can_tx_buffer.o: canlib/util/can_tx_buffer.c  .generated_files/flags/default/7b2843bd8783a74690dd3c95a31e32451c269a55 .generated_files/flags/default/21e5712e9da6f15e7f2c3a93091791477ef2790
	@${MKDIR} "${OBJECTDIR}/canlib/util" 
	@${RM} ${OBJECTDIR}/canlib/util/can_tx_buffer.o.d 
	@${RM} ${OBJECTDIR}/canlib/util/can_tx_buffer.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -DBOARD_UNIQUE_ID=BOARD_ID_KALMAN -I"../src" -I"../src/config/default" -Wall -MP -MMD -MF "${OBJECTDIR}/canlib/util/can_tx_buffer.o.d" -o ${OBJECTDIR}/canlib/util/can_tx_buffer.o canlib/util/can_tx_buffer.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/canlib/util/safe_ring_buffer.o: canlib/util/safe_ring_buffer.c  .generated_files/flags/default/c4ab965a2110fdecc67edc2bf8c1b5def9e55dbc .generated_files/flags/default/21e5712e9da6f15e7f2c3a93091791477ef2790
	@${MKDIR} "${OBJECTDIR}/canlib/util" 
	@${RM} ${OBJECTDIR}/canlib/util/safe_ring_buffer.o.d 
	@${RM} ${OBJECTDIR}/canlib/util/safe_ring_buffer.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -DBOARD_UNIQUE_ID=BOARD_ID_KALMAN -I"../src" -I"../src/config/default" -Wall -MP -MMD -MF "${OBJECTDIR}/canlib/util/safe_ring_buffer.o.d" -o ${OBJECTDIR}/canlib/util/safe_ring_buffer.o canlib/util/safe_ring_buffer.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/canlib/util/timing_util.o: canlib/util/timing_util.c  .generated_files/flags/default/ee3117bb52ca980a7d289a9325c03e0f7d2496c2 .generated_files/flags/default/21e5712e9da6f15e7f2c3a93091791477ef2790
	@${MKDIR} "${OBJECTDIR}/canlib/util" 
	@${RM} ${OBJECTDIR}/canlib/util/timing_util.o.d 
	@${RM} ${OBJECTDIR}/canlib/util/timing_util.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -DBOARD_UNIQUE_ID=BOARD_ID_KALMAN -I"../src" -I"../src/config/default" -Wall -MP -MMD -MF "${OBJECTDIR}/canlib/util/timing_util.o.d" -o ${OBJECTDIR}/canlib/util/timing_util.o canlib/util/timing_util.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/canlib/can_common.o: canlib/can_common.c  .generated_files/flags/default/e59564190c2727bd8aab1a8837e301ec51805bf8 .generated_files/flags/default/21e5712e9da6f15e7f2c3a93091791477ef2790
	@${MKDIR} "${OBJECTDIR}/canlib" 
	@${RM} ${OBJECTDIR}/canlib/can_common.o.d 
	@${RM} ${OBJECTDIR}/canlib/can_common.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -DBOARD_UNIQUE_ID=BOARD_ID_KALMAN -I"../src" -I"../src/config/default" -Wall -MP -MMD -MF "${OBJECTDIR}/canlib/can_common.o.d" -o ${OBJECTDIR}/canlib/can_common.o canlib/can_common.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/60165182/plib_can2.o: ../src/config/default/peripheral/can/plib_can2.c  .generated_files/flags/default/f613476a41b29b7775d24b295e008242983f595b .generated_files/flags/default/21e5712e9da6f15e7f2c3a93091791477ef2790
	@${MKDIR} "${OBJECTDIR}/_ext/60165182" 
	@${RM} ${OBJECTDIR}/_ext/60165182/plib_can2.o.d 
	@${RM} ${OBJECTDIR}/_ext/60165182/plib_can2.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -DBOARD_UNIQUE_ID=BOARD_ID_KALMAN -I"../src" -I"../src/config/default" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/60165182/plib_can2.o.d" -o ${OBJECTDIR}/_ext/60165182/plib_can2.o ../src/config/default/peripheral/can/plib_can2.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/60165520/plib_clk.o: ../src/config/default/peripheral/clk/plib_clk.c  .generated_files/flags/default/c321e7c5010adbafd91817131e347dd0d90469be .generated_files/flags/default/21e5712e9da6f15e7f2c3a93091791477ef2790
	@${MKDIR} "${OBJECTDIR}/_ext/60165520" 
	@${RM} ${OBJECTDIR}/_ext/60165520/plib_clk.o.d 
	@${RM} ${OBJECTDIR}/_ext/60165520/plib_clk.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -DBOARD_UNIQUE_ID=BOARD_ID_KALMAN -I"../src" -I"../src/config/default" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/60165520/plib_clk.o.d" -o ${OBJECTDIR}/_ext/60165520/plib_clk.o ../src/config/default/peripheral/clk/plib_clk.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1865200349/plib_evic.o: ../src/config/default/peripheral/evic/plib_evic.c  .generated_files/flags/default/63f67a1d5ea84fe033125f83ba87fd38c4d1ed1 .generated_files/flags/default/21e5712e9da6f15e7f2c3a93091791477ef2790
	@${MKDIR} "${OBJECTDIR}/_ext/1865200349" 
	@${RM} ${OBJECTDIR}/_ext/1865200349/plib_evic.o.d 
	@${RM} ${OBJECTDIR}/_ext/1865200349/plib_evic.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -DBOARD_UNIQUE_ID=BOARD_ID_KALMAN -I"../src" -I"../src/config/default" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1865200349/plib_evic.o.d" -o ${OBJECTDIR}/_ext/1865200349/plib_evic.o ../src/config/default/peripheral/evic/plib_evic.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1865254177/plib_gpio.o: ../src/config/default/peripheral/gpio/plib_gpio.c  .generated_files/flags/default/5db3fdd7f2343905c57d99c39fc8f12d20d3c51 .generated_files/flags/default/21e5712e9da6f15e7f2c3a93091791477ef2790
	@${MKDIR} "${OBJECTDIR}/_ext/1865254177" 
	@${RM} ${OBJECTDIR}/_ext/1865254177/plib_gpio.o.d 
	@${RM} ${OBJECTDIR}/_ext/1865254177/plib_gpio.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -DBOARD_UNIQUE_ID=BOARD_ID_KALMAN -I"../src" -I"../src/config/default" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1865254177/plib_gpio.o.d" -o ${OBJECTDIR}/_ext/1865254177/plib_gpio.o ../src/config/default/peripheral/gpio/plib_gpio.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1865657120/plib_uart6.o: ../src/config/default/peripheral/uart/plib_uart6.c  .generated_files/flags/default/1157c0caef9a1ca11d1f1bf7726675a927fa613b .generated_files/flags/default/21e5712e9da6f15e7f2c3a93091791477ef2790
	@${MKDIR} "${OBJECTDIR}/_ext/1865657120" 
	@${RM} ${OBJECTDIR}/_ext/1865657120/plib_uart6.o.d 
	@${RM} ${OBJECTDIR}/_ext/1865657120/plib_uart6.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -DBOARD_UNIQUE_ID=BOARD_ID_KALMAN -I"../src" -I"../src/config/default" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1865657120/plib_uart6.o.d" -o ${OBJECTDIR}/_ext/1865657120/plib_uart6.o ../src/config/default/peripheral/uart/plib_uart6.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/163028504/xc32_monitor.o: ../src/config/default/stdio/xc32_monitor.c  .generated_files/flags/default/efd2a24d095697270d1c7f0415456ffa53bca49b .generated_files/flags/default/21e5712e9da6f15e7f2c3a93091791477ef2790
	@${MKDIR} "${OBJECTDIR}/_ext/163028504" 
	@${RM} ${OBJECTDIR}/_ext/163028504/xc32_monitor.o.d 
	@${RM} ${OBJECTDIR}/_ext/163028504/xc32_monitor.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -DBOARD_UNIQUE_ID=BOARD_ID_KALMAN -I"../src" -I"../src/config/default" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/163028504/xc32_monitor.o.d" -o ${OBJECTDIR}/_ext/163028504/xc32_monitor.o ../src/config/default/stdio/xc32_monitor.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1171490990/exceptions.o: ../src/config/default/exceptions.c  .generated_files/flags/default/f5da8cf7c0f3c651bae099bebac5fe38552e8ba6 .generated_files/flags/default/21e5712e9da6f15e7f2c3a93091791477ef2790
	@${MKDIR} "${OBJECTDIR}/_ext/1171490990" 
	@${RM} ${OBJECTDIR}/_ext/1171490990/exceptions.o.d 
	@${RM} ${OBJECTDIR}/_ext/1171490990/exceptions.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -DBOARD_UNIQUE_ID=BOARD_ID_KALMAN -I"../src" -I"../src/config/default" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1171490990/exceptions.o.d" -o ${OBJECTDIR}/_ext/1171490990/exceptions.o ../src/config/default/exceptions.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1171490990/initialization.o: ../src/config/default/initialization.c  .generated_files/flags/default/d7e22180f4323068ea6303b47f466987d0040859 .generated_files/flags/default/21e5712e9da6f15e7f2c3a93091791477ef2790
	@${MKDIR} "${OBJECTDIR}/_ext/1171490990" 
	@${RM} ${OBJECTDIR}/_ext/1171490990/initialization.o.d 
	@${RM} ${OBJECTDIR}/_ext/1171490990/initialization.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -DBOARD_UNIQUE_ID=BOARD_ID_KALMAN -I"../src" -I"../src/config/default" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1171490990/initialization.o.d" -o ${OBJECTDIR}/_ext/1171490990/initialization.o ../src/config/default/initialization.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1171490990/interrupts.o: ../src/config/default/interrupts.c  .generated_files/flags/default/e003f30d1013b6b046fe817deca876ab1a7da75e .generated_files/flags/default/21e5712e9da6f15e7f2c3a93091791477ef2790
	@${MKDIR} "${OBJECTDIR}/_ext/1171490990" 
	@${RM} ${OBJECTDIR}/_ext/1171490990/interrupts.o.d 
	@${RM} ${OBJECTDIR}/_ext/1171490990/interrupts.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -DBOARD_UNIQUE_ID=BOARD_ID_KALMAN -I"../src" -I"../src/config/default" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1171490990/interrupts.o.d" -o ${OBJECTDIR}/_ext/1171490990/interrupts.o ../src/config/default/interrupts.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1360937237/main.o: ../src/main.c  .generated_files/flags/default/7420caa237729c189f4758bcce3ea4ccb7ee741c .generated_files/flags/default/21e5712e9da6f15e7f2c3a93091791477ef2790
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -DBOARD_UNIQUE_ID=BOARD_ID_KALMAN -I"../src" -I"../src/config/default" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/main.o.d" -o ${OBJECTDIR}/_ext/1360937237/main.o ../src/main.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/60181895/plib_tmr2.o: ../src/config/default/peripheral/tmr/plib_tmr2.c  .generated_files/flags/default/56208c3d0eeb790d3ae6e791038f69680dbc2b8e .generated_files/flags/default/21e5712e9da6f15e7f2c3a93091791477ef2790
	@${MKDIR} "${OBJECTDIR}/_ext/60181895" 
	@${RM} ${OBJECTDIR}/_ext/60181895/plib_tmr2.o.d 
	@${RM} ${OBJECTDIR}/_ext/60181895/plib_tmr2.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -DBOARD_UNIQUE_ID=BOARD_ID_KALMAN -I"../src" -I"../src/config/default" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/60181895/plib_tmr2.o.d" -o ${OBJECTDIR}/_ext/60181895/plib_tmr2.o ../src/config/default/peripheral/tmr/plib_tmr2.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/kalman_lib/data.o: kalman_lib/data.c  .generated_files/flags/default/e0429148be4d63e148989014d1f5513198b95b79 .generated_files/flags/default/21e5712e9da6f15e7f2c3a93091791477ef2790
	@${MKDIR} "${OBJECTDIR}/kalman_lib" 
	@${RM} ${OBJECTDIR}/kalman_lib/data.o.d 
	@${RM} ${OBJECTDIR}/kalman_lib/data.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -DBOARD_UNIQUE_ID=BOARD_ID_KALMAN -I"../src" -I"../src/config/default" -Wall -MP -MMD -MF "${OBJECTDIR}/kalman_lib/data.o.d" -o ${OBJECTDIR}/kalman_lib/data.o kalman_lib/data.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/kalman_lib/gps_conversion.o: kalman_lib/gps_conversion.c  .generated_files/flags/default/9eccc92728ac6757f0cd4f40988b5370cf333c39 .generated_files/flags/default/21e5712e9da6f15e7f2c3a93091791477ef2790
	@${MKDIR} "${OBJECTDIR}/kalman_lib" 
	@${RM} ${OBJECTDIR}/kalman_lib/gps_conversion.o.d 
	@${RM} ${OBJECTDIR}/kalman_lib/gps_conversion.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -DBOARD_UNIQUE_ID=BOARD_ID_KALMAN -I"../src" -I"../src/config/default" -Wall -MP -MMD -MF "${OBJECTDIR}/kalman_lib/gps_conversion.o.d" -o ${OBJECTDIR}/kalman_lib/gps_conversion.o kalman_lib/gps_conversion.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/kalman_lib/kalman_lib.o: kalman_lib/kalman_lib.c  .generated_files/flags/default/49175d0d022ddee8ef0c9861c83dfb0265aa97e3 .generated_files/flags/default/21e5712e9da6f15e7f2c3a93091791477ef2790
	@${MKDIR} "${OBJECTDIR}/kalman_lib" 
	@${RM} ${OBJECTDIR}/kalman_lib/kalman_lib.o.d 
	@${RM} ${OBJECTDIR}/kalman_lib/kalman_lib.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -DBOARD_UNIQUE_ID=BOARD_ID_KALMAN -I"../src" -I"../src/config/default" -Wall -MP -MMD -MF "${OBJECTDIR}/kalman_lib/kalman_lib.o.d" -o ${OBJECTDIR}/kalman_lib/kalman_lib.o kalman_lib/kalman_lib.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/kalman_lib/kalman_test.o: kalman_lib/kalman_test.c  .generated_files/flags/default/7148f6478c785760e9aa27a3f019024ba0841e1d .generated_files/flags/default/21e5712e9da6f15e7f2c3a93091791477ef2790
	@${MKDIR} "${OBJECTDIR}/kalman_lib" 
	@${RM} ${OBJECTDIR}/kalman_lib/kalman_test.o.d 
	@${RM} ${OBJECTDIR}/kalman_lib/kalman_test.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -DBOARD_UNIQUE_ID=BOARD_ID_KALMAN -I"../src" -I"../src/config/default" -Wall -MP -MMD -MF "${OBJECTDIR}/kalman_lib/kalman_test.o.d" -o ${OBJECTDIR}/kalman_lib/kalman_test.o kalman_lib/kalman_test.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/kalman_lib/orientation_conversion.o: kalman_lib/orientation_conversion.c  .generated_files/flags/default/cdcf5a31c7b7dba0a0d971c8e248d94f883ba621 .generated_files/flags/default/21e5712e9da6f15e7f2c3a93091791477ef2790
	@${MKDIR} "${OBJECTDIR}/kalman_lib" 
	@${RM} ${OBJECTDIR}/kalman_lib/orientation_conversion.o.d 
	@${RM} ${OBJECTDIR}/kalman_lib/orientation_conversion.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -DBOARD_UNIQUE_ID=BOARD_ID_KALMAN -I"../src" -I"../src/config/default" -Wall -MP -MMD -MF "${OBJECTDIR}/kalman_lib/orientation_conversion.o.d" -o ${OBJECTDIR}/kalman_lib/orientation_conversion.o kalman_lib/orientation_conversion.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/kalman_lib/orientation_test.o: kalman_lib/orientation_test.c  .generated_files/flags/default/cdf6766e8e626ba6d24e9e7d192b8cfdd4130d6f .generated_files/flags/default/21e5712e9da6f15e7f2c3a93091791477ef2790
	@${MKDIR} "${OBJECTDIR}/kalman_lib" 
	@${RM} ${OBJECTDIR}/kalman_lib/orientation_test.o.d 
	@${RM} ${OBJECTDIR}/kalman_lib/orientation_test.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -DBOARD_UNIQUE_ID=BOARD_ID_KALMAN -I"../src" -I"../src/config/default" -Wall -MP -MMD -MF "${OBJECTDIR}/kalman_lib/orientation_test.o.d" -o ${OBJECTDIR}/kalman_lib/orientation_test.o kalman_lib/orientation_test.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
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
	${MP_CC} $(MP_EXTRA_LD_PRE) -g   -mprocessor=$(MP_PROCESSOR_OPTION)  -o ${DISTDIR}/kalman_board.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)      -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,-D=__DEBUG_D,--defsym=_min_heap_size=512,--gc-sections,--no-code-in-dinit,--no-dinit-in-serial-mem,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,${DISTDIR}/memoryfile.xml -mdfp="${DFP_DIR}"
	
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
