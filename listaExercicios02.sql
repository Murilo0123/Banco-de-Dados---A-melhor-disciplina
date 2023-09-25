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
delimiter ; 
