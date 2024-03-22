<%@ Control %>
<script runat="server">
    public Person Person {get;set;}

    public ITemplate PersonTemplate {get;set;}

    protected override void OnDataBinding(EventArgs e)
    {
        base.OnDataBinding(e);
        if (PersonTemplate != null)
        {
            PersonTemplate.InstantiateIn(containerPlaceHolder);
        }
    }
</script>

<pre>
    First Name : <%# Person.FirstName %>
    Last Name  : <%# Person.LastName %>
</pre>
<p>Template:</p>
<div style="border: 1px solid black;">
    <asp:PlaceHolder runat="server" id="containerPlaceHolder" />
</div>