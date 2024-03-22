using System;
using System.Web;
using System.Web.UI;

namespace WebFormsDoneRight
{
    // If using codebehinds, this can let you use generics, but I haven't figured out how to specify a generic type in the @page directive. 
    // public class PageBase<TModel> : System.Web.UI.Page
    // {
    //     protected TModel Model {get;set;}
    //     protected override void OnPreRender(EventArgs e)
    //     {
    //         DataBind();
    //     }
    // }
    // public class PageBase : PageBase<object>
    // {
        
    // }

    public class PageBase : System.Web.UI.Page
    {
        UserControl _headerControl = null;
        protected override void OnInit(EventArgs e)
        {
            _headerControl = (UserControl)LoadControl("~/UserControls/HeaderContent.ascx");
            Controls.AddAt(0, _headerControl);
            Controls.AddAt(-1, LoadControl("~/UserControls/FooterContent.ascx"));
            base.OnInit(e);
        }

        public string PageTitle
        {
            get { return (string)_headerControl.GetType().GetProperty("PageTitle").GetValue(_headerControl); }
            set { _headerControl.GetType().GetProperty("PageTitle").SetValue(_headerControl, value); }
        }

        protected override void OnPreRender(EventArgs e)
        {
            DataBind();
        }
    }
}