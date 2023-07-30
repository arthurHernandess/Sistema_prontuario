<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="SistemaProntuario.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta sharset="utf-8" />
    <meta name="viewport" content="width=device-width"/>
    <title>Prontuário</title>
    <link rel="preconnect" href="https://fonts.gstatic.com"/>
    <link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet"/>
    <link rel="stylesheet" type="text/css" href="css/Estilo.css"/>
    <link rel="preconnect" href="https://fonts.googleapis.com"/>
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin/>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400&display=swap" rel="stylesheet"/>
</head>
<body>
    <form id="form1" runat="server">
        <header>
            <nav>
                <ul>
                    <li><h1 style="text-decoration:underline;">Encontrar aluno</h1></li>
                    <li><h1>Adicionar aluno</h1></li>
                </ul>
            </nav>
        </header>
        <section>
        <div class="container">
            <div class="bloco">
                <div id="linhaH1"></div>
                <div id="Pesquisa">
                    <h2>Pesquisa</h2>
                    <div id="buscar">
                        <p id="pBuscar">Buscar: </p>
                        <asp:DropDownList ID="DropDownList" runat="server" AutoPostBack="false" >
                            <asp:ListItem Text="Nome" Value="1" />
                            <asp:ListItem Text="RM" Value="2" />
                            <asp:ListItem Text="RG" Value="3" />
                            <asp:ListItem Text="CPF" Value="4" />
                        </asp:DropDownList>

                       <%--<select id="SelectBusca">
                            <option value="1">Nome</option>
                            <option value="2">RM</option>
                            <option value="3">RG</option>
                            <option value="4">CPF</option>
                        </select>--%>
                        <asp:TextBox ID="txtBusca" runat="server"></asp:TextBox>
                        <asp:Button ID="btnFind" runat="server" Text="Encontrar" OnClick="btnFind_Click" />
                    </div>
                </div>

                <h2 style="margin-bottom: 12px;">Resultados</h2>
                <div class="sla">
                    <asp:GridView ID="tblResultado" runat="server" AutoGenerateColumns="False" style="border-radius:3px">
                        <Columns>
                            <asp:BoundField DataField="cd_rm_aluno" HeaderText="RM" />
                            <asp:BoundField DataField="nm_aluno" HeaderText="Nome" />
                            <asp:BoundField DataField="cd_rg_aluno" HeaderText="RG" />
                            <asp:BoundField DataField="cd_cpf_aluno" HeaderText="CPF" />
                            <asp:HyperLinkField DataNavigateUrlFields="cd_rm_aluno" DataNavigateUrlFormatString="DadosAluno.aspx?rm={0}" HeaderText="Infos" Text="Ver mais"/>
                        </Columns>
                    </asp:GridView>
                    <asp:Literal ID="litAlunoNotFound" runat="server"></asp:Literal>
                </div>
                <%--<table>
                    <thead>
                        <tr>
                            <th>RM</th>
                            <th>NOME</th>
                            <th>RG</th>
                            <th>CPF</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>08751</td>
                            <td id="aluno" class='ResultPesquisa'>Joãozinho da Silva</td>
                            <td>9876542155</td>
                            <td>12345678910</td>
                        </tr>
                        <asp:Label ID="lblResposta" runat="server" Text=""></asp:Label>
                    </tbody>
                </table>--%>
            </div>
        </div>

        <br/>

        <div class="container">
            <asp:Label ID="lblDadosAluno" runat="server" Text=""></asp:Label>
            <%--<div class="bloco dados esconder" style="margin-top: 5%;">
                <h3>Dados Pessoais</h3>
                <table>
                <tr>
                    <th>RM</th>
                    <th>NOME</th>
                    <th>RG</th>
                    <th>CPF</th>
                </tr>
                <tr>
                    <td>08751</td>
                    <td>Joãozinho da Silva</td>
                    <td>9876542155</td>
                    <td>12345678910</td>
                </tr>
                </table>

                <br>
                <div id="docs">
                    <h3>Documentos</h3>
                    <div id="documentosCheck">
                        <div><p>RG</p><input type="checkbox"></div>
                        <div><p>CPF</p><input type="checkbox"></div>
                        <div><p>Foto 3X4</p><input type="checkbox"></div>
                        <div><p>Lauda</p><input type="checkbox"></div>
                        <div><p>Visto Confere</p><input type="checkbox"></div>
                        <div><p>SED E. Fundamental</p><input type="checkbox"></div>
                        <div><p>SED E. Médio</p><input type="checkbox"></div>
                        <div><p>H.E E. Médio</p><input type="checkbox"></div>
                        <div><p>H.E E. Fundamental</p><input type="checkbox"></div>
                        <div><p>H.E de transferência Original</p><input type="checkbox"></div>
                    </div>
                </div>
                <!-- <p><strong>RM: </strong>08751</p>
                <p><strong>Nome: </strong>Joãozinho da Silva</p>
                <p><strong>RG: </strong>9876542155</p>
                <p><strong>CPF: </strong>12345678910</p>
                <p><strong>Data de nascimento: </strong>12/08/2000</p>
                <p><strong>Responsável: </strong>Manuela da Silva</p>
                <p><strong>Sexo: </strong>M</p>
                <p><strong>Telefone: </strong>(13)998754362</p> -->
                <br>
                <div id="cursos">
                    <h3 style="margin-top:2px">Cursos concluídos</h3>
                    <table>
                        <tr>
                            <th>Curso</th>
                            <th>Sigla</th>
                            <th>Data de Conclusão</th>
                        </tr>
                        <tr>
                            <td>Desenvolvimento de Sistemas</td>
                            <td>N</td>
                            <td>20/12/2017</td>
                        </tr>
                        <tr>
                            <td>Automação Industrial</td>
                            <td>K</td>
                            <td>18/12/2021</td>
                        </tr>
                    </table>
                </div>
            </div>--%>
        </div>
        
        <br>

        <div class="container">
            <div class="bloco diplomas esconder" style="margin-top: 5%; margin-bottom: 5%;">
                <h3>Diplomas</h3>
                <table>
                    <tr>
                        <th>Curso</th>
                        <th>Data de Conclusão</th>
                        <th>Data de Emição</th>
                        <th>Data de retirada</th>
                        <th>Tipo do diploma</th>
                        <th>Livro</th>
                        <th>Página</th>
                        <th>Ação</th>
                    </tr>
                    <tr>
                        <td>Desenvolvimento de Sistemas</td>
                        <td>20/12/2017</td>
                        <td>20/12/2017</td>
                        <td>10/01/2018</td>
                        <td>Comum</td>
                        <td>2</td>
                        <td>214</td>
                        <td><a style="text-decoration: none; color:-webkit-link">Emitir diploma</a></td>
                    </tr>
                    <tr>
                        <td>Desenvolvimento de Sistemas</td>
                        <td>20/12/2017</td>
                        <td>20/12/2017</td>
                        <td>03/02/2019</td>
                        <td>Comum</td>
                        <td>2</td>
                        <td>214</td>
                        <td><a style="text-decoration: none; color:-webkit-link">Emitir diploma</a></td>
                    </tr>
                    <tr>
                        <td>Automação Industrial</td>
                        <td>18/12/2021</td>
                        <td>18/12/2021</td>
                        <td> - </td>
                        <td>Comum</td>
                        <td>3</td>
                        <td>84</td>
                        <td><a style="text-decoration: none; color:-webkit-link">Emitir diploma</a></td>
                    </tr>
                </table>
            </div>
        </div>
    </section>
    <script type="text/javascript" src="js/prontuario.js"></script>
    </form>
</body>
</html>
