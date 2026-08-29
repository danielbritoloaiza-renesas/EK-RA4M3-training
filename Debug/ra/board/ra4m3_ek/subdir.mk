################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../ra/board/ra4m3_ek/board_init.c \
../ra/board/ra4m3_ek/board_leds.c 

C_DEPS += \
./ra/board/ra4m3_ek/board_init.d \
./ra/board/ra4m3_ek/board_leds.d 

OBJS += \
./ra/board/ra4m3_ek/board_init.o \
./ra/board/ra4m3_ek/board_leds.o 

SREC += \
ek_ra4m3_baremetal.srec 

MAP += \
ek_ra4m3_baremetal.map 


# Each subdirectory must supply rules for building sources it contributes
ra/board/ra4m3_ek/%.o: ../ra/board/ra4m3_ek/%.c
	$(file > $@.in,-mcpu=cortex-m33 -mthumb -mfloat-abi=hard -mfpu=fpv5-sp-d16 -O2 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-strict-aliasing -Wunused -Wuninitialized -Wall -Wextra -Wmissing-declarations -Wconversion -Wpointer-arith -Wshadow -Wlogical-op -Waggregate-return -Wfloat-equal -g -D_RENESAS_RA_ -D_RA_CORE=CM33 -D_RA_ORDINAL=1 -I"C:/Users/a5166677/e2_studio/workspace/ek_ra4m3_baremetal/ra_gen" -I"." -I"C:/Users/a5166677/e2_studio/workspace/ek_ra4m3_baremetal/ra_cfg/fsp_cfg/bsp" -I"C:/Users/a5166677/e2_studio/workspace/ek_ra4m3_baremetal/ra_cfg/fsp_cfg" -I"C:/Users/a5166677/e2_studio/workspace/ek_ra4m3_baremetal/src" -I"C:/Users/a5166677/e2_studio/workspace/ek_ra4m3_baremetal/ra/fsp/inc" -I"C:/Users/a5166677/e2_studio/workspace/ek_ra4m3_baremetal/ra/fsp/inc/api" -I"C:/Users/a5166677/e2_studio/workspace/ek_ra4m3_baremetal/ra/fsp/inc/instances" -I"C:/Users/a5166677/e2_studio/workspace/ek_ra4m3_baremetal/ra/arm/CMSIS_6/CMSIS/Core/Include" -I"C:/Users/a5166677/e2_studio/workspace/ek_ra4m3_baremetal/src/qc-middleware" -I"C:/Users/a5166677/e2_studio/workspace/ek_ra4m3_baremetal/src/qc-middleware/common_utils" -I"C:/Users/a5166677/e2_studio/workspace/ek_ra4m3_baremetal/src/qc-middleware/SEGGER_RTT" -std=c99 -Wno-stringop-overflow -Wno-format-truncation --param=min-pagesize=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -c -o "$@" -x c "$<")
	@echo Building file: $< && arm-none-eabi-gcc @"$@.in"

