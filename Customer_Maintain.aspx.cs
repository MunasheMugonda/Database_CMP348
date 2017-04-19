using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace DatabaseProject
{
    public partial class Customer_Maintain : System.Web.UI.Page
    {
        //Define necessary module-level variables.
        Int32 int32NewlyInsertedPrimaryKey;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) {
                this.Master.MessageForeColor = System.Drawing.Color.DarkBlue;
                this.Master.Message = "Please choose form the options below";
            }
            
        }

        protected void sdsFormViewCustomer_Inserted(object sender, SqlDataSourceStatusEventArgs e)
        {
            //Get the primary key value of the newly inserted row so that the newly inserted row can be displayed. 
            //This is in the FormView ItemInserted method position the assorciated dropdownlist and FormView on the newly inserted row.
            if (e.Exception == null)
            {
                int32NewlyInsertedPrimaryKey = (Int32)e.Command.Parameters["@CustomerID"].Value;
            }
        }

        protected void fovCustomer_ItemInserted(object sender, FormViewInsertedEventArgs e)
        {
            //Make sure that the database call was successful.
            if (e.Exception == null)
            {
                if(e.AffectedRows == 1)
                {
                    //Set the message
                    this.Master.MessageForeColor = System.Drawing.Color.DeepSkyBlue;
                    this.Master.Message = "Customer successfully added.";
                }
                else
                {
                    //set the message
                    this.Master.MessageForeColor = System.Drawing.Color.Red;
                    this.Master.Message = "Customer was not successfully added. Please report this message to Munashe(Munashe.Mugonda@franklincollege.edu).";
                    e.KeepInInsertMode = true;
                }
                
                //Refresh the page data.
                ddlCustomer.DataBind();
                ddlCustomer.SelectedValue = int32NewlyInsertedPrimaryKey.ToString();
                fovCustomer.DataBind();
                           
            }
            else
            { //set the message
                this.Master.MessageForeColor = System.Drawing.Color.Red;
                this.Master.Message = "Customer was not successfully added. Please report this message to Munashe(Munashe.Mugonda@franklincollege.edu):" + e.Exception;
                e.KeepInInsertMode = true;
                e.ExceptionHandled = true;
            }
        }

        protected void fovCustomer_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
        {
            //Make sure that the database call was successful.
            if (e.Exception == null)
            {
                if (e.AffectedRows == 1)
                {
                    //Set the message
                    this.Master.MessageForeColor = System.Drawing.Color.DeepSkyBlue;
                    this.Master.Message = "Customer successfully added.";
                }
                else
                {
                    //set the message
                    this.Master.MessageForeColor = System.Drawing.Color.Red;
                    this.Master.Message = "Customer was not successfully modified. Please report this message to Munashe(Munashe.Mugonda@franklincollege.edu).";
                    e.KeepInEditMode = true;
                }

                //Refresh the page data.
                String strSelectedValue = ddlCustomer.SelectedValue;
                ddlCustomer.DataBind();
                ddlCustomer.SelectedValue = strSelectedValue.ToString();
                fovCustomer.DataBind();

            }
            else
            { //set the message
                this.Master.MessageForeColor = System.Drawing.Color.Red;
                this.Master.Message = "Customer was not successfully modified. Please report this message to Munashe(Munashe.Mugonda@franklincollege.edu):" + e.Exception;
                e.KeepInEditMode = true;
                e.ExceptionHandled = true;
            }
            
        }

        protected void fovCustomer_ItemDeleted(object sender, FormViewDeletedEventArgs e)
        {
            //Make sure that the database call was successful.
            if (e.Exception == null)
            {
                if (e.AffectedRows == 1)
                {
                    //Set the message
                    this.Master.MessageForeColor = System.Drawing.Color.DeepSkyBlue;
                    this.Master.Message = "Customer successfully deleted.";
                }
                else
                {
                    //set the message
                    this.Master.MessageForeColor = System.Drawing.Color.Red;
                    this.Master.Message = "Customer was not successfully deleted. Please report this message to Munashe(Munashe.Mugonda@franklincollege.edu).";
                    e.ExceptionHandled = true;
                }

                //Refresh the page data.
                ddlCustomer.DataBind();
                fovCustomer.DataBind();

            }
            else
            {
                if (((SqlException)e.Exception).Number.Equals(547))
                {
                    //set the message(foreign key constraint problem)
                    this.Master.MessageForeColor = System.Drawing.Color.Red;
                    this.Master.Message = "Customer was NOT successfully deleted. To delete this Customer, you must first delete all assorciate products";
                    e.ExceptionHandled = true;
                }
                else
                {
                    //set the message(generic message)
                    this.Master.MessageForeColor = System.Drawing.Color.Red;
                    this.Master.Message = "Customer was not successfully deleted. Please report this message to Munashe(Munashe.Mugonda@franklincollege.edu):" + e.Exception;
                    e.ExceptionHandled = true;
                }
            }

        }

        
    }
}