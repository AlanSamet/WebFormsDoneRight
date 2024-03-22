<%@ Application %>
<script runat="server">
    void Application_AuthenticateRequest(object sender, EventArgs e)
    {
        //I usually would use FormsAuthentication to encrypt a GUID to store as a cookie.
        //This has the added benefit of making anyone intent on bypassing security waste resources
        //on something fruitless. And to sign a user out from all locations, I can change the GUID
        //in the database. Or I can sign them out from the single browser if they want. 
        HttpContext.Current.User = null;
        //HttpContext.Current.Response.Write("auth");
        var cookie = HttpContext.Current.Request.Cookies[FormsAuthentication.FormsCookieName];
        if (cookie != null)
        {
            //HttpContext.Current.Response.Write("Has cookie");
            FormsAuthenticationTicket authTicket = FormsAuthentication.Decrypt(cookie.Value);
            if (authTicket != null)
            {
                //HttpContext.Current.Response.Write(authTicket.Name);
                if (authTicket.Name == UserPrincipal.UserGuid.ToString())
                    HttpContext.Current.User = new UserPrincipal("User", new string[]{"User"});
                else if (authTicket.Name == UserPrincipal.AdminGuid.ToString())
                    HttpContext.Current.User = new UserPrincipal("Admin", new string[]{"Admin"});
            }
        }

        //HttpContext.Current.User = new UserPrincipal("DemoUser", "User|Admin".Split('|')); 
    }
</script>