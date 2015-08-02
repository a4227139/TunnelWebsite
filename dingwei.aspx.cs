using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Threading;
using System.Timers;
public partial class _Default : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection("Data Source =.;Initial Catalog=Contiki;Integrated Security=true");
    int count1;//count1表示当前收到的节点的个数
    long[] count2 = new long[10]; //count2表示对应节点在数据库中记录的条数
    struct Node
    {
        public double x;
        public double y;
        public string net;
        public string name;
        public string gongzhong;
    }
    Node[] node = new Node[10];
    protected void Page_Load(object sender, EventArgs e)
    {
        Label1.Text = DateTime.Now.ToLongDateString();
        Label2.Text = DateTime.Now.ToLongTimeString();
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        Timer1_Tick( sender,  e);
        Timer1.Enabled = true;
        ImageButton1.ImageUrl = "~/images/clicklocation.png";
        Label4.Text = " ------将鼠标移至工人身上可查看其详细信息-----       ";
        Label4.Visible = true;
    }

    protected void Timer1_Tick(object sender, EventArgs e)
    {
        int i; bool[] exist = new bool[10];
        conn.Open();
        SqlCommand cmd_All_Node = new SqlCommand("select Net,X,Y from Location", conn);
        SqlDataReader reader2 = cmd_All_Node.ExecuteReader();
        DateTime dt = new DateTime();
        dt = DateTime.Now;
        //time.Value = dt.ToLongTimeString();
        //date.Value = dt.ToLongDateString();
        while (reader2.Read())//把数据库中所有节点和它们的坐标放进node数组
        {
            for (i = 0; i < count1; i++)
                if (node[i].net == reader2[0].ToString().Replace(" ", ""))
                    break;
            if (i == count1)
            {
                node[i].net = reader2[0].ToString().Replace(" ", "");
                node[i].x = double.Parse(reader2[0].ToString().Replace(" ", ""));
                node[i].y = double.Parse(reader2[0].ToString().Replace(" ", ""));
                count1++;
            }
        }
        reader2.Close();
        for (i = 0; i < count1; i++)//数据库中存在多少个节点，就将前多少个exist赋值为真
            exist[i] = true;
        Label3.Text = count1.ToString();
        for (i = 0; i < count1; i++)
        {
            int j = 0;
            SqlCommand cmd_Count = new SqlCommand("select count(*) from Location where Net=" + node[i].net + "", conn);
            SqlDataReader count = cmd_Count.ExecuteReader();
            count.Read();
            count2[i] = long.Parse(count[0].ToString().Replace(" ", ""));//对应节点在数据库中的记录的个数
            count.Close();
            SqlCommand cmd_SelectXY = new SqlCommand("select X,Y from Location where Net=" + node[i].net + "", conn);
            SqlDataReader reader = cmd_SelectXY.ExecuteReader();
            while (j < count2[i])//将对应节点在数据库中最后的坐标赋值给node[i]
            {
                reader.Read();
                j++;
            }
            node[i].x = double.Parse(reader[0].ToString().Replace(" ", ""));
            node[i].y = double.Parse(reader[1].ToString().Replace(" ", ""));
            reader.Close();
            /*SqlCommand cmd_SelectX = new SqlCommand("select cast(X as x) from Location where Net=" + node[i].net + "", conn);
            node[i].x = (double)cmd_SelectX.ExecuteScalar();
            conn.Close();
            conn.Open();
            SqlCommand cmd_SelectY = new SqlCommand("select cast(Y as y) from Location where Net=" + node[i].net + "", conn);
            node[i].y = (double)cmd_SelectY.ExecuteScalar();*/
            SqlCommand cmd_SelectNG = new SqlCommand("select Name,Gongzhong from Eminformation where Node=" + node[i].net + " ", conn);
            SqlDataReader reader1 = cmd_SelectNG.ExecuteReader();
            if (reader1.Read())
            {
                node[i].name = reader1[0].ToString();
                node[i].gongzhong = reader1[1].ToString();
            }
            reader1.Close();
        }
        if (exist[0] == true)
        {
            span1.Style["display"] = "";
            span1.Style["left"] =(node[0].x+130).ToString() + "px";//x
            span1.Style["top"] = (node[0].y+84).ToString() + "px";//y
            span1.ToolTip = "坐标（" + (node[0].x / 10).ToString() + " ," + (node[0].y / 10).ToString() + ")  节点：" + node[0].net + "  姓名：" + node[0].name.Replace(" ", "") + "  工种：" + node[0].gongzhong;
        }
        if (exist[1] == true)
        {
            span2.Style["display"] = "";
            span2.Style["left"] = (node[1].x + 130).ToString() + "px";//x
            span2.Style["top"] = (node[1].x + 84).ToString() + "px";//y
            span2.ToolTip = "坐标（" + (node[1].x / 10).ToString() + " ," + (node[1].y / 10).ToString() + ")  节点：" + node[1].net + "  姓名：" + node[1].name.Replace(" ", "") + "  工种：" + node[1].gongzhong;
        }
        if (exist[2] == true)
        {
            span3.Style["display"] = "";
            span3.Style["left"] = (node[2].x + 130).ToString() + "px";//x
            span3.Style["top"] = (node[2].x + 84).ToString() + "px";//y
            span3.ToolTip = "坐标（" + (node[2].x / 10).ToString() + " ," + (node[2].y / 10).ToString() + ")  节点：" + node[2].net + "  姓名：" + node[2].name.Replace(" ", "") + "  工种：" + node[2].gongzhong;
        }
        if (exist[3] == true)
        {
            span4.Style["display"] = "";
            span4.Style["left"] = (node[3].x + 130).ToString() + "px";//x
            span4.Style["top"] = (node[3].x + 84).ToString() + "px";//y
            span4.ToolTip = "坐标（" + (node[3].x / 10).ToString() + " ," + (node[3].y / 10).ToString() + ")  节点：" + node[3].net + "  姓名：" + node[3].name.Replace(" ", "") + "  工种：" + node[3].gongzhong;
        }
        if (exist[4] == true)
        {
            span5.Style["display"] = "";
            span5.Style["left"] = (node[4].x + 130).ToString() + "px";//x
            span5.Style["top"] = (node[4].x + 84).ToString() + "px";//y
            span5.ToolTip = "坐标（" + (node[4].x / 10).ToString() + " ," + (node[4].y / 10).ToString() + ")  节点：" + node[4].net + "  姓名：" + node[4].name.Replace(" ", "") + "  工种：" + node[4].gongzhong;
        }
        conn.Close();

    }

}