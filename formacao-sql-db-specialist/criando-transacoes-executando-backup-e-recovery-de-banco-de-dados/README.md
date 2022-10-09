**PARTE 1 – TRANSAÇÕES** 

Objetivo:  

Neste desafio você irá lidar com transações para executar modificações na base de dados. Sendo assim, vamos relamenbrar como executar uma transação. Primeiramente, é preciso desabilitar o autocommit do MySQL. Caso contrário, cada instrução SQL executada será confirmada. 

CODE 1

SET @@autocmmit = 0  -- podemos utilizar off no lugar de 0  START TRANSACTION;  -- instruções SQL  COMMIT; -- ROLLBACK em casos de erro 



Essa primeira transação pode ser executada sem utilizar outros recursos como procedures. Dessa forma, você irá executar statements de consultas e modificações de dados persistidos no banco de dados via transações.  

 

CODE 2

-- exemplo com transações -- sem determinar o rollback explicitamente ele não acontece SET @@autocommit = off; -- startando uma transação START TRANSACTION; -- query sql recuperando o id de order SELECT -- declarando uma variável com @ 	@orderNumber:=max(orderNumbers)+1 FROM 	order; 	 -- inserção de dados em order INSERT INTO order( orderNumber, 						orderDate, 						requiredDate, 						shippedDate, 						orderStatus 					) VALUES(@orderNumber, 			'2005-05-31', 			'2005-6-10', 			'2005-06-11', 			'EM PROGRESSO' 			); 			 -- comitando as modificações COMMIT;



**PARTE 2 - TRANSAÇÃO COM PROCEDURE** 

Você deverá criar outra transação, contudo, esta será definida dentro de uma procedure. Neste caso, assim como no exemplo em aula, deverá haver uma verificação de erro. Essa verificação irá acarretar um ROLLBACK, total ou parcial (SAVEPOINT). 

CODE 3

DROP PROCEDURE sql_fail; DELIMITER // CREATE procedure sql_fail() BEGIN 	-- exit da transação caso gerada uma exceção sql 	DECLARE EXIT HANDLER FOR sqlexception 	BEGIN 		ROLLBACK; 	select 'Erro durante a transação' AS Resultado; 	END; 	START TRANSACTION; 	INSERT INTO order VALUES(9, '2005-05-31', '2005-6-10', '2005-06-11', 'EM PROGRESSO'); 	INSERT INTO ordersDetails VALUES(9, '18_1749', 30, '136', 1), (9, '18_2248', 50, '55.09', 2); END// call sql_fail() select * from orders;



**PARTE 3 – BACKUP E RECOVERY** 

Objetivo: 

Neste etapa do desafio, você irá executar o backup do banco de dados e-commerce. Realize o backup e recovery do banco de dados; 

- Utilize o mysqdump para realizar o backup e recovery do banco de dados e-commerce; 
- Realize o backup de diferentes bancos de dados e inseria os recursos como: procedures, eventos e outros. 
- Adicione o arquivo de backup ao github juntamente com o script; 

 