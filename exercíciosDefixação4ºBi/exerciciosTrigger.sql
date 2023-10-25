-- ex1
create trigger trigger_mensagem_insert 
after insert on clientes 
for each row
insert into auditoria ( mensagem, data_hora)
values ("A tabela foi alterada", now());

insert into clientes (nome)
values ("Cleberson");

select * from clientes;
select * from auditoria;
