// ************************************************************************* //
//                             vtkVisItUtility.h                             //
// ************************************************************************* //

#ifndef VTK_VISIT_UTILITY_H
#define VTK_VISIT_UTILITY_H

#include <visit_vtk_exports.h>

class vtkDataSet;
class vtkPoints;
class vtkRectilinearGrid;

namespace vtkVisItUtility
{
    VISIT_VTK_API vtkPoints  *GetPoints(vtkDataSet *);
    VISIT_VTK_API void        GetLogicalIndices(vtkDataSet *, const bool, 
                                                const int, int [3]);
    VISIT_VTK_API int         CalculateRealCellID(const int cellId, vtkDataSet *ds);
    VISIT_VTK_API int         ComputeStructuredCoordinates(vtkRectilinearGrid *, float x[3],
                                                           int ijk[3]);
}

#endif


