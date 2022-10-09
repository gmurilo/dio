**Parte 1 – Personalizando acessos com views** 

Neste desafio você irá criar visões para os seguintes cenários 

- Número de empregados por departamento e localidade 
- Lista de departamentos e seus gerentes 
- Projetos com maior número de empregados (ex: por ordenação desc) 
- Lista de projetos, departamentos e gerentes 
- Quais empregados possuem dependentes e se são gerentes 

 

Além disso, serão definidas as permissões de acesso as views de acordo com o tipo de conta de usuários. Lembre-se que as views ficam armazaneadas no banco de dados como uma “tabela”. Assim podemos definir permissão de acesso a este item do banco de dados. 

 

Você poderá criar um usuário gerente que terá acesso as informações de employee e departamento. Contudo, employee não terá acesso as informações relacionadas aos departamentos ou gerentes. 

Um exemplo retirado da aula para criação de usuário e definição de permissão pode ser encontrado abaixo. 

CODE 1:

create user 'geral'@localhost identified by '123456789'; grant all privileges on testuser.* to 'geral'@localhost



Obs: O tema de permissão de usuários foi apresentada no curso Explorando Cláusulas de DDL e Esquemas de Banco de Dados no MySQL. 

 

**Parte 2 – Criando gatilhos para cenário de e-commerce** 

Objetivo: 

Sabemos que a criação de triggers está associadas a ações que podem ser tomadas em momento anterior ou posterior a inserção, ou atualização dos dados. Além disso, em casos de remoção podemos utilizar as triggers. Sendo assim, crie as seguintes triggers para o cenário de e-commerce. 

 

Exemplo de trigger para base.

CODE 2:

drop trigger null_value_check; delimiter // create trigger null_value_check after insert on employee for each row if (new.Address is null) then 	insert into user_messages (message, ssn) values(concat('Update your address, please ',new.Fname), new.Ssn); else 	insert into user_messages (message, ssn) values(concat('Error ', new.Fname),new.Ssn); end if; // delimiter ;



Entregável: 

- Triggers de remoção: before delete 
- Triggers de atualização: before update 

 

Remoção: 

Usuários podem excluir suas contas por algum motivo. Dessa forma, para não perder as informações sobre estes usuários, crie um gatilho before remove 

CODE 3:

-- before delete statement # salvando em outra tabela os employees demitidos # old.attributes



Atualização: 

Inserção de novos colaboradores e atualização do salário base. 



CODE 4:

-- before update statement # Atribuindo aumento de salário para um dept específico = 1 salary = salary * 1.20



E agora... Finalizou seu desafio ? 

Adicione o link do github com o projeto e submeta para avaliação. 