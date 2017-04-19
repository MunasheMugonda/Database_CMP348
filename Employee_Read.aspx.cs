using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//add the namespaces here so that the sql connection, webconfigeration is recognised
using System.Data.SqlClient;
using System.Web.Configuration;


namespace DatabaseProject
{
    public partial class Employee_Read : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnReadData_Click(object sender, EventArgs e)
        {

            //Retrieve data from the database.

            //Develop the SQL call.
            String strSQL = "";
            strSQL = "SELECT * ";
            strSQL += " FROM Employee ";
            strSQL += "ORDER BY LastName, FirstName ";
            //Define the ADO.Net(application program interface) connection Object.
            SqlConnection objSqlConnection = new SqlConnection(WebConfigurationManager.ConnectionStrings["Northwind"].ConnectionString);  //connection with the connection string in the web.config
            //Create the SQL command object.
            SqlCommand objSqlCommand = new SqlCommand(strSQL, objSqlConnection); //put the command that needs to be exercuted and the database connection
            //Retrieve the rows from the table.
            objSqlConnection.Open();
            SqlDataReader objsqlDataReader = objSqlCommand.ExecuteReader();//fills up the reader with the data
            //Retrieve each row and display in the text box.
            while (objsqlDataReader.Read())
            {
                txtOutput.Text = txtOutput.Text + objsqlDataReader["LastName"].ToString() + ", " + objsqlDataReader["FirstName"].ToString() + "\r";
                
            }
            //close the data reader and connection.
            objsqlDataReader.Close();
            objSqlConnection.Close();


        }
    }
}