using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data;
using MySql.Data.MySqlClient;

namespace SistemaProntuario
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        string Erro = "Não foi possível estabelecer conexão";
        protected void Page_Load(object sender, EventArgs e)
        {
            #region Conexão
            string linhaConexao = "SERVER=localhost;UID=root;PASSWORD=root;DATABASE=remissivas";
            MySqlConnection conexao = new MySqlConnection(linhaConexao);
            try
            {
                conexao.Open();
            }
            catch (Exception)
            {
                Response.Redirect($"Erro.aspx?e={Erro}");
            }
            #endregion

            #region Select e exibir tabela de dados do aluno
            string comando = "";
            string rm = Request["rm"].ToString();
            comando = $"Select * from aluno where cd_rm_aluno = {rm}";

            MySqlCommand cSQL = new MySqlCommand(comando, conexao);
            MySqlDataReader dados = cSQL.ExecuteReader();

            tblInfos.DataSource = dados;
            tblInfos.DataBind();

            if (!dados.IsClosed)
                dados.Close();
            #endregion

            #region Select e gerar painel com Checkbox dos documentos
            comando = $"select da.cd_documento, da.ic_consta, d.nm_documento from documento_aluno da join documento d on (d.cd_documento = da.cd_documento) where da.cd_rm_aluno = {rm};";

            cSQL = new MySqlCommand(comando, conexao);
            dados = cSQL.ExecuteReader();

            if (dados.HasRows)
            {
                //string check = "";
                int numero = 0;

                while (dados.Read())
                {
                    Panel pnlCheck = new Panel();
                    pnlCheck.ID = $"pnlChk{numero}";

                    CheckBox chkDocumento = new CheckBox();
                    chkDocumento.ID = $"chk{numero}";

                    if (dados[1].ToString() == "True")
                        chkDocumento.Checked = true;
                    else
                        chkDocumento.Checked = false;

                    chkDocumento.Text = "<p>" + dados[2].ToString() + "</p>";
                    chkDocumento.Attributes.Add("codigo", dados[0].ToString());

                    pnlCheck.Controls.Add(chkDocumento);
                    documentosCheck.Controls.Add(pnlCheck);

                    //lblDocumentos.Text += $"<div><p>{dados[2].ToString()}</p><input type='checkbox' id=chk{numero} {check} /></div>";
                    numero++;
                }
            }

            if (!dados.IsClosed)
                dados.Close();
            #endregion

            #region Select e exibir tabela de cursos
            comando = $"select d.cd_rm_aluno, d.cd_curso, c.nm_curso, c.sg_curso, date_format(d.dt_conclusao, '%d/%m/%Y') as dt_conclusao, d.ic_segundavia, d.cd_tipo_diploma from diploma d join curso c on(c.cd_curso = d.cd_curso) where d.cd_rm_aluno = {rm} and d.ic_segundavia = FALSE and d.cd_tipo_diploma = 1;";

            cSQL = new MySqlCommand(comando, conexao);
            dados = cSQL.ExecuteReader();

            tblCursos.DataSource = dados;
            tblCursos.DataBind();

            if (!dados.IsClosed)
                dados.Close();

            if (conexao.State == System.Data.ConnectionState.Open)
                conexao.Close();
            #endregion
        }

        protected void btnSalvarDocumentos_Click(object sender, EventArgs e)
        {
            #region Conexão e Request
            string linhaConexao = "SERVER=localhost;UID=root;PASSWORD=root;DATABASE=remissivas";
            MySqlConnection conexao = new MySqlConnection(linhaConexao);
            try
            {
                conexao.Open();
            }
            catch (Exception erro)
            {
                Response.Redirect($"Erro.aspx?e={Erro}");
            }
            
            string rm = Request["rm"].ToString();
            #endregion

            #region Procurar Checkbox alterados e fazer Update
            for (int i = 0; i < documentosCheck.Controls.Count; i++)
            {
                Panel painelDocumentos = documentosCheck.Controls[i] as Panel;
                
                for (int cont = 0; cont < painelDocumentos.Controls.Count; cont++)
                {
                    if (painelDocumentos.Controls[cont] is CheckBox)
                    {
                        CheckBox check = painelDocumentos.Controls[cont] as CheckBox;

                        try
                        {
                            string ComandoAlterar = $"update documento_aluno set ic_consta = {check.Checked.ToString()} where cd_rm_aluno = {rm} and cd_documento = {check.Attributes["codigo"].ToString()}";
                            MySqlCommand cSQL = new MySqlCommand(ComandoAlterar, conexao);
                            cSQL.ExecuteNonQuery();
                            litRespostaSalvar.Text = "<p>Alterações salvas com sucesso :)</p>";
                        }
                        catch (Exception)
                        {
                            litRespostaSalvar.Text = "<p>Não foi possível salvar as alterações :(</p>";
                            return;
                        }
                    }
                }
            }
            if (conexao.State == System.Data.ConnectionState.Open)
                conexao.Close();
            #endregion
        }
    }
}