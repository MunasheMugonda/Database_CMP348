using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//create namespaces here to include methods and properties we need
using System.Data.SqlClient;//thats where create some sql code to be able to access SQL database
using System.Web.Configuration;//needed to create a connection string
using System.Net.Mail; //needed to for emails



namespace DatabaseProject
{
    public partial class Shipper_Maintain : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            
            
        }

        protected void sdsListViewShipper_Updated(object sender, SqlDataSourceStatusEventArgs e)
        {

            //get address of the modified shipper
            TextBox objTextBox = new TextBox();
            objTextBox = (TextBox)livShipper.EditItem.FindControl("txtEmailAddress");
            String strEmailAddress = objTextBox.Text;
            //Build the email message.
            MailMessage objMailMessage = new MailMessage();
            objMailMessage.Subject = "Password Retrieval";
            objMailMessage.Body = "Hi, " + "<br /><br />" + "The company's information has been updated. If you did no make any changes, please contact Northwind.<br /><br />Take care,<br /><br />Munashe";
            objMailMessage.From = new MailAddress("autoreply@northwind.com");
            objMailMessage.To.Add(new MailAddress(strEmailAddress));
            objMailMessage.IsBodyHtml = true;

            //Send the email message
            SmtpClient objSmtpClient = new SmtpClient();
            objSmtpClient.Send(objMailMessage);
            //Set the message.
            this.Master.MessageForeColor = System.Drawing.Color.Green;
            this.Master.Message = "Your information has been updated.";





        }
    }
}