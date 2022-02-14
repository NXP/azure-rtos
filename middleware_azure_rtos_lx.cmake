#Description: Azure RTOS LevelX; user_visible: True
include_guard(GLOBAL)
message("middleware_azure_rtos_lx component is included.")

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
    ${CMAKE_CURRENT_LIST_DIR}/levelx/common/inc
)


