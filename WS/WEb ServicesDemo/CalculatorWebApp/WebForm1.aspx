<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="CalculatorWebApp.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <table style="font-family : Arial">
            <tr>
                <td>
                    <b>First Number</b>
                </td>
                <td>
                    <asp:TextBox ID="txtFirstNumber" runat="server"></asp:TextBox>
                </td>
            </tr>
              <tr>
                <td>
                    <b>Second Number</b>
                </td>
                <td>
                    <asp:TextBox ID="txtSecondNumber" runat="server"></asp:TextBox>
                </td>
            </tr>
              <tr>
                <td>
                    <b>Operation</b>
                </td>
                <td>
                    <asp:TextBox ID="operation" runat="server"></asp:TextBox>
                </td>
            </tr>
              <tr>
                <td>
                    <b>Result</b>
                </td>
                <td>
                    <asp:Label ID="lblresult" runat="server"></asp:Label>
                </td>
            </tr>
              <tr>
                <td colspan="2">
                    <asp:Button ID="btnOk" runat="server" Text="Calcule" OnClick="btnOk_Click" />
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
