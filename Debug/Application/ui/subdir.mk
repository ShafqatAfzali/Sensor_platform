################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Application/ui/images.c \
../Application/ui/screens.c \
../Application/ui/styles.c \
../Application/ui/ui.c 

OBJS += \
./Application/ui/images.o \
./Application/ui/screens.o \
./Application/ui/styles.o \
./Application/ui/ui.o 

C_DEPS += \
./Application/ui/images.d \
./Application/ui/screens.d \
./Application/ui/styles.d \
./Application/ui/ui.d 


# Each subdirectory must supply rules for building sources it contributes
Application/ui/%.o Application/ui/%.su Application/ui/%.cyclo: ../Application/ui/%.c Application/ui/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F446xx -c -I../Application -I"C:/Users/shafg/Desktop/Projects_Firmware/sensor_platform/Application/ui" -I"C:/Users/shafg/Desktop/Projects_Firmware/sensor_platform/Middlewares/lvgl_lib" -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2 -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Application-2f-ui

clean-Application-2f-ui:
	-$(RM) ./Application/ui/images.cyclo ./Application/ui/images.d ./Application/ui/images.o ./Application/ui/images.su ./Application/ui/screens.cyclo ./Application/ui/screens.d ./Application/ui/screens.o ./Application/ui/screens.su ./Application/ui/styles.cyclo ./Application/ui/styles.d ./Application/ui/styles.o ./Application/ui/styles.su ./Application/ui/ui.cyclo ./Application/ui/ui.d ./Application/ui/ui.o ./Application/ui/ui.su

.PHONY: clean-Application-2f-ui

