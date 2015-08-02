using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
public partial class manage2 : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection("Data Source =.;Initial Catalog=Contiki;Integrated Security=true");

    protected void Bt_new_Click(object sender, EventArgs e)
    {
        bool flag = false;
        if (net.Value.ToString() == "")
        {
            System.Web.UI.ScriptManager.RegisterStartupScript(this, this.GetType(), "opennewwindow", "alert('请输入信息！');", true);
            net.Value = "";
            voltage.Value = "";
            DropDownList1.SelectedItem.Text = DropDownList1.Items[0].ToString();
            maodianx.Value = "";
            maodiany.Value = "";
        }
        else if (!(net.Value.ToString().StartsWith("2") || net.Value.ToString().StartsWith("1")) || int.Parse(net.Value) > 256256) System.Web.UI.ScriptManager.RegisterStartupScript(this, this.GetType(), "opennewwindow", "alert('设备地址格式错误！');", true);
        else if (double.Parse(voltage.Value) > 6 || double.Parse(voltage.Value) < 2) System.Web.UI.ScriptManager.RegisterStartupScript(this, this.GetType(), "opennewwindow", "alert('电压错误！电压范围应在在2.00~6.00之间！');", true);
        else
        {
            conn.Open();
            SqlCommand cmd_check_exist = new SqlCommand("select Net from Device", conn);
            SqlDataReader reader = cmd_check_exist.ExecuteReader();
            while (reader.Read())
            {
                if (reader[0].ToString().Replace(" ", "") == net.Value.ToString().Replace(" ", ""))
                {
                    flag = true;
                    System.Web.UI.ScriptManager.RegisterStartupScript(this, this.GetType(), "opennewwindow", "alert('该记录已存在！');", true);
                    net.Value = "";
                    voltage.Value = "";
                    DropDownList1.SelectedItem.Text = DropDownList1.Items[0].ToString();
                    maodianx.Value = "";
                    maodiany.Value = "";
                    break;
                }
            }
            if (!flag)
            {
                string new_net = net.Value.ToString();
                string new_type = DropDownList1.SelectedItem.Text;
                // DropDownList1.Items[0].Text = "";
                string new_voltage = voltage.Value.ToString();
                string x = maodianx.Value;
                string y = maodiany.Value;
                reader.Close();
                SqlCommand cmd = new SqlCommand("insert into Device(Net,Type,Voltage)values('" + new_net + "','" + new_type + "','" + new_voltage + "')", conn);
                if (DropDownList1.SelectedItem.Text == "定位基点")
                {
                    
                    SqlCommand cmd_Insert_Maodian = new SqlCommand("insert into Maodian(Net,X,Y)values('" + new_net + "','" + x + "','" + y + "')", conn);
                    cmd_Insert_Maodian.ExecuteNonQuery();
                }
                System.Web.UI.ScriptManager.RegisterStartupScript(this, this.GetType(), "opennewwindow", "alert('添加成功！');", true);
                net.Value = "";
                voltage.Value = "";
                DropDownList1.SelectedItem.Text = DropDownList1.Items[0].ToString();
                maodianx.Value = "";
                maodiany.Value = "";
                cmd.ExecuteNonQuery();
                Response.Redirect(Request.Url.ToString());
            }
            conn.Close();
        }

    }
    protected void Bt_search_Click(object sender, EventArgs e)
    {
        conn.Open();
        string net1;
        if (syname.Value != "")
        {
            net1 = syname.Value.ToString(); bool flag = false;
            SqlCommand cmd_search_by_name = new SqlCommand("select * from Device", conn);
            SqlDataReader reader = cmd_search_by_name.ExecuteReader();
            while (reader.Read())
            {
                if (reader[0].ToString().Replace(" ", "") == net1)
                {
                    flag = true;
                    syname.Value = "";
                    net.Value = reader[0].ToString();
                    string select = reader[1].ToString().Replace(" ","");
                    if (select == "定位卡")
                    {
                        DropDownList1.Items[0].Selected = false;
                        DropDownList1.Items[1].Selected = true;
                        DropDownList1.Items[2].Selected = false;
                        DropDownList1.Items[3].Selected = false;
                        DropDownList1.Items[4].Selected = false;
                    }
                    else if (select == "定位基点")
                    {
                        DropDownList1.Items[0].Selected = false;
                        DropDownList1.Items[1].Selected = false;
                        DropDownList1.Items[2].Selected = true;
                        DropDownList1.Items[3].Selected = false;
                        DropDownList1.Items[4].Selected = false;
                    }
                    else if (select == "路由器")
                    {
                        DropDownList1.Items[0].Selected = false;
                        DropDownList1.Items[1].Selected = false;
                        DropDownList1.Items[2].Selected = false;
                        DropDownList1.Items[3].Selected = true ;
                        DropDownList1.Items[4].Selected = false;
                    }
                    else if (select == "网关")
                    {
                        DropDownList1.Items[0].Selected = false;
                        DropDownList1.Items[1].Selected = false ;
                        DropDownList1.Items[2].Selected = false;
                        DropDownList1.Items[3].Selected = false;
                        DropDownList1.Items[4].Selected = true ;
                    }
                    else
                    {
                        DropDownList1.Items[0].Selected = true ;
                        DropDownList1.Items[1].Selected = false;
                        DropDownList1.Items[2].Selected = false;
                        DropDownList1.Items[3].Selected = false;
                        DropDownList1.Items[4].Selected = false;
                    }
                    voltage.Value = reader[2].ToString();
                    reader.Close();
                    string type = DropDownList1.SelectedItem.Text.Replace(" ", "");
                    string net2 = net.Value.Replace(" ", "");
                    maodianx.Value = ""; maodiany.Value = "";
                    if (type == "定位基点")
                    {
                        
                        SqlCommand cmd_SelectXY = new SqlCommand("select X,Y from Maodian where Net='" + net2 + "'", conn);
                        SqlDataReader reader1 = cmd_SelectXY.ExecuteReader();
                        if (reader1.Read())
                        {
                            maodianx.Value = reader1[0].ToString().Replace(" ", "");
                            maodiany.Value = reader1[1].ToString().Replace(" ", "");
                        }
                        reader1.Close();
                        div3.Style["display"] = "";
                    }
                    break;
                }
            }
            if (!flag)
            {
                System.Web.UI.ScriptManager.RegisterStartupScript(this, this.GetType(), "opennewwindow", "alert('无此设备！');", true);
                reader.Close();
            }
        }
        else System.Web.UI.ScriptManager.RegisterStartupScript(this, this.GetType(), "opennewwindow", "alert('请输入信息！');", true);
        conn.Close();
    }

    protected void Bt_clean_Click(object sender, EventArgs e)
    {
        syname.Value = "";
        net.Value = "";
        voltage.Value = "";
        maodianx.Value = "";
        maodiany.Value = "";
        DropDownList1.Items[0].Selected = true;
        DropDownList1.Items[1].Selected = false;
        DropDownList1.Items[2].Selected = false;
        DropDownList1.Items[3].Selected = false;
        DropDownList1.Items[4].Selected = false;
        div3.Style["display"] = "none";
       
    }
    protected void Bt_change_Click(object sender, EventArgs e)
    {
        conn.Open();
        if (net.Value == "")
        {
            System.Web.UI.ScriptManager.RegisterStartupScript(this, this.GetType(), "opennewwindow", "alert('请输入信息！');", true);
            
            net.Value = "";
            voltage.Value = "";
            DropDownList1.SelectedItem.Text = DropDownList1.Items[0].ToString();
            maodianx.Value = "";
            maodiany.Value = "";
        }
        else if (!(net.Value.ToString().StartsWith("2") || net.Value.ToString().StartsWith("1")) || int.Parse(net.Value) > 256256) System.Web.UI.ScriptManager.RegisterStartupScript(this, this.GetType(), "opennewwindow", "alert('设备地址格式错误！');", true);
        else if (double.Parse(voltage.Value) > 6 || double.Parse(voltage.Value) < 2) System.Web.UI.ScriptManager.RegisterStartupScript(this, this.GetType(), "opennewwindow", "alert('电压错误！电压范围应在在2.00~6.00之间！');", true);
        else
        {
            string net1 = net.Value.ToString();
            string new_type = DropDownList1.SelectedItem.Text;
            string new_voltage = voltage.Value.ToString();
            SqlCommand cmd_update_by_name = new SqlCommand("update Device set Type='" + new_type + "',Voltage='" + new_voltage + "'where Net='" + net1 + "'", conn);
            cmd_update_by_name.ExecuteNonQuery();
            if (DropDownList1.SelectedItem.Text.Replace(" ", "") == "定位基点")
            {
                
                SqlCommand cmd_UpdateXY = new SqlCommand("if exists(select * from Maodian where Net='" + net1 + "') begin update Maodian set X='" + maodianx.Value + "',Y='" + maodiany.Value + "'where Net='" + net1 + "'end else begin insert into Maodian(Net,X,Y)values('"+net1+"','" + maodianx.Value.ToString() + "','" + maodiany.Value.ToString() + "')end", conn);
                cmd_UpdateXY.ExecuteNonQuery();
            }
            System.Web.UI.ScriptManager.RegisterStartupScript(this, this.GetType(), "opennewwindow", "alert('修改成功！');", true);
            net.Value = "";
            voltage.Value = "";
            DropDownList1.SelectedItem.Text = DropDownList1.Items[0].ToString();
            maodianx.Value = "";
            maodiany.Value = "";
            Response.Redirect(Request.Url.ToString());
        }
        conn.Close();
    }
    protected void Bt_delete_Click(object sender, EventArgs e)
    {
        conn.Open();
        string net1 = net.Value.Replace(" ","");
        SqlCommand cmd_delete_by_net = new SqlCommand("delete Device where Net='" + net1 + "'", conn);
        SqlCommand cmd_delete_maodian = new SqlCommand("delete Maodian where Net='" + net1 + "'", conn);
        if (net.Value != "")
        {
            bool flag = false;
            SqlCommand cmd_search_by_name = new SqlCommand("select Net from Device", conn);
            SqlDataReader reader = cmd_search_by_name.ExecuteReader();
            while (reader.Read())
            {
                if (reader[0].ToString().Replace(" ", "") == net1)
                {
                    flag = true;
                    break;
                }
            }
            if (!flag)
            {
                System.Web.UI.ScriptManager.RegisterStartupScript(this, this.GetType(), "opennewwindow", "alert('无此设备，无法删除！');", true);
                net.Value = "";
                voltage.Value = "";
                DropDownList1.SelectedItem.Text = DropDownList1.Items[0].ToString();
                maodianx.Value = "";
                maodiany.Value = "";
                reader.Close();
            }
            else
            {
                reader.Close();
                cmd_delete_by_net.ExecuteNonQuery();
                cmd_delete_maodian.ExecuteNonQuery();
                net.Value = "";
                voltage.Value = "";
                DropDownList1.SelectedItem.Text = DropDownList1.Items[0].ToString();
                maodianx.Value = "";
                maodiany.Value = "";
                System.Web.UI.ScriptManager.RegisterStartupScript(this, this.GetType(), "opennewwindow", "alert('删除成功！');", true);
                Response.Redirect(Request.Url.ToString());

            }

        }
        else
        {
            System.Web.UI.ScriptManager.RegisterStartupScript(this, this.GetType(), "opennewwindow", "alert('请输入信息！');", true);
            net.Value = "";
            voltage.Value = "";
            DropDownList1.SelectedItem.Text = DropDownList1.Items[0].ToString();
            maodianx.Value = "";
            maodiany.Value = "";
        }
        conn.Close();
    }
    static bool show2=false;
    protected void Bt_browse_Click(object sender, EventArgs e)
    {
       
        if (show2 == true)
        {
            div2.Style["display"] = "none";
            show2 = false;
        }
        else
        {
            div2.Style["display"] = "normal";
            show2 = true;
        }
        
    }
    static bool show1=true;
    protected void Button_device0_Click(object sender, EventArgs e)
    {
        
        if (show1 == true)
        {
            div1.Style["display"] = "none";
            show1 = false;
        }
        else
        {
            div1.Style["display"] = "normal";
            show1 = true;
        }
    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (DropDownList1.SelectedItem.Text == "定位基点")
        {
            div3.Style["display"] = "normal";
        }
        else div3.Style["display"] = "none";
    }
    protected void Page_Load(object sender, EventArgs e)
    {
       /* maodianx.Attributes.Add("readonly", "true");
        maodiany.Attributes.Add("readonly", "true");*/
        if (!IsPostBack)   //首次加载时
        {
          
            DropDownList1.AutoPostBack = true;

            DropDownList1.Items.Add("--请选择--");

            DropDownList1.Items.Add("定位卡");

            DropDownList1.Items.Add("定位基点");

            DropDownList1.Items.Add("路由器");

            DropDownList1.Items.Add("网关");

        }

    }


}