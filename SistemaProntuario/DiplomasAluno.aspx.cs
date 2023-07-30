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
    public partial class WebForm3 : System.Web.UI.Page
    {
        string Erro = "Não foi possível estabelecer conexão";
        protected void Page_Load(object sender, EventArgs e)
        {
            #region Conexao e Select
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
            
            string comando = "";

            string rm = Request["rm"].ToString();
            string curso = Request["curso"].ToString();
            comando += $"select c.nm_curso, d.cd_curso, d.cd_diploma, d.codigo, d.cd_rm_aluno, date_format(d.dt_conclusao, '%d/%m/%Y') as dt_conclusao";
            comando += $", date_format(d.dt_emissao, '%d/%m/%Y') as dt_emissao, date_format(d.dt_retirada, '%d/%m/%Y') as dt_retirada,";
            comando += $" td.nm_tipo_diploma, d.cd_livro, d.cd_pagina, if(d.ic_segundavia = true, 'Segunda Via', 'Primeira Via') as ic_segundavia from diploma d join curso c on ";
            comando += $"(c.cd_curso = d.cd_curso) join tipo_diploma td on (td.cd_tipo_diploma = d.cd_tipo_diploma) ";
            comando += $"where d.cd_rm_aluno = {rm} and d.cd_curso = {curso} order by ic_segundavia";
            MySqlCommand cSQL = new MySqlCommand(comando, conexao);
            MySqlDataReader dados = cSQL.ExecuteReader();
            #endregion

            #region Primeiro Load
            if (dados.HasRows)
            {
                tblDiplomas.DataSource = dados;
                tblDiplomas.DataBind();
            }

            if(dados[11].ToString() == "Segunda Via")
            {
                btnEmitir2Via.Enabled = false;
            }
            #endregion

            #region Load com Retirada
            if (!String.IsNullOrEmpty(Request["diploma"]))
            {
                string diploma = Request["diploma"];
                
                if (!String.IsNullOrEmpty(dados["dt_retirada"].ToString()))
                {
                    litTeste.Text = "<p>Não é possível retirar, pois este já foi retirado</p>";
                    return;
                }
                else
                {
                    litTeste.Text = "";
                }
                if (!dados.IsClosed)
                    dados.Close();

                comando = $"UPDATE diploma SET dt_retirada = CURDATE() " +
                            $"WHERE codigo = {diploma} AND cd_rm_aluno = {rm}";
                cSQL = new MySqlCommand(comando, conexao);
                cSQL.ExecuteNonQuery();
                Response.Redirect($"DiplomasAluno.aspx?rm={rm}&curso={curso}");
            }
            #endregion

            if (conexao.State == System.Data.ConnectionState.Open)
                conexao.Close();
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            pnlCriarDiploma.Visible = false;
            pnlDiplomas.Visible = true;
            txtCodigoDiploma.Text = "";
            txtDtEmissao.Text = "";
            txtDtConclusao.Text = "";
            txtLivro.Text = "";
            txtPagina.Text = "";
        }

        protected void btnGerar_Click(object sender, EventArgs e)
        {
            #region Conexao e Requests
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

            string rm = Request["rm"].ToString();
            string curso = Request["curso"].ToString();
            #endregion

            #region Pegar o valor das caixas e gerar 2ª Via
            try
            {
                int cd = int.Parse(txtCodigoDiploma.Text);
                int tipo = int.Parse(dplTipoDiploma.SelectedValue);
                int livro = int.Parse(txtLivro.Text);
                int pag = int.Parse(txtPagina.Text);
                string dataConclusao = txtDtConclusao.Text;
                string dataEmissao = txtDtEmissao.Text;

                string comando = $"insert into diploma (cd_rm_aluno, cd_curso, cd_diploma, cd_tipo_diploma, ic_segundavia, cd_livro, cd_pagina, dt_conclusao, dt_emissao, dt_retirada) " +
                                    $"values ({rm}, {curso}, {cd}, {tipo}, true, {livro}, {pag}, '{dataConclusao}', '{dataEmissao}', null);";
                MySqlCommand cSQL = new MySqlCommand(comando, conexao);
                MySqlDataReader dados = cSQL.ExecuteReader();

                if (!dados.IsClosed)
                    dados.Close();
            }
            catch (Exception)
            {
                litAviso.Text = "<p>Preencha todas as caixas!</p>";
                return;
            }

            Response.Redirect($"DiplomasAluno.aspx?rm={rm}&curso={curso}");
            #endregion

            if (conexao.State == System.Data.ConnectionState.Open)
                conexao.Close();
        }

        protected void btnEmitir2Via_Click(object sender, EventArgs e)
        {
            pnlCriarDiploma.Visible = true;
        }
    }
}