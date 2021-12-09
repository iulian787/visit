#/Users/allen/Projects/VisIt/Thirdparty/trunk/third_party/cmake/3.19.5/i386-apple-darwin20_clang/bin/cmake
##
## ../../git/clean/visit/src/tools/dev/scripts/build_visit generated host.cmake
## created: Mon May  3 10:53:58 MDT 2021
## system: Darwin wortchiller 20.3.0 Darwin Kernel Version 20.3.0: Thu Jan 21 00:07:06 PST 2021; root:xnu-7195.81.3~1/RELEASE_X86_64 x86_64
## by: allen

VISIT_OPTION_DEFAULT(CMAKE_INSTALL_PREFIX /Users/allen/Projects/VisIt/Install TYPE FILEPATH)
VISIT_OPTION_DEFAULT(VISIT_CREATE_APPBUNDLE_PACKAGE ON TYPE BOOL)

##
## Setup VISITHOME & VISITARCH variables.
##
SET(VISITHOME /Users/allen/Projects/VisIt/Thirdparty/trunk/third_party)
SET(VISITARCH i386-apple-darwin20_clang)

##
## Debug build
##
#
# Do the following to get a debug version
#cmake  -DCMAKE_BUILD_TYPE:STRING=Debug ../src
#SET(CMAKE_BUILD_TYPE Debug CACHE STRING "")

## Compiler flags.
##
VISIT_OPTION_DEFAULT(VISIT_C_COMPILER clang TYPE FILEPATH)
VISIT_OPTION_DEFAULT(VISIT_CXX_COMPILER clang++ TYPE FILEPATH)
VISIT_OPTION_DEFAULT(VISIT_FORTRAN_COMPILER /usr/local/bin/gfortran TYPE FILEPATH)
VISIT_OPTION_DEFAULT(VISIT_C_FLAGS "-fno-common -fexceptions" TYPE STRING)
VISIT_OPTION_DEFAULT(VISIT_CXX_FLAGS "-fno-common -fexceptions" TYPE STRING)

##
## Parallel Build Setup.
##
VISIT_OPTION_DEFAULT(VISIT_PARALLEL ON TYPE BOOL)
## (configured w/ mpi compiler wrapper)
VISIT_OPTION_DEFAULT(VISIT_MPI_COMPILER ${VISIT_MPICH_DIR}/bin/mpicc TYPE FILEPATH)

##
## VisIt Thread Option
##
VISIT_OPTION_DEFAULT(VISIT_THREAD OFF TYPE BOOL)

##############################################################
##
## Database reader plugin support libraries
##
## The HDF4, HDF5 and NetCDF libraries must be first so that
## their libdeps are defined for any plugins that need them.
##
## For libraries with LIBDEP settings, order matters.
## Libraries with LIBDEP settings that depend on other
## Library's LIBDEP settings must come after them.
##############################################################
##

##
## ZLIB
##
SETUP_APP_VERSION(ZLIB 1.2.11)
VISIT_OPTION_DEFAULT(VISIT_ZLIB_DIR ${VISITHOME}/zlib/${ZLIB_VERSION}/${VISITARCH})

##
## OPENSSL 
##
VISIT_OPTION_DEFAULT(VISIT_OPENSSL_DIR ${VISITHOME}/openssl/1.0.2j/${VISITARCH})

##
## Python
##
VISIT_OPTION_DEFAULT(VISIT_PYTHON_DIR ${VISITHOME}/python/3.7.7/${VISITARCH})

##
## Qt
##
SETUP_APP_VERSION(QT 5.14.2)
VISIT_OPTION_DEFAULT(VISIT_QT_DIR ${VISITHOME}/qt/${QT_VERSION}/${VISITARCH})

##
## QWT
##
SETUP_APP_VERSION(QWT 6.1.2)
VISIT_OPTION_DEFAULT(VISIT_QWT_DIR ${VISITHOME}/qwt/${QWT_VERSION}/${VISITARCH})

##
## OSPRay
##
SETUP_APP_VERSION(OSPRAY 2.8.0)
VISIT_OPTION_DEFAULT(VISIT_OSPRAY_DIR ${VISITHOME}/ospray/${OSPRAY_VERSION}/${VISITARCH}/ospray)

##
## VTK
##
SETUP_APP_VERSION(VTK 9.1.0)
VISIT_OPTION_DEFAULT(VISIT_VTK_DIR ${VISITHOME}/vtk/${VTK_VERSION}/${VISITARCH})
VISIT_OPTION_DEFAULT(VISIT_VTK_INCDEP ZLIB_INCLUDE_DIR)
VISIT_OPTION_DEFAULT(VISIT_VTK_LIBDEP ZLIB_LIBRARY)

##
## MPICH
##
SETUP_APP_VERSION(MPICH 3.4.1)
VISIT_OPTION_DEFAULT(VISIT_MPICH_DIR ${VISITHOME}/mpich/${MPICH_VERSION}/${VISITARCH})
VISIT_OPTION_DEFAULT(VISIT_MPICH_INSTALL ON TYPE BOOL)

# Tell VisIt the parallel compiler so it can deduce parallel flags
VISIT_OPTION_DEFAULT(VISIT_MPI_COMPILER ${VISIT_MPICH_DIR}/bin/mpicc TYPE FILEPATH)
VISIT_OPTION_DEFAULT(VISIT_PARALLEL ON TYPE BOOL)

##
## SZIP
##
VISIT_OPTION_DEFAULT(VISIT_SZIP_DIR ${VISITHOME}/szip/2.1/${VISITARCH})

##
## HDF5
##
VISIT_OPTION_DEFAULT(VISIT_HDF5_DIR ${VISITHOME}/hdf5/1.10.7/${VISITARCH})
VISIT_OPTION_DEFAULT(VISIT_HDF5_LIBDEP ${VISITHOME}/szip/2.1/${VISITARCH}/lib sz ${VISITHOME}/zlib/${ZLIB_VERSION}/${VISITARCH}/lib z TYPE STRING)

##
## ADIOS
## (configured w/ mpi compiler wrapper)
##
SETUP_APP_VERSION(ADIOS 1.13.1)
VISIT_OPTION_DEFAULT(VISIT_ADIOS_DIR ${VISITHOME}/adios/${ADIOS_VERSION}/${VISITARCH})

##
## ADIOS2
##
SETUP_APP_VERSION(ADIOS2 2.5.0)
VISIT_OPTION_DEFAULT(VISIT_ADIOS2_DIR ${VISITHOME}/adios2-ser/${ADIOS2_VERSION}/${VISITARCH})
## (configured w/ mpi compiler wrapper)
VISIT_OPTION_DEFAULT(VISIT_ADIOS2_PAR_DIR ${VISITHOME}/adios2-par/${ADIOS2_VERSION}/${VISITARCH})

##
## BOOST
##
SETUP_APP_VERSION(BOOST 1_75_0)
VISIT_OPTION_DEFAULT(VISIT_BOOST_DIR ${VISITHOME}/boost/${BOOST_VERSION}/${VISITARCH})

##
## Boxlib
##
VISIT_OPTION_DEFAULT(VISIT_BOXLIB_DIR ${VISITHOME}/boxlib/1.3.5/${VISITARCH})

##
## Conduit
##
VISIT_OPTION_DEFAULT(VISIT_CONDUIT_DIR ${VISITHOME}/conduit/v0.7.1/${VISITARCH})
VISIT_OPTION_DEFAULT(VISIT_CONDUIT_LIBDEP HDF5_LIBRARY_DIR hdf5 ${VISIT_HDF5_LIBDEP} TYPE STRING)

##
## CFITSIO
##
#VISIT_OPTION_DEFAULT(VISIT_CFITSIO_DIR ${VISITHOME}/cfitsio/3006/${VISITARCH})

##
## CGNS
##
#VISIT_OPTION_DEFAULT(VISIT_CGNS_DIR ${VISITHOME}/cgns/3.2.1/${VISITARCH})
#VISIT_OPTION_DEFAULT(VISIT_CGNS_LIBDEP HDF5_LIBRARY_DIR hdf5 ${VISIT_HDF5_LIBDEP} TYPE STRING)

##
## FMS 
##
VISIT_OPTION_DEFAULT(VISIT_FMS_DIR ${VISITHOME}/fms/100/${VISITARCH})
VISIT_OPTION_DEFAULT(VISIT_FMS_LIBDEP CONDUIT_LIBRARY_DIR conduit CONDUIT_LIBRARY_DIR conduit_blueprint CONDUIT_LIBRARY_DIR conduit_relay ${VISIT_CONDUIT_LIBDEP} TYPE STRING)

##
## GDAL
##
#VISIT_OPTION_DEFAULT(VISIT_GDAL_DIR ${VISITHOME}/gdal/2.2.4/${VISITARCH})

##
## H5Part
##
#SETUP_APP_VERSION(H5PART 1.6.6)
#VISIT_OPTION_DEFAULT(VISIT_H5PART_DIR ${VISITHOME}/h5part/${H5PART_VERSION}/${VISITARCH})
#VISIT_OPTION_DEFAULT(VISIT_H5PART_LIBDEP HDF5_LIBRARY_DIR hdf5 ${VISIT_HDF5_LIBDEP} TYPE STRING)

##
## Ice-T
##
VISIT_OPTION_DEFAULT(VISIT_ICET_DIR ${VISITHOME}/icet/77c708f9090236b576669b74c53e9f105eedbd7e/${VISITARCH})

##
## LLVM
##
VISIT_OPTION_DEFAULT(VISIT_LLVM_DIR ${VISITHOME}/llvm/12.0.0/${VISITARCH})

##
## MFEM 
##
VISIT_OPTION_DEFAULT(VISIT_MFEM_DIR ${VISITHOME}/mfem/Add_FMS_support/${VISITARCH})
VISIT_OPTION_DEFAULT(VISIT_MFEM_INCDEP CONDUIT_INCLUDE_DIR FMS_INCLUDE_DIR TYPE STRING)
VISIT_OPTION_DEFAULT(VISIT_MFEM_LIBDEP ${VISIT_CONDUIT_LIBDEP} ${VISITHOME}/zlib/${ZLIB_VERSION}/${VISITARCH}/lib z TYPE STRING)

##
## Nektar++
##
SETUP_APP_VERSION(NEKTAR++ 5.0.0)
VISIT_OPTION_DEFAULT(VISIT_NEKTAR++_DIR ${VISITHOME}/nektar++/${NEKTAR++_VERSION}/${VISITARCH})
VISIT_OPTION_DEFAULT(VISIT_NEKTAR++_LIBDEP ${VISITHOME}/zlib/${ZLIB_VERSION}/${VISITARCH}/lib z TYPE STRING)

##
## NetCDF
##
#VISIT_OPTION_DEFAULT(VISIT_NETCDF_DIR ${VISITHOME}/netcdf/4.1.1/${VISITARCH})
#VISIT_OPTION_DEFAULT(VISIT_NETCDF_LIBDEP HDF5_LIBRARY_DIR hdf5_hl HDF5_LIBRARY_DIR hdf5 ${VISIT_HDF5_LIBDEP} TYP#E STRING)

##
## OpenEXR
##
VISIT_OPTION_DEFAULT(VISIT_OPENEXR_DIR ${VISITHOME}/openexr/2.2.0/${VISITARCH})

##
## OPENVKL
##
SETUP_APP_VERSION(OPENVKL 0.12.0)
VISIT_OPTION_DEFAULT(openvkl_DIR ${VISITHOME}/openvkl/0.12.0/${VISITARCH}/lib/cmake/openvkl-0.12.0)
VISIT_OPTION_DEFAULT(VISIT_OPENVKL_DIR ${VISITHOME}/openvkl/0.12.0/${VISITARCH})

##
## P7ZIP
##
VISIT_OPTION_DEFAULT(VISIT_SEVEN_ZIP_DIR ${VISITHOME}/p7zip/16.02/${VISITARCH})

##
## PIDX
##
#SETUP_APP_VERSION(PIDX 0.9.3)
#VISIT_OPTION_DEFAULT(VISIT_PIDX_DIR ${VISITHOME}/pidx/${PIDX_VERSION}/${VISITARCH})

##
## PySide
##
# version is needed by VisIt's Find module.
set(PYSIDE_VERSION 5.14.2)
VISIT_OPTION_DEFAULT(VISIT_PYSIDE_DIR ${VISITHOME}/pyside/${PYSIDE_VERSION}/${VISITARCH})

##
## Silo
##
#VISIT_OPTION_DEFAULT(VISIT_SILO_DIR ${VISITHOME}/silo/4.10.2/${VISITARCH})
#VISIT_OPTION_DEFAULT(VISIT_SILO_LIBDEP HDF5_LIBRARY_DIR hdf5 ${VISIT_HDF5_LIBDEP} ZLIB_LIBRARY_DIR z TYPE STRING)

##
## Uintah
##
#SETUP_APP_VERSION(UINTAH 2.6.1)
#VISIT_OPTION_DEFAULT(VISIT_UINTAH_DIR ${VISITHOME}/uintah/${UINTAH_VERSION}/${VISITARCH})

SETUP_APP_VERSION(UINTAH 2.7.0)
VISIT_OPTION_DEFAULT(VISIT_UINTAH_DIR /Users/allen/Projects/Uintah/Uintah/build)
SET(VISIT_USE_SYSTEM_UINTAH TRUE)

##
## Xdmf
##
#VISIT_OPTION_DEFAULT(VISIT_XDMF_DIR ${VISITHOME}/Xdmf/2.1.1/${VISITARCH})
#VISIT_OPTION_DEFAULT(VISIT_XDMF_LIBDEP HDF5_LIBRARY_DIR hdf5  VTK_LIBRARY_DIRS vtklibxml2-${VTK_MAJOR_VERSION}.${VTK_MINOR_VERSION}  TYPE STRING)
