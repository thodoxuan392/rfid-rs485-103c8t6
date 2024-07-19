################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (10.3-2021.10)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Lib/utils/utils_buffer.c \
../Lib/utils/utils_logger.c \
../Lib/utils/utils_string.c 

C_DEPS += \
./Lib/utils/utils_buffer.d \
./Lib/utils/utils_logger.d \
./Lib/utils/utils_string.d 

OBJS += \
./Lib/utils/utils_buffer.o \
./Lib/utils/utils_logger.o \
./Lib/utils/utils_string.o 


# Each subdirectory must supply rules for building sources it contributes
Lib/utils/%.o Lib/utils/%.su: ../Lib/utils/%.c Lib/utils/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m3 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F103xB -c -I../Core/Inc -I../Lib -I../Drivers/STM32F1xx_HAL_Driver/Inc/Legacy -I../Drivers/STM32F1xx_HAL_Driver/Inc -I../Drivers/CMSIS/Device/ST/STM32F1xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"

clean: clean-Lib-2f-utils

clean-Lib-2f-utils:
	-$(RM) ./Lib/utils/utils_buffer.d ./Lib/utils/utils_buffer.o ./Lib/utils/utils_buffer.su ./Lib/utils/utils_logger.d ./Lib/utils/utils_logger.o ./Lib/utils/utils_logger.su ./Lib/utils/utils_string.d ./Lib/utils/utils_string.o ./Lib/utils/utils_string.su

.PHONY: clean-Lib-2f-utils

