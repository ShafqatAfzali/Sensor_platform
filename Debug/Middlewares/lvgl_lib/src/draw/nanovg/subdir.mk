################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Middlewares/lvgl_lib/src/draw/nanovg/lv_draw_nanovg.c \
../Middlewares/lvgl_lib/src/draw/nanovg/lv_draw_nanovg_3d.c \
../Middlewares/lvgl_lib/src/draw/nanovg/lv_draw_nanovg_arc.c \
../Middlewares/lvgl_lib/src/draw/nanovg/lv_draw_nanovg_border.c \
../Middlewares/lvgl_lib/src/draw/nanovg/lv_draw_nanovg_box_shadow.c \
../Middlewares/lvgl_lib/src/draw/nanovg/lv_draw_nanovg_fill.c \
../Middlewares/lvgl_lib/src/draw/nanovg/lv_draw_nanovg_grad.c \
../Middlewares/lvgl_lib/src/draw/nanovg/lv_draw_nanovg_image.c \
../Middlewares/lvgl_lib/src/draw/nanovg/lv_draw_nanovg_label.c \
../Middlewares/lvgl_lib/src/draw/nanovg/lv_draw_nanovg_layer.c \
../Middlewares/lvgl_lib/src/draw/nanovg/lv_draw_nanovg_line.c \
../Middlewares/lvgl_lib/src/draw/nanovg/lv_draw_nanovg_mask_rect.c \
../Middlewares/lvgl_lib/src/draw/nanovg/lv_draw_nanovg_triangle.c \
../Middlewares/lvgl_lib/src/draw/nanovg/lv_draw_nanovg_vector.c \
../Middlewares/lvgl_lib/src/draw/nanovg/lv_nanovg_fbo_cache.c \
../Middlewares/lvgl_lib/src/draw/nanovg/lv_nanovg_image_cache.c \
../Middlewares/lvgl_lib/src/draw/nanovg/lv_nanovg_utils.c 

OBJS += \
./Middlewares/lvgl_lib/src/draw/nanovg/lv_draw_nanovg.o \
./Middlewares/lvgl_lib/src/draw/nanovg/lv_draw_nanovg_3d.o \
./Middlewares/lvgl_lib/src/draw/nanovg/lv_draw_nanovg_arc.o \
./Middlewares/lvgl_lib/src/draw/nanovg/lv_draw_nanovg_border.o \
./Middlewares/lvgl_lib/src/draw/nanovg/lv_draw_nanovg_box_shadow.o \
./Middlewares/lvgl_lib/src/draw/nanovg/lv_draw_nanovg_fill.o \
./Middlewares/lvgl_lib/src/draw/nanovg/lv_draw_nanovg_grad.o \
./Middlewares/lvgl_lib/src/draw/nanovg/lv_draw_nanovg_image.o \
./Middlewares/lvgl_lib/src/draw/nanovg/lv_draw_nanovg_label.o \
./Middlewares/lvgl_lib/src/draw/nanovg/lv_draw_nanovg_layer.o \
./Middlewares/lvgl_lib/src/draw/nanovg/lv_draw_nanovg_line.o \
./Middlewares/lvgl_lib/src/draw/nanovg/lv_draw_nanovg_mask_rect.o \
./Middlewares/lvgl_lib/src/draw/nanovg/lv_draw_nanovg_triangle.o \
./Middlewares/lvgl_lib/src/draw/nanovg/lv_draw_nanovg_vector.o \
./Middlewares/lvgl_lib/src/draw/nanovg/lv_nanovg_fbo_cache.o \
./Middlewares/lvgl_lib/src/draw/nanovg/lv_nanovg_image_cache.o \
./Middlewares/lvgl_lib/src/draw/nanovg/lv_nanovg_utils.o 

C_DEPS += \
./Middlewares/lvgl_lib/src/draw/nanovg/lv_draw_nanovg.d \
./Middlewares/lvgl_lib/src/draw/nanovg/lv_draw_nanovg_3d.d \
./Middlewares/lvgl_lib/src/draw/nanovg/lv_draw_nanovg_arc.d \
./Middlewares/lvgl_lib/src/draw/nanovg/lv_draw_nanovg_border.d \
./Middlewares/lvgl_lib/src/draw/nanovg/lv_draw_nanovg_box_shadow.d \
./Middlewares/lvgl_lib/src/draw/nanovg/lv_draw_nanovg_fill.d \
./Middlewares/lvgl_lib/src/draw/nanovg/lv_draw_nanovg_grad.d \
./Middlewares/lvgl_lib/src/draw/nanovg/lv_draw_nanovg_image.d \
./Middlewares/lvgl_lib/src/draw/nanovg/lv_draw_nanovg_label.d \
./Middlewares/lvgl_lib/src/draw/nanovg/lv_draw_nanovg_layer.d \
./Middlewares/lvgl_lib/src/draw/nanovg/lv_draw_nanovg_line.d \
./Middlewares/lvgl_lib/src/draw/nanovg/lv_draw_nanovg_mask_rect.d \
./Middlewares/lvgl_lib/src/draw/nanovg/lv_draw_nanovg_triangle.d \
./Middlewares/lvgl_lib/src/draw/nanovg/lv_draw_nanovg_vector.d \
./Middlewares/lvgl_lib/src/draw/nanovg/lv_nanovg_fbo_cache.d \
./Middlewares/lvgl_lib/src/draw/nanovg/lv_nanovg_image_cache.d \
./Middlewares/lvgl_lib/src/draw/nanovg/lv_nanovg_utils.d 


# Each subdirectory must supply rules for building sources it contributes
Middlewares/lvgl_lib/src/draw/nanovg/%.o Middlewares/lvgl_lib/src/draw/nanovg/%.su Middlewares/lvgl_lib/src/draw/nanovg/%.cyclo: ../Middlewares/lvgl_lib/src/draw/nanovg/%.c Middlewares/lvgl_lib/src/draw/nanovg/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F446xx -c -I../Application -I"C:/Users/shafg/Desktop/Projects_Firmware/sensor_platform/Middlewares/lvgl_lib" -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2 -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Middlewares-2f-lvgl_lib-2f-src-2f-draw-2f-nanovg

clean-Middlewares-2f-lvgl_lib-2f-src-2f-draw-2f-nanovg:
	-$(RM) ./Middlewares/lvgl_lib/src/draw/nanovg/lv_draw_nanovg.cyclo ./Middlewares/lvgl_lib/src/draw/nanovg/lv_draw_nanovg.d ./Middlewares/lvgl_lib/src/draw/nanovg/lv_draw_nanovg.o ./Middlewares/lvgl_lib/src/draw/nanovg/lv_draw_nanovg.su ./Middlewares/lvgl_lib/src/draw/nanovg/lv_draw_nanovg_3d.cyclo ./Middlewares/lvgl_lib/src/draw/nanovg/lv_draw_nanovg_3d.d ./Middlewares/lvgl_lib/src/draw/nanovg/lv_draw_nanovg_3d.o ./Middlewares/lvgl_lib/src/draw/nanovg/lv_draw_nanovg_3d.su ./Middlewares/lvgl_lib/src/draw/nanovg/lv_draw_nanovg_arc.cyclo ./Middlewares/lvgl_lib/src/draw/nanovg/lv_draw_nanovg_arc.d ./Middlewares/lvgl_lib/src/draw/nanovg/lv_draw_nanovg_arc.o ./Middlewares/lvgl_lib/src/draw/nanovg/lv_draw_nanovg_arc.su ./Middlewares/lvgl_lib/src/draw/nanovg/lv_draw_nanovg_border.cyclo ./Middlewares/lvgl_lib/src/draw/nanovg/lv_draw_nanovg_border.d ./Middlewares/lvgl_lib/src/draw/nanovg/lv_draw_nanovg_border.o ./Middlewares/lvgl_lib/src/draw/nanovg/lv_draw_nanovg_border.su ./Middlewares/lvgl_lib/src/draw/nanovg/lv_draw_nanovg_box_shadow.cyclo ./Middlewares/lvgl_lib/src/draw/nanovg/lv_draw_nanovg_box_shadow.d ./Middlewares/lvgl_lib/src/draw/nanovg/lv_draw_nanovg_box_shadow.o ./Middlewares/lvgl_lib/src/draw/nanovg/lv_draw_nanovg_box_shadow.su ./Middlewares/lvgl_lib/src/draw/nanovg/lv_draw_nanovg_fill.cyclo ./Middlewares/lvgl_lib/src/draw/nanovg/lv_draw_nanovg_fill.d ./Middlewares/lvgl_lib/src/draw/nanovg/lv_draw_nanovg_fill.o ./Middlewares/lvgl_lib/src/draw/nanovg/lv_draw_nanovg_fill.su ./Middlewares/lvgl_lib/src/draw/nanovg/lv_draw_nanovg_grad.cyclo ./Middlewares/lvgl_lib/src/draw/nanovg/lv_draw_nanovg_grad.d ./Middlewares/lvgl_lib/src/draw/nanovg/lv_draw_nanovg_grad.o ./Middlewares/lvgl_lib/src/draw/nanovg/lv_draw_nanovg_grad.su ./Middlewares/lvgl_lib/src/draw/nanovg/lv_draw_nanovg_image.cyclo ./Middlewares/lvgl_lib/src/draw/nanovg/lv_draw_nanovg_image.d ./Middlewares/lvgl_lib/src/draw/nanovg/lv_draw_nanovg_image.o ./Middlewares/lvgl_lib/src/draw/nanovg/lv_draw_nanovg_image.su ./Middlewares/lvgl_lib/src/draw/nanovg/lv_draw_nanovg_label.cyclo ./Middlewares/lvgl_lib/src/draw/nanovg/lv_draw_nanovg_label.d ./Middlewares/lvgl_lib/src/draw/nanovg/lv_draw_nanovg_label.o ./Middlewares/lvgl_lib/src/draw/nanovg/lv_draw_nanovg_label.su ./Middlewares/lvgl_lib/src/draw/nanovg/lv_draw_nanovg_layer.cyclo ./Middlewares/lvgl_lib/src/draw/nanovg/lv_draw_nanovg_layer.d ./Middlewares/lvgl_lib/src/draw/nanovg/lv_draw_nanovg_layer.o ./Middlewares/lvgl_lib/src/draw/nanovg/lv_draw_nanovg_layer.su ./Middlewares/lvgl_lib/src/draw/nanovg/lv_draw_nanovg_line.cyclo ./Middlewares/lvgl_lib/src/draw/nanovg/lv_draw_nanovg_line.d ./Middlewares/lvgl_lib/src/draw/nanovg/lv_draw_nanovg_line.o ./Middlewares/lvgl_lib/src/draw/nanovg/lv_draw_nanovg_line.su ./Middlewares/lvgl_lib/src/draw/nanovg/lv_draw_nanovg_mask_rect.cyclo ./Middlewares/lvgl_lib/src/draw/nanovg/lv_draw_nanovg_mask_rect.d ./Middlewares/lvgl_lib/src/draw/nanovg/lv_draw_nanovg_mask_rect.o ./Middlewares/lvgl_lib/src/draw/nanovg/lv_draw_nanovg_mask_rect.su ./Middlewares/lvgl_lib/src/draw/nanovg/lv_draw_nanovg_triangle.cyclo ./Middlewares/lvgl_lib/src/draw/nanovg/lv_draw_nanovg_triangle.d ./Middlewares/lvgl_lib/src/draw/nanovg/lv_draw_nanovg_triangle.o ./Middlewares/lvgl_lib/src/draw/nanovg/lv_draw_nanovg_triangle.su ./Middlewares/lvgl_lib/src/draw/nanovg/lv_draw_nanovg_vector.cyclo ./Middlewares/lvgl_lib/src/draw/nanovg/lv_draw_nanovg_vector.d ./Middlewares/lvgl_lib/src/draw/nanovg/lv_draw_nanovg_vector.o ./Middlewares/lvgl_lib/src/draw/nanovg/lv_draw_nanovg_vector.su ./Middlewares/lvgl_lib/src/draw/nanovg/lv_nanovg_fbo_cache.cyclo ./Middlewares/lvgl_lib/src/draw/nanovg/lv_nanovg_fbo_cache.d ./Middlewares/lvgl_lib/src/draw/nanovg/lv_nanovg_fbo_cache.o ./Middlewares/lvgl_lib/src/draw/nanovg/lv_nanovg_fbo_cache.su ./Middlewares/lvgl_lib/src/draw/nanovg/lv_nanovg_image_cache.cyclo ./Middlewares/lvgl_lib/src/draw/nanovg/lv_nanovg_image_cache.d ./Middlewares/lvgl_lib/src/draw/nanovg/lv_nanovg_image_cache.o ./Middlewares/lvgl_lib/src/draw/nanovg/lv_nanovg_image_cache.su ./Middlewares/lvgl_lib/src/draw/nanovg/lv_nanovg_utils.cyclo ./Middlewares/lvgl_lib/src/draw/nanovg/lv_nanovg_utils.d ./Middlewares/lvgl_lib/src/draw/nanovg/lv_nanovg_utils.o ./Middlewares/lvgl_lib/src/draw/nanovg/lv_nanovg_utils.su

.PHONY: clean-Middlewares-2f-lvgl_lib-2f-src-2f-draw-2f-nanovg

