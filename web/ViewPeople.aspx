<%@ Page %>
<script runat="server">
    public class ViewPeopleModel
    {
        public Person[] People {get;set;}
    }

    ViewPeopleModel Model {get;set;}

    void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack)
        {
            //Redux style. And it allows the back button to work without reposting form data. 
            Response.Redirect(Request.RawUrl); 
        }

        Model = new ViewPeopleModel
        {
            People = new Person[]
            {
                new Person{FirstName="Bob", LastName="Smith"},
                new Person{FirstName="Susan", LastName="Doe"}
            }
        };
    }
</script>
<h1>View People</h1>
<asp:Repeater runat="server" DataSource='<%# Model.People %>'>
    <ItemTemplate>
        <WFDR:PersonControl runat="server" Person='<%# Container.DataItem %>'>
            <PersonTemplate>
                <%# Eval("LastName")%>, <%# Eval("FirstName") %>
            </PersonTemplate>
        </WFDR:PersonControl>
    </ItemTemplate>
</asp:Repeater>