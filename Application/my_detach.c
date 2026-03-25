#include "cmsis_os2.h"

osStatus_t osThreadDetach(osThreadId_t thread_id)
{
    (void)thread_id;
    return osOK;
}
