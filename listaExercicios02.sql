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
create procedure sp_LivrosAteAno(in ano_publi varchar(50))
begin
	select Titulo 
    from livro
    where Ano_Publicacao <= ano_publi;
end;
//
call sp_LivrosAteAno("1999");
//	
create procedure sp_TitulosPorCategoria(in nome_categoria varchar(100))
begin
	select Titulo 
    from livro
    inner join categoria on livro.Categoria_ID = categoria.Categoria_ID
    where Nome = nome_categoria;
end;
//
call sp_TitulosPorCategoria("Autoajuda");
//	
CREATE PROCEDURE sp_AdicionarLivro(
    in titulo_livro varchar(255),
    in editora_id int,
    in ano_publicacao int,
    in numero_paginas int,
    in categoria_id int,
    out mensagem varchar(100)
)
begin
    declare livro_existente int;
	select COUNT(*) into livro_existente
    from Livro
    where Titulo = titulo_livro;
    if livro_existente > 0 then
        set mensagem = "Já existe um livro com esse título.";
    else
        insert into Livro (Titulo, Editora_ID, Ano_Publicacao, Numero_Paginas, Categoria_ID)
        values (titulo_livro, editora_id, ano_publicacao, numero_paginas, categoria_id);

        set mensagem = "Livro adicionado com sucesso.";
    end if;
    select mensagem;
end;
//
call sp_AdicionarLivro("Obras pra que te quero?", 2, 2023, 1500, 2, @mensagem);
//	
create procedure sp_AutorMaisVelho()
begin
	select Nome, Sobrenome
    from autor
    order by Data_Nascimento asc
    limit 1;
end;
//
call sp_AutorMaisVelho();
//	
CREATE PROCEDURE sp_contar_livros_por_categoria(in nome_cat varchar(100))
BEGIN
    declare num_livros int;

    -- Seleciona o número de livros para a categoria especificada
    select count(titulo) as num_livros
    from livro 
    join categoria
    where livro.categoria_id = categoria.categoria_id and categoria.nome = nome_cat
    into num_livros;

    -- Retorna o número de livros
    select num_livros;
END;
//
delimiter ; 
