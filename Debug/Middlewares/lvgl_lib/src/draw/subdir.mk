################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Middlewares/lvgl_lib/src/draw/lv_draw.c \
../Middlewares/lvgl_lib/src/draw/lv_draw_3d.c \
../Middlewares/lvgl_lib/src/draw/lv_draw_arc.c \
../Middlewares/lvgl_lib/src/draw/lv_draw_blur.c \
../Middlewares/lvgl_lib/src/draw/lv_draw_buf.c \
../Middlewares/lvgl_lib/src/draw/lv_draw_image.c \
../Middlewares/lvgl_lib/src/draw/lv_draw_label.c \
../Middlewares/lvgl_lib/src/draw/lv_draw_line.c \
../Middlewares/lvgl_lib/src/draw/lv_draw_mask.c \
../Middlewares/lvgl_lib/src/draw/lv_draw_rect.c \
../Middlewares/lvgl_lib/src/draw/lv_draw_triangle.c \
../Middlewares/lvgl_lib/src/draw/lv_draw_vector.c \
../Middlewares/lvgl_lib/src/draw/lv_image_decoder.c 

OBJS += \
./Middlewares/lvgl_lib/src/draw/lv_draw.o \
./Middlewares/lvgl_lib/src/draw/lv_draw_3d.o \
./Middlewares/lvgl_lib/src/draw/lv_draw_arc.o \
./Middlewares/lvgl_lib/src/draw/lv_draw_blur.o \
./Middlewares/lvgl_lib/src/draw/lv_draw_buf.o \
./Middlewares/lvgl_lib/src/draw/lv_draw_image.o \
./Middlewares/lvgl_lib/src/draw/lv_draw_label.o \
./Middlewares/lvgl_lib/src/draw/lv_draw_line.o \
./Middlewares/lvgl_lib/src/draw/lv_draw_mask.o \
./Middlewares/lvgl_lib/src/draw/lv_draw_rect.o \
./Middlewares/lvgl_lib/src/draw/lv_draw_triangle.o \
./Middlewares/lvgl_lib/src/draw/lv_draw_vector.o \
./Middlewares/lvgl_lib/src/draw/lv_image_decoder.o 

C_DEPS += \
./Middlewares/lvgl_lib/src/draw/lv_draw.d \
./Middlewares/lvgl_lib/src/draw/lv_draw_3d.d \
./Middlewares/lvgl_lib/src/draw/lv_draw_arc.d \
./Middlewares/lvgl_lib/src/draw/lv_draw_blur.d \
./Middlewares/lvgl_lib/src/draw/lv_draw_buf.d \
./Middlewares/lvgl_lib/src/draw/lv_draw_image.d \
./Middlewares/lvgl_lib/src/draw/lv_draw_label.d \
./Middlewares/lvgl_lib/src/draw/lv_draw_line.d \
./Middlewares/lvgl_lib/src/draw/lv_draw_mask.d \
./Middlewares/lvgl_lib/src/draw/lv_draw_rect.d \
./Middlewares/lvgl_lib/src/draw/lv_draw_triangle.d \
./Middlewares/lvgl_lib/src/draw/lv_draw_vector.d \
./Middlewares/lvgl_lib/src/draw/lv_image_decoder.d 


# Each subdirectory must supply rules for building sources it contributes
Middlewares/lvgl_lib/src/draw/%.o Middlewares/lvgl_lib/src/draw/%.su Middlewares/lvgl_lib/src/draw/%.cyclo: ../Middlewares/lvgl_lib/src/draw/%.c Middlewares/lvgl_lib/src/draw/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F446xx -c -I../Application -I"C:/Users/shafg/Desktop/Projects_Firmware/sensor_platform/Middlewares/lvgl_lib" -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2 -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Middlewares-2f-lvgl_lib-2f-src-2f-draw

clean-Middlewares-2f-lvgl_lib-2f-src-2f-draw:
	-$(RM) ./Middlewares/lvgl_lib/src/draw/lv_draw.cyclo ./Middlewares/lvgl_lib/src/draw/lv_draw.d ./Middlewares/lvgl_lib/src/draw/lv_draw.o ./Middlewares/lvgl_lib/src/draw/lv_draw.su ./Middlewares/lvgl_lib/src/draw/lv_draw_3d.cyclo ./Middlewares/lvgl_lib/src/draw/lv_draw_3d.d ./Middlewares/lvgl_lib/src/draw/lv_draw_3d.o ./Middlewares/lvgl_lib/src/draw/lv_draw_3d.su ./Middlewares/lvgl_lib/src/draw/lv_draw_arc.cyclo ./Middlewares/lvgl_lib/src/draw/lv_draw_arc.d ./Middlewares/lvgl_lib/src/draw/lv_draw_arc.o ./Middlewares/lvgl_lib/src/draw/lv_draw_arc.su ./Middlewares/lvgl_lib/src/draw/lv_draw_blur.cyclo ./Middlewares/lvgl_lib/src/draw/lv_draw_blur.d ./Middlewares/lvgl_lib/src/draw/lv_draw_blur.o ./Middlewares/lvgl_lib/src/draw/lv_draw_blur.su ./Middlewares/lvgl_lib/src/draw/lv_draw_buf.cyclo ./Middlewares/lvgl_lib/src/draw/lv_draw_buf.d ./Middlewares/lvgl_lib/src/draw/lv_draw_buf.o ./Middlewares/lvgl_lib/src/draw/lv_draw_buf.su ./Middlewares/lvgl_lib/src/draw/lv_draw_image.cyclo ./Middlewares/lvgl_lib/src/draw/lv_draw_image.d ./Middlewares/lvgl_lib/src/draw/lv_draw_image.o ./Middlewares/lvgl_lib/src/draw/lv_draw_image.su ./Middlewares/lvgl_lib/src/draw/lv_draw_label.cyclo ./Middlewares/lvgl_lib/src/draw/lv_draw_label.d ./Middlewares/lvgl_lib/src/draw/lv_draw_label.o ./Middlewares/lvgl_lib/src/draw/lv_draw_label.su ./Middlewares/lvgl_lib/src/draw/lv_draw_line.cyclo ./Middlewares/lvgl_lib/src/draw/lv_draw_line.d ./Middlewares/lvgl_lib/src/draw/lv_draw_line.o ./Middlewares/lvgl_lib/src/draw/lv_draw_line.su ./Middlewares/lvgl_lib/src/draw/lv_draw_mask.cyclo ./Middlewares/lvgl_lib/src/draw/lv_draw_mask.d ./Middlewares/lvgl_lib/src/draw/lv_draw_mask.o ./Middlewares/lvgl_lib/src/draw/lv_draw_mask.su ./Middlewares/lvgl_lib/src/draw/lv_draw_rect.cyclo ./Middlewares/lvgl_lib/src/draw/lv_draw_rect.d ./Middlewares/lvgl_lib/src/draw/lv_draw_rect.o ./Middlewares/lvgl_lib/src/draw/lv_draw_rect.su ./Middlewares/lvgl_lib/src/draw/lv_draw_triangle.cyclo ./Middlewares/lvgl_lib/src/draw/lv_draw_triangle.d ./Middlewares/lvgl_lib/src/draw/lv_draw_triangle.o ./Middlewares/lvgl_lib/src/draw/lv_draw_triangle.su ./Middlewares/lvgl_lib/src/draw/lv_draw_vector.cyclo ./Middlewares/lvgl_lib/src/draw/lv_draw_vector.d ./Middlewares/lvgl_lib/src/draw/lv_draw_vector.o ./Middlewares/lvgl_lib/src/draw/lv_draw_vector.su ./Middlewares/lvgl_lib/src/draw/lv_image_decoder.cyclo ./Middlewares/lvgl_lib/src/draw/lv_image_decoder.d ./Middlewares/lvgl_lib/src/draw/lv_image_decoder.o ./Middlewares/lvgl_lib/src/draw/lv_image_decoder.su

.PHONY: clean-Middlewares-2f-lvgl_lib-2f-src-2f-draw

