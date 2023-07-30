<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DadosAluno.aspx.cs" Inherits="SistemaProntuario.WebForm2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta sharset="utf-8" />
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
        <div class="bloco dados" style="margin: auto;">
            <h3 style="margin-top:2%">Dados Pessoais</h3>
            <div class="sla">
                <asp:GridView ID="tblInfos" runat="server" AutoGenerateColumns="False">
                    <Columns>
                        <asp:BoundField DataField="cd_rm_aluno" HeaderText="RM" />
                        <asp:BoundField DataField="nm_aluno" HeaderText="Nome" />
                        <asp:BoundField DataField="cd_rg_aluno" HeaderText="RG" />
                        <asp:BoundField DataField="cd_cpf_aluno" HeaderText="CPF" />
                    </Columns>
                </asp:GridView>
            </div>

            <br/>
            <div id="docs">
                <h3>Documentos</h3>
                    <asp:Panel id="documentosCheck" runat="server"></asp:Panel>
                        <%--<asp:Label ID="lblDocumentos" runat="server" Text=""></asp:Label>--%>
                        <asp:Button ID="btnSalvarDocumentos" runat="server" Text="Salvar alterações" OnClick="btnSalvarDocumentos_Click"/>
                <asp:Literal ID="litRespostaSalvar" runat="server"></asp:Literal>
            </div>

            <br/>
            <div id="cursos">
                <h3 style="margin-top:2px">Cursos concluídos</h3>
                <div class="sla">
                    <asp:GridView ID="tblCursos" runat="server" AutoGenerateColumns="False">
                        <Columns>
                            <asp:BoundField DataField="nm_curso" HeaderText="Curso" />
                            <asp:BoundField DataField="sg_curso" HeaderText="Sigla" />
                            <asp:BoundField DataField="dt_conclusao" HeaderText="Data de Conclusão" />
                            <asp:HyperLinkField DataNavigateUrlFields="cd_rm_aluno,cd_curso" DataNavigateUrlFormatString="DiplomasAluno.aspx?rm={0}&amp;curso={1}" HeaderText="Diplomas" Text="Mostrar" >
                            <ItemStyle CssClass="TableLink" />
                            </asp:HyperLinkField>
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
