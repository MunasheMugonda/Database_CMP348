using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DatabaseProject
{
    public partial class AjaxDemo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblCurrentTime.Text = DateTime.Now.ToString();
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            lbloutput.Text = txtInput.Text;
        }

        protected void timCurrentTime_Tick(object sender, EventArgs e)
        {
            lblCurrentTime.Text = DateTime.Now.ToString();
        }
    }
}