using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class administrator : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
       
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        SqlConnection add = new SqlConnection("Data Source =.;Initial Catalog=Contiki;Integrated Security=true");
        string gly00 = gly1.Value.ToString();
        SqlCommand chaxun = new SqlCommand("select *from Login where Username='" + gly00 + "'", add);
        SqlDataReader reader;
        add.Open();
        if (gly1.Value.ToString() != "" && Password1.Value.ToString() != "" && Password2.Value.ToString() != "")
        {
            reader= chaxun.ExecuteReader();
            if (!reader.Read())
            {
                reader.Close();
                if (Password1.Value.ToString() != Password2.Value.ToString())
                    System.Web.UI.ScriptManager.RegisterStartupScript(this, this.GetType(), "opennewwindow", "alert('两次密码不一致！！！');", true);
                else
                {
                    SqlCommand cmd = new SqlCommand("insert into Login(Username,Password)values('" + gly1.Value.ToString() + "','" + Password1.Value.ToString() + "' )", add);
                    cmd.ExecuteNonQuery();
                    add.Close();
                    System.Web.UI.ScriptManager.RegisterStartupScript(this, this.GetType(), "opennewwindow", "alert('注册成功！！！');", true);
                    gly1.Value = "";
                    Password1.Value = "";
                }

            }
            else { System.Web.UI.ScriptManager.RegisterStartupScript(this, this.GetType(), "opennewwindow", "alert('该账户已存在！！！');", true); reader.Close(); }
        }
        else
        {
            System.Web.UI.ScriptManager.RegisterStartupScript(this, this.GetType(), "opennewwindow", "alert('请输入账号或密码！！！');", true);

        }      
    }
    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("Login.aspx");
    }
}