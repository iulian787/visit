#ifndef ANIMATIONATTRIBUTES_H
#define ANIMATIONATTRIBUTES_H
#include <state_exports.h>
#include <AttributeSubject.h>

// ****************************************************************************
// Class: AnimationAttributes
//
// Purpose:
//    This class contains the animation attributes.
//
// Notes:      Autogenerated by xml2atts.
//
// Programmer: xml2atts
// Creation:   Tue May 20 13:39:39 PST 2003
//
// Modifications:
//   
// ****************************************************************************

class STATE_API AnimationAttributes : public AttributeSubject
{
public:
    AnimationAttributes();
    AnimationAttributes(const AnimationAttributes &obj);
    virtual ~AnimationAttributes();

    virtual void operator = (const AnimationAttributes &obj);
    virtual bool operator == (const AnimationAttributes &obj) const;
    virtual bool operator != (const AnimationAttributes &obj) const;

    virtual const std::string TypeName() const;
    virtual bool CopyAttributes(const AttributeGroup *);
    virtual AttributeSubject *CreateCompatible(const std::string &) const;

    // Property selection methods
    virtual void SelectAll();

    // Property setting methods
    void SetPipelineCachingMode(bool pipelineCachingMode_);
    void SetTimeout(int timeout_);

    // Property getting methods
    bool GetPipelineCachingMode() const;
    int  GetTimeout() const;

    // Persistence methods
    virtual bool CreateNode(DataNode *node, bool forceAdd);
    virtual void SetFromNode(DataNode *node);


    // Keyframing methods
    virtual std::string               GetFieldName(int index) const;
    virtual AttributeGroup::FieldType GetFieldType(int index) const;
    virtual std::string               GetFieldTypeName(int index) const;
    virtual bool                      FieldsEqual(int index, const AttributeGroup *rhs) const;

private:
    bool pipelineCachingMode;
    int  timeout;
};

#endif
