package llnl.visit;

import java.util.Vector;

// ****************************************************************************
// Class: QueryAttributes
//
// Purpose:
//    This class contains attributes used for query.
//
// Notes:      Autogenerated by xml2java.
//
// Programmer: xml2java
// Creation:   Tue Oct 1 12:01:48 PDT 2002
//
// Modifications:
//   
// ****************************************************************************

public class QueryAttributes extends AttributeSubject
{
    public QueryAttributes()
    {
        super(3);

        name = new String(" ");
        variables = new Vector();
        variables.addElement(new String("default"));
        resultsMessage = new String(" ");
    }

    public QueryAttributes(QueryAttributes obj)
    {
        super(3);

        int i;

        name = new String(obj.name);
        variables = new Vector(obj.variables.size());
        for(i = 0; i < obj.variables.size(); ++i)
            variables.addElement(new String((String)obj.variables.elementAt(i)));

        resultsMessage = new String(obj.resultsMessage);

        SelectAll();
    }

    public boolean equals(QueryAttributes obj)
    {
        int i;

        // Create the return value
        return ((name == obj.name) &&
                (variables == obj.variables) &&
                (resultsMessage == obj.resultsMessage));
    }

    // Property setting methods
    public void SetName(String name_)
    {
        name = name_;
        Select(0);
    }

    public void SetVariables(Vector variables_)
    {
        variables = variables_;
        Select(1);
    }

    public void SetResultsMessage(String resultsMessage_)
    {
        resultsMessage = resultsMessage_;
        Select(2);
    }

    // Property getting methods
    public String GetName() { return name; }
    public Vector GetVariables() { return variables; }
    public String GetResultsMessage() { return resultsMessage; }

    // Write and read methods.
    public void WriteAtts(CommunicationBuffer buf)
    {
        if(WriteSelect(0, buf))
            buf.WriteString(name);
        if(WriteSelect(1, buf))
            buf.WriteStringVector(variables);
        if(WriteSelect(2, buf))
            buf.WriteString(resultsMessage);
    }

    public void ReadAtts(int n, CommunicationBuffer buf)
    {
        for(int i = 0; i < n; ++i)
        {
            int index = (int)buf.ReadByte();
            switch(index)
            {
            case 0:
                SetName(buf.ReadString());
                break;
            case 1:
                SetVariables(buf.ReadStringVector());
                break;
            case 2:
                SetResultsMessage(buf.ReadString());
                break;
            }
        }
    }


    // Attributes
    private String name;
    private Vector variables; // vector of String objects
    private String resultsMessage;
}

