<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DiplomasAluno.aspx.cs" Inherits="SistemaProntuario.WebForm3" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta sharset="utf-8"/>
    <meta name="viewport" content="width=device-width"/>
    <title>Prontuário</title>
    <link rel="preconnect" href="https://fonts.gstatic.com"/>
    <link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet"/>
    <link rel="stylesheet" type="text/css" href="css/Estilo.css"/>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400&display=swap" rel="stylesheet">
</head>
<body>
    <form id="form1" runat="server">
    <asp:Panel ID="BlocoDiplomas" CssClass="container" runat="server">
        <asp:Panel ID="pnlDiplomas" CssClass="bloco diplomas" runat="server">
            <h3>Diplomas</h3>
            <asp:GridView ID="tblDiplomas" runat="server" AutoGenerateColumns="False">
                <Columns>
                    <asp:BoundField DataField="nm_curso" HeaderText="Curso" />
                    <asp:BoundField DataField="cd_diploma" HeaderText="Código" />
                    <asp:BoundField DataField="dt_conclusao" HeaderText="Data de Conclusão" />
                    <asp:BoundField DataField="dt_emissao" HeaderText="Data de Emissão" />
                    <asp:BoundField DataField="dt_retirada" HeaderText="Data de Retirada" />
                    <asp:BoundField DataField="nm_tipo_diploma" HeaderText="Tipo Diploma"/>                                           
                    <asp:BoundField DataField="cd_livro" HeaderText="Livro" />
                    <asp:BoundField DataField="cd_pagina" HeaderText="Página" />
                    <asp:BoundField DataField="ic_segundavia" HeaderText="Emissão"/>
                    <%--<asp:TemplateField HeaderText="Ações">
						<ItemTemplate>
                            <asp:Button ID="btnRetirar" runat="server" Text="Retirar" OnClick="btnRetirar_Click"/>
						</ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>--%>
                    <asp:HyperLinkField DataNavigateUrlFields="cd_rm_aluno,cd_curso,codigo" DataNavigateUrlFormatString="DiplomasAluno.aspx?rm={0}&amp;curso={1}&amp;diploma={2}" HeaderText="Ações" Text="Retirar" />
                </Columns>
            </asp:GridView>
            <asp:Literal ID="litTeste" runat="server"></asp:Literal>
            <asp:Button ID="btnEmitir2Via" runat="server" Text="Emitir 2ª via" OnClick="btnEmitir2Via_Click"/>
        </asp:Panel>
    </asp:Panel>

        <asp:Panel ID="pnlCriarDiploma" Visible="false" CssClass="bloco" runat="server">
            <div class="divDF">
                Código do Diploma:
                <asp:TextBox ID="txtCodigoDiploma" CssClass="inputNovoDiploma" runat="server"></asp:TextBox>
            </div>

            <div class="divDF">
                Tipo do diploma:
                <asp:DropDownList ID="dplTipoDiploma" CssClass="inputNovoDiploma" runat="server">
                    <asp:ListItem Text="Comum" Value="1" />
                    <asp:ListItem Text="Guia Regional" Value="2" />
                    <asp:ListItem Text="Guia Nacional" Value="3" />
                </asp:DropDownList>
            </div>

            <div class="divDF">
                Livro:
                <asp:TextBox ID="txtLivro" CssClass="inputNovoDiploma" runat="server"></asp:TextBox>
            </div>

            <div class="divDF">
                Página:
                <asp:TextBox ID="txtPagina" CssClass="inputNovoDiploma" runat="server"></asp:TextBox>
            </div>

            <div class="divDF">
                Data de Conclusão:
                <asp:TextBox ID="txtDtConclusao" CssClass="inputNovoDiploma" type="date" runat="server"></asp:TextBox>
            </div>

            <div class="divDF">
                Data de Emissão:
                <asp:TextBox ID="txtDtEmissao" CssClass="inputNovoDiploma" type="date" runat="server"></asp:TextBox>
            </div>

            <%--<div class="divDF" style="width: 20%;">
                Segunda via:
                <asp:CheckBox ID="chkSegundaVia" runat="server" />
            </div>--%>

            <div class="divDF" style="width: 20%;">
                <asp:Button ID="btnGerar" runat="server" Text="Gerar!" OnClick="btnGerar_Click"/>
            </div>

            <div class="divDF" style="width: 20%;">
                <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" OnClick="btnCancelar_Click"/>
            </div>

            <asp:Literal ID="litAviso" runat="server"></asp:Literal>

        </asp:Panel>

    </form>
</body>
</html>
