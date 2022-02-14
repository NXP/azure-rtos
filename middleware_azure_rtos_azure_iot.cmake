#Description: Azure RTOS IoT; user_visible: True
include_guard(GLOBAL)
message("middleware_azure_rtos_azure_iot component is included.")

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
)

#OR Logic component
if(CONFIG_USE_middleware_azure_rtos_nxd_sp) 
    include(middleware_azure_rtos_nxd_sp)
endif()
if(CONFIG_USE_middleware_azure_rtos_nxd) 
    include(middleware_azure_rtos_nxd)
endif()

