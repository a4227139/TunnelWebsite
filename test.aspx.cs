﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class test : System.Web.UI.Page
{
    public int num;
    public string name = "HZX";
    protected void Page_Load(object sender, EventArgs e)
    {
        num = 5;
    }
    public string behideMethod()
    {
        string s = "this is a BackStage's code";
        //this.TextBox1.DataBind();
        return s;
    }
}