insert into Aluno (cd_cpf_aluno, cd_rg_aluno, nm_aluno, cd_rm_aluno)
	values (502.330708-50, 677687656565, 'Lucas Ruas de Oliveira',36412);

insert into aluno (cd_cpf_aluno, cd_rg_aluno, nm_aluno, cd_rm_aluno)
	values (503.732998-18, 7778, 'Luan Felix Perera',36403);

insert into aluno (cd_cpf_aluno, cd_rg_aluno, nm_aluno, cd_rm_aluno)
	values (3545453455-65, 8889, 'Arthur de Lima Hernandes',36338);

select *
from Aluno;

insert into curso
	values (541, 'N', 'Desenvolvimento de Sistemas');
insert into curso
	values (357, 'S', 'Jogos Digitais');
insert into curso
	values (987, 'R', 'Eletrotécnica');

select *
from Curso;

insert into documento 
	values (1, 'RG');
insert into documento
	values (2, 'CPF');
insert into documento
	values (3, 'Foto 3x4');
insert into documento
	values (4, 'Lauda');
insert into documento
	values (5, 'Visto Confere');
insert into documento
	values (6, 'SED E. Fundamental');
insert into documento
	values (7, 'SED E. Medio');
insert into documento
	values (8, 'H.E E. Medio');
insert into documento
	values (9, 'H.E E. Fundamental');
insert into documento
	values (10, 'H.E transferencia Original');

select *
from documento;

insert into prontuario 
	values (36338, 541, 'Chato, falante, cheirou cocaina na sala... 2 VEZES');
insert into prontuario 
	values (36403, 357, 'Chato, falante, cheirava pó de borracha na sala constantemente');
insert into prontuario 
	values (36412, 987, 'Chato, falante, dormia em todas as aulas');
insert into prontuario 
	values (36412, 357, 'Chato, falante, dormia em todas as aulas');

select *
from prontuario;

insert into documento_aluno 
	values (36338, 1, TRUE);
insert into documento_aluno 
	values (36338, 2, TRUE);
insert into documento_aluno 
	values (36338, 3, TRUE);
insert into documento_aluno 
	values (36338, 4, TRUE);
insert into documento_aluno 
	values (36338, 5, TRUE);
insert into documento_aluno 
	values (36338, 6, TRUE);
insert into documento_aluno 
	values (36338, 7, TRUE);
insert into documento_aluno 
	values (36338, 8, TRUE);
insert into documento_aluno 
	values (36338, 9, FALSE);
insert into documento_aluno 
	values (36338, 10, TRUE);

insert into documento_aluno
	values (36403, 1, TRUE);
insert into documento_aluno
	values (36403, 2, TRUE);
insert into documento_aluno
	values (36403, 3, FALSE);
insert into documento_aluno
	values (36403, 4, TRUE);
insert into documento_aluno
	values (36403, 5, FALSE);
insert into documento_aluno
	values (36403, 6, TRUE);
insert into documento_aluno
	values (36403, 7, TRUE);
insert into documento_aluno
	values (36403, 8, TRUE);
insert into documento_aluno
	values (36403, 9, TRUE);
insert into documento_aluno
	values (36403, 10, TRUE);

insert into documento_aluno 
	values (36412, 1, TRUE);
insert into documento_aluno 
	values (36412, 2, FALSE);
insert into documento_aluno 
	values (36412, 3, TRUE);
insert into documento_aluno 
	values (36412, 4, TRUE);
insert into documento_aluno 
	values (36412, 5, TRUE);
insert into documento_aluno 
	values (36412, 6, TRUE);
insert into documento_aluno 
	values (36412, 7, TRUE);
insert into documento_aluno 
	values (36412, 8, TRUE);
insert into documento_aluno 
	values (36412, 9, TRUE);
insert into documento_aluno 
	values (36412, 10, FALSE);

select *
from documento_aluno;

insert into tipo_diploma 
	values (1, 'Comum');
insert into tipo_diploma
	values (2, 'Guia Nacional');
insert into tipo_diploma 
	values (3, 'Guia Regional');

select *
from tipo_diploma;

insert into diploma (cd_rm_aluno, cd_curso, cd_diploma, cd_tipo_diploma, ic_segundavia, cd_livro, cd_pagina, dt_conclusao, dt_emissao, dt_retirada) 
	values (36338, 541, 1203, 1, FALSE, 54, 66, '2010-12-10', '2010-12-08', '2011-01-08');
insert into diploma (cd_rm_aluno, cd_curso, cd_diploma, cd_tipo_diploma, ic_segundavia, cd_livro, cd_pagina, dt_conclusao, dt_emissao, dt_retirada) 
	values (36403, 357, 657, 1, TRUE, 32, 200, '2009-11-19', '2011-01-08', '2011-05-05');
insert into diploma (cd_rm_aluno, cd_curso, cd_diploma, cd_tipo_diploma, ic_segundavia, cd_livro, cd_pagina, dt_conclusao, dt_emissao, dt_retirada) 
	values (36403, 357, 966, 1, false, 32, 200, '2009-11-19', '2011-01-08', '2015-09-03');
insert into diploma (cd_rm_aluno, cd_curso, cd_diploma, cd_tipo_diploma, ic_segundavia, cd_livro, cd_pagina, dt_conclusao, dt_emissao, dt_retirada) 
	values (36412, 987, 967, 1, FALSE, 33, 57, '2012-10-29', '2011-01-08', '2013-03-01');
insert into diploma (cd_rm_aluno, cd_curso, cd_diploma, cd_tipo_diploma, ic_segundavia, cd_livro, cd_pagina, dt_conclusao, dt_emissao, dt_retirada) 
	values (36412, 357, 1000, 1, FALSE, 33, 57, '2015-12-20', '2011-01-08', null);

select *
from diploma;

select c.nm_curso, d.cd_curso, d.cd_diploma, d.dt_conclusao, d.dt_emissao, d.dt_retirada, d.cd_tipo_diploma, d.cd_livro, d.cd_pagina from diploma d join curso c on (c.cd_curso = d.cd_curso) where d.cd_rm_aluno = 36412;

select d.cd_rm_aluno, d.cd_curso, c.nm_curso, c.sg_curso, d.dt_conclusao,
if(d.ic_segundavia = true, 'Segunda Via', 'Primeira Via') as ic_segundavia, d.cd_tipo_diploma from diploma d join curso c on(c.cd_curso = d.cd_curso) 
where d.cd_rm_aluno = 36403 and d.ic_segundavia = FALSE and d.cd_tipo_diploma = 1;

/*insert into diploma (cd_rm_aluno, cd_curso, cd_diploma, cd_tipo_diploma, ic_segundavia, cd_livro, cd_pagina, dt_conclusao, dt_emissao) values (36338, 541, 654, 1, True, 54, 5, null, null);*/
/*select * from diploma;*/

/*select cd_rm_aluno, ISNULL(dt_retirada ' - ') from diploma;*/

select curdate();
/*UPDATE 
	diploma
SET 
	dt_retirada = curdate()
where 
	cd_diploma = 967 and cd_rm_aluno = 36412;
select * from diploma*/

select * from diploma where cd_rm_aluno = 36412 order by ic_segundavia;