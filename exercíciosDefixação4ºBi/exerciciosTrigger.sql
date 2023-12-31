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

update clientes
set nome = "Hugo"
where id = 4;

select * from clientes;
select * from auditoria;

-- ex4
delimiter //
create trigger trigger_mensagem_update_nula
before update on clientes
for each row
begin
if new.nome is null or new.nome = '' or new.nome = "" then
	insert into auditoria (mensagem, data_hora)
	values ("Não foi possível atualizar", now());
end if;
end;
//
update clientes
set nome = ""
where id = 3;
//

-- ex5
delimiter //
create trigger trigger_estoque
after insert on pedidos
for each row
begin
declare estoque_atual int;
select estoque into estoque_atual from produtos where id = new.produto_id;
update produtos
set estoque = estoque - new.quantidade
where id = new.produto_id;

if estoque_atual - new.quantidade < 5 then 
	insert into auditoria (mensagem, data_hora)
	values (concat('Hora de repor o estoque'),now());
end if;
end;
//
insert into pedidos(produto_id, quantidade)
values (1, 8);
select * from auditoria;
//
