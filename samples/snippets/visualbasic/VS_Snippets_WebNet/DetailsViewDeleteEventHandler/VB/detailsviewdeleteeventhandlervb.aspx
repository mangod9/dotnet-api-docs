<!-- <Snippet1> -->

<%@ page language="VB" autoeventwireup="false"%>
  
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<script runat="server">

  Sub CustomerDetailsView_ItemDeleting(ByVal sender As Object, _
    ByVal e As DetailsViewDeleteEventArgs) _
    Handles CustomerDetailsView.ItemDeleting

    ' Get customer ID and name from the Keys and Values
    ' properties.
    Dim keyValue As String = e.Keys("CustomerID").ToString()
    Dim customerName As String = e.Values("CompanyName").ToString()

    ' Cancel the delete operation if the user attempts to 
    ' delete protected record. In this example, records
    ' with a customer ID that starts with with "A" cannot
    ' be deleted.
    If keyValue.StartsWith("A") Then

      e.Cancel = True
      MessageLabel.Text = "You cannot delete " & _
        customerName & ". This customer is protected."
  
    Else
  
      MessageLabel.Text = "Row " & e.RowIndex.ToString() & _
        " deleted."
  
    End If
  
  End Sub

</script>
  
<html xmlns="http://www.w3.org/1999/xhtml" >    
  <head runat="server">
    <title>DetailsViewDeleteEventHandler Example</title>
</head>
<body>
    <form id="form1" runat="server">
        
      <h3>DetailsViewDeleteEventHandler Example</h3>
        
        <asp:detailsview id="CustomerDetailsView"
          datasourceid="DetailsViewSource"
          autogeneraterows="true"
          autogeneratedeletebutton="true"
          allowpaging="true"
          datakeynames="CustomerID" 
          runat="server">
        
          <pagersettings mode="NextPrevious"/>
        
        </asp:detailsview>
          
        <br/><br/>
        
        <asp:label id="MessageLabel"
          forecolor="Red"
          runat="server"/>
            
        <!-- This example uses Microsoft SQL Server and connects  -->
        <!-- to the Northwind sample database. Use an ASP.NET     -->
        <!-- expression to retrieve the connection string value   -->
        <!-- from the web.config file.                            -->
        <asp:sqldatasource id="DetailsViewSource"
          selectcommand="Select [CustomerID], [CompanyName], [Address], 
            [City], [PostalCode], [Country] From [Customers]"
          deletecommand="Delete [Customers] 
            Where [CustomerID]=@CustomerID"
          connectionstring=
            "<%$ ConnectionStrings:NorthWindConnectionString%>" 
          runat="server"/>
            
      </form>
  </body>
</html>

<!-- </Snippet1> -->