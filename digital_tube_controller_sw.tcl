#
#  digital_tube_controller.tcl
#

# Create a new driver
create_driver digital_tube_controller

# Associate it with some hardware known as " digital_tube_controller"
set_sw_property hw_class_name digital_tube_controller

# The version of this driver
set_sw_property version 18.1

# This driver may be incompatible with versions of hardware less
# than specified below. Updates to hardware and device drivers
# rendering the driver incompatible with older versions of
# hardware are noted with this property assignment.
#
set_sw_property min_compatible_hw_version 1.0

# Initialize the driver in alt_sys_init()
set_sw_property auto_initialize true

# Interrupt properties:
# This peripheral has an IRQ output but the driver doesn't currently
# have any interrupt service routine. To ensure that the BSP tools
# do not otherwise limit the BSP functionality for users of the
# Nios II enhanced interrupt port, these settings advertise 
# compliance with both legacy and enhanced interrupt APIs, and to state
# that any driver ISR supports preemption. If an interrupt handler
# is added to this driver, these must be re-examined for validity.

#
# Source file listings...
#
add_sw_property c_source HAL/src/digital_tube_controller.c

# Include files
add_sw_property include_source HAL/inc/digital_tube_controller.h
add_sw_property include_source inc/verdvana_avalon_digital_tube_register.h

# This driver supports HAL & UCOSII BSP (OS) types
add_sw_property supported_bsp_type HAL
add_sw_property supported_bsp_type UCOSII


# End of file
