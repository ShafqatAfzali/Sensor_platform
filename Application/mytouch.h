#ifndef mytouch_
#define mytouch_

//lærte at dette er mer brukelig enn forventer
//så skal bruke dette mer
typedef enum {
	SET_TO_GND,
	SET_TO_VCC,
    SET_TO_ADC,
	SET_TO_FLOAT

} pinstate;

void touchscreen_INIT();

#endif
