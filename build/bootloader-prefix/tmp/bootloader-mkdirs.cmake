# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file Copyright.txt or https://cmake.org/licensing for details.

cmake_minimum_required(VERSION 3.5)

file(MAKE_DIRECTORY
  "/home/yukari/esp-idf-v4.4/components/bootloader/subproject"
  "/home/yukari/esp-idf-v4.4/wind_anemometer/build/bootloader"
  "/home/yukari/esp-idf-v4.4/wind_anemometer/build/bootloader-prefix"
  "/home/yukari/esp-idf-v4.4/wind_anemometer/build/bootloader-prefix/tmp"
  "/home/yukari/esp-idf-v4.4/wind_anemometer/build/bootloader-prefix/src/bootloader-stamp"
  "/home/yukari/esp-idf-v4.4/wind_anemometer/build/bootloader-prefix/src"
  "/home/yukari/esp-idf-v4.4/wind_anemometer/build/bootloader-prefix/src/bootloader-stamp"
)

set(configSubDirs )
foreach(subDir IN LISTS configSubDirs)
    file(MAKE_DIRECTORY "/home/yukari/esp-idf-v4.4/wind_anemometer/build/bootloader-prefix/src/bootloader-stamp/${subDir}")
endforeach()
if(cfgdir)
  file(MAKE_DIRECTORY "/home/yukari/esp-idf-v4.4/wind_anemometer/build/bootloader-prefix/src/bootloader-stamp${cfgdir}") # cfgdir has leading slash
endif()
