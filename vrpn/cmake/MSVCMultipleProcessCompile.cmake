# - Compile with multiple processes on MSVC
#
#  include(MSVCMultipleProcessCompile)
#
# Requires these CMake modules:
#  ListCombinations.cmake
#
# Original Author:
# 2009-2010 Ryan Pavlik <rpavlik@iastate.edu> <abiryan@ryand.net>
# http://academic.cleardefinition.com
# Iowa State University HCI Graduate Program/VRAC

if(MSVC AND NOT MSVC71)
	string(TOUPPER "${CMAKE_CONFIGURATION_TYPES}" _conftypesUC)
	include(ListCombinations)
	list_combinations(_varnames
		PREFIXES
		CMAKE_C_FLAGS_
		CMAKE_CXX_FLAGS_
		SUFFIXES
		${_conftypesUC})
	foreach(_var ${_varnames})
		set(${_var} "${${_var}} /MP")
	endforeach()
endif()