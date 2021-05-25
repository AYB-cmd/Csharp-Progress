<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StudentWebForm.aspx.cs" Inherits="StudentServices.StudentWebForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type="text/javascript">
        function GetStudentById() {
            var id = document.getElementById("txtStudentId").value;
            StudentServices.StudentService.GetStudentByID(id, SuccessCallBack);
        }

        function SuccessCallBack(result) {
            document.getElementById("txtName").value = result["Name"];
            document.getElementById("txtGender").value = result["Gender"];
            document.getElementById("txtTotalMarks").value = result["TotalMarks"];




        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server">
            <Services>
                <asp:ServiceReference Path="~/StudentService.asmx" />
            </Services>
        </asp:ScriptManager>
        <table style="font-family: Arial; border: 1px solid black">
            <tr>
                <td><b>ID</b></td>
                <td>
                    <asp:TextBox ID="txtStudentId" runat="server"></asp:TextBox>
                    <p>
                        <input id="Button1" type="button" value="Get Student" onclick="GetStudentById()" />
                    </p>
                </td>
            </tr>
            <tr>
                <td><b>Name</b></td>
                <td>
                    <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td><b>Gender</b></td>
                <td>
                    <asp:TextBox ID="txtGender" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td><b>Total Marks</b></td>
                <td>
                    <asp:TextBox ID="txtTotalMarks" runat="server"></asp:TextBox>
                </td>
            </tr>
        </table>

    </form>
</body>
</html>
