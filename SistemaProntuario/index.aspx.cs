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
    public partial class WebForm1 : System.Web.UI.Page
    {
        string Erro = "Não foi possível estabelecer conexão";
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnFind_Click(object sender, EventArgs e)
        {
            litAlunoNotFound.Text = "";

            if (txtBusca.Text == "")
            {
                litAlunoNotFound.Text = "O aluno deve ser inserido!!";
            }

            //lblResposta.Text = "";

            string busca = txtBusca.Text;

            string linhaConexao = "SERVER=localhost;UID=root;PASSWORD=root;DATABASE=remissivas";
            MySqlConnection conexao = new MySqlConnection(linhaConexao);
            try
            {
                conexao.Open();
                #region filtroTipo
                string comando = "";
                if (DropDownList.SelectedValue == "1")
                {
                    comando = $"Select * from aluno where nm_aluno like '{busca}%'";
                }
                else if (DropDownList.SelectedValue == "2")
                {
                    comando = $"Select * from aluno where cd_rm_aluno like '{busca}%'";
                }
                else if (DropDownList.SelectedValue == "3")
                {           
                    comando = $"Select * from aluno where cd_rg_aluno = {busca}";
                }
                else if (DropDownList.SelectedValue == "4")
                {
                    comando = $"Select * from aluno where cd_cpf_aluno = {busca}%";
                }
                #endregion
                MySqlCommand cSQL = new MySqlCommand(comando, conexao);
                MySqlDataReader dados = cSQL.ExecuteReader();

                #region Exibir dados com While (comentado)
                //if (dados.HasRows)
                //{
                //    while(dados.Read())
                //    {
                //        lblResposta.Text += "<tr class='ResultPesquisa'>";
                //        lblResposta.Text += "<td class='centro'>" + dados[0].ToString() + "</td>";
                //        lblResposta.Text += "<td>" + dados[1].ToString() + "</td>";
                //        lblResposta.Text += "<td class='centro'>" + dados[2].ToString() + "</td>";
                //        lblResposta.Text += "<td class='centro'>" + dados[3].ToString() + "</td>";
                //        lblResposta.Text += "</tr>";
                //    }
                //}
                #endregion

                if (dados.HasRows)
                {
                    tblResultado.DataSource = dados;
                    tblResultado.DataBind();
                }
                else
                {
                    tblResultado = null;
                    litAlunoNotFound.Text = "<p id='alunoNotFound'>Aluno não encontrado :(</p>";
                }

                if(!dados.IsClosed)
                    dados.Close();
            }
            catch (Exception)
            {
                Response.Redirect($"Erro.aspx?e={Erro}");
            }

            if(conexao.State == System.Data.ConnectionState.Open)
                conexao.Close();
        }
    }
}