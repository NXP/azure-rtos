#Description: Azure RTOS NetX Duo(Single Precision FPU); user_visible: True
include_guard(GLOBAL)
message("middleware_azure_rtos_nxd_sp component is included.")

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
)

#OR Logic component
if(${MCUX_DEVICE} STREQUAL "LPC55S16")
    include(middleware_azure_rtos_nxd_template_LPC55S16)
endif()
if(${MCUX_DEVICE} STREQUAL "LPC55S69_cm33_core0")
    include(middleware_azure_rtos_nxd_template_LPC55S69_cm33_core0)
endif()
if(${MCUX_DEVICE} STREQUAL "MIMXRT1011")
    include(middleware_azure_rtos_nxd_template_MIMXRT1011)
endif()
if(${MCUX_DEVICE} STREQUAL "LPC55S28")
    include(middleware_azure_rtos_nxd_template_LPC55S28)
endif()
if(${MCUX_DEVICE} STREQUAL "MIMXRT1015")
    include(middleware_azure_rtos_nxd_template_MIMXRT1015)
endif()

include(middleware_azure_rtos_fx_sp)
