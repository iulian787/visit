/*****************************************************************************
*
* Copyright (c) 2000 - 2007, The Regents of the University of California
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
//                            avtNek3DFileFormat.h                           //
// ************************************************************************* //

#ifndef AVT_Nek3D_FILE_FORMAT_H
#define AVT_Nek3D_FILE_FORMAT_H

#include <avtMTMDFileFormat.h>

#include <vector>


// ****************************************************************************
//  Class: avtNek3DFileFormat
//
//  Purpose:
//      Reads in Nek3D files as a plugin to VisIt.
//
//  Programmer: dbremer -- generated by xml2avt
//  Creation:   Fri May 18 16:07:09 PST 2007
//
// ****************************************************************************

class avtNek3DFileFormat : public avtMTMDFileFormat
{
  public:
                       avtNek3DFileFormat(const char *);
    virtual           ~avtNek3DFileFormat() {;};

    //
    // This is used to return unconventional data -- ranging from material
    // information to information about block connectivity.
    //
    // virtual void      *GetAuxiliaryData(const char *var, int timestep, 
    //                                     int domain, const char *type, void *args, 
    //                                     DestructorFunction &);
    //

    //
    // If you know the times and cycle numbers, overload this function.
    // Otherwise, VisIt will make up some reasonable ones for you.
    //
    virtual void           GetCycles(std::vector<int> &);
    virtual void           GetTimes(std::vector<double> &);
    //

    virtual int            GetNTimesteps(void);

    virtual const char    *GetType(void)   { return "Nek3D"; }
    virtual void           FreeUpResources(void); 

    virtual vtkDataSet    *GetMesh(int, int, const char *);
    virtual vtkDataArray  *GetVar(int, int, const char *);
    virtual vtkDataArray  *GetVectorVar(int, int, const char *);

  protected:
    // This info is embedded in the text file specified by Dave Bremer
    std::string          version;
    bool                 bSwapEndian;
    std::string          fileTemplate;
    int                  iFirstTimestep;
    int                  iNumTimesteps;
    std::vector<int>     iTimestepsWithMesh;

    // This info is embedded in the header of each dump
    int                  iNumBlocks;
    int                  iBlockSize[3];
    bool                 bHasVelocity;
    bool                 bHasPressure;
    bool                 bHasTemperature;
    int                  iHeaderSize;

    // This info is distributed through all the dumps, and only
    // computed on demand
    std::vector<int>     aCycles;
    std::vector<double>  aTimes;

    // Cached data
    FILE *fdMesh, *fdVar;
    int  iCurrTimestep;

    virtual void           PopulateDatabaseMetaData(avtDatabaseMetaData *, int);
    virtual void           UpdateCyclesAndTimes();
    virtual void           GetDomainSizeAndVarOffset(int timestate, const char *var, 
                                                     int &outDomSize, int &outOffset);
    void                   ByteSwap32(void *aVals, int nVals);

};


#endif
