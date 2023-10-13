--ex1
delimiter //

create function total_livros_por_genero(n_genero varchar(100))
returns int
deterministic
begin
    declare v_quantlivro int;
    declare done boolean default false;

    declare cursor_quantlivro cursor for 
        select count(l.titulo)
        from livro as l
        inner join genero as g on l.id_genero = g.id
        where g.nome_genero = n_genero;

    declare continue handler for not found set done = true;

    open cursor_quantlivro;

    fetch_loop: loop
        fetch cursor_quantlivro into v_quantlivro;
        if done then
            leave fetch_loop;
        end if;
    end loop fetch_loop;

    close cursor_quantlivro;

    return v_quantlivro;
end //
//
select total_livros_por_genero("Romance");
//
