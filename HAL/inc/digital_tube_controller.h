#ifndef __DIGITAL_TUBE_CONTROLLER_H__
#define __DIGITAL_TUBE_CONTROLLER_H__

#include "system.h" 
#include "alt_types.h"
#include "verdvana_avalon_digital_tube_register.h"

#ifdef __cplusplus

extern "C"
{

#endif /* __cplusplus*/

void verdvana_digital_tube_allclose();
void verdvana_digital_tube_display(alt_u32 hex);

#define DIGITAL_TUBE_CONTROLLER_INSTANCE(name,dev) alt_u32 digital_tube_controller_addr = name##_BASE
#define DIGITAL_TUBE_CONTROLLER_INIT(name,dev) while(0)

#ifdef __cplusplus

}

#endif /*__cplusplus*/

#endif  /*__DIGITAL_TUBE_CONTROLLER_H__*/
