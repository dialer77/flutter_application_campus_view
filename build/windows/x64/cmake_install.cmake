# Install script for directory: D:/Work/Kmong/CampusView/flutter_application_campus_view/windows

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "$<TARGET_FILE_DIR:flutter_application_campus_view>")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Release")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/flutter/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/plugins/media_kit_libs_windows_video/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/plugins/media_kit_video/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/plugins/screen_brightness_windows/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/plugins/screen_retriever_windows/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/plugins/window_manager/cmake_install.cmake")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Runtime" OR NOT CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
     "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Debug/flutter_application_campus_view.exe")
    if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    file(INSTALL DESTINATION "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Debug" TYPE EXECUTABLE FILES "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Debug/flutter_application_campus_view.exe")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Pp][Rr][Oo][Ff][Ii][Ll][Ee])$")
    list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
     "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Profile/flutter_application_campus_view.exe")
    if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    file(INSTALL DESTINATION "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Profile" TYPE EXECUTABLE FILES "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Profile/flutter_application_campus_view.exe")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
     "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Release/flutter_application_campus_view.exe")
    if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    file(INSTALL DESTINATION "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Release" TYPE EXECUTABLE FILES "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Release/flutter_application_campus_view.exe")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Runtime" OR NOT CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
     "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Debug/data/icudtl.dat")
    if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    file(INSTALL DESTINATION "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Debug/data" TYPE FILE FILES "D:/Work/Kmong/CampusView/flutter_application_campus_view/windows/flutter/ephemeral/icudtl.dat")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Pp][Rr][Oo][Ff][Ii][Ll][Ee])$")
    list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
     "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Profile/data/icudtl.dat")
    if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    file(INSTALL DESTINATION "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Profile/data" TYPE FILE FILES "D:/Work/Kmong/CampusView/flutter_application_campus_view/windows/flutter/ephemeral/icudtl.dat")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
     "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Release/data/icudtl.dat")
    if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    file(INSTALL DESTINATION "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Release/data" TYPE FILE FILES "D:/Work/Kmong/CampusView/flutter_application_campus_view/windows/flutter/ephemeral/icudtl.dat")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Runtime" OR NOT CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
     "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Debug/flutter_windows.dll")
    if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    file(INSTALL DESTINATION "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Debug" TYPE FILE FILES "D:/Work/Kmong/CampusView/flutter_application_campus_view/windows/flutter/ephemeral/flutter_windows.dll")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Pp][Rr][Oo][Ff][Ii][Ll][Ee])$")
    list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
     "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Profile/flutter_windows.dll")
    if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    file(INSTALL DESTINATION "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Profile" TYPE FILE FILES "D:/Work/Kmong/CampusView/flutter_application_campus_view/windows/flutter/ephemeral/flutter_windows.dll")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
     "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Release/flutter_windows.dll")
    if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    file(INSTALL DESTINATION "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Release" TYPE FILE FILES "D:/Work/Kmong/CampusView/flutter_application_campus_view/windows/flutter/ephemeral/flutter_windows.dll")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Runtime" OR NOT CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
     "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Debug/media_kit_libs_windows_video_plugin.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Debug/libmpv-2.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Debug/api-ms-win-core-console-l1-1-0.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Debug/api-ms-win-core-console-l1-2-0.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Debug/api-ms-win-core-datetime-l1-1-0.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Debug/api-ms-win-core-debug-l1-1-0.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Debug/api-ms-win-core-errorhandling-l1-1-0.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Debug/api-ms-win-core-fibers-l1-1-0.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Debug/api-ms-win-core-file-l1-1-0.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Debug/api-ms-win-core-file-l1-2-0.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Debug/api-ms-win-core-file-l2-1-0.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Debug/api-ms-win-core-handle-l1-1-0.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Debug/api-ms-win-core-heap-l1-1-0.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Debug/api-ms-win-core-interlocked-l1-1-0.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Debug/api-ms-win-core-libraryloader-l1-1-0.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Debug/api-ms-win-core-localization-l1-2-0.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Debug/api-ms-win-core-memory-l1-1-0.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Debug/api-ms-win-core-namedpipe-l1-1-0.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Debug/api-ms-win-core-processenvironment-l1-1-0.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Debug/api-ms-win-core-processthreads-l1-1-0.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Debug/api-ms-win-core-processthreads-l1-1-1.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Debug/api-ms-win-core-profile-l1-1-0.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Debug/api-ms-win-core-rtlsupport-l1-1-0.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Debug/api-ms-win-core-string-l1-1-0.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Debug/api-ms-win-core-synch-l1-1-0.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Debug/api-ms-win-core-synch-l1-2-0.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Debug/api-ms-win-core-sysinfo-l1-1-0.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Debug/api-ms-win-core-timezone-l1-1-0.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Debug/api-ms-win-core-util-l1-1-0.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Debug/api-ms-win-crt-conio-l1-1-0.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Debug/api-ms-win-crt-convert-l1-1-0.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Debug/api-ms-win-crt-environment-l1-1-0.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Debug/api-ms-win-crt-filesystem-l1-1-0.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Debug/api-ms-win-crt-heap-l1-1-0.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Debug/api-ms-win-crt-locale-l1-1-0.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Debug/api-ms-win-crt-math-l1-1-0.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Debug/api-ms-win-crt-multibyte-l1-1-0.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Debug/api-ms-win-crt-private-l1-1-0.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Debug/api-ms-win-crt-process-l1-1-0.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Debug/api-ms-win-crt-runtime-l1-1-0.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Debug/api-ms-win-crt-stdio-l1-1-0.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Debug/api-ms-win-crt-string-l1-1-0.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Debug/api-ms-win-crt-time-l1-1-0.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Debug/api-ms-win-crt-utility-l1-1-0.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Debug/api-ms-win-downlevel-kernel32-l2-1-0.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Debug/api-ms-win-eventing-provider-l1-1-0.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Debug/concrt140.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Debug/d3dcompiler_47.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Debug/libc++.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Debug/libEGL.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Debug/libGLESv2.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Debug/msvcp140.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Debug/msvcp140_1.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Debug/msvcp140_2.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Debug/msvcp140_atomic_wait.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Debug/msvcp140_codecvt_ids.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Debug/ucrtbase.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Debug/ucrtbased.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Debug/vccorlib140.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Debug/vccorlib140d.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Debug/vcruntime140.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Debug/vcruntime140d.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Debug/vcruntime140_1.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Debug/vcruntime140_1d.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Debug/vk_swiftshader.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Debug/vulkan-1.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Debug/zlib.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Debug/media_kit_video_plugin.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Debug/screen_brightness_windows_plugin.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Debug/screen_retriever_windows_plugin.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Debug/window_manager_plugin.dll")
    if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    file(INSTALL DESTINATION "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Debug" TYPE FILE FILES
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/plugins/media_kit_libs_windows_video/Debug/media_kit_libs_windows_video_plugin.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/libmpv/libmpv-2.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/ANGLE/api-ms-win-core-console-l1-1-0.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/ANGLE/api-ms-win-core-console-l1-2-0.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/ANGLE/api-ms-win-core-datetime-l1-1-0.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/ANGLE/api-ms-win-core-debug-l1-1-0.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/ANGLE/api-ms-win-core-errorhandling-l1-1-0.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/ANGLE/api-ms-win-core-fibers-l1-1-0.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/ANGLE/api-ms-win-core-file-l1-1-0.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/ANGLE/api-ms-win-core-file-l1-2-0.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/ANGLE/api-ms-win-core-file-l2-1-0.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/ANGLE/api-ms-win-core-handle-l1-1-0.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/ANGLE/api-ms-win-core-heap-l1-1-0.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/ANGLE/api-ms-win-core-interlocked-l1-1-0.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/ANGLE/api-ms-win-core-libraryloader-l1-1-0.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/ANGLE/api-ms-win-core-localization-l1-2-0.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/ANGLE/api-ms-win-core-memory-l1-1-0.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/ANGLE/api-ms-win-core-namedpipe-l1-1-0.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/ANGLE/api-ms-win-core-processenvironment-l1-1-0.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/ANGLE/api-ms-win-core-processthreads-l1-1-0.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/ANGLE/api-ms-win-core-processthreads-l1-1-1.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/ANGLE/api-ms-win-core-profile-l1-1-0.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/ANGLE/api-ms-win-core-rtlsupport-l1-1-0.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/ANGLE/api-ms-win-core-string-l1-1-0.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/ANGLE/api-ms-win-core-synch-l1-1-0.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/ANGLE/api-ms-win-core-synch-l1-2-0.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/ANGLE/api-ms-win-core-sysinfo-l1-1-0.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/ANGLE/api-ms-win-core-timezone-l1-1-0.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/ANGLE/api-ms-win-core-util-l1-1-0.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/ANGLE/api-ms-win-crt-conio-l1-1-0.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/ANGLE/api-ms-win-crt-convert-l1-1-0.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/ANGLE/api-ms-win-crt-environment-l1-1-0.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/ANGLE/api-ms-win-crt-filesystem-l1-1-0.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/ANGLE/api-ms-win-crt-heap-l1-1-0.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/ANGLE/api-ms-win-crt-locale-l1-1-0.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/ANGLE/api-ms-win-crt-math-l1-1-0.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/ANGLE/api-ms-win-crt-multibyte-l1-1-0.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/ANGLE/api-ms-win-crt-private-l1-1-0.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/ANGLE/api-ms-win-crt-process-l1-1-0.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/ANGLE/api-ms-win-crt-runtime-l1-1-0.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/ANGLE/api-ms-win-crt-stdio-l1-1-0.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/ANGLE/api-ms-win-crt-string-l1-1-0.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/ANGLE/api-ms-win-crt-time-l1-1-0.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/ANGLE/api-ms-win-crt-utility-l1-1-0.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/ANGLE/api-ms-win-downlevel-kernel32-l2-1-0.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/ANGLE/api-ms-win-eventing-provider-l1-1-0.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/ANGLE/concrt140.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/ANGLE/d3dcompiler_47.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/ANGLE/libc++.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/ANGLE/libEGL.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/ANGLE/libGLESv2.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/ANGLE/msvcp140.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/ANGLE/msvcp140_1.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/ANGLE/msvcp140_2.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/ANGLE/msvcp140_atomic_wait.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/ANGLE/msvcp140_codecvt_ids.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/ANGLE/ucrtbase.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/ANGLE/ucrtbased.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/ANGLE/vccorlib140.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/ANGLE/vccorlib140d.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/ANGLE/vcruntime140.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/ANGLE/vcruntime140d.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/ANGLE/vcruntime140_1.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/ANGLE/vcruntime140_1d.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/ANGLE/vk_swiftshader.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/ANGLE/vulkan-1.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/ANGLE/zlib.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/plugins/media_kit_video/Debug/media_kit_video_plugin.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/plugins/screen_brightness_windows/Debug/screen_brightness_windows_plugin.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/plugins/screen_retriever_windows/Debug/screen_retriever_windows_plugin.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/plugins/window_manager/Debug/window_manager_plugin.dll"
      )
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Pp][Rr][Oo][Ff][Ii][Ll][Ee])$")
    list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
     "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Profile/media_kit_libs_windows_video_plugin.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Profile/libmpv-2.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Profile/api-ms-win-core-console-l1-1-0.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Profile/api-ms-win-core-console-l1-2-0.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Profile/api-ms-win-core-datetime-l1-1-0.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Profile/api-ms-win-core-debug-l1-1-0.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Profile/api-ms-win-core-errorhandling-l1-1-0.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Profile/api-ms-win-core-fibers-l1-1-0.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Profile/api-ms-win-core-file-l1-1-0.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Profile/api-ms-win-core-file-l1-2-0.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Profile/api-ms-win-core-file-l2-1-0.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Profile/api-ms-win-core-handle-l1-1-0.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Profile/api-ms-win-core-heap-l1-1-0.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Profile/api-ms-win-core-interlocked-l1-1-0.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Profile/api-ms-win-core-libraryloader-l1-1-0.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Profile/api-ms-win-core-localization-l1-2-0.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Profile/api-ms-win-core-memory-l1-1-0.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Profile/api-ms-win-core-namedpipe-l1-1-0.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Profile/api-ms-win-core-processenvironment-l1-1-0.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Profile/api-ms-win-core-processthreads-l1-1-0.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Profile/api-ms-win-core-processthreads-l1-1-1.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Profile/api-ms-win-core-profile-l1-1-0.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Profile/api-ms-win-core-rtlsupport-l1-1-0.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Profile/api-ms-win-core-string-l1-1-0.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Profile/api-ms-win-core-synch-l1-1-0.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Profile/api-ms-win-core-synch-l1-2-0.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Profile/api-ms-win-core-sysinfo-l1-1-0.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Profile/api-ms-win-core-timezone-l1-1-0.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Profile/api-ms-win-core-util-l1-1-0.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Profile/api-ms-win-crt-conio-l1-1-0.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Profile/api-ms-win-crt-convert-l1-1-0.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Profile/api-ms-win-crt-environment-l1-1-0.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Profile/api-ms-win-crt-filesystem-l1-1-0.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Profile/api-ms-win-crt-heap-l1-1-0.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Profile/api-ms-win-crt-locale-l1-1-0.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Profile/api-ms-win-crt-math-l1-1-0.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Profile/api-ms-win-crt-multibyte-l1-1-0.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Profile/api-ms-win-crt-private-l1-1-0.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Profile/api-ms-win-crt-process-l1-1-0.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Profile/api-ms-win-crt-runtime-l1-1-0.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Profile/api-ms-win-crt-stdio-l1-1-0.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Profile/api-ms-win-crt-string-l1-1-0.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Profile/api-ms-win-crt-time-l1-1-0.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Profile/api-ms-win-crt-utility-l1-1-0.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Profile/api-ms-win-downlevel-kernel32-l2-1-0.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Profile/api-ms-win-eventing-provider-l1-1-0.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Profile/concrt140.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Profile/d3dcompiler_47.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Profile/libc++.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Profile/libEGL.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Profile/libGLESv2.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Profile/msvcp140.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Profile/msvcp140_1.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Profile/msvcp140_2.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Profile/msvcp140_atomic_wait.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Profile/msvcp140_codecvt_ids.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Profile/ucrtbase.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Profile/ucrtbased.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Profile/vccorlib140.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Profile/vccorlib140d.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Profile/vcruntime140.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Profile/vcruntime140d.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Profile/vcruntime140_1.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Profile/vcruntime140_1d.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Profile/vk_swiftshader.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Profile/vulkan-1.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Profile/zlib.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Profile/media_kit_video_plugin.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Profile/screen_brightness_windows_plugin.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Profile/screen_retriever_windows_plugin.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Profile/window_manager_plugin.dll")
    if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    file(INSTALL DESTINATION "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Profile" TYPE FILE FILES
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/plugins/media_kit_libs_windows_video/Profile/media_kit_libs_windows_video_plugin.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/libmpv/libmpv-2.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/ANGLE/api-ms-win-core-console-l1-1-0.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/ANGLE/api-ms-win-core-console-l1-2-0.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/ANGLE/api-ms-win-core-datetime-l1-1-0.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/ANGLE/api-ms-win-core-debug-l1-1-0.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/ANGLE/api-ms-win-core-errorhandling-l1-1-0.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/ANGLE/api-ms-win-core-fibers-l1-1-0.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/ANGLE/api-ms-win-core-file-l1-1-0.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/ANGLE/api-ms-win-core-file-l1-2-0.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/ANGLE/api-ms-win-core-file-l2-1-0.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/ANGLE/api-ms-win-core-handle-l1-1-0.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/ANGLE/api-ms-win-core-heap-l1-1-0.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/ANGLE/api-ms-win-core-interlocked-l1-1-0.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/ANGLE/api-ms-win-core-libraryloader-l1-1-0.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/ANGLE/api-ms-win-core-localization-l1-2-0.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/ANGLE/api-ms-win-core-memory-l1-1-0.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/ANGLE/api-ms-win-core-namedpipe-l1-1-0.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/ANGLE/api-ms-win-core-processenvironment-l1-1-0.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/ANGLE/api-ms-win-core-processthreads-l1-1-0.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/ANGLE/api-ms-win-core-processthreads-l1-1-1.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/ANGLE/api-ms-win-core-profile-l1-1-0.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/ANGLE/api-ms-win-core-rtlsupport-l1-1-0.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/ANGLE/api-ms-win-core-string-l1-1-0.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/ANGLE/api-ms-win-core-synch-l1-1-0.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/ANGLE/api-ms-win-core-synch-l1-2-0.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/ANGLE/api-ms-win-core-sysinfo-l1-1-0.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/ANGLE/api-ms-win-core-timezone-l1-1-0.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/ANGLE/api-ms-win-core-util-l1-1-0.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/ANGLE/api-ms-win-crt-conio-l1-1-0.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/ANGLE/api-ms-win-crt-convert-l1-1-0.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/ANGLE/api-ms-win-crt-environment-l1-1-0.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/ANGLE/api-ms-win-crt-filesystem-l1-1-0.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/ANGLE/api-ms-win-crt-heap-l1-1-0.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/ANGLE/api-ms-win-crt-locale-l1-1-0.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/ANGLE/api-ms-win-crt-math-l1-1-0.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/ANGLE/api-ms-win-crt-multibyte-l1-1-0.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/ANGLE/api-ms-win-crt-private-l1-1-0.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/ANGLE/api-ms-win-crt-process-l1-1-0.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/ANGLE/api-ms-win-crt-runtime-l1-1-0.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/ANGLE/api-ms-win-crt-stdio-l1-1-0.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/ANGLE/api-ms-win-crt-string-l1-1-0.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/ANGLE/api-ms-win-crt-time-l1-1-0.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/ANGLE/api-ms-win-crt-utility-l1-1-0.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/ANGLE/api-ms-win-downlevel-kernel32-l2-1-0.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/ANGLE/api-ms-win-eventing-provider-l1-1-0.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/ANGLE/concrt140.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/ANGLE/d3dcompiler_47.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/ANGLE/libc++.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/ANGLE/libEGL.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/ANGLE/libGLESv2.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/ANGLE/msvcp140.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/ANGLE/msvcp140_1.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/ANGLE/msvcp140_2.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/ANGLE/msvcp140_atomic_wait.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/ANGLE/msvcp140_codecvt_ids.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/ANGLE/ucrtbase.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/ANGLE/ucrtbased.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/ANGLE/vccorlib140.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/ANGLE/vccorlib140d.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/ANGLE/vcruntime140.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/ANGLE/vcruntime140d.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/ANGLE/vcruntime140_1.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/ANGLE/vcruntime140_1d.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/ANGLE/vk_swiftshader.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/ANGLE/vulkan-1.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/ANGLE/zlib.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/plugins/media_kit_video/Profile/media_kit_video_plugin.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/plugins/screen_brightness_windows/Profile/screen_brightness_windows_plugin.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/plugins/screen_retriever_windows/Profile/screen_retriever_windows_plugin.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/plugins/window_manager/Profile/window_manager_plugin.dll"
      )
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
     "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Release/media_kit_libs_windows_video_plugin.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Release/libmpv-2.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Release/api-ms-win-core-console-l1-1-0.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Release/api-ms-win-core-console-l1-2-0.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Release/api-ms-win-core-datetime-l1-1-0.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Release/api-ms-win-core-debug-l1-1-0.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Release/api-ms-win-core-errorhandling-l1-1-0.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Release/api-ms-win-core-fibers-l1-1-0.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Release/api-ms-win-core-file-l1-1-0.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Release/api-ms-win-core-file-l1-2-0.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Release/api-ms-win-core-file-l2-1-0.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Release/api-ms-win-core-handle-l1-1-0.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Release/api-ms-win-core-heap-l1-1-0.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Release/api-ms-win-core-interlocked-l1-1-0.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Release/api-ms-win-core-libraryloader-l1-1-0.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Release/api-ms-win-core-localization-l1-2-0.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Release/api-ms-win-core-memory-l1-1-0.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Release/api-ms-win-core-namedpipe-l1-1-0.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Release/api-ms-win-core-processenvironment-l1-1-0.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Release/api-ms-win-core-processthreads-l1-1-0.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Release/api-ms-win-core-processthreads-l1-1-1.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Release/api-ms-win-core-profile-l1-1-0.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Release/api-ms-win-core-rtlsupport-l1-1-0.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Release/api-ms-win-core-string-l1-1-0.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Release/api-ms-win-core-synch-l1-1-0.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Release/api-ms-win-core-synch-l1-2-0.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Release/api-ms-win-core-sysinfo-l1-1-0.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Release/api-ms-win-core-timezone-l1-1-0.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Release/api-ms-win-core-util-l1-1-0.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Release/api-ms-win-crt-conio-l1-1-0.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Release/api-ms-win-crt-convert-l1-1-0.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Release/api-ms-win-crt-environment-l1-1-0.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Release/api-ms-win-crt-filesystem-l1-1-0.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Release/api-ms-win-crt-heap-l1-1-0.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Release/api-ms-win-crt-locale-l1-1-0.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Release/api-ms-win-crt-math-l1-1-0.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Release/api-ms-win-crt-multibyte-l1-1-0.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Release/api-ms-win-crt-private-l1-1-0.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Release/api-ms-win-crt-process-l1-1-0.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Release/api-ms-win-crt-runtime-l1-1-0.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Release/api-ms-win-crt-stdio-l1-1-0.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Release/api-ms-win-crt-string-l1-1-0.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Release/api-ms-win-crt-time-l1-1-0.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Release/api-ms-win-crt-utility-l1-1-0.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Release/api-ms-win-downlevel-kernel32-l2-1-0.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Release/api-ms-win-eventing-provider-l1-1-0.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Release/concrt140.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Release/d3dcompiler_47.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Release/libc++.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Release/libEGL.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Release/libGLESv2.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Release/msvcp140.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Release/msvcp140_1.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Release/msvcp140_2.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Release/msvcp140_atomic_wait.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Release/msvcp140_codecvt_ids.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Release/ucrtbase.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Release/ucrtbased.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Release/vccorlib140.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Release/vccorlib140d.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Release/vcruntime140.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Release/vcruntime140d.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Release/vcruntime140_1.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Release/vcruntime140_1d.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Release/vk_swiftshader.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Release/vulkan-1.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Release/zlib.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Release/media_kit_video_plugin.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Release/screen_brightness_windows_plugin.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Release/screen_retriever_windows_plugin.dll;D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Release/window_manager_plugin.dll")
    if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    file(INSTALL DESTINATION "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Release" TYPE FILE FILES
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/plugins/media_kit_libs_windows_video/Release/media_kit_libs_windows_video_plugin.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/libmpv/libmpv-2.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/ANGLE/api-ms-win-core-console-l1-1-0.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/ANGLE/api-ms-win-core-console-l1-2-0.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/ANGLE/api-ms-win-core-datetime-l1-1-0.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/ANGLE/api-ms-win-core-debug-l1-1-0.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/ANGLE/api-ms-win-core-errorhandling-l1-1-0.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/ANGLE/api-ms-win-core-fibers-l1-1-0.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/ANGLE/api-ms-win-core-file-l1-1-0.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/ANGLE/api-ms-win-core-file-l1-2-0.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/ANGLE/api-ms-win-core-file-l2-1-0.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/ANGLE/api-ms-win-core-handle-l1-1-0.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/ANGLE/api-ms-win-core-heap-l1-1-0.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/ANGLE/api-ms-win-core-interlocked-l1-1-0.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/ANGLE/api-ms-win-core-libraryloader-l1-1-0.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/ANGLE/api-ms-win-core-localization-l1-2-0.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/ANGLE/api-ms-win-core-memory-l1-1-0.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/ANGLE/api-ms-win-core-namedpipe-l1-1-0.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/ANGLE/api-ms-win-core-processenvironment-l1-1-0.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/ANGLE/api-ms-win-core-processthreads-l1-1-0.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/ANGLE/api-ms-win-core-processthreads-l1-1-1.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/ANGLE/api-ms-win-core-profile-l1-1-0.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/ANGLE/api-ms-win-core-rtlsupport-l1-1-0.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/ANGLE/api-ms-win-core-string-l1-1-0.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/ANGLE/api-ms-win-core-synch-l1-1-0.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/ANGLE/api-ms-win-core-synch-l1-2-0.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/ANGLE/api-ms-win-core-sysinfo-l1-1-0.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/ANGLE/api-ms-win-core-timezone-l1-1-0.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/ANGLE/api-ms-win-core-util-l1-1-0.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/ANGLE/api-ms-win-crt-conio-l1-1-0.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/ANGLE/api-ms-win-crt-convert-l1-1-0.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/ANGLE/api-ms-win-crt-environment-l1-1-0.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/ANGLE/api-ms-win-crt-filesystem-l1-1-0.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/ANGLE/api-ms-win-crt-heap-l1-1-0.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/ANGLE/api-ms-win-crt-locale-l1-1-0.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/ANGLE/api-ms-win-crt-math-l1-1-0.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/ANGLE/api-ms-win-crt-multibyte-l1-1-0.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/ANGLE/api-ms-win-crt-private-l1-1-0.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/ANGLE/api-ms-win-crt-process-l1-1-0.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/ANGLE/api-ms-win-crt-runtime-l1-1-0.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/ANGLE/api-ms-win-crt-stdio-l1-1-0.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/ANGLE/api-ms-win-crt-string-l1-1-0.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/ANGLE/api-ms-win-crt-time-l1-1-0.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/ANGLE/api-ms-win-crt-utility-l1-1-0.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/ANGLE/api-ms-win-downlevel-kernel32-l2-1-0.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/ANGLE/api-ms-win-eventing-provider-l1-1-0.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/ANGLE/concrt140.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/ANGLE/d3dcompiler_47.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/ANGLE/libc++.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/ANGLE/libEGL.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/ANGLE/libGLESv2.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/ANGLE/msvcp140.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/ANGLE/msvcp140_1.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/ANGLE/msvcp140_2.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/ANGLE/msvcp140_atomic_wait.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/ANGLE/msvcp140_codecvt_ids.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/ANGLE/ucrtbase.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/ANGLE/ucrtbased.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/ANGLE/vccorlib140.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/ANGLE/vccorlib140d.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/ANGLE/vcruntime140.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/ANGLE/vcruntime140d.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/ANGLE/vcruntime140_1.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/ANGLE/vcruntime140_1d.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/ANGLE/vk_swiftshader.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/ANGLE/vulkan-1.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/ANGLE/zlib.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/plugins/media_kit_video/Release/media_kit_video_plugin.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/plugins/screen_brightness_windows/Release/screen_brightness_windows_plugin.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/plugins/screen_retriever_windows/Release/screen_retriever_windows_plugin.dll"
      "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/plugins/window_manager/Release/window_manager_plugin.dll"
      )
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Runtime" OR NOT CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
     "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Debug/")
    if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    file(INSTALL DESTINATION "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Debug" TYPE DIRECTORY FILES "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/native_assets/windows/")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Pp][Rr][Oo][Ff][Ii][Ll][Ee])$")
    list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
     "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Profile/")
    if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    file(INSTALL DESTINATION "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Profile" TYPE DIRECTORY FILES "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/native_assets/windows/")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
     "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Release/")
    if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    file(INSTALL DESTINATION "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Release" TYPE DIRECTORY FILES "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/native_assets/windows/")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Runtime" OR NOT CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    
  file(REMOVE_RECURSE "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Debug/data/flutter_assets")
  
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Pp][Rr][Oo][Ff][Ii][Ll][Ee])$")
    
  file(REMOVE_RECURSE "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Profile/data/flutter_assets")
  
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    
  file(REMOVE_RECURSE "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Release/data/flutter_assets")
  
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Runtime" OR NOT CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
     "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Debug/data/flutter_assets")
    if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    file(INSTALL DESTINATION "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Debug/data" TYPE DIRECTORY FILES "D:/Work/Kmong/CampusView/flutter_application_campus_view/build//flutter_assets")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Pp][Rr][Oo][Ff][Ii][Ll][Ee])$")
    list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
     "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Profile/data/flutter_assets")
    if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    file(INSTALL DESTINATION "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Profile/data" TYPE DIRECTORY FILES "D:/Work/Kmong/CampusView/flutter_application_campus_view/build//flutter_assets")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
     "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Release/data/flutter_assets")
    if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    file(INSTALL DESTINATION "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Release/data" TYPE DIRECTORY FILES "D:/Work/Kmong/CampusView/flutter_application_campus_view/build//flutter_assets")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Runtime" OR NOT CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Pp][Rr][Oo][Ff][Ii][Ll][Ee])$")
    list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
     "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Profile/data/app.so")
    if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    file(INSTALL DESTINATION "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Profile/data" TYPE FILE FILES "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/app.so")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
     "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Release/data/app.so")
    if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    file(INSTALL DESTINATION "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/runner/Release/data" TYPE FILE FILES "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/app.so")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT)
  set(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INSTALL_COMPONENT}.txt")
else()
  set(CMAKE_INSTALL_MANIFEST "install_manifest.txt")
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
file(WRITE "D:/Work/Kmong/CampusView/flutter_application_campus_view/build/windows/x64/${CMAKE_INSTALL_MANIFEST}"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
