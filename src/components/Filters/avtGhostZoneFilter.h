/*****************************************************************************
*
* Copyright (c) 2000 - 2006, The Regents of the University of California
* Produced at the Lawrence Livermore National Laboratory
* All rights reserved.
*
* This file is part of VisIt. For details, see http://www.llnl.gov/visit/. The
* full copyright notice is contained in the file COPYRIGHT located at the root
* of the VisIt distribution or at http://www.llnl.gov/visit/copyright.html.
*
* Redistribution  and  use  in  source  and  binary  forms,  with  or  without
* modification, are permitted provided that the following conditions are met:
*
*  - Redistributions of  source code must  retain the above  copyright notice,
*    this list of conditions and the disclaimer below.
*  - Redistributions in binary form must reproduce the above copyright notice,
*    this  list of  conditions  and  the  disclaimer (as noted below)  in  the
*    documentation and/or materials provided with the distribution.
*  - Neither the name of the UC/LLNL nor  the names of its contributors may be
*    used to  endorse or  promote products derived from  this software without
*    specific prior written permission.
*
* THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT  HOLDERS AND CONTRIBUTORS "AS IS"
* AND ANY EXPRESS OR  IMPLIED WARRANTIES, INCLUDING,  BUT NOT  LIMITED TO, THE
* IMPLIED WARRANTIES OF MERCHANTABILITY AND  FITNESS FOR A PARTICULAR  PURPOSE
* ARE  DISCLAIMED.  IN  NO  EVENT  SHALL  THE  REGENTS  OF  THE  UNIVERSITY OF
* CALIFORNIA, THE U.S.  DEPARTMENT  OF  ENERGY OR CONTRIBUTORS BE  LIABLE  FOR
* ANY  DIRECT,  INDIRECT,  INCIDENTAL,  SPECIAL,  EXEMPLARY,  OR CONSEQUENTIAL
* DAMAGES (INCLUDING, BUT NOT  LIMITED TO, PROCUREMENT OF  SUBSTITUTE GOODS OR
* SERVICES; LOSS OF  USE, DATA, OR PROFITS; OR  BUSINESS INTERRUPTION) HOWEVER
* CAUSED  AND  ON  ANY  THEORY  OF  LIABILITY,  WHETHER  IN  CONTRACT,  STRICT
* LIABILITY, OR TORT  (INCLUDING NEGLIGENCE OR OTHERWISE)  ARISING IN ANY  WAY
* OUT OF THE  USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH
* DAMAGE.
*
*****************************************************************************/

// ************************************************************************* //
//                            avtGhostZoneFilter.h                           //
// ************************************************************************* //

#ifndef AVT_GHOST_ZONE_FILTER_H
#define AVT_GHOST_ZONE_FILTER_H

#include <filters_exports.h>

#include <avtStreamer.h>

class     vtkDataSet;
class     vtkDataSetRemoveGhostCells;


// ****************************************************************************
//  Class: avtGhostZoneFilter
//
//  Purpose:
//
//  Programmer: Kathleen Bonnell 
//  Creation:   May 1, 2001 
//
//  Modifications:
//
//    Kathleen Bonnell, Wed Sep 19 12:55:57 PDT 2001
//    Added string argument to Execute method in order to match new interface.
//
//    Hank Childs, Tue Sep 10 12:51:33 PDT 2002
//    Inherited from avtStreamer instead of avtDataTreeStreamer.  Re-worked
//    the paradigm for memory management.
//
//    Hank Childs, Thu Feb  5 17:11:06 PST 2004
//    Moved inlined constructor and destructor definitions to .C files
//    because certain compilers have problems with them.
//
//    Hank Childs, Wed Dec 20 09:25:42 PST 2006
//    Add "ghost data must be removed".
//
// ****************************************************************************

class AVTFILTERS_API avtGhostZoneFilter : public avtStreamer
{
  public:
                         avtGhostZoneFilter();
    virtual             ~avtGhostZoneFilter();

    virtual const char  *GetType(void) { return "avtGhostZoneFilter"; };
    virtual const char  *GetDescription(void) 
                             { return "Removing ghost cells"; };

    // There are some cases where the ghost zone filter will allow
    // ghost data to pass through and allow the renderer to remove the
    // ghost data on the fly.  This disallows that behavior.
    void                 GhostDataMustBeRemoved()
                             { ghostDataMustBeRemoved = true; };

  protected:
    bool                        ghostDataMustBeRemoved;

    virtual vtkDataSet         *ExecuteData(vtkDataSet *, int, std::string);
    virtual void                RefashionDataObjectInfo(void);
};


#endif


