<%@ Control %>
<script runat="server">
    public string PageTitle {get;set;}
</script>
<html>
    <head>
        <title><%# PageTitle %></title>
    </head>
    <body>
        <asp:HyperLink runat="server" NavigateUrl="~/">Home</asp:HyperLink>
        | <asp:HyperLink runat="server" NavigateUrl="~/ViewPeople.aspx">View People List</asp:HyperLink>
        <asp:PlaceHolder runat="server" Visible='<%# UserPrincipal.Current.IsInRole("Admin") %>'>
           | <asp:HyperLink runat="server" NavigateUrl="~/Admin/">Admin</asp:HyperLink>
        </asp:PlaceHolder>
        <asp:PlaceHolder runat="server" Visible='<%# UserPrincipal.Current.IsAuthenticated %>'>
           | <asp:HyperLink runat="server" NavigateUrl="~/SignOut.aspx">Sign Out</asp:HyperLink>&nbsp;<%# UserPrincipal.Current.Identity.Name %>
        </asp:PlaceHolder>
        <br /><br />