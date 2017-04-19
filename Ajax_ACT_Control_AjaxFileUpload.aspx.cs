using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace DatabaseProject
{
    public partial class Ajax_ACT_Control_AjaxFileUpload : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           

        }

        protected void afuDocuments_UploadComplete(object sender, AjaxControlToolkit.AjaxFileUploadEventArgs e)
        {
            //Save the file to specified  location.
            String strFilePath = Request.PhysicalApplicationPath + "Documents\\" + e.FileName;
            afuDocuments.SaveAs(strFilePath);
        }
    }
}