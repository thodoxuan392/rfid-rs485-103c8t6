################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (10.3-2021.10)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/Src/Device/dipswitch.c \
../Core/Src/Device/rfid.c 

CPP_SRCS += \
../Core/Src/Device/loadcell.cpp 

C_DEPS += \
./Core/Src/Device/dipswitch.d \
./Core/Src/Device/rfid.d 

OBJS += \
./Core/Src/Device/dipswitch.o \
./Core/Src/Device/loadcell.o \
./Core/Src/Device/rfid.o 

CPP_DEPS += \
./Core/Src/Device/loadcell.d 


# Each subdirectory must supply rules for building sources it contributes
Core/Src/Device/%.o Core/Src/Device/%.su: ../Core/Src/Device/%.c Core/Src/Device/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m3 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F103xB -c -I../Core/Inc -I../Lib -I../Drivers/STM32F1xx_HAL_Driver/Inc/Legacy -I../Drivers/STM32F1xx_HAL_Driver/Inc -I../Drivers/CMSIS/Device/ST/STM32F1xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
Core/Src/Device/%.o Core/Src/Device/%.su: ../Core/Src/Device/%.cpp Core/Src/Device/subdir.mk
	arm-none-eabi-g++ "$<" -mcpu=cortex-m3 -std=gnu++14 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F103xB -c -I../Core/Inc -I../Drivers/STM32F1xx_HAL_Driver/Inc/Legacy -I../Drivers/STM32F1xx_HAL_Driver/Inc -I../Drivers/CMSIS/Device/ST/STM32F1xx/Include -I../Drivers/CMSIS/Include -I../Lib -O0 -ffunction-sections -fdata-sections -fno-exceptions -fno-rtti -fno-use-cxa-atexit -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"

clean: clean-Core-2f-Src-2f-Device

clean-Core-2f-Src-2f-Device:
	-$(RM) ./Core/Src/Device/dipswitch.d ./Core/Src/Device/dipswitch.o ./Core/Src/Device/dipswitch.su ./Core/Src/Device/loadcell.d ./Core/Src/Device/loadcell.o ./Core/Src/Device/loadcell.su ./Core/Src/Device/rfid.d ./Core/Src/Device/rfid.o ./Core/Src/Device/rfid.su

.PHONY: clean-Core-2f-Src-2f-Device

