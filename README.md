Projeto: Avaliação Spring Boot – Produto e Categoria
Descrição
Este projeto é uma aplicação Spring Boot que utiliza MariaDB para gerenciar o relacionamento entre duas entidades: Produto e Categoria. Permite realizar operações de CRUD (criar, ler, atualizar e deletar) através de endpoints REST.

Tecnologias
Spring Boot

Spring Data JPA

MariaDB

Lombok

Spring Web

DevTools


O projeto foi estruturado com base em uma arquitetura MVC (Model-View-Controller), utilizando o Spring Boot para facilitar a criação dos componentes e o gerenciamento das dependências.

Foram criadas duas entidades: Produto e Categoria, com um relacionamento do tipo @ManyToOne entre Produto e Categoria, e @OneToMany em Categoria apontando para os produtos. Esse relacionamento permite que cada produto pertença a uma categoria, e que uma categoria possua vários produtos.

A persistência dos dados foi feita com o uso do Spring Data JPA, que facilita as operações de CRUD com o banco de dados MariaDB.
Os dados podem ser acessados por meio de endpoints REST, que foram implementados em controladores separados para cada entidade.

Como rodar
Instale o MariaDB e crie um banco de dados chamado produto_categoria.

Configure o arquivo application.properties com seu usuário e senha do banco.

Execute o projeto com:

bash
Copiar
Editar
./mvnw spring-boot:run
Use o Postman ou Insomnia para testar os endpoints REST.

Repositório
O código está disponível no GitHub e pode ser clonado para testes e alterações.
