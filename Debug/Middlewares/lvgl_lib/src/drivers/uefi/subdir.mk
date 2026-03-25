################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Middlewares/lvgl_lib/src/drivers/uefi/lv_uefi_context.c \
../Middlewares/lvgl_lib/src/drivers/uefi/lv_uefi_display.c \
../Middlewares/lvgl_lib/src/drivers/uefi/lv_uefi_indev_keyboard.c \
../Middlewares/lvgl_lib/src/drivers/uefi/lv_uefi_indev_pointer.c \
../Middlewares/lvgl_lib/src/drivers/uefi/lv_uefi_indev_touch.c \
../Middlewares/lvgl_lib/src/drivers/uefi/lv_uefi_private.c 

OBJS += \
./Middlewares/lvgl_lib/src/drivers/uefi/lv_uefi_context.o \
./Middlewares/lvgl_lib/src/drivers/uefi/lv_uefi_display.o \
./Middlewares/lvgl_lib/src/drivers/uefi/lv_uefi_indev_keyboard.o \
./Middlewares/lvgl_lib/src/drivers/uefi/lv_uefi_indev_pointer.o \
./Middlewares/lvgl_lib/src/drivers/uefi/lv_uefi_indev_touch.o \
./Middlewares/lvgl_lib/src/drivers/uefi/lv_uefi_private.o 

C_DEPS += \
./Middlewares/lvgl_lib/src/drivers/uefi/lv_uefi_context.d \
./Middlewares/lvgl_lib/src/drivers/uefi/lv_uefi_display.d \
./Middlewares/lvgl_lib/src/drivers/uefi/lv_uefi_indev_keyboard.d \
./Middlewares/lvgl_lib/src/drivers/uefi/lv_uefi_indev_pointer.d \
./Middlewares/lvgl_lib/src/drivers/uefi/lv_uefi_indev_touch.d \
./Middlewares/lvgl_lib/src/drivers/uefi/lv_uefi_private.d 


# Each subdirectory must supply rules for building sources it contributes
Middlewares/lvgl_lib/src/drivers/uefi/%.o Middlewares/lvgl_lib/src/drivers/uefi/%.su Middlewares/lvgl_lib/src/drivers/uefi/%.cyclo: ../Middlewares/lvgl_lib/src/drivers/uefi/%.c Middlewares/lvgl_lib/src/drivers/uefi/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F446xx -c -I../Application -I"C:/Users/shafg/Desktop/Projects_Firmware/sensor_platform/Middlewares/lvgl_lib" -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2 -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Middlewares-2f-lvgl_lib-2f-src-2f-drivers-2f-uefi

clean-Middlewares-2f-lvgl_lib-2f-src-2f-drivers-2f-uefi:
	-$(RM) ./Middlewares/lvgl_lib/src/drivers/uefi/lv_uefi_context.cyclo ./Middlewares/lvgl_lib/src/drivers/uefi/lv_uefi_context.d ./Middlewares/lvgl_lib/src/drivers/uefi/lv_uefi_context.o ./Middlewares/lvgl_lib/src/drivers/uefi/lv_uefi_context.su ./Middlewares/lvgl_lib/src/drivers/uefi/lv_uefi_display.cyclo ./Middlewares/lvgl_lib/src/drivers/uefi/lv_uefi_display.d ./Middlewares/lvgl_lib/src/drivers/uefi/lv_uefi_display.o ./Middlewares/lvgl_lib/src/drivers/uefi/lv_uefi_display.su ./Middlewares/lvgl_lib/src/drivers/uefi/lv_uefi_indev_keyboard.cyclo ./Middlewares/lvgl_lib/src/drivers/uefi/lv_uefi_indev_keyboard.d ./Middlewares/lvgl_lib/src/drivers/uefi/lv_uefi_indev_keyboard.o ./Middlewares/lvgl_lib/src/drivers/uefi/lv_uefi_indev_keyboard.su ./Middlewares/lvgl_lib/src/drivers/uefi/lv_uefi_indev_pointer.cyclo ./Middlewares/lvgl_lib/src/drivers/uefi/lv_uefi_indev_pointer.d ./Middlewares/lvgl_lib/src/drivers/uefi/lv_uefi_indev_pointer.o ./Middlewares/lvgl_lib/src/drivers/uefi/lv_uefi_indev_pointer.su ./Middlewares/lvgl_lib/src/drivers/uefi/lv_uefi_indev_touch.cyclo ./Middlewares/lvgl_lib/src/drivers/uefi/lv_uefi_indev_touch.d ./Middlewares/lvgl_lib/src/drivers/uefi/lv_uefi_indev_touch.o ./Middlewares/lvgl_lib/src/drivers/uefi/lv_uefi_indev_touch.su ./Middlewares/lvgl_lib/src/drivers/uefi/lv_uefi_private.cyclo ./Middlewares/lvgl_lib/src/drivers/uefi/lv_uefi_private.d ./Middlewares/lvgl_lib/src/drivers/uefi/lv_uefi_private.o ./Middlewares/lvgl_lib/src/drivers/uefi/lv_uefi_private.su

.PHONY: clean-Middlewares-2f-lvgl_lib-2f-src-2f-drivers-2f-uefi

