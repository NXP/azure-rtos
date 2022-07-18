#Description: Azure RTOS USBX; user_visible: True
include_guard(GLOBAL)
message("middleware_azure_rtos_ux component is included.")

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
)

#OR Logic component
if(${MCUX_DEVICE} STREQUAL "MIMXRT1166_cm7")
    include(middleware_azure_rtos_ux_template_MIMXRT1166_cm7)
endif()
if(${MCUX_DEVICE} STREQUAL "MIMXRT1052")
    include(middleware_azure_rtos_ux_template_MIMXRT1052)
endif()
if(${MCUX_DEVICE} STREQUAL "MIMXRT1064")
    include(middleware_azure_rtos_ux_template_MIMXRT1064)
endif()
if(${MCUX_DEVICE} STREQUAL "MIMXRT1021")
    include(middleware_azure_rtos_ux_template_MIMXRT1021)
endif()
if(${MCUX_DEVICE} STREQUAL "MIMXRT1062")
    include(middleware_azure_rtos_ux_template_MIMXRT1062)
endif()
if(${MCUX_DEVICE} STREQUAL "MIMXRT1176_cm7")
    include(middleware_azure_rtos_ux_template_MIMXRT1176_cm7)
endif()
if(${MCUX_DEVICE} STREQUAL "MIMXRT1024")
    include(middleware_azure_rtos_ux_template_MIMXRT1024)
endif()
if(${MCUX_DEVICE} STREQUAL "MIMXRT1015")
    include(middleware_azure_rtos_ux_template_MIMXRT1015)
endif()

include(middleware_azure_rtos_nxd)
