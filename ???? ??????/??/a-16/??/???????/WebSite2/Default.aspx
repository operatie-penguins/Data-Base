<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="Default.aspx.cs" Inherits="_Default" Debug="true" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Пивной заводик</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Label id="Time" runat="server"/> 
    </div>

    <div>
   
    <p>С какой недели рассчитывать?</p>
    <asp:TextBox id="text1" runat="server" />
    <p>Насколько недель план?</p>
    <asp:TextBox id="text2" runat="server" />
    <asp:Button ID="Button1" runat="server" Text="Показать" OnClick="Submit" />
    </div>
    
    <div>
        <asp:Label id="days" runat="server" />
        <asp:Label id="Label2" runat="server"/> 
        <asp:Label id="Label1" runat="server"/> 
    </div>
    
    <div>
        <p>НЕДЕЛЯ, &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp ХМЕЛЬ,&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp СОЛОД, &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp ВОДА</p>
        <asp:TextBox id="TextBox4" runat="server" />
        <asp:TextBox id="TextBox1" runat="server" />
        <asp:TextBox id="TextBox2" runat="server" />
        <asp:TextBox id="TextBox3" runat="server" />
        <asp:Button ID="Button2" runat="server" Text="Добавить" OnClick="Add" />
    </div>
    
    </form>

</body>
</html>
