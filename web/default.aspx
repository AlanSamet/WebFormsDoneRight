<%@ Page Language="C#" %>
<script runat="server">
    void Page_Init(object sender, EventArgs e)
    {
        PageTitle = "I'm Home!";
    }
</script>
<h1>Home</h1>
Hello, <%# UserPrincipal.Current.Name %>. The time is now: <%# DateTime.Now %><br /><br />

<asp:PlaceHolder runat="server" Visible='<%# UserPrincipal.Current.IsInRole("Admin") %>'>
    <div style="color:red;">You are an admin user.</div>
</asp:PlaceHolder>