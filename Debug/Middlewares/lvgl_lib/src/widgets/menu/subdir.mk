################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Middlewares/lvgl_lib/src/widgets/menu/lv_menu.c 

OBJS += \
./Middlewares/lvgl_lib/src/widgets/menu/lv_menu.o 

C_DEPS += \
./Middlewares/lvgl_lib/src/widgets/menu/lv_menu.d 


# Each subdirectory must supply rules for building sources it contributes
Middlewares/lvgl_lib/src/widgets/menu/%.o Middlewares/lvgl_lib/src/widgets/menu/%.su Middlewares/lvgl_lib/src/widgets/menu/%.cyclo: ../Middlewares/lvgl_lib/src/widgets/menu/%.c Middlewares/lvgl_lib/src/widgets/menu/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F446xx -c -I../Application -I"C:/Users/shafg/Desktop/Projects_Firmware/sensor_platform/Middlewares/lvgl_lib" -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2 -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Middlewares-2f-lvgl_lib-2f-src-2f-widgets-2f-menu

clean-Middlewares-2f-lvgl_lib-2f-src-2f-widgets-2f-menu:
	-$(RM) ./Middlewares/lvgl_lib/src/widgets/menu/lv_menu.cyclo ./Middlewares/lvgl_lib/src/widgets/menu/lv_menu.d ./Middlewares/lvgl_lib/src/widgets/menu/lv_menu.o ./Middlewares/lvgl_lib/src/widgets/menu/lv_menu.su

.PHONY: clean-Middlewares-2f-lvgl_lib-2f-src-2f-widgets-2f-menu

