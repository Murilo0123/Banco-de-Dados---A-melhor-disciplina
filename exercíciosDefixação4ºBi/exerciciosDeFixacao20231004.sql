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
select total_livros_por_genero("Romance");
//
//
--ex2
create function listar_livros_por_autor(first_name varchar(255), last_name varchar(255))
returns text
DETERMINISTIC
begin
    declare lista_de_livros text default '';
    declare done boolean default false;
    declare livro_title varchar(255);
    declare autor_cursor cursor for
        select la.id_livro
        from livro_autor as la
        inner join autor as a on la.id_autor = a.id
        where a.primeiro_nome = first_name and a.ultimo_nome = last_name;
    declare continue handler for not found set done = true;
    open autor_cursor;
    fetch_loop: loop
        fetch autor_cursor into livro_title;
        if done then
            leave fetch_loop;
        end if;
        set lista_de_livros = concat(lista_de_livros, livro_title, ', ');
    end loop fetch_loop;
    close autor_cursor;
    set lista_de_livros = left(lista_de_livros, length(lista_de_livros) - 2);

    return lista_de_livros;
end; 
//
//
select listar_livros_por_autor("João", "Silva");
//
//
-- ex3
create function atualizar_resumos()
returns int
deterministic
begin
    declare done boolean default false;
    declare livro_id int;
    declare resumo_text text;
    declare livro_cursor cursor for
        select id, resumo
        from livro;
    declare continue handler for not found set done = true;
    open livro_cursor;
    update_loop: loop
        fetch livro_cursor into livro_id, resumo_text;
        if done then
            leave update_loop;
        end if;
        set resumo_text = concat(resumo_text, ' Este é um excelente livro!');
        update livro
        set resumo = resumo_text
        where id = livro_id;
    end loop update_loop;
    close livro_cursor;
    return 1;
end; //
//
select atualizar_resumos();
select resumo from livro;
//

