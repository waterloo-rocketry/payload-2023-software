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
MKDIR=mkdir -p
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
MP_LINKER_FILE_OPTION=,--script="../src/config/default/p32MZ2048EFM144.ld"
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
${OBJECTDIR}/canlib/util/can_rcv_buffer.o: canlib/util/can_rcv_buffer.c  .generated_files/flags/default/2879b0bfdeb76f08af7c296545356bb6ab202e62 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/canlib/util" 
	@${RM} ${OBJECTDIR}/canlib/util/can_rcv_buffer.o.d 
	@${RM} ${OBJECTDIR}/canlib/util/can_rcv_buffer.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -DBOARD_UNIQUE_ID=0x11 -I"../src" -I"../src/config/default" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/canlib/util/can_rcv_buffer.o.d" -o ${OBJECTDIR}/canlib/util/can_rcv_buffer.o canlib/util/can_rcv_buffer.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/canlib/util/can_tx_buffer.o: canlib/util/can_tx_buffer.c  .generated_files/flags/default/e1958f5ec68c5332386e8255e34cbb455feeb239 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/canlib/util" 
	@${RM} ${OBJECTDIR}/canlib/util/can_tx_buffer.o.d 
	@${RM} ${OBJECTDIR}/canlib/util/can_tx_buffer.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -DBOARD_UNIQUE_ID=0x11 -I"../src" -I"../src/config/default" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/canlib/util/can_tx_buffer.o.d" -o ${OBJECTDIR}/canlib/util/can_tx_buffer.o canlib/util/can_tx_buffer.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/canlib/util/safe_ring_buffer.o: canlib/util/safe_ring_buffer.c  .generated_files/flags/default/2332c65394f77cff6d6c8b4b780bdb1621fc5e62 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/canlib/util" 
	@${RM} ${OBJECTDIR}/canlib/util/safe_ring_buffer.o.d 
	@${RM} ${OBJECTDIR}/canlib/util/safe_ring_buffer.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -DBOARD_UNIQUE_ID=0x11 -I"../src" -I"../src/config/default" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/canlib/util/safe_ring_buffer.o.d" -o ${OBJECTDIR}/canlib/util/safe_ring_buffer.o canlib/util/safe_ring_buffer.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/canlib/util/timing_util.o: canlib/util/timing_util.c  .generated_files/flags/default/877cf50d49570d9b1d940c72372d44615465621c .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/canlib/util" 
	@${RM} ${OBJECTDIR}/canlib/util/timing_util.o.d 
	@${RM} ${OBJECTDIR}/canlib/util/timing_util.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -DBOARD_UNIQUE_ID=0x11 -I"../src" -I"../src/config/default" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/canlib/util/timing_util.o.d" -o ${OBJECTDIR}/canlib/util/timing_util.o canlib/util/timing_util.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/canlib/can_common.o: canlib/can_common.c  .generated_files/flags/default/31c94321644b6a3dd641d23e0af6b53a33358a15 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/canlib" 
	@${RM} ${OBJECTDIR}/canlib/can_common.o.d 
	@${RM} ${OBJECTDIR}/canlib/can_common.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -DBOARD_UNIQUE_ID=0x11 -I"../src" -I"../src/config/default" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/canlib/can_common.o.d" -o ${OBJECTDIR}/canlib/can_common.o canlib/can_common.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/60165182/plib_can2.o: ../src/config/default/peripheral/can/plib_can2.c  .generated_files/flags/default/c0e94111e14f40f4f634d3ac1e4ec982b019d951 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/60165182" 
	@${RM} ${OBJECTDIR}/_ext/60165182/plib_can2.o.d 
	@${RM} ${OBJECTDIR}/_ext/60165182/plib_can2.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -DBOARD_UNIQUE_ID=0x11 -I"../src" -I"../src/config/default" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/60165182/plib_can2.o.d" -o ${OBJECTDIR}/_ext/60165182/plib_can2.o ../src/config/default/peripheral/can/plib_can2.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/60165520/plib_clk.o: ../src/config/default/peripheral/clk/plib_clk.c  .generated_files/flags/default/56b3270c780873256e668aa02fc42f7fb90de741 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/60165520" 
	@${RM} ${OBJECTDIR}/_ext/60165520/plib_clk.o.d 
	@${RM} ${OBJECTDIR}/_ext/60165520/plib_clk.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -DBOARD_UNIQUE_ID=0x11 -I"../src" -I"../src/config/default" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/60165520/plib_clk.o.d" -o ${OBJECTDIR}/_ext/60165520/plib_clk.o ../src/config/default/peripheral/clk/plib_clk.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1865200349/plib_evic.o: ../src/config/default/peripheral/evic/plib_evic.c  .generated_files/flags/default/fe82143741a4baa8990606062cc9d95bf65fb372 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1865200349" 
	@${RM} ${OBJECTDIR}/_ext/1865200349/plib_evic.o.d 
	@${RM} ${OBJECTDIR}/_ext/1865200349/plib_evic.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -DBOARD_UNIQUE_ID=0x11 -I"../src" -I"../src/config/default" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1865200349/plib_evic.o.d" -o ${OBJECTDIR}/_ext/1865200349/plib_evic.o ../src/config/default/peripheral/evic/plib_evic.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1865254177/plib_gpio.o: ../src/config/default/peripheral/gpio/plib_gpio.c  .generated_files/flags/default/e0c783b9caa049107c869eaad6544b2d5f6c06ca .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1865254177" 
	@${RM} ${OBJECTDIR}/_ext/1865254177/plib_gpio.o.d 
	@${RM} ${OBJECTDIR}/_ext/1865254177/plib_gpio.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -DBOARD_UNIQUE_ID=0x11 -I"../src" -I"../src/config/default" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1865254177/plib_gpio.o.d" -o ${OBJECTDIR}/_ext/1865254177/plib_gpio.o ../src/config/default/peripheral/gpio/plib_gpio.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1865657120/plib_uart6.o: ../src/config/default/peripheral/uart/plib_uart6.c  .generated_files/flags/default/4930787a6f63ec772db729665b0edd11b9fd93ea .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1865657120" 
	@${RM} ${OBJECTDIR}/_ext/1865657120/plib_uart6.o.d 
	@${RM} ${OBJECTDIR}/_ext/1865657120/plib_uart6.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -DBOARD_UNIQUE_ID=0x11 -I"../src" -I"../src/config/default" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1865657120/plib_uart6.o.d" -o ${OBJECTDIR}/_ext/1865657120/plib_uart6.o ../src/config/default/peripheral/uart/plib_uart6.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/163028504/xc32_monitor.o: ../src/config/default/stdio/xc32_monitor.c  .generated_files/flags/default/7384c2626aa38dc3f15dc133ed3f5478a786434e .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/163028504" 
	@${RM} ${OBJECTDIR}/_ext/163028504/xc32_monitor.o.d 
	@${RM} ${OBJECTDIR}/_ext/163028504/xc32_monitor.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -DBOARD_UNIQUE_ID=0x11 -I"../src" -I"../src/config/default" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/163028504/xc32_monitor.o.d" -o ${OBJECTDIR}/_ext/163028504/xc32_monitor.o ../src/config/default/stdio/xc32_monitor.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1171490990/exceptions.o: ../src/config/default/exceptions.c  .generated_files/flags/default/cf9573f691a72358021f69c64f94d73e812c1314 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1171490990" 
	@${RM} ${OBJECTDIR}/_ext/1171490990/exceptions.o.d 
	@${RM} ${OBJECTDIR}/_ext/1171490990/exceptions.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -DBOARD_UNIQUE_ID=0x11 -I"../src" -I"../src/config/default" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1171490990/exceptions.o.d" -o ${OBJECTDIR}/_ext/1171490990/exceptions.o ../src/config/default/exceptions.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1171490990/initialization.o: ../src/config/default/initialization.c  .generated_files/flags/default/7cb80d731ef87f3933f8817fe67bd4ca3fe855ed .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1171490990" 
	@${RM} ${OBJECTDIR}/_ext/1171490990/initialization.o.d 
	@${RM} ${OBJECTDIR}/_ext/1171490990/initialization.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -DBOARD_UNIQUE_ID=0x11 -I"../src" -I"../src/config/default" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1171490990/initialization.o.d" -o ${OBJECTDIR}/_ext/1171490990/initialization.o ../src/config/default/initialization.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1171490990/interrupts.o: ../src/config/default/interrupts.c  .generated_files/flags/default/809c52a75213e21b26c3c0f9c45f651ab59e9c0e .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1171490990" 
	@${RM} ${OBJECTDIR}/_ext/1171490990/interrupts.o.d 
	@${RM} ${OBJECTDIR}/_ext/1171490990/interrupts.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -DBOARD_UNIQUE_ID=0x11 -I"../src" -I"../src/config/default" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1171490990/interrupts.o.d" -o ${OBJECTDIR}/_ext/1171490990/interrupts.o ../src/config/default/interrupts.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1360937237/main.o: ../src/main.c  .generated_files/flags/default/980076d721135cd777eaf8a3878a131bc9e5344e .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -DBOARD_UNIQUE_ID=0x11 -I"../src" -I"../src/config/default" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/main.o.d" -o ${OBJECTDIR}/_ext/1360937237/main.o ../src/main.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/kalman_lib/data.o: kalman_lib/data.c  .generated_files/flags/default/840eaa916051505b938ac51c7a806342afcd7c2a .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/kalman_lib" 
	@${RM} ${OBJECTDIR}/kalman_lib/data.o.d 
	@${RM} ${OBJECTDIR}/kalman_lib/data.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -DBOARD_UNIQUE_ID=0x11 -I"../src" -I"../src/config/default" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/kalman_lib/data.o.d" -o ${OBJECTDIR}/kalman_lib/data.o kalman_lib/data.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/kalman_lib/gps_conversion.o: kalman_lib/gps_conversion.c  .generated_files/flags/default/3102a69fc5f972b421fd8c2cb9e32da47fd40b1e .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/kalman_lib" 
	@${RM} ${OBJECTDIR}/kalman_lib/gps_conversion.o.d 
	@${RM} ${OBJECTDIR}/kalman_lib/gps_conversion.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -DBOARD_UNIQUE_ID=0x11 -I"../src" -I"../src/config/default" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/kalman_lib/gps_conversion.o.d" -o ${OBJECTDIR}/kalman_lib/gps_conversion.o kalman_lib/gps_conversion.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/kalman_lib/kalman_lib.o: kalman_lib/kalman_lib.c  .generated_files/flags/default/1ffe4dc035159ca2216702574d8bd41c7edf6877 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/kalman_lib" 
	@${RM} ${OBJECTDIR}/kalman_lib/kalman_lib.o.d 
	@${RM} ${OBJECTDIR}/kalman_lib/kalman_lib.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -DBOARD_UNIQUE_ID=0x11 -I"../src" -I"../src/config/default" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/kalman_lib/kalman_lib.o.d" -o ${OBJECTDIR}/kalman_lib/kalman_lib.o kalman_lib/kalman_lib.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/kalman_lib/orientation_conversion.o: kalman_lib/orientation_conversion.c  .generated_files/flags/default/c4bd54ad49c840f3abfe15efd11ce12354704096 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/kalman_lib" 
	@${RM} ${OBJECTDIR}/kalman_lib/orientation_conversion.o.d 
	@${RM} ${OBJECTDIR}/kalman_lib/orientation_conversion.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -DBOARD_UNIQUE_ID=0x11 -I"../src" -I"../src/config/default" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/kalman_lib/orientation_conversion.o.d" -o ${OBJECTDIR}/kalman_lib/orientation_conversion.o kalman_lib/orientation_conversion.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/60181895/plib_tmr2.o: ../src/config/default/peripheral/tmr/plib_tmr2.c  .generated_files/flags/default/47266ac3c8c83c142be78a673eaefa928437f5ca .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/60181895" 
	@${RM} ${OBJECTDIR}/_ext/60181895/plib_tmr2.o.d 
	@${RM} ${OBJECTDIR}/_ext/60181895/plib_tmr2.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -DBOARD_UNIQUE_ID=0x11 -I"../src" -I"../src/config/default" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/60181895/plib_tmr2.o.d" -o ${OBJECTDIR}/_ext/60181895/plib_tmr2.o ../src/config/default/peripheral/tmr/plib_tmr2.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
else
${OBJECTDIR}/canlib/util/can_rcv_buffer.o: canlib/util/can_rcv_buffer.c  .generated_files/flags/default/911ee413ae2b147e9ea044522130aa5b558ae7ea .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/canlib/util" 
	@${RM} ${OBJECTDIR}/canlib/util/can_rcv_buffer.o.d 
	@${RM} ${OBJECTDIR}/canlib/util/can_rcv_buffer.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -DBOARD_UNIQUE_ID=0x11 -I"../src" -I"../src/config/default" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/canlib/util/can_rcv_buffer.o.d" -o ${OBJECTDIR}/canlib/util/can_rcv_buffer.o canlib/util/can_rcv_buffer.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/canlib/util/can_tx_buffer.o: canlib/util/can_tx_buffer.c  .generated_files/flags/default/935a8792de905bc5b7e0e29045f6d3f86d45db00 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/canlib/util" 
	@${RM} ${OBJECTDIR}/canlib/util/can_tx_buffer.o.d 
	@${RM} ${OBJECTDIR}/canlib/util/can_tx_buffer.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -DBOARD_UNIQUE_ID=0x11 -I"../src" -I"../src/config/default" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/canlib/util/can_tx_buffer.o.d" -o ${OBJECTDIR}/canlib/util/can_tx_buffer.o canlib/util/can_tx_buffer.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/canlib/util/safe_ring_buffer.o: canlib/util/safe_ring_buffer.c  .generated_files/flags/default/b0a1cc5094dccb802701e9bbfead97b715afa506 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/canlib/util" 
	@${RM} ${OBJECTDIR}/canlib/util/safe_ring_buffer.o.d 
	@${RM} ${OBJECTDIR}/canlib/util/safe_ring_buffer.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -DBOARD_UNIQUE_ID=0x11 -I"../src" -I"../src/config/default" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/canlib/util/safe_ring_buffer.o.d" -o ${OBJECTDIR}/canlib/util/safe_ring_buffer.o canlib/util/safe_ring_buffer.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/canlib/util/timing_util.o: canlib/util/timing_util.c  .generated_files/flags/default/e5d679a2bba203e186ffb0628c7e5aee1436c72 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/canlib/util" 
	@${RM} ${OBJECTDIR}/canlib/util/timing_util.o.d 
	@${RM} ${OBJECTDIR}/canlib/util/timing_util.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -DBOARD_UNIQUE_ID=0x11 -I"../src" -I"../src/config/default" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/canlib/util/timing_util.o.d" -o ${OBJECTDIR}/canlib/util/timing_util.o canlib/util/timing_util.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/canlib/can_common.o: canlib/can_common.c  .generated_files/flags/default/861d8d75bf10acaf9883a8391d1ef288b879bb5a .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/canlib" 
	@${RM} ${OBJECTDIR}/canlib/can_common.o.d 
	@${RM} ${OBJECTDIR}/canlib/can_common.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -DBOARD_UNIQUE_ID=0x11 -I"../src" -I"../src/config/default" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/canlib/can_common.o.d" -o ${OBJECTDIR}/canlib/can_common.o canlib/can_common.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/60165182/plib_can2.o: ../src/config/default/peripheral/can/plib_can2.c  .generated_files/flags/default/1f35c23b8c7290871760d5410435daa00e3b50b3 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/60165182" 
	@${RM} ${OBJECTDIR}/_ext/60165182/plib_can2.o.d 
	@${RM} ${OBJECTDIR}/_ext/60165182/plib_can2.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -DBOARD_UNIQUE_ID=0x11 -I"../src" -I"../src/config/default" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/60165182/plib_can2.o.d" -o ${OBJECTDIR}/_ext/60165182/plib_can2.o ../src/config/default/peripheral/can/plib_can2.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/60165520/plib_clk.o: ../src/config/default/peripheral/clk/plib_clk.c  .generated_files/flags/default/5071747049de7eec5e99c2e6f84f33223d5ffe02 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/60165520" 
	@${RM} ${OBJECTDIR}/_ext/60165520/plib_clk.o.d 
	@${RM} ${OBJECTDIR}/_ext/60165520/plib_clk.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -DBOARD_UNIQUE_ID=0x11 -I"../src" -I"../src/config/default" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/60165520/plib_clk.o.d" -o ${OBJECTDIR}/_ext/60165520/plib_clk.o ../src/config/default/peripheral/clk/plib_clk.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1865200349/plib_evic.o: ../src/config/default/peripheral/evic/plib_evic.c  .generated_files/flags/default/4326e75fc6a897ea97a166a0b6146570a89b3ea5 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1865200349" 
	@${RM} ${OBJECTDIR}/_ext/1865200349/plib_evic.o.d 
	@${RM} ${OBJECTDIR}/_ext/1865200349/plib_evic.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -DBOARD_UNIQUE_ID=0x11 -I"../src" -I"../src/config/default" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1865200349/plib_evic.o.d" -o ${OBJECTDIR}/_ext/1865200349/plib_evic.o ../src/config/default/peripheral/evic/plib_evic.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1865254177/plib_gpio.o: ../src/config/default/peripheral/gpio/plib_gpio.c  .generated_files/flags/default/b8f874c504e2ac78bd96de9a902d5399d557186b .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1865254177" 
	@${RM} ${OBJECTDIR}/_ext/1865254177/plib_gpio.o.d 
	@${RM} ${OBJECTDIR}/_ext/1865254177/plib_gpio.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -DBOARD_UNIQUE_ID=0x11 -I"../src" -I"../src/config/default" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1865254177/plib_gpio.o.d" -o ${OBJECTDIR}/_ext/1865254177/plib_gpio.o ../src/config/default/peripheral/gpio/plib_gpio.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1865657120/plib_uart6.o: ../src/config/default/peripheral/uart/plib_uart6.c  .generated_files/flags/default/f65d145dada2674121e492d36bf10dfe8fe23515 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1865657120" 
	@${RM} ${OBJECTDIR}/_ext/1865657120/plib_uart6.o.d 
	@${RM} ${OBJECTDIR}/_ext/1865657120/plib_uart6.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -DBOARD_UNIQUE_ID=0x11 -I"../src" -I"../src/config/default" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1865657120/plib_uart6.o.d" -o ${OBJECTDIR}/_ext/1865657120/plib_uart6.o ../src/config/default/peripheral/uart/plib_uart6.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/163028504/xc32_monitor.o: ../src/config/default/stdio/xc32_monitor.c  .generated_files/flags/default/bc008612b32e28f6492b22514ee123e53c354380 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/163028504" 
	@${RM} ${OBJECTDIR}/_ext/163028504/xc32_monitor.o.d 
	@${RM} ${OBJECTDIR}/_ext/163028504/xc32_monitor.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -DBOARD_UNIQUE_ID=0x11 -I"../src" -I"../src/config/default" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/163028504/xc32_monitor.o.d" -o ${OBJECTDIR}/_ext/163028504/xc32_monitor.o ../src/config/default/stdio/xc32_monitor.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1171490990/exceptions.o: ../src/config/default/exceptions.c  .generated_files/flags/default/962670e7694ea5d073528e6befd4d03a675c83c7 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1171490990" 
	@${RM} ${OBJECTDIR}/_ext/1171490990/exceptions.o.d 
	@${RM} ${OBJECTDIR}/_ext/1171490990/exceptions.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -DBOARD_UNIQUE_ID=0x11 -I"../src" -I"../src/config/default" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1171490990/exceptions.o.d" -o ${OBJECTDIR}/_ext/1171490990/exceptions.o ../src/config/default/exceptions.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1171490990/initialization.o: ../src/config/default/initialization.c  .generated_files/flags/default/e381c4e92c2959af55d6f62777ca7f205c758c50 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1171490990" 
	@${RM} ${OBJECTDIR}/_ext/1171490990/initialization.o.d 
	@${RM} ${OBJECTDIR}/_ext/1171490990/initialization.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -DBOARD_UNIQUE_ID=0x11 -I"../src" -I"../src/config/default" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1171490990/initialization.o.d" -o ${OBJECTDIR}/_ext/1171490990/initialization.o ../src/config/default/initialization.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1171490990/interrupts.o: ../src/config/default/interrupts.c  .generated_files/flags/default/7a03c556bc000aa553e86c91dffe853dbb69ba25 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1171490990" 
	@${RM} ${OBJECTDIR}/_ext/1171490990/interrupts.o.d 
	@${RM} ${OBJECTDIR}/_ext/1171490990/interrupts.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -DBOARD_UNIQUE_ID=0x11 -I"../src" -I"../src/config/default" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1171490990/interrupts.o.d" -o ${OBJECTDIR}/_ext/1171490990/interrupts.o ../src/config/default/interrupts.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1360937237/main.o: ../src/main.c  .generated_files/flags/default/254db012bd695bbe678b19d09ab039d0015d3dd3 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -DBOARD_UNIQUE_ID=0x11 -I"../src" -I"../src/config/default" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/main.o.d" -o ${OBJECTDIR}/_ext/1360937237/main.o ../src/main.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/kalman_lib/data.o: kalman_lib/data.c  .generated_files/flags/default/853b45f1fbca77d1df2606009d62a5dab5887733 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/kalman_lib" 
	@${RM} ${OBJECTDIR}/kalman_lib/data.o.d 
	@${RM} ${OBJECTDIR}/kalman_lib/data.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -DBOARD_UNIQUE_ID=0x11 -I"../src" -I"../src/config/default" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/kalman_lib/data.o.d" -o ${OBJECTDIR}/kalman_lib/data.o kalman_lib/data.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/kalman_lib/gps_conversion.o: kalman_lib/gps_conversion.c  .generated_files/flags/default/6b2bae92d6d5a04a2a5a6717bb4f1c6da7331eb4 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/kalman_lib" 
	@${RM} ${OBJECTDIR}/kalman_lib/gps_conversion.o.d 
	@${RM} ${OBJECTDIR}/kalman_lib/gps_conversion.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -DBOARD_UNIQUE_ID=0x11 -I"../src" -I"../src/config/default" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/kalman_lib/gps_conversion.o.d" -o ${OBJECTDIR}/kalman_lib/gps_conversion.o kalman_lib/gps_conversion.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/kalman_lib/kalman_lib.o: kalman_lib/kalman_lib.c  .generated_files/flags/default/fc9a6f2a3c238d5b184e74a64c57e45e9f25db1e .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/kalman_lib" 
	@${RM} ${OBJECTDIR}/kalman_lib/kalman_lib.o.d 
	@${RM} ${OBJECTDIR}/kalman_lib/kalman_lib.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -DBOARD_UNIQUE_ID=0x11 -I"../src" -I"../src/config/default" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/kalman_lib/kalman_lib.o.d" -o ${OBJECTDIR}/kalman_lib/kalman_lib.o kalman_lib/kalman_lib.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/kalman_lib/orientation_conversion.o: kalman_lib/orientation_conversion.c  .generated_files/flags/default/ab162897f3c076d4da0ef61d494b75ad20daa00b .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/kalman_lib" 
	@${RM} ${OBJECTDIR}/kalman_lib/orientation_conversion.o.d 
	@${RM} ${OBJECTDIR}/kalman_lib/orientation_conversion.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -DBOARD_UNIQUE_ID=0x11 -I"../src" -I"../src/config/default" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/kalman_lib/orientation_conversion.o.d" -o ${OBJECTDIR}/kalman_lib/orientation_conversion.o kalman_lib/orientation_conversion.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/60181895/plib_tmr2.o: ../src/config/default/peripheral/tmr/plib_tmr2.c  .generated_files/flags/default/b22e66cc9032ef1985ecd5b4602e15dc30ac92d2 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
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
	${MP_CC_DIR}/xc32-bin2hex ${DISTDIR}/kalman_board.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} 
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

DEPFILES=$(wildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
