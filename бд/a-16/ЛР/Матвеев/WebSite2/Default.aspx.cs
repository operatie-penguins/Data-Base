using System;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.SqlClient;



public partial class _Default : System.Web.UI.Page 
{
    static string auth_str;


    protected void Page_Load(object sender, EventArgs e)
    {
        SqlConnectionStringBuilder builder = new SqlConnectionStringBuilder();
        //builder["Provider"] = "provider=SQLOLEDB.1";
        builder["Server"] = "(local)";
        builder["Integrated Security"] = "true";
        //builder["User Instance"] = "false";
        builder["Database"] = "planing";
        //builder["uid"] = "a";
        //builder["password"] = "";
        //builder["Pooling"] = "False";
        auth_str = builder.ConnectionString;
        //Console.WriteLine(builder.ConnectionString);


        WithMSSQL con1 = new WithMSSQL();

        string query = "select cmel, solod, voda from beer";
        string[,] matrix = new string[3, 3];
        matrix = con1.commandSQL(query, con1.connectToSQL(auth_str));

        Time.Text = "<table border='0' cellspacing='2' cellpadding='2' width='100%' bgcolor='#ffffff'>";
        Time.Text += "<tr style='color:#666; font-size: 100%;'><td>Сорт пива/Ингридиенты</td><td>Хмель</td><td>Солод</td><td>Вода</td>";

        for (int i = 0; i < 3; i++ )
        {
            Time.Text += "<tr style='color:#999; font-size: 80%;'>";
            if (i == 0) Time.Text += "<td>Светлое</td>";
            if (i == 1) Time.Text += "<td>Тёмное</td>";
            if (i == 2) Time.Text += "<td>Нефильтрованное</td>";
            for (int j=0; j<3; j++)
            {
            Time.Text += "<td>" + matrix[i,j] + "</td>";
            }
            Time.Text += "</tr>";
        }

    }

    public void Submit(object sender, EventArgs e)
    {

        string query = "select cmel, solod, voda from beer";
        string[,] matrix = new string[Convert.ToInt32(text2.Text), 3];
        WithMSSQL con1 = new WithMSSQL();
        matrix = con1.commandSQL(query, con1.connectToSQL(auth_str));

        /*WithMSSQL con1 = new WithMSSQL();*/
        query = "select light, dark, smooth from calendar where week between " + text1.Text + " and " + (text1.Text + text2.Text + 2) + "order by week";
        string[,] matrix2 = new string[3, 3];

        matrix2 = con1.commandSQL(query, con1.connectToSQL(auth_str));

        Label2.Text = "<table border='0' cellspacing='2' cellpadding='2' width='100%' bgcolor='#ffffff'>";
        Label2.Text += "<tr style='color:#666; font-size: 100%;'><td>Номер недели/Сорт пива</td><td>Светлое</td><td>Тёмное</td><td>Нефильтрованное</td>";

        int help = 0;
        for (int i = 0; i < (Convert.ToInt32(text2.Text) + 2); i++)
        {
            if (i == Convert.ToInt32(text2.Text)) Label2.Text += "<tr><td style='color:#777; font-size: 80%;'> И поставки на следующие 2 недели</td></tr>";

            Label2.Text += "<tr style='color:#999; font-size: 80%;'>";
            help = Convert.ToInt32(text1.Text) + i;
            Label2.Text += "<td>" + help + "</td>";
            
            for (int j = 0; j < 3; j++)
            {
                Label2.Text += "<td>" + matrix2[i, j] + "</td>";
            }
            Time.Text += "</tr>";
        }

        int cmel = 0;
        int solod = 0;
        int voda = 0;
        for (int i = 0; i < Convert.ToInt32(text2.Text); i++)
        {
            cmel += Convert.ToInt32(matrix[0, 0]) * Convert.ToInt32(matrix2[i, 0]) + Convert.ToInt32(matrix[1, 0]) * Convert.ToInt32(matrix2[i, 1]) + Convert.ToInt32(matrix[2, 0]) * Convert.ToInt32(matrix2[i, 2]);
            solod += Convert.ToInt32(matrix[0, 1]) * Convert.ToInt32(matrix2[i, 0]) + Convert.ToInt32(matrix[1, 1]) * Convert.ToInt32(matrix2[i, 1]) + Convert.ToInt32(matrix[2, 1]) * Convert.ToInt32(matrix2[i, 2]); ;
            voda += Convert.ToInt32(matrix[0, 2]) * Convert.ToInt32(matrix2[i, 0]) + Convert.ToInt32(matrix[1, 2]) * Convert.ToInt32(matrix2[i, 1]) + Convert.ToInt32(matrix[2, 2]) * Convert.ToInt32(matrix2[i, 2]); ; ;
        }
        Label1.Text = "<p>Итого: к " + text1.Text + "ой неделе понадобится единиц ХМЕЛЯ, СОЛОДА и ВОДЫ соответственно";
        Label1.Text += cmel + " " + solod + " " + voda + "</p>";
    }

    public void Add(object sender, EventArgs e)
    {
        string query = "insert into [planing].[dbo].[calendar]([week],[light],[smooth],[dark])values(" + TextBox4.Text + "," + TextBox1.Text + "," + TextBox2.Text + "," + TextBox3.Text + ")";
        string[,] matrix = new string[3, 3];
        WithMSSQL con1 = new WithMSSQL();
        matrix = con1.commandSQL(query, con1.connectToSQL(auth_str));
    }
}

public class WithMSSQL
{
    public SqlConnection connectToSQL(string aut_str)
    {     
        SqlConnection myConnection = new SqlConnection(aut_str);
        myConnection.Open();
        return myConnection;

    }
    public string[,] commandSQL(string command, SqlConnection myConnection)
    {
        string[,] comp = new string[32, 32];
        SqlCommand mycommand = new SqlCommand(command, myConnection);
        SqlDataAdapter sq = new SqlDataAdapter(mycommand);

            System.Data.DataSet ds = new System.Data.DataSet();
            sq.Fill(ds);

        
            if (ds.Tables.Count>0)
            {
                for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                {
                    for (int j = 0; j < ds.Tables[0].Columns.Count; j++)
                    {
                        //comp[i, j] = System.Convert.ToInt32(ds.Tables[0].Rows[i][j]);
                        comp[i, j] = Convert.ToString(ds.Tables[0].Rows[i][j]);
                        //Console.Write(ds.Tables[0].Rows[i][j] + " ");
                    }
                }
            }

        return comp;


    }
}
