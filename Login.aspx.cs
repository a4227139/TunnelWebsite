using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;


public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
       // this.form1.Target = "_blank";/*新建窗口*/
    }
    protected void Login_Click(object sender, EventArgs e)
    {
        SqlConnection conn = new SqlConnection("Data Source =.;Initial Catalog=Contiki;Integrated Security=true");
        conn.Open();
        if (conn.State == ConnectionState.Open)
        {
            SqlCommand cmd = new SqlCommand("select * from Login", conn);
            SqlDataReader reader;
            reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                if(reader[0].ToString().Replace(" ","") == uname.Value.ToString())
                {
                    if (reader[1].ToString().Replace(" ", "") == pword.Value.ToString())
                    {
                        conn.Close();
                        Response.Redirect("Index.aspx");                        
                    }
                    else
                        System.Web.UI.ScriptManager.RegisterStartupScript(this, this.GetType(), "opennewwindow", "alert('密码错误！');", true);
                }
                else
                    System.Web.UI.ScriptManager.RegisterStartupScript(this, this.GetType(), "opennewwindow", "alert('账号或者密码错误！');", true);
            }
          
        }


        }
    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("administrator.aspx");
    }
}
 