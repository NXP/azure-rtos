include_guard(GLOBAL)


if (CONFIG_USE_middleware_azure_rtos_tx_template)
# Add set(CONFIG_USE_middleware_azure_rtos_tx_template true) in config.cmake to use this component

message("middleware_azure_rtos_tx_template component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if((CONFIG_TOOLCHAIN STREQUAL mcux OR CONFIG_TOOLCHAIN STREQUAL armgcc) AND CONFIG_CORE STREQUAL cm7f)
  target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
      ${CMAKE_CURRENT_LIST_DIR}/./threadx/ports/cortex_m7/gnu/src/tx_misra.S
      ${CMAKE_CURRENT_LIST_DIR}/./threadx/ports/cortex_m7/gnu/src/tx_thread_context_restore.S
      ${CMAKE_CURRENT_LIST_DIR}/./threadx/ports/cortex_m7/gnu/src/tx_thread_context_save.S
      ${CMAKE_CURRENT_LIST_DIR}/./threadx/ports/cortex_m7/gnu/src/tx_thread_interrupt_control.S
      ${CMAKE_CURRENT_LIST_DIR}/./threadx/ports/cortex_m7/gnu/src/tx_thread_interrupt_disable.S
      ${CMAKE_CURRENT_LIST_DIR}/./threadx/ports/cortex_m7/gnu/src/tx_thread_interrupt_restore.S
      ${CMAKE_CURRENT_LIST_DIR}/./threadx/ports/cortex_m7/gnu/src/tx_thread_schedule.S
      ${CMAKE_CURRENT_LIST_DIR}/./threadx/ports/cortex_m7/gnu/src/tx_thread_stack_build.S
      ${CMAKE_CURRENT_LIST_DIR}/./threadx/ports/cortex_m7/gnu/src/tx_thread_system_return.S
      ${CMAKE_CURRENT_LIST_DIR}/./threadx/ports/cortex_m7/gnu/src/tx_timer_interrupt.S
  )
endif()

if((CONFIG_TOOLCHAIN STREQUAL mcux OR CONFIG_TOOLCHAIN STREQUAL armgcc) AND CONFIG_CORE STREQUAL cm4f)
  target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
      ${CMAKE_CURRENT_LIST_DIR}/./threadx/ports/cortex_m4/gnu/src/tx_misra.S
      ${CMAKE_CURRENT_LIST_DIR}/./threadx/ports/cortex_m4/gnu/src/tx_thread_context_restore.S
      ${CMAKE_CURRENT_LIST_DIR}/./threadx/ports/cortex_m4/gnu/src/tx_thread_context_save.S
      ${CMAKE_CURRENT_LIST_DIR}/./threadx/ports/cortex_m4/gnu/src/tx_thread_interrupt_control.S
      ${CMAKE_CURRENT_LIST_DIR}/./threadx/ports/cortex_m4/gnu/src/tx_thread_interrupt_disable.S
      ${CMAKE_CURRENT_LIST_DIR}/./threadx/ports/cortex_m4/gnu/src/tx_thread_interrupt_restore.S
      ${CMAKE_CURRENT_LIST_DIR}/./threadx/ports/cortex_m4/gnu/src/tx_thread_schedule.S
      ${CMAKE_CURRENT_LIST_DIR}/./threadx/ports/cortex_m4/gnu/src/tx_thread_stack_build.S
      ${CMAKE_CURRENT_LIST_DIR}/./threadx/ports/cortex_m4/gnu/src/tx_thread_system_return.S
      ${CMAKE_CURRENT_LIST_DIR}/./threadx/ports/cortex_m4/gnu/src/tx_timer_interrupt.S
  )
endif()

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/ports/common/tx_initialize_low_level.c
)

if((CONFIG_TOOLCHAIN STREQUAL mcux OR CONFIG_TOOLCHAIN STREQUAL armgcc) AND CONFIG_CORE STREQUAL cm33)
  target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
      ${CMAKE_CURRENT_LIST_DIR}/./threadx/ports/cortex_m33/gnu/src/tx_thread_context_restore.S
      ${CMAKE_CURRENT_LIST_DIR}/./threadx/ports/cortex_m33/gnu/src/tx_thread_context_save.S
      ${CMAKE_CURRENT_LIST_DIR}/./threadx/ports/cortex_m33/gnu/src/tx_thread_interrupt_control.S
      ${CMAKE_CURRENT_LIST_DIR}/./threadx/ports/cortex_m33/gnu/src/tx_thread_interrupt_disable.S
      ${CMAKE_CURRENT_LIST_DIR}/./threadx/ports/cortex_m33/gnu/src/tx_thread_interrupt_restore.S
      ${CMAKE_CURRENT_LIST_DIR}/./threadx/ports/cortex_m33/gnu/src/tx_thread_schedule.S
      ${CMAKE_CURRENT_LIST_DIR}/./threadx/ports/cortex_m33/gnu/src/tx_thread_stack_build.S
      ${CMAKE_CURRENT_LIST_DIR}/./threadx/ports/cortex_m33/gnu/src/tx_thread_system_return.S
      ${CMAKE_CURRENT_LIST_DIR}/./threadx/ports/cortex_m33/gnu/src/tx_timer_interrupt.S
  )
endif()

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/inc
)

if((CONFIG_TOOLCHAIN STREQUAL armgcc OR CONFIG_TOOLCHAIN STREQUAL mcux) AND CONFIG_CORE STREQUAL cm7f)
target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/ports/cortex_m7/gnu/inc
)
endif()

if((CONFIG_TOOLCHAIN STREQUAL armgcc OR CONFIG_TOOLCHAIN STREQUAL mcux) AND CONFIG_CORE STREQUAL cm4f)
target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/ports/cortex_m4/gnu/inc
)
endif()

if((CONFIG_TOOLCHAIN STREQUAL armgcc OR CONFIG_TOOLCHAIN STREQUAL mcux) AND CONFIG_CORE STREQUAL cm33)
target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/ports/cortex_m33/gnu/inc
)
endif()

if(CONFIG_USE_COMPONENT_CONFIGURATION)
  message("===>Import configuration from ${CMAKE_CURRENT_LIST_FILE}")

  target_compile_definitions(${MCUX_SDK_PROJECT_NAME} PUBLIC
    -DTX_INCLUDE_USER_DEFINE_FILE
    -DFSL_RTOS_THREADX
  )

  if(CONFIG_TOOLCHAIN STREQUAL armgcc)
    target_compile_options(${MCUX_SDK_PROJECT_NAME} PUBLIC
    )
  endif()

endif()


endif()


if (CONFIG_USE_middleware_azure_rtos_tx_mgr_template)
# Add set(CONFIG_USE_middleware_azure_rtos_tx_mgr_template true) in config.cmake to use this component

message("middleware_azure_rtos_tx_mgr_template component is included from ${CMAKE_CURRENT_LIST_FILE}.")

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/ports/common/tx_initialize_low_level.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/inc
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common_modules/inc
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common_modules/module_manager/inc
)

if(CONFIG_TOOLCHAIN STREQUAL mcux AND CONFIG_CORE STREQUAL cm7f)
target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/ports_module/cortex_m7/gnu/inc
)
endif()

if(CONFIG_USE_COMPONENT_CONFIGURATION)
  message("===>Import configuration from ${CMAKE_CURRENT_LIST_FILE}")

  target_compile_definitions(${MCUX_SDK_PROJECT_NAME} PUBLIC
    -DTX_INCLUDE_USER_DEFINE_FILE
    -DFSL_RTOS_THREADX
  )

endif()


endif()


if (CONFIG_USE_middleware_azure_rtos_tx_lib)
# Add set(CONFIG_USE_middleware_azure_rtos_tx_lib true) in config.cmake to use this component

message("middleware_azure_rtos_tx_lib component is included from ${CMAKE_CURRENT_LIST_FILE}.")

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_block_allocate.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_block_pool_cleanup.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_block_pool_create.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_block_pool_delete.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_block_pool_info_get.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_block_pool_initialize.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_block_pool_performance_info_get.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_block_pool_performance_system_info_get.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_block_pool_prioritize.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_block_release.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_byte_allocate.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_byte_pool_cleanup.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_byte_pool_create.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_byte_pool_delete.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_byte_pool_info_get.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_byte_pool_initialize.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_byte_pool_performance_info_get.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_byte_pool_performance_system_info_get.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_byte_pool_prioritize.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_byte_pool_search.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_byte_release.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_event_flags_cleanup.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_event_flags_create.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_event_flags_delete.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_event_flags_get.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_event_flags_info_get.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_event_flags_initialize.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_event_flags_performance_info_get.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_event_flags_performance_system_info_get.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_event_flags_set.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_event_flags_set_notify.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_initialize_high_level.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_initialize_kernel_enter.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_initialize_kernel_setup.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_misra.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_mutex_cleanup.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_mutex_create.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_mutex_delete.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_mutex_get.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_mutex_info_get.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_mutex_initialize.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_mutex_performance_info_get.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_mutex_performance_system_info_get.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_mutex_prioritize.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_mutex_priority_change.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_mutex_put.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_queue_cleanup.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_queue_create.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_queue_delete.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_queue_flush.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_queue_front_send.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_queue_info_get.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_queue_initialize.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_queue_performance_info_get.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_queue_performance_system_info_get.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_queue_prioritize.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_queue_receive.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_queue_send.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_queue_send_notify.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_semaphore_ceiling_put.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_semaphore_cleanup.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_semaphore_create.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_semaphore_delete.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_semaphore_get.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_semaphore_info_get.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_semaphore_initialize.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_semaphore_performance_info_get.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_semaphore_performance_system_info_get.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_semaphore_prioritize.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_semaphore_put.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_semaphore_put_notify.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_thread_create.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_thread_delete.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_thread_entry_exit_notify.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_thread_identify.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_thread_info_get.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_thread_initialize.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_thread_performance_info_get.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_thread_performance_system_info_get.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_thread_preemption_change.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_thread_priority_change.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_thread_relinquish.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_thread_reset.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_thread_resume.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_thread_shell_entry.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_thread_sleep.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_thread_stack_analyze.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_thread_stack_error_handler.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_thread_stack_error_notify.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_thread_suspend.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_thread_system_preempt_check.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_thread_system_resume.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_thread_system_suspend.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_thread_terminate.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_thread_time_slice.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_thread_time_slice_change.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_thread_timeout.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_thread_wait_abort.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_time_get.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_time_set.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_timer_activate.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_timer_change.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_timer_create.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_timer_deactivate.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_timer_delete.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_timer_expiration_process.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_timer_info_get.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_timer_initialize.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_timer_performance_info_get.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_timer_performance_system_info_get.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_timer_system_activate.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_timer_system_deactivate.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_timer_thread_entry.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_trace_buffer_full_notify.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_trace_disable.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_trace_enable.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_trace_event_filter.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_trace_event_unfilter.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_trace_initialize.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_trace_interrupt_control.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_trace_isr_enter_insert.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_trace_isr_exit_insert.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_trace_object_register.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_trace_object_unregister.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_trace_user_event_insert.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/txe_block_allocate.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/txe_block_pool_create.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/txe_block_pool_delete.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/txe_block_pool_info_get.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/txe_block_pool_prioritize.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/txe_block_release.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/txe_byte_allocate.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/txe_byte_pool_create.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/txe_byte_pool_delete.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/txe_byte_pool_info_get.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/txe_byte_pool_prioritize.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/txe_byte_release.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/txe_event_flags_create.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/txe_event_flags_delete.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/txe_event_flags_get.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/txe_event_flags_info_get.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/txe_event_flags_set.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/txe_event_flags_set_notify.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/txe_mutex_create.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/txe_mutex_delete.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/txe_mutex_get.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/txe_mutex_info_get.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/txe_mutex_prioritize.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/txe_mutex_put.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/txe_queue_create.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/txe_queue_delete.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/txe_queue_flush.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/txe_queue_front_send.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/txe_queue_info_get.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/txe_queue_prioritize.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/txe_queue_receive.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/txe_queue_send.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/txe_queue_send_notify.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/txe_semaphore_ceiling_put.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/txe_semaphore_create.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/txe_semaphore_delete.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/txe_semaphore_get.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/txe_semaphore_info_get.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/txe_semaphore_prioritize.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/txe_semaphore_put.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/txe_semaphore_put_notify.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/txe_thread_create.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/txe_thread_delete.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/txe_thread_entry_exit_notify.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/txe_thread_info_get.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/txe_thread_preemption_change.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/txe_thread_priority_change.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/txe_thread_relinquish.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/txe_thread_reset.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/txe_thread_resume.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/txe_thread_suspend.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/txe_thread_terminate.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/txe_thread_time_slice_change.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/txe_thread_wait_abort.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/txe_timer_activate.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/txe_timer_change.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/txe_timer_create.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/txe_timer_deactivate.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/txe_timer_delete.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/txe_timer_info_get.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/inc
)

if(CONFIG_TOOLCHAIN STREQUAL mcux AND CONFIG_CORE STREQUAL cm7f)
target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/ports/cortex_m7/gnu/inc
)
endif()

if(CONFIG_TOOLCHAIN STREQUAL mcux AND CONFIG_CORE STREQUAL cm4f)
target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/ports/cortex_m4/gnu/inc
)
endif()

if(CONFIG_TOOLCHAIN STREQUAL mcux AND CONFIG_CORE STREQUAL cm33)
target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/ports/cortex_m33/gnu/inc
)
endif()

if(CONFIG_USE_COMPONENT_CONFIGURATION)
  message("===>Import configuration from ${CMAKE_CURRENT_LIST_FILE}")

  target_compile_definitions(${MCUX_SDK_PROJECT_NAME} PUBLIC
    -DTX_INCLUDE_USER_DEFINE_FILE
  )

endif()


endif()


if (CONFIG_USE_middleware_azure_rtos_tx_mgr_lib)
# Add set(CONFIG_USE_middleware_azure_rtos_tx_mgr_lib true) in config.cmake to use this component

message("middleware_azure_rtos_tx_mgr_lib component is included from ${CMAKE_CURRENT_LIST_FILE}.")

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_block_allocate.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_block_pool_cleanup.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_block_pool_create.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_block_pool_delete.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_block_pool_info_get.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_block_pool_initialize.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_block_pool_performance_info_get.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_block_pool_performance_system_info_get.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_block_pool_prioritize.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_block_release.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_byte_allocate.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_byte_pool_cleanup.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_byte_pool_create.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_byte_pool_delete.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_byte_pool_info_get.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_byte_pool_initialize.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_byte_pool_performance_info_get.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_byte_pool_performance_system_info_get.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_byte_pool_prioritize.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_byte_pool_search.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_byte_release.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_event_flags_cleanup.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_event_flags_create.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_event_flags_delete.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_event_flags_get.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_event_flags_info_get.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_event_flags_initialize.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_event_flags_performance_info_get.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_event_flags_performance_system_info_get.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_event_flags_set.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_event_flags_set_notify.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_initialize_high_level.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_initialize_kernel_enter.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_initialize_kernel_setup.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_misra.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_mutex_cleanup.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_mutex_create.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_mutex_delete.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_mutex_get.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_mutex_info_get.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_mutex_initialize.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_mutex_performance_info_get.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_mutex_performance_system_info_get.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_mutex_prioritize.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_mutex_priority_change.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_mutex_put.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_queue_cleanup.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_queue_create.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_queue_delete.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_queue_flush.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_queue_front_send.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_queue_info_get.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_queue_initialize.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_queue_performance_info_get.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_queue_performance_system_info_get.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_queue_prioritize.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_queue_receive.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_queue_send.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_queue_send_notify.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_semaphore_ceiling_put.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_semaphore_cleanup.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_semaphore_create.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_semaphore_delete.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_semaphore_get.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_semaphore_info_get.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_semaphore_initialize.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_semaphore_performance_info_get.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_semaphore_performance_system_info_get.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_semaphore_prioritize.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_semaphore_put.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_semaphore_put_notify.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_thread_create.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_thread_delete.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_thread_entry_exit_notify.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_thread_identify.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_thread_info_get.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_thread_initialize.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_thread_performance_info_get.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_thread_performance_system_info_get.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_thread_preemption_change.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_thread_priority_change.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_thread_relinquish.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_thread_reset.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_thread_resume.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_thread_shell_entry.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_thread_sleep.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_thread_stack_analyze.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_thread_stack_error_handler.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_thread_stack_error_notify.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_thread_suspend.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_thread_system_preempt_check.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_thread_system_resume.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_thread_system_suspend.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_thread_terminate.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_thread_time_slice.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_thread_time_slice_change.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_thread_timeout.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_thread_wait_abort.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_time_get.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_time_set.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_timer_activate.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_timer_change.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_timer_create.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_timer_deactivate.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_timer_delete.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_timer_expiration_process.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_timer_info_get.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_timer_initialize.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_timer_performance_info_get.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_timer_performance_system_info_get.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_timer_system_activate.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_timer_system_deactivate.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_timer_thread_entry.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_trace_buffer_full_notify.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_trace_disable.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_trace_enable.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_trace_event_filter.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_trace_event_unfilter.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_trace_initialize.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_trace_interrupt_control.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_trace_isr_enter_insert.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_trace_isr_exit_insert.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_trace_object_register.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_trace_object_unregister.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/tx_trace_user_event_insert.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/txe_block_allocate.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/txe_block_pool_create.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/txe_block_pool_delete.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/txe_block_pool_info_get.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/txe_block_pool_prioritize.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/txe_block_release.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/txe_byte_allocate.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/txe_byte_pool_create.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/txe_byte_pool_delete.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/txe_byte_pool_info_get.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/txe_byte_pool_prioritize.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/txe_byte_release.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/txe_event_flags_create.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/txe_event_flags_delete.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/txe_event_flags_get.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/txe_event_flags_info_get.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/txe_event_flags_set.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/txe_event_flags_set_notify.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/txe_mutex_create.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/txe_mutex_delete.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/txe_mutex_get.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/txe_mutex_info_get.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/txe_mutex_prioritize.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/txe_mutex_put.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/txe_queue_create.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/txe_queue_delete.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/txe_queue_flush.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/txe_queue_front_send.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/txe_queue_info_get.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/txe_queue_prioritize.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/txe_queue_receive.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/txe_queue_send.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/txe_queue_send_notify.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/txe_semaphore_ceiling_put.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/txe_semaphore_create.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/txe_semaphore_delete.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/txe_semaphore_get.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/txe_semaphore_info_get.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/txe_semaphore_prioritize.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/txe_semaphore_put.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/txe_semaphore_put_notify.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/txe_thread_create.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/txe_thread_delete.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/txe_thread_entry_exit_notify.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/txe_thread_info_get.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/txe_thread_preemption_change.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/txe_thread_priority_change.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/txe_thread_relinquish.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/txe_thread_reset.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/txe_thread_resume.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/txe_thread_suspend.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/txe_thread_terminate.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/txe_thread_time_slice_change.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/txe_thread_wait_abort.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/txe_timer_activate.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/txe_timer_change.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/txe_timer_create.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/txe_timer_deactivate.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/txe_timer_delete.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/src/txe_timer_info_get.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common_modules/module_manager/src/txm_module_manager_absolute_load.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common_modules/module_manager/src/txm_module_manager_application_request.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common_modules/module_manager/src/txm_module_manager_callback_request.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common_modules/module_manager/src/txm_module_manager_event_flags_notify_trampoline.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common_modules/module_manager/src/txm_module_manager_file_load.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common_modules/module_manager/src/txm_module_manager_in_place_load.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common_modules/module_manager/src/txm_module_manager_initialize.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common_modules/module_manager/src/txm_module_manager_internal_load.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common_modules/module_manager/src/txm_module_manager_kernel_dispatch.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common_modules/module_manager/src/txm_module_manager_maximum_module_priority_set.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common_modules/module_manager/src/txm_module_manager_memory_load.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common_modules/module_manager/src/txm_module_manager_object_allocate.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common_modules/module_manager/src/txm_module_manager_object_deallocate.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common_modules/module_manager/src/txm_module_manager_object_pointer_get.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common_modules/module_manager/src/txm_module_manager_object_pointer_get_extended.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common_modules/module_manager/src/txm_module_manager_object_pool_create.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common_modules/module_manager/src/txm_module_manager_properties_get.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common_modules/module_manager/src/txm_module_manager_queue_notify_trampoline.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common_modules/module_manager/src/txm_module_manager_semaphore_notify_trampoline.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common_modules/module_manager/src/txm_module_manager_start.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common_modules/module_manager/src/txm_module_manager_stop.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common_modules/module_manager/src/txm_module_manager_thread_create.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common_modules/module_manager/src/txm_module_manager_thread_notify_trampoline.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common_modules/module_manager/src/txm_module_manager_thread_reset.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common_modules/module_manager/src/txm_module_manager_timer_notify_trampoline.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common_modules/module_manager/src/txm_module_manager_unload.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common_modules/module_manager/src/txm_module_manager_util.c
)

if(CONFIG_TOOLCHAIN STREQUAL mcux AND CONFIG_CORE STREQUAL cm7f)
  target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
      ${CMAKE_CURRENT_LIST_DIR}/./threadx/ports_module/cortex_m7/gnu/module_manager/src/tx_thread_context_restore.S
      ${CMAKE_CURRENT_LIST_DIR}/./threadx/ports_module/cortex_m7/gnu/module_manager/src/tx_thread_context_save.S
      ${CMAKE_CURRENT_LIST_DIR}/./threadx/ports_module/cortex_m7/gnu/module_manager/src/tx_thread_interrupt_control.S
      ${CMAKE_CURRENT_LIST_DIR}/./threadx/ports_module/cortex_m7/gnu/module_manager/src/tx_thread_interrupt_disable.S
      ${CMAKE_CURRENT_LIST_DIR}/./threadx/ports_module/cortex_m7/gnu/module_manager/src/tx_thread_interrupt_restore.S
      ${CMAKE_CURRENT_LIST_DIR}/./threadx/ports_module/cortex_m7/gnu/module_manager/src/tx_thread_schedule.S
      ${CMAKE_CURRENT_LIST_DIR}/./threadx/ports_module/cortex_m7/gnu/module_manager/src/tx_thread_stack_build.S
      ${CMAKE_CURRENT_LIST_DIR}/./threadx/ports_module/cortex_m7/gnu/module_manager/src/tx_thread_system_return.S
      ${CMAKE_CURRENT_LIST_DIR}/./threadx/ports_module/cortex_m7/gnu/module_manager/src/tx_timer_interrupt.S
      ${CMAKE_CURRENT_LIST_DIR}/./threadx/ports_module/cortex_m7/gnu/module_manager/src/txm_module_manager_alignment_adjust.c
      ${CMAKE_CURRENT_LIST_DIR}/./threadx/ports_module/cortex_m7/gnu/module_manager/src/txm_module_manager_external_memory_enable.c
      ${CMAKE_CURRENT_LIST_DIR}/./threadx/ports_module/cortex_m7/gnu/module_manager/src/txm_module_manager_memory_fault_handler.c
      ${CMAKE_CURRENT_LIST_DIR}/./threadx/ports_module/cortex_m7/gnu/module_manager/src/txm_module_manager_memory_fault_notify.c
      ${CMAKE_CURRENT_LIST_DIR}/./threadx/ports_module/cortex_m7/gnu/module_manager/src/txm_module_manager_mm_register_setup.c
      ${CMAKE_CURRENT_LIST_DIR}/./threadx/ports_module/cortex_m7/gnu/module_manager/src/txm_module_manager_thread_stack_build.s
  )
endif()

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/inc
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common_modules/inc
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common_modules/module_manager/inc
)

if(CONFIG_TOOLCHAIN STREQUAL mcux AND CONFIG_CORE STREQUAL cm7f)
target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/ports_module/cortex_m7/gnu/inc
)
endif()

if(CONFIG_USE_COMPONENT_CONFIGURATION)
  message("===>Import configuration from ${CMAKE_CURRENT_LIST_FILE}")

  target_compile_definitions(${MCUX_SDK_PROJECT_NAME} PUBLIC
    -DTX_INCLUDE_USER_DEFINE_FILE
  )

endif()


endif()


if (CONFIG_USE_middleware_azure_rtos_txm_lib)
# Add set(CONFIG_USE_middleware_azure_rtos_txm_lib true) in config.cmake to use this component

message("middleware_azure_rtos_txm_lib component is included from ${CMAKE_CURRENT_LIST_FILE}.")

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common_modules/module_lib/src/txm_block_allocate.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common_modules/module_lib/src/txm_block_pool_create.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common_modules/module_lib/src/txm_block_pool_delete.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common_modules/module_lib/src/txm_block_pool_info_get.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common_modules/module_lib/src/txm_block_pool_performance_info_get.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common_modules/module_lib/src/txm_block_pool_performance_system_info_get.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common_modules/module_lib/src/txm_block_pool_prioritize.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common_modules/module_lib/src/txm_block_release.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common_modules/module_lib/src/txm_byte_allocate.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common_modules/module_lib/src/txm_byte_pool_create.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common_modules/module_lib/src/txm_byte_pool_delete.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common_modules/module_lib/src/txm_byte_pool_info_get.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common_modules/module_lib/src/txm_byte_pool_performance_info_get.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common_modules/module_lib/src/txm_byte_pool_performance_system_info_get.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common_modules/module_lib/src/txm_byte_pool_prioritize.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common_modules/module_lib/src/txm_byte_release.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common_modules/module_lib/src/txm_event_flags_create.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common_modules/module_lib/src/txm_event_flags_delete.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common_modules/module_lib/src/txm_event_flags_get.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common_modules/module_lib/src/txm_event_flags_info_get.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common_modules/module_lib/src/txm_event_flags_performance_info_get.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common_modules/module_lib/src/txm_event_flags_performance_system_info_get.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common_modules/module_lib/src/txm_event_flags_set.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common_modules/module_lib/src/txm_event_flags_set_notify.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common_modules/module_lib/src/txm_module_application_request.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common_modules/module_lib/src/txm_module_callback_request_thread_entry.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common_modules/module_lib/src/txm_module_object_allocate.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common_modules/module_lib/src/txm_module_object_deallocate.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common_modules/module_lib/src/txm_module_object_pointer_get.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common_modules/module_lib/src/txm_module_object_pointer_get_extended.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common_modules/module_lib/src/txm_module_thread_system_suspend.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common_modules/module_lib/src/txm_mutex_create.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common_modules/module_lib/src/txm_mutex_delete.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common_modules/module_lib/src/txm_mutex_get.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common_modules/module_lib/src/txm_mutex_info_get.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common_modules/module_lib/src/txm_mutex_performance_info_get.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common_modules/module_lib/src/txm_mutex_performance_system_info_get.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common_modules/module_lib/src/txm_mutex_prioritize.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common_modules/module_lib/src/txm_mutex_put.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common_modules/module_lib/src/txm_queue_create.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common_modules/module_lib/src/txm_queue_delete.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common_modules/module_lib/src/txm_queue_flush.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common_modules/module_lib/src/txm_queue_front_send.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common_modules/module_lib/src/txm_queue_info_get.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common_modules/module_lib/src/txm_queue_performance_info_get.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common_modules/module_lib/src/txm_queue_performance_system_info_get.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common_modules/module_lib/src/txm_queue_prioritize.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common_modules/module_lib/src/txm_queue_receive.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common_modules/module_lib/src/txm_queue_send.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common_modules/module_lib/src/txm_queue_send_notify.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common_modules/module_lib/src/txm_semaphore_ceiling_put.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common_modules/module_lib/src/txm_semaphore_create.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common_modules/module_lib/src/txm_semaphore_delete.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common_modules/module_lib/src/txm_semaphore_get.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common_modules/module_lib/src/txm_semaphore_info_get.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common_modules/module_lib/src/txm_semaphore_performance_info_get.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common_modules/module_lib/src/txm_semaphore_performance_system_info_get.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common_modules/module_lib/src/txm_semaphore_prioritize.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common_modules/module_lib/src/txm_semaphore_put.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common_modules/module_lib/src/txm_semaphore_put_notify.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common_modules/module_lib/src/txm_thread_create.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common_modules/module_lib/src/txm_thread_delete.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common_modules/module_lib/src/txm_thread_entry_exit_notify.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common_modules/module_lib/src/txm_thread_identify.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common_modules/module_lib/src/txm_thread_info_get.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common_modules/module_lib/src/txm_thread_interrupt_control.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common_modules/module_lib/src/txm_thread_performance_info_get.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common_modules/module_lib/src/txm_thread_performance_system_info_get.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common_modules/module_lib/src/txm_thread_preemption_change.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common_modules/module_lib/src/txm_thread_priority_change.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common_modules/module_lib/src/txm_thread_relinquish.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common_modules/module_lib/src/txm_thread_reset.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common_modules/module_lib/src/txm_thread_resume.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common_modules/module_lib/src/txm_thread_sleep.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common_modules/module_lib/src/txm_thread_stack_error_notify.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common_modules/module_lib/src/txm_thread_suspend.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common_modules/module_lib/src/txm_thread_terminate.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common_modules/module_lib/src/txm_thread_time_slice_change.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common_modules/module_lib/src/txm_thread_wait_abort.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common_modules/module_lib/src/txm_time_get.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common_modules/module_lib/src/txm_time_set.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common_modules/module_lib/src/txm_timer_activate.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common_modules/module_lib/src/txm_timer_change.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common_modules/module_lib/src/txm_timer_create.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common_modules/module_lib/src/txm_timer_deactivate.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common_modules/module_lib/src/txm_timer_delete.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common_modules/module_lib/src/txm_timer_info_get.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common_modules/module_lib/src/txm_timer_performance_info_get.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common_modules/module_lib/src/txm_timer_performance_system_info_get.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common_modules/module_lib/src/txm_trace_buffer_full_notify.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common_modules/module_lib/src/txm_trace_disable.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common_modules/module_lib/src/txm_trace_enable.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common_modules/module_lib/src/txm_trace_event_filter.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common_modules/module_lib/src/txm_trace_event_unfilter.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common_modules/module_lib/src/txm_trace_interrupt_control.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common_modules/module_lib/src/txm_trace_isr_enter_insert.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common_modules/module_lib/src/txm_trace_isr_exit_insert.c
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common_modules/module_lib/src/txm_trace_user_event_insert.c
)

if(CONFIG_TOOLCHAIN STREQUAL mcux AND CONFIG_CORE STREQUAL cm7f)
  target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
      ${CMAKE_CURRENT_LIST_DIR}/./threadx/ports_module/cortex_m7/gnu/module_lib/src/txm_module_thread_shell_entry.c
  )
endif()

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/inc
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common_modules/inc
)

if(CONFIG_TOOLCHAIN STREQUAL mcux AND CONFIG_CORE STREQUAL cm7f)
target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/ports_module/cortex_m7/gnu/inc
)
endif()

if(CONFIG_USE_COMPONENT_CONFIGURATION)
  message("===>Import configuration from ${CMAKE_CURRENT_LIST_FILE}")

  target_compile_definitions(${MCUX_SDK_PROJECT_NAME} PUBLIC
    -DTX_INCLUDE_USER_DEFINE_FILE
  )

endif()


endif()


if (CONFIG_USE_middleware_azure_rtos_fx_template)
# Add set(CONFIG_USE_middleware_azure_rtos_fx_template true) in config.cmake to use this component

message("middleware_azure_rtos_fx_template component is included from ${CMAKE_CURRENT_LIST_FILE}.")

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/inc
)

if((CONFIG_TOOLCHAIN STREQUAL mcux OR CONFIG_TOOLCHAIN STREQUAL armgcc) AND CONFIG_CORE STREQUAL cm7f)
target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/./filex/ports/cortex_m7/gnu/inc
)
endif()

if((CONFIG_TOOLCHAIN STREQUAL armgcc OR CONFIG_TOOLCHAIN STREQUAL mcux) AND CONFIG_CORE STREQUAL cm33)
target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/./filex/ports/cortex_m33/gnu/inc
)
endif()

if(CONFIG_USE_COMPONENT_CONFIGURATION)
  message("===>Import configuration from ${CMAKE_CURRENT_LIST_FILE}")

  target_compile_definitions(${MCUX_SDK_PROJECT_NAME} PUBLIC
    -DFX_INCLUDE_USER_DEFINE_FILE
  )

  if(CONFIG_TOOLCHAIN STREQUAL armgcc)
    target_compile_options(${MCUX_SDK_PROJECT_NAME} PUBLIC
    )
  endif()

endif()


endif()


if (CONFIG_USE_middleware_azure_rtos_fx_lib)
# Add set(CONFIG_USE_middleware_azure_rtos_fx_lib true) in config.cmake to use this component

message("middleware_azure_rtos_fx_lib component is included from ${CMAKE_CURRENT_LIST_FILE}.")

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fx_directory_attributes_read.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fx_directory_attributes_set.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fx_directory_create.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fx_directory_default_get.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fx_directory_default_get_copy.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fx_directory_default_set.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fx_directory_delete.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fx_directory_entry_read.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fx_directory_entry_write.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fx_directory_exFAT_entry_read.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fx_directory_exFAT_entry_write.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fx_directory_exFAT_free_search.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fx_directory_exFAT_unicode_entry_write.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fx_directory_first_entry_find.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fx_directory_first_full_entry_find.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fx_directory_free_search.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fx_directory_information_get.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fx_directory_local_path_clear.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fx_directory_local_path_get.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fx_directory_local_path_get_copy.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fx_directory_local_path_restore.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fx_directory_local_path_set.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fx_directory_long_name_get.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fx_directory_long_name_get_extended.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fx_directory_name_extract.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fx_directory_name_test.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fx_directory_next_entry_find.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fx_directory_next_full_entry_find.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fx_directory_rename.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fx_directory_search.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fx_directory_short_name_get.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fx_directory_short_name_get_extended.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fx_fault_tolerant_add_FAT_log.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fx_fault_tolerant_add_bitmap_log.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fx_fault_tolerant_add_checksum_log.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fx_fault_tolerant_add_dir_log.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fx_fault_tolerant_apply_logs.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fx_fault_tolerant_calculate_checksum.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fx_fault_tolerant_cleanup_FAT_chain.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fx_fault_tolerant_create_log_file.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fx_fault_tolerant_enable.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fx_fault_tolerant_read_FAT.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fx_fault_tolerant_read_directory_sector.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fx_fault_tolerant_read_log_file.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fx_fault_tolerant_recover.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fx_fault_tolerant_reset_log_file.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fx_fault_tolerant_set_FAT_chain.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fx_fault_tolerant_transaction_end.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fx_fault_tolerant_transaction_fail.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fx_fault_tolerant_transaction_start.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fx_fault_tolerant_write_log_file.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fx_file_allocate.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fx_file_attributes_read.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fx_file_attributes_set.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fx_file_best_effort_allocate.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fx_file_close.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fx_file_create.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fx_file_date_time_set.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fx_file_delete.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fx_file_extended_allocate.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fx_file_extended_best_effort_allocate.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fx_file_extended_relative_seek.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fx_file_extended_seek.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fx_file_extended_truncate.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fx_file_extended_truncate_release.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fx_file_open.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fx_file_read.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fx_file_relative_seek.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fx_file_rename.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fx_file_seek.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fx_file_truncate.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fx_file_truncate_release.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fx_file_write.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fx_file_write_notify_set.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fx_media_abort.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fx_media_boot_info_extract.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fx_media_cache_invalidate.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fx_media_check.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fx_media_check_FAT_chain_check.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fx_media_check_lost_cluster_check.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fx_media_close.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fx_media_close_notify_set.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fx_media_exFAT_format.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fx_media_extended_space_available.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fx_media_flush.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fx_media_format.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fx_media_format_oem_name_set.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fx_media_format_type_set.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fx_media_format_volume_id_set.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fx_media_open.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fx_media_open_notify_set.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fx_media_read.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fx_media_space_available.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fx_media_volume_get.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fx_media_volume_get_extended.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fx_media_volume_set.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fx_media_write.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fx_partition_offset_calculate.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fx_ram_driver.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fx_system_date_get.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fx_system_date_set.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fx_system_initialize.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fx_system_time_get.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fx_system_time_set.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fx_system_timer_entry.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fx_trace_event_insert.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fx_trace_event_update.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fx_trace_object_register.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fx_trace_object_unregister.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fx_unicode_directory_create.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fx_unicode_directory_entry_change.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fx_unicode_directory_entry_read.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fx_unicode_directory_rename.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fx_unicode_directory_search.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fx_unicode_file_create.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fx_unicode_file_rename.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fx_unicode_length_get.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fx_unicode_length_get_extended.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fx_unicode_name_get.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fx_unicode_name_get_extended.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fx_unicode_short_name_get.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fx_unicode_short_name_get_extended.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fx_utility_16_unsigned_read.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fx_utility_16_unsigned_write.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fx_utility_32_unsigned_read.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fx_utility_32_unsigned_write.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fx_utility_64_unsigned_read.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fx_utility_64_unsigned_write.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fx_utility_FAT_entry_read.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fx_utility_FAT_entry_write.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fx_utility_FAT_flush.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fx_utility_FAT_map_flush.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fx_utility_FAT_sector_get.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fx_utility_absolute_path_get.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fx_utility_exFAT_allocate_new_cluster.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fx_utility_exFAT_bitmap_cache_prepare.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fx_utility_exFAT_bitmap_cache_update.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fx_utility_exFAT_bitmap_flush.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fx_utility_exFAT_bitmap_free_cluster_find.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fx_utility_exFAT_bitmap_initialize.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fx_utility_exFAT_bitmap_start_sector_get.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fx_utility_exFAT_cluster_free.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fx_utility_exFAT_cluster_state_get.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fx_utility_exFAT_cluster_state_set.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fx_utility_exFAT_geometry_check.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fx_utility_exFAT_name_hash_get.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fx_utility_exFAT_size_calculate.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fx_utility_exFAT_system_area_checksum_verify.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fx_utility_exFAT_system_area_checksum_write.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fx_utility_exFAT_system_area_format.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fx_utility_exFAT_system_sector_write.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fx_utility_exFAT_unicode_name_hash_get.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fx_utility_exFAT_upcase_table.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fx_utility_logical_sector_cache_entry_read.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fx_utility_logical_sector_flush.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fx_utility_logical_sector_read.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fx_utility_logical_sector_write.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fx_utility_memory_copy.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fx_utility_memory_set.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fx_utility_string_length_get.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fx_utility_token_length_get.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fxe_directory_attributes_read.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fxe_directory_attributes_set.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fxe_directory_create.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fxe_directory_default_get.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fxe_directory_default_get_copy.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fxe_directory_default_set.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fxe_directory_delete.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fxe_directory_first_entry_find.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fxe_directory_first_full_entry_find.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fxe_directory_information_get.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fxe_directory_local_path_clear.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fxe_directory_local_path_get.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fxe_directory_local_path_get_copy.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fxe_directory_local_path_restore.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fxe_directory_local_path_set.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fxe_directory_long_name_get.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fxe_directory_long_name_get_extended.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fxe_directory_name_test.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fxe_directory_next_entry_find.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fxe_directory_next_full_entry_find.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fxe_directory_rename.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fxe_directory_short_name_get.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fxe_directory_short_name_get_extended.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fxe_fault_tolerant_enable.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fxe_file_allocate.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fxe_file_attributes_read.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fxe_file_attributes_set.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fxe_file_best_effort_allocate.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fxe_file_close.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fxe_file_create.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fxe_file_date_time_set.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fxe_file_delete.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fxe_file_extended_allocate.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fxe_file_extended_best_effort_allocate.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fxe_file_extended_relative_seek.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fxe_file_extended_seek.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fxe_file_extended_truncate.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fxe_file_extended_truncate_release.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fxe_file_open.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fxe_file_read.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fxe_file_relative_seek.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fxe_file_rename.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fxe_file_seek.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fxe_file_truncate.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fxe_file_truncate_release.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fxe_file_write.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fxe_file_write_notify_set.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fxe_media_abort.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fxe_media_cache_invalidate.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fxe_media_check.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fxe_media_close.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fxe_media_close_notify_set.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fxe_media_exFAT_format.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fxe_media_extended_space_available.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fxe_media_flush.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fxe_media_format.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fxe_media_open.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fxe_media_open_notify_set.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fxe_media_read.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fxe_media_space_available.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fxe_media_volume_get.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fxe_media_volume_get_extended.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fxe_media_volume_set.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fxe_media_write.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fxe_system_date_get.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fxe_system_date_set.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fxe_system_time_get.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fxe_system_time_set.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fxe_unicode_directory_create.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fxe_unicode_directory_rename.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fxe_unicode_file_create.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fxe_unicode_file_rename.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fxe_unicode_name_get.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fxe_unicode_name_get_extended.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fxe_unicode_short_name_get.c
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/src/fxe_unicode_short_name_get_extended.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/inc
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/inc
)

if(CONFIG_TOOLCHAIN STREQUAL mcux AND CONFIG_CORE STREQUAL cm7f)
target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/ports/cortex_m7/gnu/inc
)
endif()

if(CONFIG_TOOLCHAIN STREQUAL mcux AND CONFIG_CORE STREQUAL cm4f)
target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/ports/cortex_m4/gnu/inc
)
endif()

if((CONFIG_TOOLCHAIN STREQUAL mcux OR CONFIG_TOOLCHAIN STREQUAL armgcc) AND CONFIG_CORE STREQUAL cm33)
target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/ports/cortex_m33/gnu/inc
  ${CMAKE_CURRENT_LIST_DIR}/./filex/ports/cortex_m33/gnu/inc
)
endif()

if((CONFIG_TOOLCHAIN STREQUAL mcux OR CONFIG_TOOLCHAIN STREQUAL armgcc) AND CONFIG_CORE STREQUAL cm7f)
target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/./filex/ports/cortex_m7/gnu/inc
)
endif()

if((CONFIG_TOOLCHAIN STREQUAL mcux OR CONFIG_TOOLCHAIN STREQUAL armgcc) AND CONFIG_CORE STREQUAL cm4f)
target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/./filex/ports/cortex_m4/gnu/inc
)
endif()

if(CONFIG_USE_COMPONENT_CONFIGURATION)
  message("===>Import configuration from ${CMAKE_CURRENT_LIST_FILE}")

  target_compile_definitions(${MCUX_SDK_PROJECT_NAME} PUBLIC
    -DTX_INCLUDE_USER_DEFINE_FILE
    -DFX_INCLUDE_USER_DEFINE_FILE
  )

endif()


endif()


if (CONFIG_USE_middleware_azure_rtos_gx_lib)
# Add set(CONFIG_USE_middleware_azure_rtos_gx_lib true) in config.cmake to use this component

message("middleware_azure_rtos_gx_lib component is included from ${CMAKE_CURRENT_LIST_FILE}.")

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/gx_source.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_1555xrgb_canvas_blend.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_1555xrgb_jpeg_draw.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_1555xrgb_native_color_get.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_1555xrgb_pixel_blend.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_1555xrgb_pixelmap_rotate.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_1555xrgb_png_draw.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_1555xrgb_setup.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_16bpp_block_move.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_16bpp_canvas_copy.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_16bpp_horizontal_line_draw.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_16bpp_horizontal_pattern_line_draw.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_16bpp_mouse_capture.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_16bpp_mouse_restore.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_16bpp_pixel_write.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_16bpp_pixelmap_blend.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_16bpp_pixelmap_draw.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_16bpp_pixelmap_rotate.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_16bpp_rotated_block_move.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_16bpp_rotated_canvas_copy.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_16bpp_rotated_horizontal_line_draw.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_16bpp_rotated_horizontal_pattern_line_draw.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_16bpp_rotated_pixel_write.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_16bpp_rotated_pixelmap_blend.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_16bpp_rotated_pixelmap_draw.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_16bpp_rotated_pixelmap_rotate.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_16bpp_rotated_simple_line_draw.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_16bpp_rotated_vertical_line_draw.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_16bpp_rotated_vertical_pattern_line_draw.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_16bpp_row_pitch_get.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_16bpp_simple_line_draw.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_16bpp_vertical_line_draw.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_16bpp_vertical_pattern_line_draw.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_1bpp_block_move.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_1bpp_canvas_copy.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_1bpp_glyph_1bpp_draw.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_1bpp_horizontal_line_draw.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_1bpp_horizontal_pattern_line_draw.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_1bpp_horizontal_pixelmap_line_draw.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_1bpp_mouse_capture.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_1bpp_mouse_restore.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_1bpp_native_color_get.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_1bpp_pixel_write.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_1bpp_pixelmap_draw.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_1bpp_pixelmap_rotate.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_1bpp_row_pitch_get.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_1bpp_simple_line_draw.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_1bpp_vertical_line_draw.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_1bpp_vertical_pattern_line_draw.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_24xrgb_canvas_blend.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_24xrgb_jpeg_draw.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_24xrgb_mouse_capture.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_24xrgb_mouse_restore.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_24xrgb_native_color_get.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_24xrgb_pixel_blend.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_24xrgb_pixelmap_blend.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_24xrgb_png_draw.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_24xrgb_rotated_canvas_blend.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_24xrgb_rotated_jpeg_draw.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_24xrgb_rotated_pixel_blend.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_24xrgb_rotated_png_draw.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_24xrgb_rotated_setup.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_24xrgb_setup.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_32argb_native_color_get.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_32argb_pixel_blend.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_32argb_pixelmap_blend.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_32argb_pixelmap_draw.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_32argb_rotated_pixel_blend.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_32argb_rotated_setup.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_32argb_setup.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_32bpp_block_move.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_32bpp_canvas_copy.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_32bpp_glyph_1bit_draw.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_32bpp_horizontal_line_draw.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_32bpp_horizontal_pattern_line_draw.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_32bpp_horizontal_pixelmap_line_draw.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_32bpp_pixel_write.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_32bpp_pixelmap_draw.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_32bpp_pixelmap_rotate.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_32bpp_rotated_block_move.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_32bpp_rotated_canvas_copy.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_32bpp_rotated_glyph_1bit_draw.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_32bpp_rotated_horizontal_line_draw.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_32bpp_rotated_horizontal_pattern_line_draw.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_32bpp_rotated_horizontal_pixelmap_line_draw.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_32bpp_rotated_pixel_write.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_32bpp_rotated_pixelmap_blend.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_32bpp_rotated_pixelmap_draw.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_32bpp_rotated_pixelmap_rotate.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_32bpp_rotated_simple_line_draw.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_32bpp_rotated_vertical_line_draw.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_32bpp_rotated_vertical_pattern_line_draw.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_32bpp_row_pitch_get.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_32bpp_simple_line_draw.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_32bpp_vertical_line_draw.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_32bpp_vertical_pattern_line_draw.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_332rgb_native_color_get.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_332rgb_pixel_blend.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_332rgb_pixelmap_draw.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_332rgb_pixelmap_rotate.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_332rgb_setup.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_4444argb_canvas_blend.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_4444argb_horizontal_pixelmap_line_draw.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_4444argb_native_color_get.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_4444argb_pixel_blend.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_4444argb_pixelmap_draw.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_4444argb_pixelmap_rotate.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_4444argb_setup.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_4bpp_block_move.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_4bpp_canvas_copy.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_4bpp_glyph_1bit_draw.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_4bpp_glyph_4bit_draw.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_4bpp_grayscale_setup.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_4bpp_horizontal_line_draw.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_4bpp_horizontal_pattern_line_draw.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_4bpp_horizontal_pixelmap_line_draw.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_4bpp_mouse_capture.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_4bpp_mouse_restore.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_4bpp_native_color_get.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_4bpp_pixel_write.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_4bpp_pixelmap_draw.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_4bpp_pixelmap_rotate.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_4bpp_row_pitch_get.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_4bpp_simple_line_draw.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_4bpp_vertical_line_draw.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_4bpp_vertical_pattern_line_draw.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_565rgb_canvas_blend.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_565rgb_glyph_1bit_draw.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_565rgb_horizontal_pixelmap_line_draw.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_565rgb_jpeg_draw.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_565rgb_native_color_get.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_565rgb_pixel_blend.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_565rgb_png_draw.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_565rgb_rotated_canvas_blend.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_565rgb_rotated_glyph_1bit_draw.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_565rgb_rotated_horizontal_pixelmap_line_draw.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_565rgb_rotated_jpeg_draw.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_565rgb_rotated_pixel_blend.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_565rgb_rotated_png_draw.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_565rgb_rotated_setup.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_565rgb_setup.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_8bit_palette_native_color_get.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_8bit_palette_rotated_setup.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_8bit_palette_setup.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_8bpp_block_move.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_8bpp_canvas_copy.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_8bpp_glyph_1bit_draw.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_8bpp_glyph_3bit_draw.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_8bpp_glyph_4bit_draw.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_8bpp_horizontal_line_draw.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_8bpp_horizontal_pattern_line_draw.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_8bpp_horizontal_pixelmap_line_draw.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_8bpp_mouse_capture.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_8bpp_mouse_restore.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_8bpp_pixel_write.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_8bpp_pixelmap_blend.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_8bpp_pixelmap_draw.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_8bpp_pixelmap_rotate.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_8bpp_rotated_block_move.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_8bpp_rotated_canvas_copy.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_8bpp_rotated_glyph_1bit_draw.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_8bpp_rotated_glyph_3bit_draw.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_8bpp_rotated_glyph_4bit_draw.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_8bpp_rotated_horizontal_line_draw.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_8bpp_rotated_horizontal_pattern_line_draw.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_8bpp_rotated_horizontal_pixelmap_line_draw.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_8bpp_rotated_pixel_write.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_8bpp_rotated_pixelmap_draw.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_8bpp_rotated_pixelmap_rotate.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_8bpp_rotated_simple_line_draw.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_8bpp_rotated_vertical_line_draw.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_8bpp_rotated_vertical_pattern_line_draw.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_8bpp_row_pitch_get.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_8bpp_simple_line_draw.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_8bpp_vertical_line_draw.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_8bpp_vertical_pattern_line_draw.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_arc_clipping_get.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_generic_aliased_arc_draw.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_generic_aliased_circle_draw.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_generic_aliased_ellipse_draw.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_generic_aliased_filled_circle_draw.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_generic_aliased_fixed_point_line_draw.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_generic_aliased_line_draw.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_generic_aliased_wide_arc_draw.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_generic_aliased_wide_circle_draw.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_generic_aliased_wide_ellipse_draw.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_generic_aliased_wide_line_draw.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_generic_alphamap_draw.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_generic_arc_draw.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_generic_arc_fill.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_generic_circle_draw.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_generic_circle_fill.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_generic_drawing_complete.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_generic_drawing_initiate.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_generic_ellipse_draw.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_generic_ellipse_fill.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_generic_filled_circle_draw.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_generic_glyph_4bpp_draw.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_generic_glyph_8bpp_draw.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_generic_mouse_cursor_define.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_generic_mouse_draw.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_generic_mouse_enable.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_generic_mouse_position_set.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_generic_pie_fill.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_generic_polygon_draw.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_generic_polygon_fill.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_generic_rotated_alphamap_draw.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_generic_rotated_arc_fill.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_generic_rotated_circle_fill.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_generic_rotated_ellipse_fill.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_generic_rotated_glyph_4bit_draw.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_generic_rotated_glyph_8bit_draw.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_generic_rotated_pie_fill.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_generic_rotated_polygon_fill.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_generic_rotated_wide_line_fill.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_generic_simple_pie_fill.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_generic_simple_wide_line_draw.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_generic_wide_arc_draw.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_generic_wide_circle_draw.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_generic_wide_ellipse_draw.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_generic_wide_line_fill.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_generic_wide_line_points_calculate.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_horizontal_line_alpha_draw.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_monochrome_setup.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_simple_line_alpha_draw.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_display_driver_vertical_line_alpha_draw.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_system_font_4bpp.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_system_font_8bpp.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_system_font_mono.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_system_initialize.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_utility_1555xrgb_pixelmap_resize.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_utility_1555xrgb_pixelmap_rotate.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_utility_16bpp_pixelmap_resize.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_utility_1bpp_pixelmap_resize.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_utility_1bpp_pixelmap_rotate.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_utility_32argb_pixelmap_resize.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_utility_32argb_pixelmap_rotate.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_utility_332rgb_pixelmap_rotate.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_utility_4444argb_pixelmap_resize.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_utility_4444argb_pixelmap_rotate.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_utility_4bpp_pixelmap_resize.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_utility_4bpp_pixelmap_rotate.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_utility_565rgb_pixelmap_rotate.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_utility_8bpp_pixelmap_resize.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_utility_8bpp_pixelmap_rotate.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_utility_alphamap_create.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_utility_bidi_arabic_shaping.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_utility_bidi_bracket_pair_get.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_utility_bidi_character_type_get.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_utility_bidi_mirroring_get.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_utility_bidi_paragraph_reorder.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_utility_bidi_resolved_text_info_delete.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_utility_canvas_to_bmp.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_utility_circle_point_get.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_utility_easing_function_calculate.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_utility_gradient_create.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_utility_gradient_delete.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_utility_ltoa.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_utility_math_acos.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_utility_math_asin.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_utility_math_cos.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_utility_math_sin.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_utility_math_sqrt.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_utility_pixelmap_resize.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_utility_pixelmap_rotate.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_utility_pixelmap_simple_rotate.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_utility_rectangle_center.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_utility_rectangle_center_find.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_utility_rectangle_combine.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_utility_rectangle_compare.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_utility_rectangle_define.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_utility_rectangle_inside_detect.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_utility_rectangle_overlap_detect.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_utility_rectangle_point_detect.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_utility_rectangle_resize.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_utility_rectangle_shift.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_utility_string_compare.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_utility_string_length_check.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_utility_string_to_alphamap.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_utility_thai_glyph_shaping.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_utility_unicode_to_utf8.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_utility_utf8_string_backward_character_length_get.c
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/src/gx_utility_utf8_string_character_get.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/inc
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/inc
)

if(CONFIG_TOOLCHAIN STREQUAL mcux AND CONFIG_CORE STREQUAL cm7f)
target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/ports/cortex_m7/gnu/inc
  ${CMAKE_CURRENT_LIST_DIR}/./guix/ports/cortex_m7/gnu/inc
)
endif()

if(CONFIG_USE_COMPONENT_CONFIGURATION)
  message("===>Import configuration from ${CMAKE_CURRENT_LIST_FILE}")

  target_compile_definitions(${MCUX_SDK_PROJECT_NAME} PUBLIC
    -DTX_INCLUDE_USER_DEFINE_FILE
    -DGX_INCLUDE_USER_DEFINE_FILE
  )

endif()


endif()


if (CONFIG_USE_middleware_azure_rtos_nxd_template)
# Add set(CONFIG_USE_middleware_azure_rtos_nxd_template true) in config.cmake to use this component

message("middleware_azure_rtos_nxd_template component is included from ${CMAKE_CURRENT_LIST_FILE}.")

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/addons/auto_ip/nx_auto_ip.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/addons/cloud/nx_cloud.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/addons/dhcp/nxd_dhcp_client.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/addons/dhcp/nxd_dhcp_server.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/addons/dhcp/nxd_dhcpv6_client.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/addons/dhcp/nxd_dhcpv6_server.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/addons/dns/nxd_dns.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/addons/ftp/nxd_ftp_client.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/addons/ftp/nxd_ftp_server.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/addons/http/nxd_http_client.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/addons/http/nxd_http_server.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/addons/lwm2m/nx_lwm2m_client.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/addons/mdns/nxd_mdns.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/addons/mqtt/nxd_mqtt_client.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/addons/nat/nx_nat.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/addons/pop3/nxd_pop3_client.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/addons/ppp/nx_ppp.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/addons/pppoe/nx_pppoe_client.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/addons/pppoe/nx_pppoe_server.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/addons/ptp/nxd_ptp_client.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/addons/smtp/nxd_smtp_client.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/addons/snmp/nx_des.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/addons/snmp/nx_sha1.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/addons/snmp/nxd_snmp.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/addons/sntp/nxd_sntp_client.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/addons/telnet/nxd_telnet_client.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/addons/telnet/nxd_telnet_server.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/addons/tftp/nxd_tftp_client.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/addons/tftp/nxd_tftp_server.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/addons/web/nx_tcpserver.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/addons/web/nx_web_http_client.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/addons/web/nx_web_http_server.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/addons/websocket/nx_websocket_client.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/addons/auto_ip
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/addons/cloud
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/addons/BSD
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/addons/dhcp
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/addons/dns
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/addons/ftp
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/addons/http
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/addons/lwm2m
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/addons/mdns
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/addons/mqtt
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/addons/nat
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/addons/pop3
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/addons/ppp
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/addons/pppoe
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/addons/ptp
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/addons/smtp
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/addons/snmp
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/addons/sntp
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/addons/telnet
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/addons/tftp
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/addons/web
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/addons/websocket
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/common/inc
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/crypto_libraries/inc
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/inc
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/ports
)

if((CONFIG_TOOLCHAIN STREQUAL armgcc OR CONFIG_TOOLCHAIN STREQUAL mcux) AND CONFIG_CORE STREQUAL cm7f)
target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/ports/cortex_m7/gnu/inc
)
endif()

if((CONFIG_TOOLCHAIN STREQUAL armgcc OR CONFIG_TOOLCHAIN STREQUAL mcux) AND CONFIG_CORE STREQUAL cm33)
target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/ports/cortex_m33/gnu/inc
)
endif()

if(CONFIG_USE_COMPONENT_CONFIGURATION)
  message("===>Import configuration from ${CMAKE_CURRENT_LIST_FILE}")

  target_compile_definitions(${MCUX_SDK_PROJECT_NAME} PUBLIC
    -DNX_INCLUDE_USER_DEFINE_FILE
  )

  if(CONFIG_TOOLCHAIN STREQUAL armgcc)
    target_compile_options(${MCUX_SDK_PROJECT_NAME} PUBLIC
    )
  endif()

endif()


endif()


if (CONFIG_USE_middleware_azure_rtos_nxd_lib)
# Add set(CONFIG_USE_middleware_azure_rtos_nxd_lib true) in config.cmake to use this component

message("middleware_azure_rtos_nxd_lib component is included from ${CMAKE_CURRENT_LIST_FILE}.")

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/common/netxduo_common_source.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/common/src/nx_ip_initialize.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/common/src/nx_packet_pool_initialize.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/common/src/nx_ram_network_driver.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/common/src/nx_system_initialize.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/common/src/nx_tcp_initialize.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/crypto_libraries/src/nx_crypto_3des.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/crypto_libraries/src/nx_crypto_aes.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/crypto_libraries/src/nx_crypto_cbc.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/crypto_libraries/src/nx_crypto_ccm.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/crypto_libraries/src/nx_crypto_ctr.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/crypto_libraries/src/nx_crypto_des.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/crypto_libraries/src/nx_crypto_dh.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/crypto_libraries/src/nx_crypto_drbg.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/crypto_libraries/src/nx_crypto_ec.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/crypto_libraries/src/nx_crypto_ec_secp192r1_fixed_points.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/crypto_libraries/src/nx_crypto_ec_secp224r1_fixed_points.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/crypto_libraries/src/nx_crypto_ec_secp256r1_fixed_points.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/crypto_libraries/src/nx_crypto_ec_secp384r1_fixed_points.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/crypto_libraries/src/nx_crypto_ec_secp521r1_fixed_points.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/crypto_libraries/src/nx_crypto_ecdh.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/crypto_libraries/src/nx_crypto_ecdsa.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/crypto_libraries/src/nx_crypto_ecjpake.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/crypto_libraries/src/nx_crypto_gcm.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/crypto_libraries/src/nx_crypto_generic_ciphersuites.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/crypto_libraries/src/nx_crypto_hkdf.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/crypto_libraries/src/nx_crypto_hmac.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/crypto_libraries/src/nx_crypto_hmac_md5.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/crypto_libraries/src/nx_crypto_hmac_sha1.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/crypto_libraries/src/nx_crypto_hmac_sha2.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/crypto_libraries/src/nx_crypto_hmac_sha5.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/crypto_libraries/src/nx_crypto_huge_number.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/crypto_libraries/src/nx_crypto_huge_number_extended.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/crypto_libraries/src/nx_crypto_initialize.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/crypto_libraries/src/nx_crypto_md5.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/crypto_libraries/src/nx_crypto_method_self_test.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/crypto_libraries/src/nx_crypto_method_self_test_3des.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/crypto_libraries/src/nx_crypto_method_self_test_aes.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/crypto_libraries/src/nx_crypto_method_self_test_des.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/crypto_libraries/src/nx_crypto_method_self_test_drbg.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/crypto_libraries/src/nx_crypto_method_self_test_ecdh.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/crypto_libraries/src/nx_crypto_method_self_test_ecdsa.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/crypto_libraries/src/nx_crypto_method_self_test_hmac_md5.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/crypto_libraries/src/nx_crypto_method_self_test_hmac_sha.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/crypto_libraries/src/nx_crypto_method_self_test_md5.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/crypto_libraries/src/nx_crypto_method_self_test_pkcs1.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/crypto_libraries/src/nx_crypto_method_self_test_prf.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/crypto_libraries/src/nx_crypto_method_self_test_rsa.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/crypto_libraries/src/nx_crypto_method_self_test_sha.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/crypto_libraries/src/nx_crypto_methods.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/crypto_libraries/src/nx_crypto_null_cipher.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/crypto_libraries/src/nx_crypto_phash.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/crypto_libraries/src/nx_crypto_pkcs1_v1.5.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/crypto_libraries/src/nx_crypto_rsa.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/crypto_libraries/src/nx_crypto_sha1.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/crypto_libraries/src/nx_crypto_sha2.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/crypto_libraries/src/nx_crypto_sha5.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/crypto_libraries/src/nx_crypto_tls_prf_1.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/crypto_libraries/src/nx_crypto_tls_prf_sha256.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/crypto_libraries/src/nx_crypto_tls_prf_sha384.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/crypto_libraries/src/nx_crypto_tls_prf_sha512.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/crypto_libraries/src/nx_crypto_xcbc_mac.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_crypto_method_self_test_3des.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_crypto_method_self_test_aes.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_crypto_method_self_test_des.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_crypto_method_self_test_hmac_md5.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_crypto_method_self_test_hmac_sha.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_crypto_method_self_test_md5.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_crypto_method_self_test_prf.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_crypto_method_self_test_rsa.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_crypto_method_self_test_sha.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_crypto_rng_self_test.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_crypto_table_self_test.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_dtls_allocate_handshake_packet.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_dtls_client_handshake.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_dtls_client_protocol_version_override.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_dtls_client_session_start.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_dtls_ecc_initialize.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_dtls_hash_record.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_dtls_initialize.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_dtls_packet_allocate.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_dtls_process_clienthello.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_dtls_process_handshake_header.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_dtls_process_header.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_dtls_process_helloverifyrequest.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_dtls_process_record.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_dtls_psk_add.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_dtls_receive_callback.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_dtls_retransmit.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_dtls_retransmit_queue_flush.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_dtls_send_clienthello.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_dtls_send_handshake_record.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_dtls_send_helloverifyrequest.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_dtls_send_record.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_dtls_send_serverhello.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_dtls_server_create.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_dtls_server_delete.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_dtls_server_ecc_initialize.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_dtls_server_handshake.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_dtls_server_local_certificate_add.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_dtls_server_local_certificate_remove.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_dtls_server_notify_set.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_dtls_server_protocol_version_override.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_dtls_server_psk_add.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_dtls_server_session_send.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_dtls_server_session_start.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_dtls_server_start.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_dtls_server_stop.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_dtls_server_trusted_certificate_add.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_dtls_server_trusted_certificate_remove.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_dtls_server_x509_client_verify_configure.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_dtls_server_x509_client_verify_disable.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_dtls_session_cache.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_dtls_session_client_info_get.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_dtls_session_create.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_dtls_session_delete.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_dtls_session_end.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_dtls_session_local_certificate_add.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_dtls_session_local_certificate_remove.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_dtls_session_receive.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_dtls_session_reset.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_dtls_session_send.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_dtls_session_sliding_window_check.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_dtls_session_sliding_window_update.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_dtls_session_start.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_dtls_session_trusted_certificate_add.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_dtls_session_trusted_certificate_remove.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_dtls_verify_mac.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_generate_client_key_exchange.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_generate_master_secret.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_generate_premaster_secret.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_generate_server_key_exchange.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_generate_session_keys.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_module_hash_compute.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_process_client_key_exchange.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_process_server_key_exchange.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_remote_certificate_verify.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_session_keys_set.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_tls_1_3_client_handshake.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_tls_1_3_crypto_init.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_tls_1_3_finished_hash_generate.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_tls_1_3_generate_keys.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_tls_1_3_server_handshake.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_tls_1_3_session_keys_set.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_tls_1_3_transcript_hash_save.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_tls_active_certificate_set.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_tls_allocate_handshake_packet.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_tls_check_protocol_version.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_tls_ciphersuite_lookup.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_tls_client_handshake.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_tls_client_psk_set.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_tls_ecc_generate_keys.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_tls_ecc_initialize.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_tls_find_curve_method.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_tls_finished_hash_generate.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_tls_generate_keys.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_tls_generate_premaster_secret.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_tls_handshake_hash_init.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_tls_handshake_hash_update.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_tls_handshake_process.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_tls_hash_record.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_tls_initialize.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_tls_key_material_init.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_tls_local_certificate_add.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_tls_local_certificate_find.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_tls_local_certificate_remove.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_tls_map_error_to_alert.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_tls_metadata_size_calculate.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_tls_newest_supported_version.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_tls_packet_allocate.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_tls_packet_release.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_tls_process_certificate_request.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_tls_process_certificate_verify.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_tls_process_changecipherspec.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_tls_process_client_key_exchange.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_tls_process_clienthello.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_tls_process_clienthello_extensions.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_tls_process_encrypted_extensions.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_tls_process_finished.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_tls_process_handshake_header.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_tls_process_header.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_tls_process_newsessionticket.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_tls_process_record.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_tls_process_remote_certificate.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_tls_process_server_key_exchange.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_tls_process_serverhello.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_tls_process_serverhello_extensions.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_tls_protocol_version_get.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_tls_psk_add.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_tls_psk_binder_generate.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_tls_psk_find.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_tls_psk_identity_find.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_tls_record_hash_calculate.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_tls_record_hash_initialize.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_tls_record_hash_update.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_tls_record_payload_decrypt.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_tls_record_payload_encrypt.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_tls_remote_certificate_allocate.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_tls_remote_certificate_buffer_allocate.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_tls_remote_certificate_free.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_tls_remote_certificate_free_all.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_tls_remote_certificate_verify.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_tls_send_alert.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_tls_send_certificate.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_tls_send_certificate_request.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_tls_send_certificate_verify.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_tls_send_changecipherspec.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_tls_send_client_key_exchange.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_tls_send_clienthello.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_tls_send_clienthello_extensions.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_tls_send_encrypted_extensions.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_tls_send_finished.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_tls_send_handshake_record.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_tls_send_hellorequest.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_tls_send_newsessionticket.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_tls_send_record.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_tls_send_server_key_exchange.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_tls_send_serverhello.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_tls_send_serverhello_extensions.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_tls_server_certificate_add.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_tls_server_certificate_find.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_tls_server_certificate_remove.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_tls_server_handshake.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_tls_session_alert_value_get.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_tls_session_certificate_callback_set.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_tls_session_client_callback_set.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_tls_session_client_verify_disable.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_tls_session_client_verify_enable.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_tls_session_create.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_tls_session_create_ext.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_tls_session_delete.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_tls_session_end.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_tls_session_iv_size_get.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_tls_session_keys_set.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_tls_session_packet_buffer_set.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_tls_session_packet_pool_set.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_tls_session_protocol_version_override.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_tls_session_receive.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_tls_session_receive_records.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_tls_session_renegotiate.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_tls_session_renegotiate_callback_set.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_tls_session_reset.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_tls_session_send.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_tls_session_server_callback_set.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_tls_session_sni_extension_parse.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_tls_session_sni_extension_set.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_tls_session_start.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_tls_session_time_function_set.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_tls_session_x509_client_verify_configure.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_tls_shutdown.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_tls_trusted_certificate_add.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_tls_trusted_certificate_remove.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_tls_verify_mac.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_trusted_certificate_add.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_verify_mac.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_x509.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_x509_asn1_tlv_block_parse.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_x509_certificate_chain_verify.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_x509_certificate_initialize.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_x509_certificate_list_add.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_x509_certificate_list_find.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_x509_certificate_list_remove.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_x509_certificate_revocation_list_parse.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_x509_certificate_verify.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_x509_common_name_dns_check.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_x509_crl_revocation_check.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_x509_crl_verify.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_x509_distinguished_name_compare.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_x509_distinguished_name_parse.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_x509_dns_name_initialize.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_x509_ec_private_key_parse.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_x509_expiration_check.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_x509_extended_key_usage_extension_parse.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_x509_extension_find.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_x509_find_certificate_methods.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_x509_find_curve_method.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_x509_free_certificate_get.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_x509_key_usage_extension_parse.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_x509_local_certificate_find.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_x509_local_device_certificate_get.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_x509_oid_parse.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_x509_pkcs1_rsa_private_key_parse.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_x509_pkcs7_decode.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_x509_remote_endpoint_certificate_get.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_x509_store_certificate_add.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_x509_store_certificate_find.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_x509_store_certificate_remove.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_x509_subject_alt_names_find.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nx_secure_x509_wildcard_compare.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nxe_secure_dtls_client_protocol_version_override.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nxe_secure_dtls_client_session_start.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nxe_secure_dtls_ecc_initialize.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nxe_secure_dtls_packet_allocate.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nxe_secure_dtls_psk_add.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nxe_secure_dtls_server_create.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nxe_secure_dtls_server_delete.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nxe_secure_dtls_server_ecc_initialize.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nxe_secure_dtls_server_local_certificate_add.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nxe_secure_dtls_server_local_certificate_remove.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nxe_secure_dtls_server_notify_set.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nxe_secure_dtls_server_protocol_version_override.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nxe_secure_dtls_server_psk_add.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nxe_secure_dtls_server_session_send.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nxe_secure_dtls_server_session_start.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nxe_secure_dtls_server_start.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nxe_secure_dtls_server_stop.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nxe_secure_dtls_server_trusted_certificate_add.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nxe_secure_dtls_server_trusted_certificate_remove.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nxe_secure_dtls_server_x509_client_verify_configure.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nxe_secure_dtls_server_x509_client_verify_disable.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nxe_secure_dtls_session_client_info_get.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nxe_secure_dtls_session_create.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nxe_secure_dtls_session_delete.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nxe_secure_dtls_session_end.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nxe_secure_dtls_session_local_certificate_add.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nxe_secure_dtls_session_local_certificate_remove.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nxe_secure_dtls_session_receive.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nxe_secure_dtls_session_reset.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nxe_secure_dtls_session_send.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nxe_secure_dtls_session_start.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nxe_secure_dtls_session_trusted_certificate_add.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nxe_secure_dtls_session_trusted_certificate_remove.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nxe_secure_tls_active_certificate_set.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nxe_secure_tls_client_psk_set.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nxe_secure_tls_local_certificate_add.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nxe_secure_tls_local_certificate_find.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nxe_secure_tls_local_certificate_remove.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nxe_secure_tls_metadata_size_calculate.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nxe_secure_tls_packet_allocate.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nxe_secure_tls_psk_add.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nxe_secure_tls_remote_certificate_allocate.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nxe_secure_tls_remote_certificate_buffer_allocate.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nxe_secure_tls_remote_certificate_free_all.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nxe_secure_tls_server_certificate_add.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nxe_secure_tls_server_certificate_find.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nxe_secure_tls_server_certificate_remove.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nxe_secure_tls_session_alert_value_get.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nxe_secure_tls_session_certificate_callback_set.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nxe_secure_tls_session_client_callback_set.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nxe_secure_tls_session_client_verify_disable.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nxe_secure_tls_session_client_verify_enable.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nxe_secure_tls_session_create.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nxe_secure_tls_session_delete.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nxe_secure_tls_session_end.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nxe_secure_tls_session_packet_buffer_set.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nxe_secure_tls_session_packet_pool_set.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nxe_secure_tls_session_protocol_version_override.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nxe_secure_tls_session_receive.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nxe_secure_tls_session_renegotiate.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nxe_secure_tls_session_renegotiate_callback_set.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nxe_secure_tls_session_reset.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nxe_secure_tls_session_send.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nxe_secure_tls_session_server_callback_set.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nxe_secure_tls_session_sni_extension_parse.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nxe_secure_tls_session_sni_extension_set.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nxe_secure_tls_session_start.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nxe_secure_tls_session_time_function_set.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nxe_secure_tls_session_x509_client_verify_configure.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nxe_secure_tls_trusted_certificate_add.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nxe_secure_tls_trusted_certificate_remove.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nxe_secure_x509_certificate_initialize.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nxe_secure_x509_common_name_dns_check.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nxe_secure_x509_crl_revocation_check.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nxe_secure_x509_dns_name_initialize.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nxe_secure_x509_extended_key_usage_extension_parse.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nxe_secure_x509_extension_find.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/src/nxe_secure_x509_key_usage_extension_parse.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/inc
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/inc
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/common/inc
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/crypto_libraries/inc
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/inc
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/ports
)

if(CONFIG_TOOLCHAIN STREQUAL mcux AND CONFIG_CORE STREQUAL cm7f)
target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/ports/cortex_m7/gnu/inc
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/ports/cortex_m7/gnu/inc
)
endif()

if((CONFIG_TOOLCHAIN STREQUAL mcux OR CONFIG_TOOLCHAIN STREQUAL armgcc) AND CONFIG_CORE STREQUAL cm7f)
target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/./filex/ports/cortex_m7/gnu/inc
)
endif()

if((CONFIG_TOOLCHAIN STREQUAL mcux OR CONFIG_TOOLCHAIN STREQUAL armgcc) AND CONFIG_CORE STREQUAL cm33)
target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/./filex/ports/cortex_m33/gnu/inc
)
endif()

if(CONFIG_TOOLCHAIN STREQUAL mcux AND CONFIG_CORE STREQUAL cm33)
target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/ports/cortex_m33/gnu/inc
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/ports/cortex_m33/gnu/inc
)
endif()

if(CONFIG_USE_COMPONENT_CONFIGURATION)
  message("===>Import configuration from ${CMAKE_CURRENT_LIST_FILE}")

  target_compile_definitions(${MCUX_SDK_PROJECT_NAME} PUBLIC
    -DTX_INCLUDE_USER_DEFINE_FILE
    -DFX_INCLUDE_USER_DEFINE_FILE
    -DNX_INCLUDE_USER_DEFINE_FILE
  )

endif()


endif()


if (CONFIG_USE_middleware_azure_rtos_ux_template)
# Add set(CONFIG_USE_middleware_azure_rtos_ux_template true) in config.cmake to use this component

message("middleware_azure_rtos_ux_template component is included from ${CMAKE_CURRENT_LIST_FILE}.")

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/./usbx/common/core/inc
  ${CMAKE_CURRENT_LIST_DIR}/./usbx/common/usbx_device_classes/inc
  ${CMAKE_CURRENT_LIST_DIR}/./usbx/common/usbx_host_classes/inc
  ${CMAKE_CURRENT_LIST_DIR}/./usbx/common/usbx_network/inc
  ${CMAKE_CURRENT_LIST_DIR}/./usbx/common/usbx_pictbridge/inc
)

if((CONFIG_TOOLCHAIN STREQUAL armgcc OR CONFIG_TOOLCHAIN STREQUAL mcux) AND CONFIG_CORE STREQUAL cm7f)
target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/./usbx/ports/cortex_m7/gnu/inc
)
endif()

if(CONFIG_TOOLCHAIN STREQUAL mcux AND CONFIG_CORE STREQUAL cm33)
target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/./usbx/ports/cortex_m33/inc
)
endif()

if(CONFIG_USE_COMPONENT_CONFIGURATION)
  message("===>Import configuration from ${CMAKE_CURRENT_LIST_FILE}")

  target_compile_definitions(${MCUX_SDK_PROJECT_NAME} PUBLIC
    -DUX_OTG_SUPPORT
    -DUX_INCLUDE_USER_DEFINE_FILE
  )

  if(CONFIG_TOOLCHAIN STREQUAL armgcc)
    target_compile_options(${MCUX_SDK_PROJECT_NAME} PUBLIC
    )
  endif()

endif()


endif()


if (CONFIG_USE_middleware_azure_rtos_ux_ehci)
# Add set(CONFIG_USE_middleware_azure_rtos_ux_ehci true) in config.cmake to use this component

message("middleware_azure_rtos_ux_ehci component is included from ${CMAKE_CURRENT_LIST_FILE}.")

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/./usbx/common/usbx_host_controllers/src/ux_hcd_ehci_asynchronous_endpoint_create.c
  ${CMAKE_CURRENT_LIST_DIR}/./usbx/common/usbx_host_controllers/src/ux_hcd_ehci_asynchronous_endpoint_destroy.c
  ${CMAKE_CURRENT_LIST_DIR}/./usbx/common/usbx_host_controllers/src/ux_hcd_ehci_asynch_td_process.c
  ${CMAKE_CURRENT_LIST_DIR}/./usbx/common/usbx_host_controllers/src/ux_hcd_ehci_controller_disable.c
  ${CMAKE_CURRENT_LIST_DIR}/./usbx/common/usbx_host_controllers/src/ux_hcd_ehci_done_queue_process.c
  ${CMAKE_CURRENT_LIST_DIR}/./usbx/common/usbx_host_controllers/src/ux_hcd_ehci_door_bell_wait.c
  ${CMAKE_CURRENT_LIST_DIR}/./usbx/common/usbx_host_controllers/src/ux_hcd_ehci_ed_clean.c
  ${CMAKE_CURRENT_LIST_DIR}/./usbx/common/usbx_host_controllers/src/ux_hcd_ehci_ed_obtain.c
  ${CMAKE_CURRENT_LIST_DIR}/./usbx/common/usbx_host_controllers/src/ux_hcd_ehci_endpoint_reset.c
  ${CMAKE_CURRENT_LIST_DIR}/./usbx/common/usbx_host_controllers/src/ux_hcd_ehci_entry.c
  ${CMAKE_CURRENT_LIST_DIR}/./usbx/common/usbx_host_controllers/src/ux_hcd_ehci_frame_number_get.c
  ${CMAKE_CURRENT_LIST_DIR}/./usbx/common/usbx_host_controllers/src/ux_hcd_ehci_frame_number_set.c
  ${CMAKE_CURRENT_LIST_DIR}/./usbx/common/usbx_host_controllers/src/ux_hcd_ehci_fsisochronous_td_obtain.c
  ${CMAKE_CURRENT_LIST_DIR}/./usbx/common/usbx_host_controllers/src/ux_hcd_ehci_fsisochronous_tds_process.c
  ${CMAKE_CURRENT_LIST_DIR}/./usbx/common/usbx_host_controllers/src/ux_hcd_ehci_hsisochronous_td_obtain.c
  ${CMAKE_CURRENT_LIST_DIR}/./usbx/common/usbx_host_controllers/src/ux_hcd_ehci_hsisochronous_tds_process.c
  ${CMAKE_CURRENT_LIST_DIR}/./usbx/common/usbx_host_controllers/src/ux_hcd_ehci_initialize.c
  ${CMAKE_CURRENT_LIST_DIR}/./usbx/common/usbx_host_controllers/src/ux_hcd_ehci_interrupt_endpoint_create.c
  ${CMAKE_CURRENT_LIST_DIR}/./usbx/common/usbx_host_controllers/src/ux_hcd_ehci_interrupt_endpoint_destroy.c
  ${CMAKE_CURRENT_LIST_DIR}/./usbx/common/usbx_host_controllers/src/ux_hcd_ehci_interrupt_handler.c
  ${CMAKE_CURRENT_LIST_DIR}/./usbx/common/usbx_host_controllers/src/ux_hcd_ehci_isochronous_endpoint_create.c
  ${CMAKE_CURRENT_LIST_DIR}/./usbx/common/usbx_host_controllers/src/ux_hcd_ehci_isochronous_endpoint_destroy.c
  ${CMAKE_CURRENT_LIST_DIR}/./usbx/common/usbx_host_controllers/src/ux_hcd_ehci_least_traffic_list_get.c
  ${CMAKE_CURRENT_LIST_DIR}/./usbx/common/usbx_host_controllers/src/ux_hcd_ehci_next_td_clean.c
  ${CMAKE_CURRENT_LIST_DIR}/./usbx/common/usbx_host_controllers/src/ux_hcd_ehci_periodic_descriptor_link.c
  ${CMAKE_CURRENT_LIST_DIR}/./usbx/common/usbx_host_controllers/src/ux_hcd_ehci_periodic_tree_create.c
  ${CMAKE_CURRENT_LIST_DIR}/./usbx/common/usbx_host_controllers/src/ux_hcd_ehci_poll_rate_entry_get.c
  ${CMAKE_CURRENT_LIST_DIR}/./usbx/common/usbx_host_controllers/src/ux_hcd_ehci_port_disable.c
  ${CMAKE_CURRENT_LIST_DIR}/./usbx/common/usbx_host_controllers/src/ux_hcd_ehci_port_reset.c
  ${CMAKE_CURRENT_LIST_DIR}/./usbx/common/usbx_host_controllers/src/ux_hcd_ehci_port_resume.c
  ${CMAKE_CURRENT_LIST_DIR}/./usbx/common/usbx_host_controllers/src/ux_hcd_ehci_port_status_get.c
  ${CMAKE_CURRENT_LIST_DIR}/./usbx/common/usbx_host_controllers/src/ux_hcd_ehci_port_suspend.c
  ${CMAKE_CURRENT_LIST_DIR}/./usbx/common/usbx_host_controllers/src/ux_hcd_ehci_power_down_port.c
  ${CMAKE_CURRENT_LIST_DIR}/./usbx/common/usbx_host_controllers/src/ux_hcd_ehci_power_on_port.c
  ${CMAKE_CURRENT_LIST_DIR}/./usbx/common/usbx_host_controllers/src/ux_hcd_ehci_power_root_hubs.c
  ${CMAKE_CURRENT_LIST_DIR}/./usbx/common/usbx_host_controllers/src/ux_hcd_ehci_register_read.c
  ${CMAKE_CURRENT_LIST_DIR}/./usbx/common/usbx_host_controllers/src/ux_hcd_ehci_register_write.c
  ${CMAKE_CURRENT_LIST_DIR}/./usbx/common/usbx_host_controllers/src/ux_hcd_ehci_regular_td_obtain.c
  ${CMAKE_CURRENT_LIST_DIR}/./usbx/common/usbx_host_controllers/src/ux_hcd_ehci_request_bulk_transfer.c
  ${CMAKE_CURRENT_LIST_DIR}/./usbx/common/usbx_host_controllers/src/ux_hcd_ehci_request_control_transfer.c
  ${CMAKE_CURRENT_LIST_DIR}/./usbx/common/usbx_host_controllers/src/ux_hcd_ehci_request_interrupt_transfer.c
  ${CMAKE_CURRENT_LIST_DIR}/./usbx/common/usbx_host_controllers/src/ux_hcd_ehci_request_isochronous_transfer.c
  ${CMAKE_CURRENT_LIST_DIR}/./usbx/common/usbx_host_controllers/src/ux_hcd_ehci_request_transfer_add.c
  ${CMAKE_CURRENT_LIST_DIR}/./usbx/common/usbx_host_controllers/src/ux_hcd_ehci_request_transfer.c
  ${CMAKE_CURRENT_LIST_DIR}/./usbx/common/usbx_host_controllers/src/ux_hcd_ehci_transfer_abort.c
  ${CMAKE_CURRENT_LIST_DIR}/./usbx/common/usbx_host_controllers/src/ux_hcd_ehci_transfer_request_process.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/./usbx/common/usbx_host_controllers/inc
)


endif()


if (CONFIG_USE_middleware_azure_rtos_ux_ohci)
# Add set(CONFIG_USE_middleware_azure_rtos_ux_ohci true) in config.cmake to use this component

message("middleware_azure_rtos_ux_ohci component is included from ${CMAKE_CURRENT_LIST_FILE}.")

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/./usbx/common/usbx_host_controllers/src/ux_hcd_ohci_asynchronous_endpoint_create.c
  ${CMAKE_CURRENT_LIST_DIR}/./usbx/common/usbx_host_controllers/src/ux_hcd_ohci_asynchronous_endpoint_destroy.c
  ${CMAKE_CURRENT_LIST_DIR}/./usbx/common/usbx_host_controllers/src/ux_hcd_ohci_controller_disable.c
  ${CMAKE_CURRENT_LIST_DIR}/./usbx/common/usbx_host_controllers/src/ux_hcd_ohci_done_queue_process.c
  ${CMAKE_CURRENT_LIST_DIR}/./usbx/common/usbx_host_controllers/src/ux_hcd_ohci_ed_obtain.c
  ${CMAKE_CURRENT_LIST_DIR}/./usbx/common/usbx_host_controllers/src/ux_hcd_ohci_endpoint_error_clear.c
  ${CMAKE_CURRENT_LIST_DIR}/./usbx/common/usbx_host_controllers/src/ux_hcd_ohci_endpoint_reset.c
  ${CMAKE_CURRENT_LIST_DIR}/./usbx/common/usbx_host_controllers/src/ux_hcd_ohci_entry.c
  ${CMAKE_CURRENT_LIST_DIR}/./usbx/common/usbx_host_controllers/src/ux_hcd_ohci_frame_number_get.c
  ${CMAKE_CURRENT_LIST_DIR}/./usbx/common/usbx_host_controllers/src/ux_hcd_ohci_frame_number_set.c
  ${CMAKE_CURRENT_LIST_DIR}/./usbx/common/usbx_host_controllers/src/ux_hcd_ohci_initialize.c
  ${CMAKE_CURRENT_LIST_DIR}/./usbx/common/usbx_host_controllers/src/ux_hcd_ohci_interrupt_endpoint_create.c
  ${CMAKE_CURRENT_LIST_DIR}/./usbx/common/usbx_host_controllers/src/ux_hcd_ohci_interrupt_handler.c
  ${CMAKE_CURRENT_LIST_DIR}/./usbx/common/usbx_host_controllers/src/ux_hcd_ohci_isochronous_endpoint_create.c
  ${CMAKE_CURRENT_LIST_DIR}/./usbx/common/usbx_host_controllers/src/ux_hcd_ohci_isochronous_td_obtain.c
  ${CMAKE_CURRENT_LIST_DIR}/./usbx/common/usbx_host_controllers/src/ux_hcd_ohci_least_traffic_list_get.c
  ${CMAKE_CURRENT_LIST_DIR}/./usbx/common/usbx_host_controllers/src/ux_hcd_ohci_next_td_clean.c
  ${CMAKE_CURRENT_LIST_DIR}/./usbx/common/usbx_host_controllers/src/ux_hcd_ohci_periodic_endpoint_destroy.c
  ${CMAKE_CURRENT_LIST_DIR}/./usbx/common/usbx_host_controllers/src/ux_hcd_ohci_periodic_tree_create.c
  ${CMAKE_CURRENT_LIST_DIR}/./usbx/common/usbx_host_controllers/src/ux_hcd_ohci_port_disable.c
  ${CMAKE_CURRENT_LIST_DIR}/./usbx/common/usbx_host_controllers/src/ux_hcd_ohci_port_enable.c
  ${CMAKE_CURRENT_LIST_DIR}/./usbx/common/usbx_host_controllers/src/ux_hcd_ohci_port_reset.c
  ${CMAKE_CURRENT_LIST_DIR}/./usbx/common/usbx_host_controllers/src/ux_hcd_ohci_port_resume.c
  ${CMAKE_CURRENT_LIST_DIR}/./usbx/common/usbx_host_controllers/src/ux_hcd_ohci_port_status_get.c
  ${CMAKE_CURRENT_LIST_DIR}/./usbx/common/usbx_host_controllers/src/ux_hcd_ohci_port_suspend.c
  ${CMAKE_CURRENT_LIST_DIR}/./usbx/common/usbx_host_controllers/src/ux_hcd_ohci_power_down_port.c
  ${CMAKE_CURRENT_LIST_DIR}/./usbx/common/usbx_host_controllers/src/ux_hcd_ohci_power_on_port.c
  ${CMAKE_CURRENT_LIST_DIR}/./usbx/common/usbx_host_controllers/src/ux_hcd_ohci_power_root_hubs.c
  ${CMAKE_CURRENT_LIST_DIR}/./usbx/common/usbx_host_controllers/src/ux_hcd_ohci_register_read.c
  ${CMAKE_CURRENT_LIST_DIR}/./usbx/common/usbx_host_controllers/src/ux_hcd_ohci_register_write.c
  ${CMAKE_CURRENT_LIST_DIR}/./usbx/common/usbx_host_controllers/src/ux_hcd_ohci_regular_td_obtain.c
  ${CMAKE_CURRENT_LIST_DIR}/./usbx/common/usbx_host_controllers/src/ux_hcd_ohci_request_bulk_transfer.c
  ${CMAKE_CURRENT_LIST_DIR}/./usbx/common/usbx_host_controllers/src/ux_hcd_ohci_request_control_transfer.c
  ${CMAKE_CURRENT_LIST_DIR}/./usbx/common/usbx_host_controllers/src/ux_hcd_ohci_request_interupt_transfer.c
  ${CMAKE_CURRENT_LIST_DIR}/./usbx/common/usbx_host_controllers/src/ux_hcd_ohci_request_isochronous_transfer.c
  ${CMAKE_CURRENT_LIST_DIR}/./usbx/common/usbx_host_controllers/src/ux_hcd_ohci_request_transfer.c
  ${CMAKE_CURRENT_LIST_DIR}/./usbx/common/usbx_host_controllers/src/ux_hcd_ohci_transfer_abort.c
  ${CMAKE_CURRENT_LIST_DIR}/./usbx/common/usbx_host_controllers/src/ux_hcd_ohci_transfer_request_process.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/./usbx/common/usbx_host_controllers/inc
)


endif()


if (CONFIG_USE_middleware_azure_rtos_ux_ip3516)
# Add set(CONFIG_USE_middleware_azure_rtos_ux_ip3516 true) in config.cmake to use this component

message("middleware_azure_rtos_ux_ip3516 component is included from ${CMAKE_CURRENT_LIST_FILE}.")

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/./usbx/usbx_host_controllers_ip3516/ux_hcd_ip3516_asynchronous_endpoint_create.c
  ${CMAKE_CURRENT_LIST_DIR}/./usbx/usbx_host_controllers_ip3516/ux_hcd_ip3516_asynchronous_endpoint_destroy.c
  ${CMAKE_CURRENT_LIST_DIR}/./usbx/usbx_host_controllers_ip3516/ux_hcd_ip3516_controller_disable.c
  ${CMAKE_CURRENT_LIST_DIR}/./usbx/usbx_host_controllers_ip3516/ux_hcd_ip3516_done_queue_process.c
  ${CMAKE_CURRENT_LIST_DIR}/./usbx/usbx_host_controllers_ip3516/ux_hcd_ip3516_endpoint_reset.c
  ${CMAKE_CURRENT_LIST_DIR}/./usbx/usbx_host_controllers_ip3516/ux_hcd_ip3516_entry.c
  ${CMAKE_CURRENT_LIST_DIR}/./usbx/usbx_host_controllers_ip3516/ux_hcd_ip3516_frame_number_get.c
  ${CMAKE_CURRENT_LIST_DIR}/./usbx/usbx_host_controllers_ip3516/ux_hcd_ip3516_frame_number_set.c
  ${CMAKE_CURRENT_LIST_DIR}/./usbx/usbx_host_controllers_ip3516/ux_hcd_ip3516_initialize.c
  ${CMAKE_CURRENT_LIST_DIR}/./usbx/usbx_host_controllers_ip3516/ux_hcd_ip3516_interrupt_endpoint_create.c
  ${CMAKE_CURRENT_LIST_DIR}/./usbx/usbx_host_controllers_ip3516/ux_hcd_ip3516_interrupt_endpoint_destroy.c
  ${CMAKE_CURRENT_LIST_DIR}/./usbx/usbx_host_controllers_ip3516/ux_hcd_ip3516_interrupt_handler.c
  ${CMAKE_CURRENT_LIST_DIR}/./usbx/usbx_host_controllers_ip3516/ux_hcd_ip3516_isochronous_endpoint_create.c
  ${CMAKE_CURRENT_LIST_DIR}/./usbx/usbx_host_controllers_ip3516/ux_hcd_ip3516_isochronous_endpoint_destroy.c
  ${CMAKE_CURRENT_LIST_DIR}/./usbx/usbx_host_controllers_ip3516/ux_hcd_ip3516_least_traffic_list_get.c
  ${CMAKE_CURRENT_LIST_DIR}/./usbx/usbx_host_controllers_ip3516/ux_hcd_ip3516_port_disable.c
  ${CMAKE_CURRENT_LIST_DIR}/./usbx/usbx_host_controllers_ip3516/ux_hcd_ip3516_port_reset.c
  ${CMAKE_CURRENT_LIST_DIR}/./usbx/usbx_host_controllers_ip3516/ux_hcd_ip3516_port_resume.c
  ${CMAKE_CURRENT_LIST_DIR}/./usbx/usbx_host_controllers_ip3516/ux_hcd_ip3516_port_status_get.c
  ${CMAKE_CURRENT_LIST_DIR}/./usbx/usbx_host_controllers_ip3516/ux_hcd_ip3516_port_suspend.c
  ${CMAKE_CURRENT_LIST_DIR}/./usbx/usbx_host_controllers_ip3516/ux_hcd_ip3516_power_down_port.c
  ${CMAKE_CURRENT_LIST_DIR}/./usbx/usbx_host_controllers_ip3516/ux_hcd_ip3516_power_on_port.c
  ${CMAKE_CURRENT_LIST_DIR}/./usbx/usbx_host_controllers_ip3516/ux_hcd_ip3516_power_root_hubs.c
  ${CMAKE_CURRENT_LIST_DIR}/./usbx/usbx_host_controllers_ip3516/ux_hcd_ip3516_register_read.c
  ${CMAKE_CURRENT_LIST_DIR}/./usbx/usbx_host_controllers_ip3516/ux_hcd_ip3516_register_write.c
  ${CMAKE_CURRENT_LIST_DIR}/./usbx/usbx_host_controllers_ip3516/ux_hcd_ip3516_request_bulk_transfer.c
  ${CMAKE_CURRENT_LIST_DIR}/./usbx/usbx_host_controllers_ip3516/ux_hcd_ip3516_request_control_transfer.c
  ${CMAKE_CURRENT_LIST_DIR}/./usbx/usbx_host_controllers_ip3516/ux_hcd_ip3516_request_interrupt_transfer.c
  ${CMAKE_CURRENT_LIST_DIR}/./usbx/usbx_host_controllers_ip3516/ux_hcd_ip3516_request_isochronous_transfer.c
  ${CMAKE_CURRENT_LIST_DIR}/./usbx/usbx_host_controllers_ip3516/ux_hcd_ip3516_request_transfer.c
  ${CMAKE_CURRENT_LIST_DIR}/./usbx/usbx_host_controllers_ip3516/ux_hcd_ip3516_transfer_abort.c
  ${CMAKE_CURRENT_LIST_DIR}/./usbx/usbx_host_controllers_ip3516/ux_hcd_ip3516_transfer_request_process.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/./usbx/usbx_host_controllers_ip3516
)


endif()


if (CONFIG_USE_middleware_azure_rtos_ux_ip3511)
# Add set(CONFIG_USE_middleware_azure_rtos_ux_ip3511 true) in config.cmake to use this component

message("middleware_azure_rtos_ux_ip3511 component is included from ${CMAKE_CURRENT_LIST_FILE}.")

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/./usbx/usbx_device_controllers_ip3511/ux_dcd_ip3511_callback.c
  ${CMAKE_CURRENT_LIST_DIR}/./usbx/usbx_device_controllers_ip3511/ux_dcd_ip3511_control_callback.c
  ${CMAKE_CURRENT_LIST_DIR}/./usbx/usbx_device_controllers_ip3511/ux_dcd_ip3511_endpoint_create.c
  ${CMAKE_CURRENT_LIST_DIR}/./usbx/usbx_device_controllers_ip3511/ux_dcd_ip3511_endpoint_destroy.c
  ${CMAKE_CURRENT_LIST_DIR}/./usbx/usbx_device_controllers_ip3511/ux_dcd_ip3511_endpoint_reset.c
  ${CMAKE_CURRENT_LIST_DIR}/./usbx/usbx_device_controllers_ip3511/ux_dcd_ip3511_endpoint_stall.c
  ${CMAKE_CURRENT_LIST_DIR}/./usbx/usbx_device_controllers_ip3511/ux_dcd_ip3511_endpoint_status.c
  ${CMAKE_CURRENT_LIST_DIR}/./usbx/usbx_device_controllers_ip3511/ux_dcd_ip3511_frame_number_get.c
  ${CMAKE_CURRENT_LIST_DIR}/./usbx/usbx_device_controllers_ip3511/ux_dcd_ip3511_function.c
  ${CMAKE_CURRENT_LIST_DIR}/./usbx/usbx_device_controllers_ip3511/ux_dcd_ip3511_initialize.c
  ${CMAKE_CURRENT_LIST_DIR}/./usbx/usbx_device_controllers_ip3511/ux_dcd_ip3511_initialize_complete.c
  ${CMAKE_CURRENT_LIST_DIR}/./usbx/usbx_device_controllers_ip3511/ux_dcd_ip3511_transfer_callback.c
  ${CMAKE_CURRENT_LIST_DIR}/./usbx/usbx_device_controllers_ip3511/ux_dcd_ip3511_transfer_request.c
  ${CMAKE_CURRENT_LIST_DIR}/./usbx/usbx_device_controllers_ip3511/ux_dcd_ip3511_uninitialize.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/./usbx/usbx_device_controllers_ip3511
)


endif()


if (CONFIG_USE_middleware_azure_rtos_ux_dci)
# Add set(CONFIG_USE_middleware_azure_rtos_ux_dci true) in config.cmake to use this component

message("middleware_azure_rtos_ux_dci component is included from ${CMAKE_CURRENT_LIST_FILE}.")

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/./usbx/usbx_device_controllers/ux_dcd_nxp_dci_callback.c
  ${CMAKE_CURRENT_LIST_DIR}/./usbx/usbx_device_controllers/ux_dcd_nxp_dci_control_callback.c
  ${CMAKE_CURRENT_LIST_DIR}/./usbx/usbx_device_controllers/ux_dcd_nxp_dci_endpoint_create.c
  ${CMAKE_CURRENT_LIST_DIR}/./usbx/usbx_device_controllers/ux_dcd_nxp_dci_endpoint_destroy.c
  ${CMAKE_CURRENT_LIST_DIR}/./usbx/usbx_device_controllers/ux_dcd_nxp_dci_endpoint_reset.c
  ${CMAKE_CURRENT_LIST_DIR}/./usbx/usbx_device_controllers/ux_dcd_nxp_dci_endpoint_stall.c
  ${CMAKE_CURRENT_LIST_DIR}/./usbx/usbx_device_controllers/ux_dcd_nxp_dci_endpoint_status.c
  ${CMAKE_CURRENT_LIST_DIR}/./usbx/usbx_device_controllers/ux_dcd_nxp_dci_frame_number_get.c
  ${CMAKE_CURRENT_LIST_DIR}/./usbx/usbx_device_controllers/ux_dcd_nxp_dci_function.c
  ${CMAKE_CURRENT_LIST_DIR}/./usbx/usbx_device_controllers/ux_dcd_nxp_dci_initialize.c
  ${CMAKE_CURRENT_LIST_DIR}/./usbx/usbx_device_controllers/ux_dcd_nxp_dci_initialize_complete.c
  ${CMAKE_CURRENT_LIST_DIR}/./usbx/usbx_device_controllers/ux_dcd_nxp_dci_transfer_callback.c
  ${CMAKE_CURRENT_LIST_DIR}/./usbx/usbx_device_controllers/ux_dcd_nxp_dci_transfer_request.c
  ${CMAKE_CURRENT_LIST_DIR}/./usbx/usbx_device_controllers/ux_dcd_nxp_dci_uninitialize.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/./usbx/usbx_device_controllers
)


endif()


if (CONFIG_USE_middleware_azure_rtos_ux_lib)
# Add set(CONFIG_USE_middleware_azure_rtos_ux_lib true) in config.cmake to use this component

message("middleware_azure_rtos_ux_lib component is included from ${CMAKE_CURRENT_LIST_FILE}.")

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/./usbx/common/core/usbx_core_source.c
  ${CMAKE_CURRENT_LIST_DIR}/./usbx/common/usbx_device_classes/usbx_device_classes_source.c
  ${CMAKE_CURRENT_LIST_DIR}/./usbx/common/usbx_host_classes/usbx_host_classes_source.c
  ${CMAKE_CURRENT_LIST_DIR}/./usbx/common/usbx_pictbridge/usbx_pictbridge_source.c
  ${CMAKE_CURRENT_LIST_DIR}/./usbx/common/usbx_network/src/ux_network_driver.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/common/inc
  ${CMAKE_CURRENT_LIST_DIR}/./filex/common/inc
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/common/inc
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/crypto_libraries/inc
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/inc
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/nx_secure/ports
  ${CMAKE_CURRENT_LIST_DIR}/./usbx/common/core/inc
  ${CMAKE_CURRENT_LIST_DIR}/./usbx/common/usbx_device_classes/inc
  ${CMAKE_CURRENT_LIST_DIR}/./usbx/common/usbx_host_classes/inc
  ${CMAKE_CURRENT_LIST_DIR}/./usbx/common/usbx_network/inc
  ${CMAKE_CURRENT_LIST_DIR}/./usbx/common/usbx_pictbridge/inc
)

if(CONFIG_TOOLCHAIN STREQUAL mcux AND CONFIG_CORE STREQUAL cm7f)
target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/ports/cortex_m7/gnu/inc
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/ports/cortex_m7/gnu/inc
  ${CMAKE_CURRENT_LIST_DIR}/./usbx/ports/cortex_m7/gnu/inc
)
endif()

if((CONFIG_TOOLCHAIN STREQUAL mcux OR CONFIG_TOOLCHAIN STREQUAL armgcc) AND CONFIG_CORE STREQUAL cm7f)
target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/./filex/ports/cortex_m7/gnu/inc
)
endif()

if((CONFIG_TOOLCHAIN STREQUAL mcux OR CONFIG_TOOLCHAIN STREQUAL armgcc) AND CONFIG_CORE STREQUAL cm33)
target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/./filex/ports/cortex_m33/gnu/inc
)
endif()

if(CONFIG_TOOLCHAIN STREQUAL mcux AND CONFIG_CORE STREQUAL cm33)
target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/./threadx/ports/cortex_m33/gnu/inc
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/ports/cortex_m33/gnu/inc
  ${CMAKE_CURRENT_LIST_DIR}/./usbx/ports/cortex_m33/inc
)
endif()

if(CONFIG_USE_COMPONENT_CONFIGURATION)
  message("===>Import configuration from ${CMAKE_CURRENT_LIST_FILE}")

  target_compile_definitions(${MCUX_SDK_PROJECT_NAME} PUBLIC
    -DUX_OTG_SUPPORT
    -DTX_INCLUDE_USER_DEFINE_FILE
    -DFX_INCLUDE_USER_DEFINE_FILE
    -DNX_INCLUDE_USER_DEFINE_FILE
    -DUX_INCLUDE_USER_DEFINE_FILE
  )

endif()


endif()


if (CONFIG_USE_middleware_azure_rtos_tx)
# Add set(CONFIG_USE_middleware_azure_rtos_tx true) in config.cmake to use this component

message("middleware_azure_rtos_tx component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if(CONFIG_USE_middleware_azure_rtos_tx_template)

if(CONFIG_TOOLCHAIN STREQUAL mcux AND CONFIG_CORE STREQUAL cm7f)
  target_link_libraries(${MCUX_SDK_PROJECT_NAME} PRIVATE
    -Wl,--start-group
      ${CMAKE_CURRENT_LIST_DIR}/./binary/threadx/cortex_m7/mcux/libthreadx.a
      -Wl,--end-group
  )
endif()

else()

message(SEND_ERROR "middleware_azure_rtos_tx dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_middleware_azure_rtos_tx_mgr)
# Add set(CONFIG_USE_middleware_azure_rtos_tx_mgr true) in config.cmake to use this component

message("middleware_azure_rtos_tx_mgr component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if(CONFIG_USE_middleware_azure_rtos_tx_mgr_template)

if(CONFIG_TOOLCHAIN STREQUAL mcux AND CONFIG_CORE STREQUAL cm7f)
  target_link_libraries(${MCUX_SDK_PROJECT_NAME} PRIVATE
    -Wl,--start-group
      ${CMAKE_CURRENT_LIST_DIR}/./binary/threadx/cortex_m7/mcux/libthreadx-txm.a
      -Wl,--end-group
  )
endif()

else()

message(SEND_ERROR "middleware_azure_rtos_tx_mgr dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_middleware_azure_rtos_tx_sp)
# Add set(CONFIG_USE_middleware_azure_rtos_tx_sp true) in config.cmake to use this component

message("middleware_azure_rtos_tx_sp component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if(CONFIG_USE_middleware_azure_rtos_tx_template)

if(CONFIG_TOOLCHAIN STREQUAL mcux AND CONFIG_CORE STREQUAL cm7f)
  target_link_libraries(${MCUX_SDK_PROJECT_NAME} PRIVATE
    -Wl,--start-group
      ${CMAKE_CURRENT_LIST_DIR}/./binary/threadx/cortex_m7/mcux/libthreadx_sp.a
      -Wl,--end-group
  )
endif()

if(CONFIG_TOOLCHAIN STREQUAL mcux AND CONFIG_CORE STREQUAL cm33)
  target_link_libraries(${MCUX_SDK_PROJECT_NAME} PRIVATE
    -Wl,--start-group
      ${CMAKE_CURRENT_LIST_DIR}/./binary/threadx/cortex_m33/mcux/libthreadx_sp.a
      -Wl,--end-group
  )
endif()

else()

message(SEND_ERROR "middleware_azure_rtos_tx_sp dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_middleware_azure_rtos_fx)
# Add set(CONFIG_USE_middleware_azure_rtos_fx true) in config.cmake to use this component

message("middleware_azure_rtos_fx component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if(CONFIG_USE_middleware_azure_rtos_fx_template AND CONFIG_USE_middleware_azure_rtos_tx)

if(CONFIG_TOOLCHAIN STREQUAL mcux AND CONFIG_CORE STREQUAL cm7f)
  target_link_libraries(${MCUX_SDK_PROJECT_NAME} PRIVATE
    -Wl,--start-group
      ${CMAKE_CURRENT_LIST_DIR}/./binary/filex/cortex_m7/mcux/libfilex.a
      -Wl,--end-group
  )
endif()

else()

message(SEND_ERROR "middleware_azure_rtos_fx dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_middleware_azure_rtos_fx_sp)
# Add set(CONFIG_USE_middleware_azure_rtos_fx_sp true) in config.cmake to use this component

message("middleware_azure_rtos_fx_sp component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if(CONFIG_USE_middleware_azure_rtos_fx_template AND CONFIG_USE_middleware_azure_rtos_tx_sp)

if(CONFIG_TOOLCHAIN STREQUAL mcux AND CONFIG_CORE STREQUAL cm7f)
  target_link_libraries(${MCUX_SDK_PROJECT_NAME} PRIVATE
    -Wl,--start-group
      ${CMAKE_CURRENT_LIST_DIR}/./binary/filex/cortex_m7/mcux/libfilex_sp.a
      -Wl,--end-group
  )
endif()

if(CONFIG_TOOLCHAIN STREQUAL mcux AND CONFIG_CORE STREQUAL cm33)
  target_link_libraries(${MCUX_SDK_PROJECT_NAME} PRIVATE
    -Wl,--start-group
      ${CMAKE_CURRENT_LIST_DIR}/./binary/filex/cortex_m33/mcux/libfilex_sp.a
      -Wl,--end-group
  )
endif()

else()

message(SEND_ERROR "middleware_azure_rtos_fx_sp dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_middleware_azure_rtos_gx)
# Add set(CONFIG_USE_middleware_azure_rtos_gx true) in config.cmake to use this component

message("middleware_azure_rtos_gx component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if(CONFIG_USE_middleware_azure_rtos_tx)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/./guix/common/inc
)

if((CONFIG_TOOLCHAIN STREQUAL armgcc OR CONFIG_TOOLCHAIN STREQUAL mcux) AND CONFIG_CORE STREQUAL cm7f)
target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/./guix/ports/cortex_m7/gnu/inc
)
endif()

if(CONFIG_USE_COMPONENT_CONFIGURATION)
  message("===>Import configuration from ${CMAKE_CURRENT_LIST_FILE}")

  target_compile_definitions(${MCUX_SDK_PROJECT_NAME} PUBLIC
    -DGX_INCLUDE_USER_DEFINE_FILE
  )

  if(CONFIG_TOOLCHAIN STREQUAL armgcc)
    target_compile_options(${MCUX_SDK_PROJECT_NAME} PUBLIC
    )
  endif()

endif()

if(CONFIG_TOOLCHAIN STREQUAL mcux AND CONFIG_CORE STREQUAL cm7f)
  target_link_libraries(${MCUX_SDK_PROJECT_NAME} PRIVATE
    -Wl,--start-group
      ${CMAKE_CURRENT_LIST_DIR}/./binary/guix/cortex_m7/mcux/libguix.a
      -Wl,--end-group
  )
endif()

else()

message(SEND_ERROR "middleware_azure_rtos_gx dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_middleware_azure_rtos_lx)
# Add set(CONFIG_USE_middleware_azure_rtos_lx true) in config.cmake to use this component

message("middleware_azure_rtos_lx component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if(CONFIG_USE_middleware_azure_rtos_fx OR CONFIG_USE_middleware_azure_rtos_fx_sp)

if(CONFIG_TOOLCHAIN STREQUAL mcux)
  target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
      ${CMAKE_CURRENT_LIST_DIR}/./levelx/common/src/fx_nand_flash_simulated_driver.c
      ${CMAKE_CURRENT_LIST_DIR}/./levelx/common/src/fx_nor_flash_simulator_driver.c
      ${CMAKE_CURRENT_LIST_DIR}/./levelx/common/src/lx_nand_flash_256byte_ecc_check.c
      ${CMAKE_CURRENT_LIST_DIR}/./levelx/common/src/lx_nand_flash_256byte_ecc_compute.c
      ${CMAKE_CURRENT_LIST_DIR}/./levelx/common/src/lx_nand_flash_block_full_update.c
      ${CMAKE_CURRENT_LIST_DIR}/./levelx/common/src/lx_nand_flash_block_obsoleted_check.c
      ${CMAKE_CURRENT_LIST_DIR}/./levelx/common/src/lx_nand_flash_block_reclaim.c
      ${CMAKE_CURRENT_LIST_DIR}/./levelx/common/src/lx_nand_flash_close.c
      ${CMAKE_CURRENT_LIST_DIR}/./levelx/common/src/lx_nand_flash_defragment.c
      ${CMAKE_CURRENT_LIST_DIR}/./levelx/common/src/lx_nand_flash_driver_block_erase.c
      ${CMAKE_CURRENT_LIST_DIR}/./levelx/common/src/lx_nand_flash_driver_block_erased_verify.c
      ${CMAKE_CURRENT_LIST_DIR}/./levelx/common/src/lx_nand_flash_driver_block_status_get.c
      ${CMAKE_CURRENT_LIST_DIR}/./levelx/common/src/lx_nand_flash_driver_block_status_set.c
      ${CMAKE_CURRENT_LIST_DIR}/./levelx/common/src/lx_nand_flash_driver_extra_bytes_get.c
      ${CMAKE_CURRENT_LIST_DIR}/./levelx/common/src/lx_nand_flash_driver_extra_bytes_set.c
      ${CMAKE_CURRENT_LIST_DIR}/./levelx/common/src/lx_nand_flash_driver_page_erased_verify.c
      ${CMAKE_CURRENT_LIST_DIR}/./levelx/common/src/lx_nand_flash_driver_read.c
      ${CMAKE_CURRENT_LIST_DIR}/./levelx/common/src/lx_nand_flash_driver_write.c
      ${CMAKE_CURRENT_LIST_DIR}/./levelx/common/src/lx_nand_flash_extended_cache_enable.c
      ${CMAKE_CURRENT_LIST_DIR}/./levelx/common/src/lx_nand_flash_initialize.c
      ${CMAKE_CURRENT_LIST_DIR}/./levelx/common/src/lx_nand_flash_logical_sector_find.c
      ${CMAKE_CURRENT_LIST_DIR}/./levelx/common/src/lx_nand_flash_next_block_to_erase_find.c
      ${CMAKE_CURRENT_LIST_DIR}/./levelx/common/src/lx_nand_flash_open.c
      ${CMAKE_CURRENT_LIST_DIR}/./levelx/common/src/lx_nand_flash_page_ecc_check.c
      ${CMAKE_CURRENT_LIST_DIR}/./levelx/common/src/lx_nand_flash_page_ecc_compute.c
      ${CMAKE_CURRENT_LIST_DIR}/./levelx/common/src/lx_nand_flash_partial_defragment.c
      ${CMAKE_CURRENT_LIST_DIR}/./levelx/common/src/lx_nand_flash_physical_page_allocate.c
      ${CMAKE_CURRENT_LIST_DIR}/./levelx/common/src/lx_nand_flash_sector_mapping_cache_invalidate.c
      ${CMAKE_CURRENT_LIST_DIR}/./levelx/common/src/lx_nand_flash_sector_read.c
      ${CMAKE_CURRENT_LIST_DIR}/./levelx/common/src/lx_nand_flash_sector_release.c
      ${CMAKE_CURRENT_LIST_DIR}/./levelx/common/src/lx_nand_flash_sector_write.c
      ${CMAKE_CURRENT_LIST_DIR}/./levelx/common/src/lx_nand_flash_simulator.c
      ${CMAKE_CURRENT_LIST_DIR}/./levelx/common/src/lx_nand_flash_system_error.c
      ${CMAKE_CURRENT_LIST_DIR}/./levelx/common/src/lx_nor_flash_block_reclaim.c
      ${CMAKE_CURRENT_LIST_DIR}/./levelx/common/src/lx_nor_flash_close.c
      ${CMAKE_CURRENT_LIST_DIR}/./levelx/common/src/lx_nor_flash_defragment.c
      ${CMAKE_CURRENT_LIST_DIR}/./levelx/common/src/lx_nor_flash_driver_block_erase.c
      ${CMAKE_CURRENT_LIST_DIR}/./levelx/common/src/lx_nor_flash_driver_read.c
      ${CMAKE_CURRENT_LIST_DIR}/./levelx/common/src/lx_nor_flash_driver_write.c
      ${CMAKE_CURRENT_LIST_DIR}/./levelx/common/src/lx_nor_flash_extended_cache_enable.c
      ${CMAKE_CURRENT_LIST_DIR}/./levelx/common/src/lx_nor_flash_initialize.c
      ${CMAKE_CURRENT_LIST_DIR}/./levelx/common/src/lx_nor_flash_logical_sector_find.c
      ${CMAKE_CURRENT_LIST_DIR}/./levelx/common/src/lx_nor_flash_next_block_to_erase_find.c
      ${CMAKE_CURRENT_LIST_DIR}/./levelx/common/src/lx_nor_flash_open.c
      ${CMAKE_CURRENT_LIST_DIR}/./levelx/common/src/lx_nor_flash_partial_defragment.c
      ${CMAKE_CURRENT_LIST_DIR}/./levelx/common/src/lx_nor_flash_physical_sector_allocate.c
      ${CMAKE_CURRENT_LIST_DIR}/./levelx/common/src/lx_nor_flash_sector_mapping_cache_invalidate.c
      ${CMAKE_CURRENT_LIST_DIR}/./levelx/common/src/lx_nor_flash_sector_read.c
      ${CMAKE_CURRENT_LIST_DIR}/./levelx/common/src/lx_nor_flash_sector_release.c
      ${CMAKE_CURRENT_LIST_DIR}/./levelx/common/src/lx_nor_flash_sector_write.c
      ${CMAKE_CURRENT_LIST_DIR}/./levelx/common/src/lx_nor_flash_simulator.c
      ${CMAKE_CURRENT_LIST_DIR}/./levelx/common/src/lx_nor_flash_system_error.c
  )
endif()

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/./levelx/common/inc
)

if(CONFIG_USE_COMPONENT_CONFIGURATION)
  message("===>Import configuration from ${CMAKE_CURRENT_LIST_FILE}")

  target_compile_definitions(${MCUX_SDK_PROJECT_NAME} PUBLIC
    -DLX_THREAD_SAFE_ENABLE
  )

  if(CONFIG_TOOLCHAIN STREQUAL armgcc)
    target_compile_options(${MCUX_SDK_PROJECT_NAME} PUBLIC
    )
  endif()

endif()

else()

message(SEND_ERROR "middleware_azure_rtos_lx dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_middleware_azure_rtos_nxd)
# Add set(CONFIG_USE_middleware_azure_rtos_nxd true) in config.cmake to use this component

message("middleware_azure_rtos_nxd component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if(CONFIG_USE_middleware_azure_rtos_nxd_template AND CONFIG_USE_middleware_azure_rtos_fx)

if(CONFIG_TOOLCHAIN STREQUAL mcux AND CONFIG_CORE STREQUAL cm7f)
  target_link_libraries(${MCUX_SDK_PROJECT_NAME} PRIVATE
    -Wl,--start-group
      ${CMAKE_CURRENT_LIST_DIR}/./binary/netxduo/cortex_m7/mcux/libnetxduo.a
      -Wl,--end-group
  )
endif()

else()

message(SEND_ERROR "middleware_azure_rtos_nxd dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_middleware_azure_rtos_nxd_sp)
# Add set(CONFIG_USE_middleware_azure_rtos_nxd_sp true) in config.cmake to use this component

message("middleware_azure_rtos_nxd_sp component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if(CONFIG_USE_middleware_azure_rtos_nxd_template AND CONFIG_USE_middleware_azure_rtos_fx_sp)

if(CONFIG_TOOLCHAIN STREQUAL mcux AND CONFIG_CORE STREQUAL cm7f)
  target_link_libraries(${MCUX_SDK_PROJECT_NAME} PRIVATE
    -Wl,--start-group
      ${CMAKE_CURRENT_LIST_DIR}/./binary/netxduo/cortex_m7/mcux/libnetxduo_sp.a
      -Wl,--end-group
  )
endif()

if(CONFIG_TOOLCHAIN STREQUAL mcux AND CONFIG_CORE STREQUAL cm33)
  target_link_libraries(${MCUX_SDK_PROJECT_NAME} PRIVATE
    -Wl,--start-group
      ${CMAKE_CURRENT_LIST_DIR}/./binary/netxduo/cortex_m33/mcux/libnetxduo_sp.a
      -Wl,--end-group
  )
endif()

else()

message(SEND_ERROR "middleware_azure_rtos_nxd_sp dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_middleware_netxduo_imxrt)
# Add set(CONFIG_USE_middleware_netxduo_imxrt true) in config.cmake to use this component

message("middleware_netxduo_imxrt component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if(CONFIG_USE_middleware_azure_rtos_nxd)

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/./ports/netxduo/nx_driver_imxrt_irq.c
  ${CMAKE_CURRENT_LIST_DIR}/./ports/netxduo/nx_driver_imxrt.c
)

else()

message(SEND_ERROR "middleware_netxduo_imxrt dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_middleware_azure_rtos_ux)
# Add set(CONFIG_USE_middleware_azure_rtos_ux true) in config.cmake to use this component

message("middleware_azure_rtos_ux component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if(CONFIG_USE_middleware_azure_rtos_ux_template AND CONFIG_USE_middleware_azure_rtos_nxd)

if(CONFIG_TOOLCHAIN STREQUAL mcux AND CONFIG_CORE STREQUAL cm7f)
  target_link_libraries(${MCUX_SDK_PROJECT_NAME} PRIVATE
    -Wl,--start-group
      ${CMAKE_CURRENT_LIST_DIR}/./binary/usbx/cortex_m7/mcux/libusbx.a
      -Wl,--end-group
  )
endif()

else()

message(SEND_ERROR "middleware_azure_rtos_ux dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_middleware_azure_rtos_ux_sp)
# Add set(CONFIG_USE_middleware_azure_rtos_ux_sp true) in config.cmake to use this component

message("middleware_azure_rtos_ux_sp component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if(CONFIG_USE_middleware_azure_rtos_ux_template AND CONFIG_USE_middleware_azure_rtos_nxd_sp)

if(CONFIG_TOOLCHAIN STREQUAL mcux AND CONFIG_CORE STREQUAL cm7f)
  target_link_libraries(${MCUX_SDK_PROJECT_NAME} PRIVATE
    -Wl,--start-group
      ${CMAKE_CURRENT_LIST_DIR}/./binary/usbx/cortex_m7/mcux/libusbx_sp.a
      -Wl,--end-group
  )
endif()

if(CONFIG_TOOLCHAIN STREQUAL mcux AND CONFIG_CORE STREQUAL cm33)
  target_link_libraries(${MCUX_SDK_PROJECT_NAME} PRIVATE
    -Wl,--start-group
      ${CMAKE_CURRENT_LIST_DIR}/./binary/usbx/cortex_m33/mcux/libusbx_sp.a
      -Wl,--end-group
  )
endif()

else()

message(SEND_ERROR "middleware_azure_rtos_ux_sp dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_middleware_azure_rtos_azure_iot)
# Add set(CONFIG_USE_middleware_azure_rtos_azure_iot true) in config.cmake to use this component

message("middleware_azure_rtos_azure_iot component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if(CONFIG_USE_middleware_azure_rtos_nxd OR CONFIG_USE_middleware_azure_rtos_nxd_sp)

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/addons/azure_iot/nx_azure_iot.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/addons/azure_iot/nx_azure_iot_adu_agent.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/addons/azure_iot/nx_azure_iot_adu_root_key.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/addons/azure_iot/nx_azure_iot_hub_client.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/addons/azure_iot/nx_azure_iot_hub_client_properties.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/addons/azure_iot/nx_azure_iot_json_reader.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/addons/azure_iot/nx_azure_iot_json_writer.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/addons/azure_iot/nx_azure_iot_provisioning_client.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/addons/azure_iot/azure-sdk-for-c/sdk/src/azure/core/az_base64.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/addons/azure_iot/azure-sdk-for-c/sdk/src/azure/core/az_context.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/addons/azure_iot/azure-sdk-for-c/sdk/src/azure/core/az_http_pipeline.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/addons/azure_iot/azure-sdk-for-c/sdk/src/azure/core/az_http_policy.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/addons/azure_iot/azure-sdk-for-c/sdk/src/azure/core/az_http_policy_logging.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/addons/azure_iot/azure-sdk-for-c/sdk/src/azure/core/az_http_policy_retry.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/addons/azure_iot/azure-sdk-for-c/sdk/src/azure/core/az_http_request.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/addons/azure_iot/azure-sdk-for-c/sdk/src/azure/core/az_http_response.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/addons/azure_iot/azure-sdk-for-c/sdk/src/azure/core/az_json_reader.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/addons/azure_iot/azure-sdk-for-c/sdk/src/azure/core/az_json_token.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/addons/azure_iot/azure-sdk-for-c/sdk/src/azure/core/az_json_writer.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/addons/azure_iot/azure-sdk-for-c/sdk/src/azure/core/az_log.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/addons/azure_iot/azure-sdk-for-c/sdk/src/azure/core/az_precondition.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/addons/azure_iot/azure-sdk-for-c/sdk/src/azure/core/az_span.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/addons/azure_iot/azure-sdk-for-c/sdk/src/azure/iot/az_iot_common.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/addons/azure_iot/azure-sdk-for-c/sdk/src/azure/iot/az_iot_hub_client.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/addons/azure_iot/azure-sdk-for-c/sdk/src/azure/iot/az_iot_hub_client_c2d.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/addons/azure_iot/azure-sdk-for-c/sdk/src/azure/iot/az_iot_hub_client_commands.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/addons/azure_iot/azure-sdk-for-c/sdk/src/azure/iot/az_iot_hub_client_methods.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/addons/azure_iot/azure-sdk-for-c/sdk/src/azure/iot/az_iot_hub_client_properties.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/addons/azure_iot/azure-sdk-for-c/sdk/src/azure/iot/az_iot_hub_client_sas.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/addons/azure_iot/azure-sdk-for-c/sdk/src/azure/iot/az_iot_hub_client_telemetry.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/addons/azure_iot/azure-sdk-for-c/sdk/src/azure/iot/az_iot_hub_client_twin.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/addons/azure_iot/azure-sdk-for-c/sdk/src/azure/iot/az_iot_provisioning_client.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/addons/azure_iot/azure-sdk-for-c/sdk/src/azure/iot/az_iot_provisioning_client_sas.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/addons/azure_iot/azure-sdk-for-c/sdk/src/azure/platform/az_nohttp.c
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/addons/azure_iot/azure-sdk-for-c/sdk/src/azure/platform/az_noplatform.c
)

if((CONFIG_TOOLCHAIN STREQUAL mcux OR CONFIG_TOOLCHAIN STREQUAL armgcc))
  target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
      ${CMAKE_CURRENT_LIST_DIR}/./netxduo/addons/azure_iot/azure_iot_security_module/nx_azure_iot_security_module.c
      ${CMAKE_CURRENT_LIST_DIR}/./netxduo/addons/azure_iot/azure_iot_security_module/iot-security-module-core/deps/flatcc/src/runtime/builder.c
      ${CMAKE_CURRENT_LIST_DIR}/./netxduo/addons/azure_iot/azure_iot_security_module/iot-security-module-core/deps/flatcc/src/runtime/emitter.c
      ${CMAKE_CURRENT_LIST_DIR}/./netxduo/addons/azure_iot/azure_iot_security_module/iot-security-module-core/deps/flatcc/src/runtime/refmap.c
      ${CMAKE_CURRENT_LIST_DIR}/./netxduo/addons/azure_iot/azure_iot_security_module/iot-security-module-core/src/collector_collection.c
      ${CMAKE_CURRENT_LIST_DIR}/./netxduo/addons/azure_iot/azure_iot_security_module/iot-security-module-core/src/collectors/collector_heartbeat.c
      ${CMAKE_CURRENT_LIST_DIR}/./netxduo/addons/azure_iot/azure_iot_security_module/iot-security-module-core/src/collectors_info.c
      ${CMAKE_CURRENT_LIST_DIR}/./netxduo/addons/azure_iot/azure_iot_security_module/iot-security-module-core/src/components_factory.c
      ${CMAKE_CURRENT_LIST_DIR}/./netxduo/addons/azure_iot/azure_iot_security_module/iot-security-module-core/src/components_manager.c
      ${CMAKE_CURRENT_LIST_DIR}/./netxduo/addons/azure_iot/azure_iot_security_module/iot-security-module-core/src/core.c
      ${CMAKE_CURRENT_LIST_DIR}/./netxduo/addons/azure_iot/azure_iot_security_module/iot-security-module-core/src/logger.c
      ${CMAKE_CURRENT_LIST_DIR}/./netxduo/addons/azure_iot/azure_iot_security_module/iot-security-module-core/src/model/collector.c
      ${CMAKE_CURRENT_LIST_DIR}/./netxduo/addons/azure_iot/azure_iot_security_module/iot-security-module-core/src/model/security_message.c
      ${CMAKE_CURRENT_LIST_DIR}/./netxduo/addons/azure_iot/azure_iot_security_module/iot-security-module-core/src/object_pool_static.c
      ${CMAKE_CURRENT_LIST_DIR}/./netxduo/addons/azure_iot/azure_iot_security_module/iot-security-module-core/src/serializer/extensions/custom_builder_allocator.c
      ${CMAKE_CURRENT_LIST_DIR}/./netxduo/addons/azure_iot/azure_iot_security_module/iot-security-module-core/src/serializer/extensions/page_allocator.c
      ${CMAKE_CURRENT_LIST_DIR}/./netxduo/addons/azure_iot/azure_iot_security_module/iot-security-module-core/src/serializer/heartbeat.c
      ${CMAKE_CURRENT_LIST_DIR}/./netxduo/addons/azure_iot/azure_iot_security_module/iot-security-module-core/src/serializer/network_activity.c
      ${CMAKE_CURRENT_LIST_DIR}/./netxduo/addons/azure_iot/azure_iot_security_module/iot-security-module-core/src/serializer/serializer.c
      ${CMAKE_CURRENT_LIST_DIR}/./netxduo/addons/azure_iot/azure_iot_security_module/iot-security-module-core/src/serializer/serializer_private.c
      ${CMAKE_CURRENT_LIST_DIR}/./netxduo/addons/azure_iot/azure_iot_security_module/iot-security-module-core/src/serializer/system_information.c
      ${CMAKE_CURRENT_LIST_DIR}/./netxduo/addons/azure_iot/azure_iot_security_module/iot-security-module-core/src/utils/collection/bit_vector.c
      ${CMAKE_CURRENT_LIST_DIR}/./netxduo/addons/azure_iot/azure_iot_security_module/iot-security-module-core/src/utils/collection/hashtable.c
      ${CMAKE_CURRENT_LIST_DIR}/./netxduo/addons/azure_iot/azure_iot_security_module/iot-security-module-core/src/utils/collection/list.c
      ${CMAKE_CURRENT_LIST_DIR}/./netxduo/addons/azure_iot/azure_iot_security_module/iot-security-module-core/src/utils/collection/stack.c
      ${CMAKE_CURRENT_LIST_DIR}/./netxduo/addons/azure_iot/azure_iot_security_module/iot-security-module-core/src/utils/event_loop_be.c
      ${CMAKE_CURRENT_LIST_DIR}/./netxduo/addons/azure_iot/azure_iot_security_module/iot-security-module-core/src/utils/iconv.c
      ${CMAKE_CURRENT_LIST_DIR}/./netxduo/addons/azure_iot/azure_iot_security_module/iot-security-module-core/src/utils/notifier.c
      ${CMAKE_CURRENT_LIST_DIR}/./netxduo/addons/azure_iot/azure_iot_security_module/iot-security-module-core/src/utils/string_utils.c
      ${CMAKE_CURRENT_LIST_DIR}/./netxduo/addons/azure_iot/azure_iot_security_module/iot-security-module-core/src/utils/uuid.c
      ${CMAKE_CURRENT_LIST_DIR}/./netxduo/addons/azure_iot/azure_iot_security_module/src/collectors/collector_network_activity.c
      ${CMAKE_CURRENT_LIST_DIR}/./netxduo/addons/azure_iot/azure_iot_security_module/src/collectors/collector_system_information.c
      ${CMAKE_CURRENT_LIST_DIR}/./netxduo/addons/azure_iot/azure_iot_security_module/src/model/objects/object_network_activity_ext.c
      ${CMAKE_CURRENT_LIST_DIR}/./netxduo/addons/azure_iot/azure_iot_security_module/src/utils/ievent_loop.c
      ${CMAKE_CURRENT_LIST_DIR}/./netxduo/addons/azure_iot/azure_iot_security_module/src/utils/irand.c
      ${CMAKE_CURRENT_LIST_DIR}/./netxduo/addons/azure_iot/azure_iot_security_module/src/utils/itime.c
      ${CMAKE_CURRENT_LIST_DIR}/./netxduo/addons/azure_iot/azure_iot_security_module/src/utils/os_utils.c
  )
endif()

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/addons/azure_iot
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/addons/azure_iot/azure-sdk-for-c/sdk/inc
)

if((CONFIG_TOOLCHAIN STREQUAL mcux OR CONFIG_TOOLCHAIN STREQUAL armgcc))
target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/addons/azure_iot/azure_iot_security_module
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/addons/azure_iot/azure_iot_security_module/inc
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/addons/azure_iot/azure_iot_security_module/inc/configs/RTOS_BASE
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/addons/azure_iot/azure_iot_security_module/iot-security-module-core/inc
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/addons/azure_iot/azure_iot_security_module/iot-security-module-core/deps/flatcc/src/runtime
  ${CMAKE_CURRENT_LIST_DIR}/./netxduo/addons/azure_iot/azure_iot_security_module/iot-security-module-core/deps/flatcc/include
)
endif()

if(CONFIG_USE_COMPONENT_CONFIGURATION)
  message("===>Import configuration from ${CMAKE_CURRENT_LIST_FILE}")

  target_compile_definitions(${MCUX_SDK_PROJECT_NAME} PUBLIC
    -DAZ_NO_PRECONDITION_CHECKING
  )

endif()

else()

message(SEND_ERROR "middleware_azure_rtos_azure_iot dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()

