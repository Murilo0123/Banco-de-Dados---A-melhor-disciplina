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

--6

--7

--8

--9

--10

--11

--12

--13

--14

--15

--16

--17

--18

--19

--20
