package llnl.visit.operators;

import llnl.visit.AttributeSubject;
import llnl.visit.CommunicationBuffer;
import llnl.visit.Plugin;

// ****************************************************************************
// Class: ThresholdAttributes
//
// Purpose:
//    This class contains attributes for the threshold operator.
//
// Notes:      Autogenerated by xml2java.
//
// Programmer: xml2java
// Creation:   Thu Aug 15 14:56:28 PST 2002
//
// Modifications:
//   
// ****************************************************************************

public class ThresholdAttributes extends AttributeSubject implements Plugin
{
    // Constants
    public final static int AMOUNT_SOME = 0;
    public final static int AMOUNT_ALL = 1;


    public ThresholdAttributes()
    {
        super(4);

        amount = AMOUNT_SOME;
        lbound = 0;
        ubound = 0;
        variable = new String("default");
    }

    public ThresholdAttributes(ThresholdAttributes obj)
    {
        super(4);

        amount = obj.amount;
        lbound = obj.lbound;
        ubound = obj.ubound;
        variable = new String(obj.variable);

        SelectAll();
    }

    public boolean equals(ThresholdAttributes obj)
    {
        // Create the return value
        return ((amount == obj.amount) &&
                (lbound == obj.lbound) &&
                (ubound == obj.ubound) &&
                (variable == obj.variable));
    }

    public String GetName() { return "Threshold"; }
    public String GetVersion() { return "1.0"; }

    // Property setting methods
    public void SetAmount(int amount_)
    {
        amount = amount_;
        Select(0);
    }

    public void SetLbound(double lbound_)
    {
        lbound = lbound_;
        Select(1);
    }

    public void SetUbound(double ubound_)
    {
        ubound = ubound_;
        Select(2);
    }

    public void SetVariable(String variable_)
    {
        variable = variable_;
        Select(3);
    }

    // Property getting methods
    public int    GetAmount() { return amount; }
    public double GetLbound() { return lbound; }
    public double GetUbound() { return ubound; }
    public String GetVariable() { return variable; }

    // Write and read methods.
    public void WriteAtts(CommunicationBuffer buf)
    {
        if(WriteSelect(0, buf))
            buf.WriteInt(amount);
        if(WriteSelect(1, buf))
            buf.WriteDouble(lbound);
        if(WriteSelect(2, buf))
            buf.WriteDouble(ubound);
        if(WriteSelect(3, buf))
            buf.WriteString(variable);
    }

    public void ReadAtts(int n, CommunicationBuffer buf)
    {
        for(int i = 0; i < n; ++i)
        {
            int index = (int)buf.ReadByte();
            switch(index)
            {
            case 0:
                SetAmount(buf.ReadInt());
                break;
            case 1:
                SetLbound(buf.ReadDouble());
                break;
            case 2:
                SetUbound(buf.ReadDouble());
                break;
            case 3:
                SetVariable(buf.ReadString());
                break;
            }
        }
    }


    // Attributes
    private int    amount;
    private double lbound;
    private double ubound;
    private String variable;
}

