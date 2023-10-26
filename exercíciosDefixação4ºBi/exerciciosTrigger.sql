-- ex1
create trigger trigger_mensagem_insert 
after insert on clientes 
for each row
insert into auditoria ( mensagem, data_hora)
values ("Nome adicionado", now());

insert into clientes (nome)
values ("Cleberson");

select * from clientes;
select * from auditoria;

-- ex2
create trigger trigger_mensagem_delete
before delete on clientes 
for each row
insert into auditoria ( mensagem, data_hora)
values ("Nome deletado", now());

delete from clientes 
where id = 1;

select * from clientes;
select * from auditoria;

-- ex3
create trigger trigger_mensagem_update
after update on clientes
for each row
insert into auditoria (mensagem, data_hora)
values (concat('O nome ', old.nome, ' foi atualizado para ', new.nome), now());

drop trigger trigger_mensagem_update;

update clientes
set nome = "Hugo"
where id = 4;

select * from clientes;
select * from auditoria;

