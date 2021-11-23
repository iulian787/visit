// Copyright (c) Lawrence Livermore National Security, LLC and other VisIt
// Project developers.  See the top-level LICENSE file for dates and other
// details.  No copyright assignment is required to contribute to VisIt.

// ************************************************************************* //
//                           avtVisItVTKDeviceBase.h                             //
// ************************************************************************* //

#ifndef AVT_VISIT_VTK_DEVICE_BASE_H
#define AVT_VISIT_VTK_DEVICE_BASE_H

#include <vtkErrorCode.h>

namespace avt
{
    namespace visit_vtk
    {
        enum class DataType
        {
            GEOMETRY,
            VOLUME
        };

        enum class RendererType
        {
            SCIVIS,
            AO,
            PATHTRACER
        };
    }   // namespace visit_vtk
}   // namespace avt

class avtVisItVTKDeviceBase
{
public:
    virtual ~avtVisItVTKDeviceBase() = default;
    virtual const char  *GetDeviceType() = 0;

    static inline std::string GetVisItVTKErrorString(const vtkErrorCode::ErrorIds err)
    {
        return vtkErrorCode::GetStringFromErrorCode( err );
    }
};

#endif
