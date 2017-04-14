<%@ Page Language="C#" %>

<script runat="server">

    protected void GetNumbers(out float number1, out float number2, ref string warnings)
    {
        number1 = 0;
        number2 = 0;
        try
        {
            number1 = float.Parse(txtNumber1.Text);
        }
        catch(FormatException)
        {
            warnings += "Number 1 is not valid<br />";
        }
        try
        {
            number2 = float.Parse(txtNumber2.Text);
        } catch(FormatException)
        {
            warnings += "Number 2 is not valid<br />";
        }
    }

    protected void DisplayResults(string result, string warnings)
    {
        if (warnings.Equals(""))
        {
            lblResult.Text = result;
            lblWarning.Text = "";
        } else
        {
            lblResult.Text = "0";
            lblWarning.Text = warnings;
        }
    }

    protected void btnAdd_Click(object sender, EventArgs e)
    {
        float number1;
        float number2;
        string warnings = "";
        GetNumbers(out number1, out number2, ref warnings);

        DisplayResults(number1 + " + " + number2 + " = " + (number1 + number2), warnings);
    }

    protected void btnSubtract_Click(object sender, EventArgs e)
    {
        float number1;
        float number2;
        string warnings = "";
        GetNumbers(out number1, out number2, ref warnings);

        DisplayResults(number1 + " - " + number2 + " = " + (number1 - number2), warnings);
    }

    protected void btnMultiply_Click(object sender, EventArgs e)
    {
        float number1;
        float number2;
        string warnings = "";
        GetNumbers(out number1, out number2, ref warnings);

        DisplayResults(number1 + " x " + number2 + " = " + (number1 * number2), warnings);
    }

    protected void btnDivide_Click(object sender, EventArgs e)
    {
        float number1;
        float number2;
        string warnings = "";
        GetNumbers(out number1, out number2, ref warnings);

        if (number2 == 0)
        {
            warnings += "Number 2 cannot be zero<br />";
            DisplayResults("", warnings);
        }
        else
        {
            DisplayResults(number1 + " / " + number2 + " = " + (number1 / number2), warnings);
        }
    }

    protected void btnClear_Click(object sender, EventArgs e)
    {
        txtNumber1.Text = "";
        txtNumber2.Text = "";
        DisplayResults("0", "");
    }
</script>

<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta charset="utf-8" />
    <title>Simple Calculator</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" type="text/css" />  
</head>
<body>
    <div class="container">
        <div class="row">
            <div class="col-md-8 col-md-offset-2">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <asp:label runat="server" id="lblResult" Font-Size="Large">0</asp:label>
                    </div>
                    <div class="panel-body">
                        <form id="form1" runat="server">
                            <div class="row">
                                <div class="col-md-6">
                                    <asp:Label ID="lblNumber1" class="control-label" runat="server">Number 1</asp:Label>
                                    <asp:TextBox ID="txtNumber1" class="form-control" runat="server"></asp:TextBox>
                                </div>
                                <div class="col-md-6">
                                    <asp:Label ID="lblNumber2" class="control-label" runat="server">Number 2</asp:Label>
                                    <asp:TextBox ID="txtNumber2" class="form-control" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <br />
                            <div class="row">
                                <div class="wrapper text-center">
                                    <asp:Button ID="btnAdd" class="btn" runat="server" onclick="btnAdd_Click" Text="+" />
                                    <asp:Button ID="btnSubtract" class="btn" runat="server" onclick="btnSubtract_Click" Text="-" />
                                    <asp:Button ID="btnMultiply" class="btn" runat="server" onclick="btnMultiply_Click" Text="x" />
                                    <asp:Button ID="btnDivide" class="btn" runat="server" onclick="btnDivide_Click" Text="/" />
                                    <asp:Button ID="btnClear" class="btn" runat="server" onclick="btnClear_Click" Text="Clear" />
                                </div>
                            </div>
                            <br />
                            <div id="warningsDiv" class="alert alert-warning">
                               <asp:label runat="server" id="lblWarning"></asp:label> 
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
        if (document.getElementById("lblWarning").innerHTML === "") {
            document.getElementById("warningsDiv").setAttribute("hidden", true);
        }
    </script>
</body>
</html>
