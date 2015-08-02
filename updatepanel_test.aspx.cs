using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class updatepanel_test : System.Web.UI.Page
{
    protected void Button1_Click(object sender, EventArgs e)
    {
        Label1.Text = DateTime.Now.ToString();
        Label2.Text = DateTime.Now.ToString();
        Label3.Text = DateTime.Now.ToString();
        UpdatePanel1.Update();
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        Label1.Text = DateTime.Now.ToString();
        ScriptManager1.RegisterAsyncPostBackControl(this.Button1);
    }
    protected void Timer1_Tick(object sender, EventArgs e)
    {
        Label3.Text = DateTime.Now.ToString();
    }
}