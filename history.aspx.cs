using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class _Default : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
       
    }

   /* protected void ImageButton_Click(object sender, ImageClickEventArgs e)
    {
        DateCalendar.Visible = !DateCalendar.Visible;
    }

    protected void RequestedDeliveryDateCalendar_SelectionChanged(object sender, EventArgs eventArgs)
    {
        TextBox_date.Text = DateCalendar.SelectedDate.ToShortDateString();

        // 隐藏日历  
        DateCalendar.Visible = false;
    }*/
    

    //the number of real pan 
    public static int countpan = 0;

    protected void Button_OK_Click(object sender, EventArgs e)
    {

        if (TextBox_ID.Value == "" || TextBox_date.Value == "")
        {
            System.Web.UI.ScriptManager.RegisterStartupScript(this, this.GetType(), "opennewwindow", "alert('员工编号、查询日期不能为空！');", true);
        }
        else
        {
            SqlConnection conn = new SqlConnection("Data Source =.;Initial Catalog=Contiki;Integrated Security=true");
            conn.Open();
            SqlConnection conn1 = new SqlConnection("Data Source =.;Initial Catalog=Contiki;Integrated Security=true");
            conn1.Open();
            SqlCommand comm_count = new SqlCommand();
            comm_count.Connection = conn;
            comm_count.CommandText = "select count(*) from Location where Net = '" + TextBox_ID.Value + "' and Date = '" + TextBox_date.Value + "'";
            int count = (int)comm_count.ExecuteScalar();
            int len = count / 20;
            if (len == 0)
            {
                len = 1;
            }

            SqlCommand comm_show = new SqlCommand();
            comm_show.Connection = conn;
            comm_show.CommandText = "select * from Location where Net = '" + TextBox_ID.Value + "' and Date = '" + TextBox_date.Value + "'";

            SqlDataAdapter ad = new SqlDataAdapter();
            ad.SelectCommand = comm_show;

            DataSet dataset = new DataSet();
            ad.Fill(dataset, "s");
            dataset.Tables["s"].Clear();
            ad.Fill(dataset, "s");
            GridView1.DataSource = dataset.Tables["s"];
            GridView1.DataBind();
            GridView1.Visible = false;            
            
            Image[] span = new Image[50] { span1, span2, span3, span4, span5, span6, span7, span8, span9, span10, 
            span11,span12, span13, span14, span15, span16, span17, span18, span19, span20, span21, span22, span23, 
            span24, span25, span26, span27, span28, span29, span30, span31, span32, span33, span34, span35, span36, span37, 
            span38, span39, span40, span41, span42, span43, span44, span45, span46, span47, span48, span49, span50 };
           
            int i = 0;//数据行号
            int j = 0;//span序号            
            
            while (i < count & j < 50)
            {
                    //span[j].Style["display"] = "";
                    span[j].Style["left"] = (double.Parse(GridView1.Rows[i].Cells[1].Text.Replace(" ", ""))+130).ToString()+ "px";
                    span[j].Style["top"] = (double.Parse(GridView1.Rows[i].Cells[2].Text.Replace(" ", "")) + 84).ToString()+ "px";

                    double x = double.Parse(GridView1.Rows[i].Cells[1].Text.Replace(" ", ""));
                    double y = double.Parse(GridView1.Rows[i].Cells[2].Text.Replace(" ", ""));
                    span[j].ToolTip = "坐标（" + (x / 10).ToString() + " ," + (y / 10).ToString() + ")";

                    //span[j].Visible = false;

                    i += len;
                    j++;                    
            }

            countpan = j - 1;
            
            conn.Close();

            SqlCommand cmd_search_by_name = new SqlCommand("select * from Eminformation", conn1);
            SqlDataReader reader = cmd_search_by_name.ExecuteReader();
            while (reader.Read())
            {
                if (reader[0].ToString().Replace(" ", "") == TextBox_ID.Value)
                {
                    
                   
                    name.Value = reader[1].ToString();
                    sex.Value = reader[2].ToString();
                    gongzhong.Value = reader[3].ToString();
                   
                    age.Value = reader[5].ToString();
                    
                    break;
                }
            }
            reader.Close();
            conn1.Close();
            //Timer1.Enabled = true;
            Label4.Text = " ------将鼠标移至工人身上可查看其坐标-----       ";
            Label4.Visible = true;
        }
        ClientScript.RegisterStartupScript(ClientScript.GetType(), "myscript", "<script>Show();</script>");
    }


    //the numeber of show pan
    static int showpan = 0;

    protected void Timer1_Tick(object sender, EventArgs e)
    {
        showpan += 1;

        Image[] span_t = new Image[50] { span1, span2, span3, span4, span5, span6, span7, span8, span9, span10, 
            span11,span12, span13, span14, span15, span16, span17, span18, span19, span20, span21, span22, span23, 
            span24, span25, span26, span27, span28, span29, span30, span31, span32, span33, span34, span35, span36, span37, 
            span38, span39, span40, span41, span42, span43, span44, span45, span46, span47, span48, span49, span50 };

        if (showpan <= countpan)
        {
            for (int i = 0; i < showpan; i++)
            {
                span_t[i].Visible = true;
            }
        }

        else
        {
            Timer1.Enabled = false;
            showpan = 0;
            countpan = 0;
        }
        SqlConnection conn1 = new SqlConnection("Data Source =.;Initial Catalog=Contiki;Integrated Security=true");
        conn1.Open();
        SqlCommand cmd_search_by_name = new SqlCommand("select * from Eminformation", conn1);
        SqlDataReader reader = cmd_search_by_name.ExecuteReader();
        while (reader.Read())
        {
            if (reader[0].ToString().Replace(" ", "") == TextBox_ID.Value)
            {


                name.Value = reader[1].ToString();
                sex.Value = reader[2].ToString();
                gongzhong.Value = reader[3].ToString();

                age.Value = reader[5].ToString();

                break;
            }
        }
    }


}