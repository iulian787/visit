// ************************************************************************* //
//                               FilledBoundaryPluginInfo.h                            //
// ************************************************************************* //

#ifndef FILLEDBOUNDARY_PLUGIN_INFO_H
#define FILLEDBOUNDARY_PLUGIN_INFO_H
#include <PlotPluginInfo.h>
#include <plot_plugin_exports.h>

class FilledBoundaryAttributes;

// ****************************************************************************
//  Class: FilledBoundaryPluginInfo
//
//  Purpose:
//    Five classes that provide all the information about a FilledBoundary
//    plot plugin.  The information is broken up into five classes since
//    portions of it are only relevant to particular components within
//    visit.  There is the general information which all the components
//    are interested in, the gui information which the gui is interested in,
//    the viewer information which the viewer is interested in, the
//    engine information which the engine is interested in, and finally a.
//    scripting portion that enables the Python VisIt extension to use the
//    plugin.
//
//  Programmer: meredith -- generated by xml2info
//  Creation:   Fri May 9 11:20:53 PDT 2003
//
// ****************************************************************************

class FilledBoundaryGeneralPluginInfo: public virtual GeneralPlotPluginInfo


{
  public:
    virtual char *GetName() const;
    virtual char *GetVersion() const;
    virtual char *GetID() const;
};

class FilledBoundaryCommonPluginInfo : public virtual CommonPlotPluginInfo, public virtual FilledBoundaryGeneralPluginInfo
{
  public:
    virtual AttributeSubject *AllocAttributes();
    virtual void CopyAttributes(AttributeSubject *to, AttributeSubject *from);
};

class FilledBoundaryGUIPluginInfo: public virtual GUIPlotPluginInfo, public virtual FilledBoundaryCommonPluginInfo
{
  public:
    virtual const char *GetMenuName() const;
    virtual int GetVariableTypes() const;
    virtual QvisPostableWindowObserver *CreatePluginWindow(int type,
        AttributeSubject *attr, QvisNotepadArea *notepad);
    virtual const char **XPMIconData() const;
};

class FilledBoundaryViewerPluginInfo: public virtual ViewerPlotPluginInfo, public virtual FilledBoundaryCommonPluginInfo
{
  public:
    virtual AttributeSubject *GetClientAtts();
    virtual AttributeSubject *GetDefaultAtts();
    virtual void SetClientAtts(AttributeSubject *atts);
    virtual void GetClientAtts(AttributeSubject *atts);

    virtual avtPlot *AllocAvtPlot();

    virtual void InitializePlotAtts(AttributeSubject *atts,
        const char *hostName, const char *databaseName,
        const char *variableName);

    virtual void ReInitializePlotAtts(AttributeSubject *atts,
        const char *hostName, const char *databaseName,
        const char *variableName);

    virtual void ResetPlotAtts(AttributeSubject *atts,
        const char *hostName, const char *databaseName,
        const char *variableName);

    virtual const char **XPMIconData() const;
    virtual int GetVariableTypes() const;

    static void InitializeGlobalObjects();
  private:
    static FilledBoundaryAttributes *defaultAtts;
    static FilledBoundaryAttributes *clientAtts;

    void   PrivateSetPlotAtts(AttributeSubject *atts,
        const char *hostName, const char *databaseName,
        const char *variableName);
};

class FilledBoundaryEnginePluginInfo: public virtual EnginePlotPluginInfo, public virtual FilledBoundaryCommonPluginInfo
{
  public:
    virtual avtPlot *AllocAvtPlot();
};

class FilledBoundaryScriptingPluginInfo : public virtual ScriptingPlotPluginInfo, public virtual FilledBoundaryCommonPluginInfo
{
  public:
    virtual void InitializePlugin(AttributeSubject *subj, FILE *log);
    virtual void *GetMethodTable(int *nMethods);
    virtual bool TypesMatch(void *pyobject);
    virtual void SetLogging(bool val);
    virtual void SetDefaults(const AttributeSubject *atts);
};

#endif
