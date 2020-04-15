##
## Setup VISITHOME variables.
##
SET(VISITHOME /home/biagas2/BuildVisIt/VTK9/third_party)
SET(VISITARCH linux-x86_64_gcc-6.3)

## Compiler flags.
##
VISIT_OPTION_DEFAULT(VISIT_C_COMPILER gcc TYPE FILEPATH)
VISIT_OPTION_DEFAULT(VISIT_CXX_COMPILER g++ TYPE FILEPATH)
VISIT_OPTION_DEFAULT(VISIT_FORTRAN_COMPILER no TYPE FILEPATH)
VISIT_OPTION_DEFAULT(VISIT_C_FLAGS " -m64 -fPIC -fvisibility=hidden" TYPE STRING)
VISIT_OPTION_DEFAULT(VISIT_CXX_FLAGS " -m64 -fPIC -fvisibility=hidden" TYPE STRING)

##
##  Misc options
##
VISIT_OPTION_DEFAULT(VISIT_PARADIS OFF TYPE BOOL)
VISIT_OPTION_DEFAULT(VISIT_CREATE_XMLTOOLS_GEN_TARGETS OFF TYPE BOOL)
VISIT_OPTION_DEFAULT(VISIT_THREAD OFF TYPE BOOL)

if(USE_REDUCED_BUILD) # this is just a var I create when I need it
  VISIT_OPTION_DEFAULT(VISIT_ENABLE_ANNOTATION_TOOLS OFF TYPE BOOL)
  VISIT_OPTION_DEFAULT(VISIT_ENABLE_DATAGEN OFF TYPE BOOL)
  VISIT_OPTION_DEFAULT(VISIT_ENABLE_DATA_MANUAL_EXAMPLES OFF TYPE BOOL)
  VISIT_OPTION_DEFAULT(VISIT_ENABLE_DIAGNOSTICS OFF TYPE BOOL)
  VISIT_OPTION_DEFAULT(VISIT_ENABLE_EXAMPLES OFF TYPE BOOL)
  VISIT_OPTION_DEFAULT(VISIT_ENABLE_LIBSIM OFF TYPE BOOL)
  VISIT_OPTION_DEFAULT(VISIT_ENABLE_MANUALS OFF TYPE BOOL)
  VISIT_OPTION_DEFAULT(VISIT_ENABLE_SILO_TOOLS OFF TYPE BOOL)

  VISIT_OPTION_DEFAULT(VISIT_BUILD_ALL_PLUGINS OFF TYPE BOOL)
  VISIT_OPTION_DEFAULT(VISIT_CREATE_XMLTOOLS_GEN_TARGETS OFF TYPE BOOL)
  VISIT_OPTION_DEFAULT(VISIT_PARALLEL OFF TYPE BOOL)
  VISIT_OPTION_DEFAULT(VISIT_SPHINX OFF TYPE BOOL)

  #VISIT_OPTION_DEFAULT(VISIT_SELECTED_DATABASE_PLUGINS "VTK;Silo" TYPE STRING)
  #VISIT_OPTION_DEFAULT(VISIT_SELECTED_PLOT_PLUGINS "Pseudocolor;Curve" TYPE STRING)
  #VISIT_OPTION_DEFAULT(VISIT_SELECTED_OPERATOR_PLUGINS "Slice;Lineout" TYPE STRING)
endif()

##
## 7-zip
##
VISIT_OPTION_DEFAULT(VISIT_SEVEN_ZIP_DIR ${VISITHOME}/p7zip/16.02/${VISITARCH})
VISIT_OPTION_DEFAULT(VISIT_DATA_ARCHIVER_NAME "7za" TYPE STRING)

##
## ZLIB
##
VISIT_OPTION_DEFAULT(VISIT_ZLIB_DIR ${VISITHOME}/zlib/1.2.11/${VISITARCH})

##
## OPENSSL
##
VISIT_OPTION_DEFAULT(VISIT_OPENSSL_DIR ${VISITHOME}/openssl/1.0.2j/${VISITARCH})

##
## Python
##
VISIT_OPTION_DEFAULT(VISIT_PYTHON_DIR ${VISITHOME}/python/2.7.14/${VISITARCH})

##
## Qt
##
SETUP_APP_VERSION(QT 5.10.1)
VISIT_OPTION_DEFAULT(VISIT_QT_DIR ${VISITHOME}/qt/${QT_VERSION}/${VISITARCH})

##
## QWT
##
SETUP_APP_VERSION(QWT 6.1.2)
VISIT_OPTION_DEFAULT(VISIT_QWT_DIR ${VISITHOME}/qwt/${QWT_VERSION}/${VISITARCH})

##
## VTK
##
SETUP_APP_VERSION(VTK 9.0.0.rc2)
VISIT_OPTION_DEFAULT(VISIT_VTK_DIR ${VISITHOME}/vtk/${VTK_VERSION}/${VISITARCH})
VISIT_OPTION_DEFAULT(VISIT_VTK_INCDEP ZLIB_INCLUDE_DIR)                         
VISIT_OPTION_DEFAULT(VISIT_VTK_LIBDEP ZLIB_LIBRARY)  

##
## MPICH
##
# Give VisIt information so it can install MPI into the binary distribution.
if (VISIT_PARALLEL)
  VISIT_OPTION_DEFAULT(VISIT_MPICH_DIR ${VISITHOME}/mpich/3.3.1/${VISITARCH})
  VISIT_OPTION_DEFAULT(VISIT_MPICH_INSTALL ON TYPE BOOL)
  # Tell VisIt the parallel compiler so it can deduce parallel flags
  VISIT_OPTION_DEFAULT(VISIT_MPI_COMPILER ${VISIT_MPICH_DIR}/bin/mpicc TYPE FILEPATH)
endif()

##
## SZIP
##
VISIT_OPTION_DEFAULT(VISIT_SZIP_DIR ${VISITHOME}/szip/2.1/${VISITARCH})

##
## HDF5
##
VISIT_OPTION_DEFAULT(VISIT_HDF5_DIR ${VISITHOME}/hdf5/1.8.14/${VISITARCH})
VISIT_OPTION_DEFAULT(VISIT_HDF5_LIBDEP ${VISIT_SZIP_DIR}/lib sz ${VISIT_ZLIB_DIR}/lib z TYPE STRING)

##
## AdvIO
##
VISIT_OPTION_DEFAULT(VISIT_ADVIO_DIR ${VISITHOME}/AdvIO/1.2/${VISITARCH})

##
## BOOST
##
SETUP_APP_VERSION(BOOST 1_67_0)
VISIT_OPTION_DEFAULT(VISIT_BOOST_DIR ${VISITHOME}/boost/${BOOST_VERSION}/${VISITARCH})

##
## Boxlib
##
VISIT_OPTION_DEFAULT(VISIT_BOXLIB_DIR ${VISITHOME}/boxlib/1.3.5/${VISITARCH})

##
## CFITSIO
##
VISIT_OPTION_DEFAULT(VISIT_CFITSIO_DIR ${VISITHOME}/cfitsio/3006/${VISITARCH})

##
## CGNS
##
VISIT_OPTION_DEFAULT(VISIT_CGNS_DIR ${VISITHOME}/cgns/3.2.1/${VISITARCH})
VISIT_OPTION_DEFAULT(VISIT_CGNS_LIBDEP HDF5_LIBRARY_DIR hdf5 ${VISIT_HDF5_LIBDEP} TYPE STRING)

##
## Conduit
##
VISIT_OPTION_DEFAULT(VISIT_CONDUIT_DIR ${VISITHOME}/conduit/v0.4.0/${VISITARCH})
VISIT_OPTION_DEFAULT(VISIT_CONDUIT_LIBDEP HDF5_LIBRARY_DIR hdf5 ${VISIT_HDF5_LIBDEP} TYPE STRING)

##
## GDAL
##
VISIT_OPTION_DEFAULT(VISIT_GDAL_DIR ${VISITHOME}/gdal/2.2.4/${VISITARCH})

##
## H5Part
##
SETUP_APP_VERSION(H5PART 1.6.6)
VISIT_OPTION_DEFAULT(VISIT_H5PART_DIR ${VISITHOME}/h5part/${H5PART_VERSION}/${VISITARCH})
VISIT_OPTION_DEFAULT(VISIT_H5PART_LIBDEP HDF5_LIBRARY_DIR hdf5 ${VISIT_HDF5_LIBDEP} TYPE STRING)

## HDF4
##
VISIT_OPTION_DEFAULT(VISIT_HDF4_DIR ${VISITHOME}/hdf4/4.2.15/${VISITARCH})
#VISIT_OPTION_DEFAULT(VISIT_HDF4_LIBDEP ${VISIT_SZIP_DIR}/lib sz TYPE STRING)

##
## Ice-T
##
if(VISIT_PARALLEL)
VISIT_OPTION_DEFAULT(VISIT_ICET_DIR ${VISITHOME}/icet/77c708f9090236b576669b74c53e9f105eedbd7e/${VISITARCH})
endif()

##
## MFEM 
##
VISIT_OPTION_DEFAULT(VISIT_MFEM_DIR ${VISITHOME}/mfem/4.0/${VISITARCH})
VISIT_OPTION_DEFAULT(VISIT_MFEM_INCDEP CONDUIT_INCLUDE_DIR TYPE STRING)
VISIT_OPTION_DEFAULT(VISIT_MFEM_LIBDEP ${VISIT_CONDUIT_LIBDEP} ${VISIT_ZLIB_DIR}/lib z TYPE STRING)

##
## Mili
##
VISIT_OPTION_DEFAULT(VISIT_MILI_DIR ${VISITHOME}/mili/15.1/${VISITARCH})


##
## NetCDF
##
VISIT_OPTION_DEFAULT(VISIT_NETCDF_DIR ${VISITHOME}/netcdf/4.1.1/${VISITARCH})
VISIT_OPTION_DEFAULT(VISIT_NETCDF_LIBDEP HDF5_LIBRARY_DIR hdf5_hl HDF5_LIBRARY_DIR hdf5 ${VISIT_HDF5_LIBDEP} TYPE STRING)

##
## OpenEXR
##
VISIT_OPTION_DEFAULT(VISIT_OPENEXR_DIR ${VISITHOME}/openexr/2.2.0/${VISITARCH})

##
## Silo
##
VISIT_OPTION_DEFAULT(VISIT_SILO_DIR ${VISITHOME}/silo/4.10.2/${VISITARCH})
VISIT_OPTION_DEFAULT(VISIT_SILO_LIBDEP HDF5_LIBRARY_DIR hdf5 ${VISIT_HDF5_LIBDEP} TYPE STRING)


##
## Xdmf
##
VISIT_OPTION_DEFAULT(VISIT_XDMF_DIR ${VISITHOME}/Xdmf/2.1.1/${VISITARCH})
VISIT_OPTION_DEFAULT(VISIT_XDMF_LIBDEP HDF5_LIBRARY_DIR hdf5 VTK::libxml2 TYPE STRING)

