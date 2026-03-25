################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Middlewares/lvgl_lib/src/libs/gltf/gltf_view/assets/chromatic.c \
../Middlewares/lvgl_lib/src/libs/gltf/gltf_view/assets/lv_gltf_view_shader.c 

OBJS += \
./Middlewares/lvgl_lib/src/libs/gltf/gltf_view/assets/chromatic.o \
./Middlewares/lvgl_lib/src/libs/gltf/gltf_view/assets/lv_gltf_view_shader.o 

C_DEPS += \
./Middlewares/lvgl_lib/src/libs/gltf/gltf_view/assets/chromatic.d \
./Middlewares/lvgl_lib/src/libs/gltf/gltf_view/assets/lv_gltf_view_shader.d 


# Each subdirectory must supply rules for building sources it contributes
Middlewares/lvgl_lib/src/libs/gltf/gltf_view/assets/%.o Middlewares/lvgl_lib/src/libs/gltf/gltf_view/assets/%.su Middlewares/lvgl_lib/src/libs/gltf/gltf_view/assets/%.cyclo: ../Middlewares/lvgl_lib/src/libs/gltf/gltf_view/assets/%.c Middlewares/lvgl_lib/src/libs/gltf/gltf_view/assets/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F446xx -c -I../Application -I"C:/Users/shafg/Desktop/Projects_Firmware/sensor_platform/Middlewares/lvgl_lib" -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2 -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Middlewares-2f-lvgl_lib-2f-src-2f-libs-2f-gltf-2f-gltf_view-2f-assets

clean-Middlewares-2f-lvgl_lib-2f-src-2f-libs-2f-gltf-2f-gltf_view-2f-assets:
	-$(RM) ./Middlewares/lvgl_lib/src/libs/gltf/gltf_view/assets/chromatic.cyclo ./Middlewares/lvgl_lib/src/libs/gltf/gltf_view/assets/chromatic.d ./Middlewares/lvgl_lib/src/libs/gltf/gltf_view/assets/chromatic.o ./Middlewares/lvgl_lib/src/libs/gltf/gltf_view/assets/chromatic.su ./Middlewares/lvgl_lib/src/libs/gltf/gltf_view/assets/lv_gltf_view_shader.cyclo ./Middlewares/lvgl_lib/src/libs/gltf/gltf_view/assets/lv_gltf_view_shader.d ./Middlewares/lvgl_lib/src/libs/gltf/gltf_view/assets/lv_gltf_view_shader.o ./Middlewares/lvgl_lib/src/libs/gltf/gltf_view/assets/lv_gltf_view_shader.su

.PHONY: clean-Middlewares-2f-lvgl_lib-2f-src-2f-libs-2f-gltf-2f-gltf_view-2f-assets

