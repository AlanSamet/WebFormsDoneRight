<%@ Page %>
<script runat="server">
    void Page_Load(object sender, EventArgs e)
    {
        FormsAuthentication.SignOut();
        Response.Redirect("login.aspx");
    }
</script>