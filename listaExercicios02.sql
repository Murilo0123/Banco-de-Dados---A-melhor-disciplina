delimiter //
create procedure sp_ListarAutores()
begin
	select Nome
	from autor;
	end;
//
call sp_ListarAutores();
//
create procedure sp_LivrosPorCategoria(in cat_nome varchar(100))
begin
	select Titulo
    from livro join categoria
    where categoria.Categoria_ID = livro.Categoria_ID and categoria.Nome = cat_nome;
end;
//
call sp_LivrosPorCategoria('Ciência');
//
create procedure sp_ContarLivrosPorCategoria(in nome_cat varchar(100))
begin
	select count(Titulo) as num_livros
    from livro join categoria
    where livro.Categoria_ID = categoria.Categoria_ID and categoria.Nome = nome_cat;
end;
//
call sp_ContarLivrosPorCategoria('História');
//
create procedure sp_VerificarLivrosCategoria(in nom_cat varchar(100), out resp varchar(100))
begin
	declare quant int;
	select count(titulo) as livros
    into quant
    from livro 
    inner join categoria on categoria.Categoria_ID = livro.Categoria_ID
    where categoria.Nome = nom_cat;
    
    if quant > 0 
    then set resp = "Possui";
    else
    set resp = "Não possui";
    end if;
    select resp;
end;
//
call sp_VerificarLivrosCategoria("Física", @resp);
//
delimiter ; 
