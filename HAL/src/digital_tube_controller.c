#include "unistd.h"
#include "alt_types.h"
#include "stdlib.h"
#include "digital_tube_controller.h"

extern alt_u32 digital_tube_controller_addr;


void verdvana_digital_tube_allclose()
{
    IOWR_VERDVANA_AVALON_DIGITAL_TUBE_DATA(digital_tube_controller_addr,0xffffff);


}

void verdvana_digital_tube_display(alt_u32 hex)
{
    IOWR_VERDVANA_AVALON_DIGITAL_TUBE_DATA(digital_tube_controller_addr,hex);

}
