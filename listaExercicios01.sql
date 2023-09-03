--1
select titulo from livros;

--2
select nome from autores
where (nascimento < '1900-01-01');

--3
select livros.titulo from livros
inner join autores on autores.nome = 'J.K. Rowling';

--4
select alunos.nome from alunos
inner join matriculas on matriculas.curso = 'Engenharia de Software' 
and matriculas.aluno_id = alunos.id;

--5
select produto, sum(receita) as receita_total
from vendas
group by produto;

--6
select autores.nome, count(livros.id) as livros_total
from autores
left join livros on autores.id = livros.autor_id
group by autores.nome;

--7
select curso, count(aluno_id) as qt_alunos
from matriculas
group by curso;

--8
select produto, avg(receita) as média_receita
from vendas
group by produto;

--9
select produto, sum(receita) as receita_maior
from vendas
group by produto
having receita_maior > 10000;

--10
select autores.nome, count(livros.id) as livros_total
from autores
left join livros on autores.id = livros.autor_id
group by autores.nome
having livros_total > 2;

--11
select titulo, nome from livros 
inner join autores
where autor_id = autores.id;

--12
select nome, curso from alunos
inner join matriculas
where aluno_id = alunos.id;

--13
select nome, titulo from autores
left join livros on autores.id = autor_id;

--14
select curso, nome from matriculas
right join alunos on aluno_id = alunos.id;

--15
select nome, curso from alunos
inner join matriculas on alunos.id = aluno_id;

--16
select autores.nome, count(livros.id) as livros_total
from autores
left join livros on autores.id = livros.autor_id
group by autores.nome
order by livros_total desc
limit 1;

--17
select produto, sum(receita) as receita_total
from vendas
group by produto
order by receita_total asc
limit 1;

--18
select nome, sum(20) as receita_total
from autores
left join livros on autores.id = autor_id
group by nome;

--19
select nome, count(matriculas.id) as qt_matriculas
from alunos
left join matriculas on aluno_id = alunos.id
group by nome;

--20
