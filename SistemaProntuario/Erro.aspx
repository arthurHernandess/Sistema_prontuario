<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Erro.aspx.cs" Inherits="SistemaProntuario.WebForm4" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Erro</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400&display=swap" rel="stylesheet">
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>Ops, tivemos um problema</h1>
            <asp:Literal ID="litErro" runat="server"></asp:Literal>
        </div>
    </form>
</body>
</html>
