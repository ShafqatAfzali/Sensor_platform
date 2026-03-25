################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
S_UPPER_SRCS += \
../Middlewares/lvgl_lib/src/draw/sw/blend/helium/lv_blend_helium.S 

OBJS += \
./Middlewares/lvgl_lib/src/draw/sw/blend/helium/lv_blend_helium.o 

S_UPPER_DEPS += \
./Middlewares/lvgl_lib/src/draw/sw/blend/helium/lv_blend_helium.d 


# Each subdirectory must supply rules for building sources it contributes
Middlewares/lvgl_lib/src/draw/sw/blend/helium/%.o: ../Middlewares/lvgl_lib/src/draw/sw/blend/helium/%.S Middlewares/lvgl_lib/src/draw/sw/blend/helium/subdir.mk
	arm-none-eabi-gcc -mcpu=cortex-m4 -g3 -DDEBUG -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2 -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I../Middlewares/ST/ARM/DSP/Inc -x assembler-with-cpp -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@" "$<"

clean: clean-Middlewares-2f-lvgl_lib-2f-src-2f-draw-2f-sw-2f-blend-2f-helium

clean-Middlewares-2f-lvgl_lib-2f-src-2f-draw-2f-sw-2f-blend-2f-helium:
	-$(RM) ./Middlewares/lvgl_lib/src/draw/sw/blend/helium/lv_blend_helium.d ./Middlewares/lvgl_lib/src/draw/sw/blend/helium/lv_blend_helium.o

.PHONY: clean-Middlewares-2f-lvgl_lib-2f-src-2f-draw-2f-sw-2f-blend-2f-helium

