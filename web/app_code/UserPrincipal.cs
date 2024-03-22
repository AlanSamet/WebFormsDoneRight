using System;
using System.Security.Principal;
using System.Web;

public class UserPrincipal : IPrincipal, IIdentity
{
    //Hardcoded for demo
    public static Guid AdminGuid = new Guid("85645A4A-D3F3-404D-90A4-1180F9AC6FFE");
    public static Guid UserGuid = new Guid("42118180-4E10-4506-92B8-6BC37E0D2233");

    public IIdentity Identity 
    {
        get 
        {
            return this;
        }
    }

    public string AuthenticationType
    {
        get
        {
            return "WebFormsDoneRight";
        }
    }

    public static UserPrincipal Current
    {
        get
        {
            var up = HttpContext.Current.User as UserPrincipal;
            if (up == null)
            {
                HttpContext.Current.User = up = new UserPrincipal("", new string[]{});
            }
            return up;
        }
    }

    public bool IsAuthenticated 
    {
        get
        {
            return !string.IsNullOrWhiteSpace(Name);
        }
    }

    public string Name {get;private set;}
    string[] _roles;
    public UserPrincipal(string username, string[] roles)
    {
        Name = username;
        _roles = roles ?? new string[]{};
    }

    public bool IsInRole(string rolename)
    {
        return Array.IndexOf(_roles, rolename) > -1;
    }
}