<%@ Page %>
<script runat="server">
    void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack)
        {
            string selectedUser = dropDownListSelectUser.SelectedValue;
            FormsAuthentication.SetAuthCookie(new Dictionary<string, Guid>
            {
                {"User", UserPrincipal.UserGuid},
                {"Admin", UserPrincipal.AdminGuid}
            }[selectedUser].ToString(), false);
            Response.Redirect("~/");
            //Response.Redirect(Request.RawUrl); //Make it so the back button works without resubmitting form. 
        }
    }
</script>
<h1>Login</h1>
<form runat="server">
    Select Role: <asp:DropDownList id="dropDownListSelectUser" runat="server" DataSource='<%# new string[]{"User", "Admin"} %>' /><br />
    <input type="Submit" />
</form>
