/*
Created: 12/10/2022
Modified: 12/10/2022
Model: Universal
Database: MySQL 8.0
*/

-- Create tables section -------------------------------------------------

-- Table Cliente

CREATE TABLE `Cliente`
(
  `idCliente` Int UNSIGNED NOT NULL AUTO_INCREMENT
  COMMENT 'Código do Cliente',
  `nomeCliente` Varchar(120)
  COMMENT 'Nome do Cliente',
  PRIMARY KEY (`idCliente`)
)
;

-- Table Serviço

CREATE TABLE `Serviço`
(
  `idServico` Int UNSIGNED NOT NULL AUTO_INCREMENT
  COMMENT 'Código do Serviço',
  `nomeServico` Varchar(140) NOT NULL
  COMMENT 'Nome do Serviço',
  `descricaoServico` Text
  COMMENT 'Descrição do Serviço',
  `valorServico` Double UNSIGNED NOT NULL DEFAULT 0
  COMMENT 'Valor do Serviço',
  PRIMARY KEY (`idServico`)
)
;

-- Table Veiculo

CREATE TABLE `Veiculo`
(
  `idVeiculo` Int UNSIGNED NOT NULL AUTO_INCREMENT
  COMMENT 'Código do Veículo',
  `kmAtual` Int
  COMMENT 'Ultima KM Registrada (Presente na Tabela de OS)',
  `placaVeiculo` Varchar(7) NOT NULL
  COMMENT 'Placa do Veículo',
  PRIMARY KEY (`idVeiculo`)
)
;

ALTER TABLE `Veiculo` ADD UNIQUE `placaVeiculo` (`placaVeiculo`)
;

-- Table EquipeMecanico

CREATE TABLE `EquipeMecanico`
(
  `idEquipeMecanica` Int UNSIGNED NOT NULL AUTO_INCREMENT
  COMMENT 'Código da Equipe Mecânica',
  `nomeEquipe` Varchar(150) NOT NULL
  COMMENT 'Nome da Equipe',
  PRIMARY KEY (`idEquipeMecanica`)
)
;

-- Table OrdemServico

CREATE TABLE `OrdemServico`
(
  `idOs` Int UNSIGNED NOT NULL AUTO_INCREMENT
  COMMENT 'Código Sequencial da OS',
  `idCliente` Int UNSIGNED NOT NULL
  COMMENT 'Código do Cliente',
  `idVeiculo` Int UNSIGNED NOT NULL
  COMMENT 'Código do Veículo',
  `dataEmissao` Date
  COMMENT 'Data de Emissão da OS',
  `situacao` Char(1)
  COMMENT 'Situação da OS',
  `dataConclusao` Date
  COMMENT 'Data da Conclusão da OS',
  `idEquipe` Int UNSIGNED
  COMMENT 'Código da Equipe Mecânica',
  `valorPecas` Double UNSIGNED
  COMMENT 'Valor Total das Pecas',
  `valorServicos` Double UNSIGNED
  COMMENT 'Valor Total dos Servicos',
  `valorTotal` Double UNSIGNED
  COMMENT 'Valor Total da OS',
  PRIMARY KEY (`idOs`)
)
;

CREATE INDEX `FK_Veiculo_idVeiculo` ON `OrdemServico` (`idVeiculo`)
;

CREATE INDEX `FK_Cliente_idCliente` ON `OrdemServico` (`idCliente`)
;

CREATE INDEX `FK_Equipe_idEquipe` ON `OrdemServico` (`idEquipe`)
;

-- Table Mecanico

CREATE TABLE `Mecanico`
(
  `idMecanico` Int UNSIGNED NOT NULL AUTO_INCREMENT
  COMMENT 'Código Sequencial do Mecânico',
  `nomeMecanico` Varchar(120) NOT NULL
  COMMENT 'Nome do Mecânico',
  `enderecoMecanico` Varchar(255) NOT NULL
  COMMENT 'Endereco do Mecânico',
  `idEspecialidade` Int UNSIGNED NOT NULL
  COMMENT 'Código da Especialidade do Mecânico',
  PRIMARY KEY (`idMecanico`)
)
;

CREATE INDEX `FK_Especialidade_idEspecialidade` ON `Mecanico` (`idEspecialidade`)
;

-- Table OS_Servico

CREATE TABLE `OS_Servico`
(
  `idOSServico` Int UNSIGNED NOT NULL AUTO_INCREMENT
  COMMENT 'Código da Serviço na OS',
  `idServico` Int UNSIGNED NOT NULL
  COMMENT 'Código do Serviço',
  `idOs` Int UNSIGNED NOT NULL
  COMMENT 'Código da OS',
  `servicoAutorizado` Smallint NOT NULL
  COMMENT 'Informa se o serviço foi autorizado ou não',
  `dataAutorizacao` Date
  COMMENT 'Data da Autorização',
  `resumoServico` Text
  COMMENT 'Resmo do Serviço',
  `kmVeiculo` Int NOT NULL
  COMMENT 'KM do Veículo ao Entrar',
  PRIMARY KEY (`idOSServico`)
)
;

CREATE INDEX `FK_OS_idOs` ON `OS_Servico` (`idOs`)
;

CREATE INDEX `FK_Servico_idServico` ON `OS_Servico` (`idServico`)
;

-- Table ClienteVeiculo

CREATE TABLE `ClienteVeiculo`
(
  `idCliente` Int UNSIGNED NOT NULL
  COMMENT 'Código do Cliente',
  `idVeiculo` Int UNSIGNED NOT NULL
  COMMENT 'Código do Veículo',
  `dataInicial` Date NOT NULL
  COMMENT 'Data Inicial',
  `dataFinal` Date
  COMMENT 'Data Final'
)
;

ALTER TABLE `ClienteVeiculo` ADD PRIMARY KEY (`idCliente`, `idVeiculo`)
;

-- Table Especialidade

CREATE TABLE `Especialidade`
(
  `idEspecialidade` Int UNSIGNED NOT NULL AUTO_INCREMENT
  COMMENT 'Código da Especialdiade',
  `nomeEspecialidade` Varchar(150) NOT NULL
  COMMENT 'Nome da Especialidade',
  PRIMARY KEY (`idEspecialidade`)
)
;

-- Table Peca

CREATE TABLE `Peca`
(
  `idPeca` Int UNSIGNED NOT NULL AUTO_INCREMENT
  COMMENT 'Código da Peça',
  `valorPeca` Double UNSIGNED
  COMMENT 'Valor da Peça',
  PRIMARY KEY (`idPeca`)
)
;

-- Table OSServico_Peca

CREATE TABLE `OSServico_Peca`
(
  `idPeca` Int UNSIGNED NOT NULL,
  `idOSServico` Int UNSIGNED NOT NULL
)
;

ALTER TABLE `OSServico_Peca` ADD PRIMARY KEY (`idPeca`, `idOSServico`)
;

-- Table EquipeMecanico_Mecanico

CREATE TABLE `EquipeMecanico_Mecanico`
(
  `idEquipeMecanica` Int UNSIGNED NOT NULL
  COMMENT 'Código da Equipe',
  `idMecanico` Int UNSIGNED NOT NULL
  COMMENT 'Código do Mecânico'
)
;

ALTER TABLE `EquipeMecanico_Mecanico` ADD PRIMARY KEY (`idEquipeMecanica`, `idMecanico`)
;

-- Create foreign keys (relationships) section -------------------------------------------------

ALTER TABLE `OS_Servico` ADD CONSTRAINT `rel_OSServico_Servico_idServico` FOREIGN KEY (`idServico`) REFERENCES `Serviço` (`idServico`) ON DELETE NO ACTION ON UPDATE NO ACTION
;

ALTER TABLE `OS_Servico` ADD CONSTRAINT `rel_OsServico_OS_idOs` FOREIGN KEY (`idOs`) REFERENCES `OrdemServico` (`idOs`) ON DELETE NO ACTION ON UPDATE NO ACTION
;

ALTER TABLE `OrdemServico` ADD CONSTRAINT `rel_OrdemServico_Cliente_idCliente` FOREIGN KEY (`idCliente`) REFERENCES `Cliente` (`idCliente`) ON DELETE NO ACTION ON UPDATE NO ACTION
;

ALTER TABLE `OrdemServico` ADD CONSTRAINT `rel_OS_Veiculo_idVeiculo` FOREIGN KEY (`idVeiculo`) REFERENCES `Veiculo` (`idVeiculo`) ON DELETE NO ACTION ON UPDATE NO ACTION
;

ALTER TABLE `ClienteVeiculo` ADD CONSTRAINT `rel_ClienteVeiculo_Cliente_idCliente` FOREIGN KEY (`idCliente`) REFERENCES `Cliente` (`idCliente`) ON DELETE NO ACTION ON UPDATE NO ACTION
;

ALTER TABLE `ClienteVeiculo` ADD CONSTRAINT `rel_ClienteVeiculo_Veiculo_idVeiculo` FOREIGN KEY (`idVeiculo`) REFERENCES `Veiculo` (`idVeiculo`) ON DELETE NO ACTION ON UPDATE NO ACTION
;

ALTER TABLE `Mecanico` ADD CONSTRAINT `rel_Mecanico_Especialidade_idEspecialidade` FOREIGN KEY (`idEspecialidade`) REFERENCES `Especialidade` (`idEspecialidade`) ON DELETE NO ACTION ON UPDATE NO ACTION
;

ALTER TABLE `OrdemServico` ADD CONSTRAINT `rel_OS_EquipeMecanico_idEquipe` FOREIGN KEY (`idEquipe`) REFERENCES `EquipeMecanico` (`idEquipeMecanica`) ON DELETE NO ACTION ON UPDATE NO ACTION
;

ALTER TABLE `OSServico_Peca` ADD CONSTRAINT `rel_OSServicoPeca_OSServico_idOSServico` FOREIGN KEY (`idOSServico`) REFERENCES `OS_Servico` (`idOSServico`) ON DELETE NO ACTION ON UPDATE NO ACTION
;

ALTER TABLE `OSServico_Peca` ADD CONSTRAINT `rel_OSServicoPeca_Peca_idPeca` FOREIGN KEY (`idPeca`) REFERENCES `Peca` (`idPeca`) ON DELETE NO ACTION ON UPDATE NO ACTION
;

ALTER TABLE `EquipeMecanico_Mecanico` ADD CONSTRAINT `rel_EquipeMecanicoMecanico_EquipeMecanico_idEquipeMecanico` FOREIGN KEY (`idEquipeMecanica`) REFERENCES `EquipeMecanico` (`idEquipeMecanica`) ON DELETE NO ACTION ON UPDATE NO ACTION
;

ALTER TABLE `EquipeMecanico_Mecanico` ADD CONSTRAINT `rel_EquipeMecanicoMecanico_Mecanico_idMecanico` FOREIGN KEY (`idMecanico`) REFERENCES `Mecanico` (`idMecanico`) ON DELETE NO ACTION ON UPDATE NO ACTION
;

