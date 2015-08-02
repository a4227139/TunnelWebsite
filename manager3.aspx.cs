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
        if (name.Value.ToString() == "" || node.Value.ToString() == "")
            System.Web.UI.ScriptManager.RegisterStartupScript(this, this.GetType(), "opennewwindow", "alert('请输入信息！');", true);
        else if (idcard.Value.Length != 18) System.Web.UI.ScriptManager.RegisterStartupScript(this, this.GetType(), "opennewwindow", "alert('身份证格式错误！');", true);
        else if (phone.Value.Length != 11) System.Web.UI.ScriptManager.RegisterStartupScript(this, this.GetType(), "opennewwindow", "alert('手机号码格式错误！');", true);
        else if (int.Parse(node.Value) > 256256) System.Web.UI.ScriptManager.RegisterStartupScript(this, this.GetType(), "opennewwindow", "alert('设备地址格式错误！');", true);
        else if (!(node.Value.ToString().StartsWith("2") || node.Value.ToString().StartsWith("1"))) System.Web.UI.ScriptManager.RegisterStartupScript(this, this.GetType(), "opennewwindow", "alert('设备地址格式错误！');", true);
        else
        {
            conn.Open();
            SqlCommand cmd_check_exist = new SqlCommand("select Node from Eminformation", conn);
            SqlDataReader reader = cmd_check_exist.ExecuteReader();
            while (reader.Read())
            {
                if (reader[0].ToString().Replace(" ", "") == node.Value.ToString())
                {
                    System.Web.UI.ScriptManager.RegisterStartupScript(this, this.GetType(), "opennewwindow", "alert('该记录已存在！');", true);
                    break;
                }
            }
            if (!reader.Read())
            {
                string new_name = name.Value.ToString();
                string new_age = age.Value.ToString();
                string new_address = address.Value.ToString();
                string new_node = node.Value.ToString();
                string new_sex = DropDownList1.SelectedItem.Text;
                string new_gongzhong = gongzhong.Value.ToString();
                string new_phone = phone.Value.ToString();
                string new_idcard = idcard.Value.ToString();
                reader.Close();
                SqlCommand cmd = new SqlCommand("insert into Eminformation( Eminformation.Node, Eminformation.Name, Eminformation.Sex, Eminformation.Gongzhong, Eminformation.Phone, Eminformation.Age, Eminformation.IdCard, Eminformation.Address) values('" + new_node + "','" + new_name + "','" + new_sex + "','" + new_gongzhong + "','" + new_phone + "','" + new_age + "','" + new_idcard + "','" + new_address + "')", conn);
                cmd.ExecuteNonQuery();
            }
            Response.Redirect(Request.Url.ToString());
            conn.Close();
        }

    }
    protected void Bt_search_Click(object sender, EventArgs e)
    {
        conn.Open();
        string name1, net;
        if (syname.Value != "")
        {
            name1 = syname.Value.ToString(); bool flag = false;
            SqlCommand cmd_search_by_name = new SqlCommand("select * from Eminformation", conn);
            SqlDataReader reader = cmd_search_by_name.ExecuteReader();
            while (reader.Read())
            {
                if (reader[1].ToString().Replace(" ", "") == name1)
                {
                    flag = true;
                    syname.Value = "";
                    synet.Value = "";
                    node.Value = reader[0].ToString().Trim();
                    name.Value = reader[1].ToString().Trim();
                    //sex.Value = reader[2].ToString();
                    gongzhong.Value = reader[3].ToString().Trim();
                    phone.Value = reader[4].ToString().Trim();
                    age.Value = reader[5].ToString().Trim();
                    idcard.Value = reader[6].ToString().Trim();
                    address.Value = reader[7].ToString().Trim();
                    string sex = reader[2].ToString().Trim();
                    if (sex == "男")
                    {
                        DropDownList1.Items[0].Selected = false;
                        DropDownList1.Items[1].Selected = true;
                        DropDownList1.Items[2].Selected = false;
                    }
                    else
                    {
                        DropDownList1.Items[0].Selected = false;
                        DropDownList1.Items[1].Selected = false;
                        DropDownList1.Items[2].Selected = true;
                    }
                    break;
                }
            }
            if (!flag)
            {
                System.Web.UI.ScriptManager.RegisterStartupScript(this, this.GetType(), "opennewwindow", "alert('查无此人！');", true);
            }
            reader.Close();
        }
        else if (synet.Value != "")
        {
            net = synet.Value.ToString(); bool flag = false;
            SqlCommand cmd_search_by_net = new SqlCommand("select * from Eminformation", conn);
            SqlDataReader reader = cmd_search_by_net.ExecuteReader();
            while (reader.Read())
            {
                if (reader[0].ToString().Replace(" ", "") == net)
                {
                    flag = true;
                    synet.Value = "";
                    syname.Value = "";
                    node.Value = reader[0].ToString().Trim();
                    name.Value = reader[1].ToString().Trim();
                    //sex.Value = reader[2].ToString();
                    gongzhong.Value = reader[3].ToString().Trim();
                    phone.Value = reader[4].ToString().Trim();
                    age.Value = reader[5].ToString().Trim();
                    idcard.Value = reader[6].ToString().Trim();
                    address.Value = reader[7].ToString().Trim();
                    string sex = reader[2].ToString().Trim();
                    if (sex.Replace(" ", "") == "男")
                    {
                        DropDownList1.Items[0].Selected = false;
                        DropDownList1.Items[1].Selected = true;
                        DropDownList1.Items[2].Selected = false;
                    }
                    else
                    {
                        DropDownList1.Items[0].Selected = false;
                        DropDownList1.Items[1].Selected = false;
                        DropDownList1.Items[2].Selected = true;
                    }
                    break;
                }
            }
            if (!flag)
            {
                System.Web.UI.ScriptManager.RegisterStartupScript(this, this.GetType(), "opennewwindow", "alert('查无此人！');", true);
            }
            reader.Close();
        }
        else System.Web.UI.ScriptManager.RegisterStartupScript(this, this.GetType(), "opennewwindow", "alert('请输入信息！');", true);
        conn.Close();
    }
    protected void Bt_clean_Click(object sender, EventArgs e)
    {
        synet.Value = "";
        syname.Value = "";
        node.Value = "";
        name.Value = "";
        //sex.Value = "";
        gongzhong.Value = "";
        phone.Value = "";
        age.Value = "";
        idcard.Value = "";
        address.Value = "";
        DropDownList1.Items[0].Selected = true;
        DropDownList1.Items[1].Selected = false;
        DropDownList1.Items[2].Selected = false;
    }
    protected void Bt_change_Click(object sender, EventArgs e)
    {
        if (idcard.Value.Trim().Length != 18) System.Web.UI.ScriptManager.RegisterStartupScript(this, this.GetType(), "opennewwindow", "alert('身份证格式错误！');", true);
        else if (phone.Value.Trim().Length != 11) System.Web.UI.ScriptManager.RegisterStartupScript(this, this.GetType(), "opennewwindow", "alert('手机号码格式错误！');", true);
        else if (int.Parse(node.Value) > 256256) System.Web.UI.ScriptManager.RegisterStartupScript(this, this.GetType(), "opennewwindow", "alert('设备地址格式错误！');", true);
        else if (!(node.Value.ToString().StartsWith("2") || node.Value.ToString().StartsWith("1"))) System.Web.UI.ScriptManager.RegisterStartupScript(this, this.GetType(), "opennewwindow", "alert('设备地址格式错误！');", true);
        else
        {
            conn.Open();
            string new_name = name.Value.ToString();
            string new_age = age.Value.ToString();
            string new_address = address.Value.ToString();
            string new_node = node.Value.ToString();
            string new_sex = DropDownList1.SelectedItem.Text;
            string new_gongzhong = gongzhong.Value.ToString();
            string new_phone = phone.Value.ToString();
            string new_idcard = idcard.Value.ToString();
            SqlCommand cmd_update_by_name = new SqlCommand("update Eminformation set Node='" + new_node + "',Age='" + new_age + "',Address='" + new_address + "',Sex='" + new_sex + "',Phone='" + new_phone + "',IdCard='" + new_idcard + "',Gongzhong='" + new_gongzhong + "'where Name='" + new_name + "'", conn);
            cmd_update_by_name.ExecuteNonQuery();
            SqlCommand cmd_update_by_net = new SqlCommand("update Eminformation set Name='" + new_name + "',Age='" + new_age + "',Address='" + new_address + "',Sex='" + new_sex + "',Phone='" + new_phone + "',IdCard='" + new_idcard + "',Gongzhong='" + new_gongzhong + "'where Node='" + new_node + "'", conn);
            cmd_update_by_net.ExecuteNonQuery();
            Response.Redirect(Request.Url.ToString());
            conn.Close();
        }
    }
    protected void Bt_delete_Click(object sender, EventArgs e)
    {
        conn.Open();
        string name1 = name.Value.Replace(" ", "");
        string net = synet.Value;
        SqlCommand cmd_delete_by_name = new SqlCommand("delete Eminformation where Name='" + name1 + "'", conn);
        SqlCommand cmd_delete_by_net = new SqlCommand("delete Eminformation where Node='" + net + "'", conn);
        if (name.Value != "")
        {
            bool flag = false;
            SqlCommand cmd_search_by_name = new SqlCommand("select * from Eminformation", conn);
            SqlDataReader reader = cmd_search_by_name.ExecuteReader();
            while (reader.Read())
            {
                if (reader[1].ToString().Replace(" ", "") == name1)
                {
                    flag = true;
                    break;
                }
            }
            if (!flag)
            {
                System.Web.UI.ScriptManager.RegisterStartupScript(this, this.GetType(), "opennewwindow", "alert('无此人，无法删除！');", true);
                reader.Close();
            }
            else
            {
                reader.Close();
                cmd_delete_by_name.ExecuteNonQuery();
                Response.Redirect(Request.Url.ToString());
            }

        }
        else if (synet.Value != "")
        {
            bool flag = false;
            SqlCommand cmd_search_by_net = new SqlCommand("select * from Eminformation", conn);
            SqlDataReader reader = cmd_search_by_net.ExecuteReader();
            while (reader.Read())
            {
                if (reader[0].ToString().Replace(" ", "") == net)
                {
                    flag = true;
                    break;
                }
            }
            if (!flag)
            {
                System.Web.UI.ScriptManager.RegisterStartupScript(this, this.GetType(), "opennewwindow", "alert('无此人，无法删除！');", true);
                reader.Close();
            }
            else
            {
                reader.Close();
                cmd_delete_by_net.ExecuteNonQuery();
            }
        }
        else System.Web.UI.ScriptManager.RegisterStartupScript(this, this.GetType(), "opennewwindow", "alert('请输入信息！');", true);
        cmd_delete_by_net.ExecuteNonQuery();
        conn.Close();
    }
    static bool show3 = false;
    protected void Bt_browse_Click(object sender, EventArgs e)
    {
        if (show3 == true)
        {
            div3.Style["display"] = "none";
            show3 = false;
        }
        else
        {
            div3.Style["display"] = "normal";
            show3 = true;
        }
    }
    static bool show1 = true;
    protected void Button_yuangongxingxi_Click(object sender, EventArgs e)
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
    static bool show2 = false;
    protected void Button1_Click(object sender, EventArgs e)
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
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void Page_Load(object sender, EventArgs e)
    {
        /* maodianx.Attributes.Add("readonly", "true");
         maodiany.Attributes.Add("readonly", "true");*/
        if (!IsPostBack)   //首次加载时
        {
            DropDownList1.AutoPostBack = true;
            DropDownList1.Items.Add("----------请选择----------");
            DropDownList1.Items.Add("男");
            DropDownList1.Items.Add("女");
        }

    }
}