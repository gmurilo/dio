/*
Created: 08/10/2022
Modified: 08/10/2022
Model: Universal
Database: PostgreSQL 10
*/

-- Create tables section -------------------------------------------------

-- Table Cliente

CREATE TABLE "Cliente"
(
  "idCliente" Integer NOT NULL
)
WITH (
  autovacuum_enabled=true)
;
COMMENT ON COLUMN "Cliente"."idCliente" IS 'Código da Pessoa'
;

ALTER TABLE "Cliente" ADD CONSTRAINT "PK_Cliente" PRIMARY KEY ("idCliente")
;

-- Table Fornecedor

CREATE TABLE "Fornecedor"
(
  "idFornecedor" Integer NOT NULL
)
WITH (
  autovacuum_enabled=true)
;
COMMENT ON COLUMN "Fornecedor"."idFornecedor" IS 'Código do Fornecedor'
;

ALTER TABLE "Fornecedor" ADD CONSTRAINT "PK_Fornecedor" PRIMARY KEY ("idFornecedor")
;

-- Table Estoque

CREATE TABLE "Estoque"
(
  "idProduto" Integer NOT NULL,
  "quantidade" Integer DEFAULT 0 NOT NULL
)
WITH (
  autovacuum_enabled=true)
;
COMMENT ON COLUMN "Estoque"."idProduto" IS 'Código do Produto'
;
COMMENT ON COLUMN "Estoque"."quantidade" IS 'Quantidade de Itens no Estoque Geral'
;

CREATE INDEX "IX_Relationship3" ON "Estoque" ("idProduto")
;

ALTER TABLE "Estoque" ADD CONSTRAINT "PK_Estoque" PRIMARY KEY ("idProduto")
;

-- Table Pedido

CREATE TABLE "Pedido"
(
  "idPedido" Integer NOT NULL,
  "idPessoaEndereco" Integer NOT NULL,
  "dataPedido" Date NOT NULL,
  "situacaoPedido" Character(1) DEFAULT 'H' NOT NULL,
  "valorProdutos" Numeric(14,2),
  "desconto" Numeric(14,2)NOT NULL,
  "valorFrete" Numeric(14,2)NOT NULL,
  "valorPedido" Numeric(14,2)NOT NULL
)
WITH (
  autovacuum_enabled=true)
;
COMMENT ON COLUMN "Pedido"."idPedido" IS 'Código Sequencial do Pedido'
;
COMMENT ON COLUMN "Pedido"."idPessoaEndereco" IS 'Código do Endereço da Pessoa'
;
COMMENT ON COLUMN "Pedido"."dataPedido" IS 'Data de Realização do Pedido'
;
COMMENT ON COLUMN "Pedido"."situacaoPedido" IS 'Situação do Pedido'
;
COMMENT ON COLUMN "Pedido"."valorProdutos" IS 'Valor dos Produtos'
;
COMMENT ON COLUMN "Pedido"."desconto" IS 'Desconto no pedido'
;
COMMENT ON COLUMN "Pedido"."valorFrete" IS 'Valor do Frete'
;
COMMENT ON COLUMN "Pedido"."valorPedido" IS 'Valor do Pedido'
;

CREATE INDEX "IX_Relationship26" ON "Pedido" ("idPessoaEndereco")
;

ALTER TABLE "Pedido" ADD CONSTRAINT "PK_Pedido" PRIMARY KEY ("idPedido")
;

-- Table Pessoa

CREATE TABLE "Pessoa"
(
  "idPessoa" Integer NOT NULL,
  "nome" Character varying(180) NOT NULL,
  "codigoAcesso" Character varying(20),
  "email" Character varying(255) NOT NULL
)
WITH (
  autovacuum_enabled=true)
;
COMMENT ON COLUMN "Pessoa"."idPessoa" IS 'Código Sequencial da Pessoa'
;
COMMENT ON COLUMN "Pessoa"."nome" IS 'Nome da Pessoa'
;
COMMENT ON COLUMN "Pessoa"."codigoAcesso" IS 'Código de Acesso'
;
COMMENT ON COLUMN "Pessoa"."email" IS 'E-mail do Cliente'
;

ALTER TABLE "Pessoa" ADD CONSTRAINT "PK_Pessoa" PRIMARY KEY ("idPessoa")
;

ALTER TABLE "Pessoa" ADD CONSTRAINT "email" UNIQUE ("email")
;

-- Table Produto

CREATE TABLE "Produto"
(
  "idProduto" Integer NOT NULL,
  "idFornecedor" Integer NOT NULL
)
WITH (
  autovacuum_enabled=true)
;
COMMENT ON COLUMN "Produto"."idProduto" IS 'Código Sequencial do Produto'
;

CREATE INDEX "IX_Relationship4" ON "Produto" ("idFornecedor")
;

ALTER TABLE "Produto" ADD CONSTRAINT "PK_Produto" PRIMARY KEY ("idProduto")
;

-- Table Pedido_Produto

CREATE TABLE "Pedido_Produto"
(
  "idProduto" Integer NOT NULL,
  "idPedido" Integer NOT NULL,
  "quantidade" Integer NOT NULL,
  "valor" Numeric(14,2)NOT NULL
)
WITH (
  autovacuum_enabled=true)
;
COMMENT ON COLUMN "Pedido_Produto"."idProduto" IS 'Código do Pedido'
;
COMMENT ON COLUMN "Pedido_Produto"."idPedido" IS 'Código do Produto'
;
COMMENT ON COLUMN "Pedido_Produto"."quantidade" IS 'Quantidade de Itens'
;
COMMENT ON COLUMN "Pedido_Produto"."valor" IS 'Valor dos Produtos'
;

ALTER TABLE "Pedido_Produto" ADD CONSTRAINT "PK_Pedido_Produto" PRIMARY KEY ("idProduto","idPedido")
;

-- Table Revenda

CREATE TABLE "Revenda"
(
  "idRevenda" Integer NOT NULL
)
WITH (
  autovacuum_enabled=true)
;
COMMENT ON COLUMN "Revenda"."idRevenda" IS 'Código da Revenda'
;

ALTER TABLE "Revenda" ADD CONSTRAINT "PK_Revenda" PRIMARY KEY ("idRevenda")
;

-- Table Revenda_Produto

CREATE TABLE "Revenda_Produto"
(
  "idRevenda" Integer NOT NULL,
  "idProduto" Integer NOT NULL,
  "estaAtivo" Smallint DEFAULT 1 NOT NULL
)
WITH (
  autovacuum_enabled=true)
;
COMMENT ON COLUMN "Revenda_Produto"."idRevenda" IS 'Código da Revenda'
;
COMMENT ON COLUMN "Revenda_Produto"."idProduto" IS 'Código do Produto'
;
COMMENT ON COLUMN "Revenda_Produto"."estaAtivo" IS 'O Produto Está Ativo ?'
;

ALTER TABLE "Revenda_Produto" ADD CONSTRAINT "PK_Revenda_Produto" PRIMARY KEY ("idRevenda","idProduto")
;

-- Table Estoque_Revenda

CREATE TABLE "Estoque_Revenda"
(
  "idRevenda" Integer NOT NULL,
  "idProduto" Integer NOT NULL,
  "quantidade" Integer NOT NULL,
  "quantidadeMinima" Character(1)
)
WITH (
  autovacuum_enabled=true)
;
COMMENT ON TABLE "Estoque_Revenda" IS 'A tabela foi criada, pra caso a revenda possua mais de uma unidade.'
;
COMMENT ON COLUMN "Estoque_Revenda"."idRevenda" IS 'Código da Revenda'
;
COMMENT ON COLUMN "Estoque_Revenda"."idProduto" IS 'Código do Produto'
;
COMMENT ON COLUMN "Estoque_Revenda"."quantidade" IS 'Quantidade de Itens'
;

CREATE INDEX "IX_Relationship17" ON "Estoque_Revenda" ("idRevenda","idProduto")
;

ALTER TABLE "Estoque_Revenda" ADD CONSTRAINT "PK_Estoque_Revenda" PRIMARY KEY ("idRevenda","idProduto")
;

-- Table Cidade

CREATE TABLE "Cidade"
(
  "idCidade" Integer NOT NULL,
  "idEstado" Integer NOT NULL,
  "nomeCidade" Character varying(120) NOT NULL,
  "descricaoCidade" Text
)
WITH (
  autovacuum_enabled=true)
;
COMMENT ON COLUMN "Cidade"."idCidade" IS 'Código da Cidade'
;
COMMENT ON COLUMN "Cidade"."idEstado" IS 'Código do Estado'
;
COMMENT ON COLUMN "Cidade"."nomeCidade" IS 'Nome da Cidade'
;
COMMENT ON COLUMN "Cidade"."descricaoCidade" IS 'Informações da Cidade'
;

CREATE INDEX "IX_Relationship19" ON "Cidade" ("idEstado")
;

ALTER TABLE "Cidade" ADD CONSTRAINT "PK_Cidade" PRIMARY KEY ("idCidade")
;

-- Table Pais

CREATE TABLE "Pais"
(
  "idPais" Smallint NOT NULL,
  "nomePais" Character varying(180),
  "siglaPais" Character(2)
)
WITH (
  autovacuum_enabled=true)
;
COMMENT ON COLUMN "Pais"."idPais" IS 'Código do País'
;

ALTER TABLE "Pais" ADD CONSTRAINT "PK_Pais" PRIMARY KEY ("idPais")
;

-- Table Estado

CREATE TABLE "Estado"
(
  "idEstado" Integer NOT NULL,
  "idPais" Smallint NOT NULL,
  "nomeEstado" Character varying(120) NOT NULL,
  "siglaEstado" Character(2) NOT NULL
)
WITH (
  autovacuum_enabled=true)
;
COMMENT ON COLUMN "Estado"."idEstado" IS 'Código do Estado'
;
COMMENT ON COLUMN "Estado"."idPais" IS 'Código do País'
;
COMMENT ON COLUMN "Estado"."nomeEstado" IS 'Nome do Estado'
;
COMMENT ON COLUMN "Estado"."siglaEstado" IS 'Sigla do Estado'
;

CREATE INDEX "IX_Relationship18" ON "Estado" ("idPais")
;

ALTER TABLE "Estado" ADD CONSTRAINT "PK_Estado" PRIMARY KEY ("idEstado")
;

-- Table Logradouro

CREATE TABLE "Logradouro"
(
  "idLogradouro" Integer NOT NULL,
  "idCidade" Integer,
  "idTipoLogradouro" Smallint NOT NULL,
  "nomeLogradouro" Character varying(255) NOT NULL,
  "cepLogradouro" Character varying(11) NOT NULL
)
WITH (
  autovacuum_enabled=true)
;
COMMENT ON COLUMN "Logradouro"."idLogradouro" IS 'Código do Logradouro'
;
COMMENT ON COLUMN "Logradouro"."idTipoLogradouro" IS 'Tipo de Logradouro'
;
COMMENT ON COLUMN "Logradouro"."nomeLogradouro" IS 'Nome do Logradouro'
;
COMMENT ON COLUMN "Logradouro"."cepLogradouro" IS 'Código Postal'
;

CREATE INDEX "IX_Relationship20" ON "Logradouro" ("idCidade")
;

CREATE INDEX "IX_Relationship21" ON "Logradouro" ("idTipoLogradouro")
;

ALTER TABLE "Logradouro" ADD CONSTRAINT "PK_Logradouro" PRIMARY KEY ("idLogradouro")
;

-- Table TipoLogradouro

CREATE TABLE "TipoLogradouro"
(
  "idTipoLogradouro" Smallint NOT NULL,
  "nomeTipoLogradouro" Character varying(40) NOT NULL,
  "siglaTipoLogradouro" Character varying(3)
)
WITH (
  autovacuum_enabled=true)
;
COMMENT ON COLUMN "TipoLogradouro"."idTipoLogradouro" IS 'Código Sequencial do Tipo'
;
COMMENT ON COLUMN "TipoLogradouro"."nomeTipoLogradouro" IS 'Nome do Tipo do Logradouro'
;
COMMENT ON COLUMN "TipoLogradouro"."siglaTipoLogradouro" IS 'Sgila do Tipo de Logradouro'
;

ALTER TABLE "TipoLogradouro" ADD CONSTRAINT "PK_TipoLogradouro" PRIMARY KEY ("idTipoLogradouro")
;

-- Table Pessoa_Endereco

CREATE TABLE "Pessoa_Endereco"
(
  "idPessoaEndereco" Integer NOT NULL,
  "idPessoa" Integer NOT NULL,
  "idLogradouro" Integer NOT NULL,
  "complementoEndereco" Character varying(160),
  "numeroEndereco" Character varying(20),
  "tagEndereco" Character varying(40),
  "enderecoPadrao" Smallint,
  "estaAtivo" Smallint DEFAULT 1 NOT NULL,
  "tipoEndereco" Character(1) DEFAULT 'U' NOT NULL
)
WITH (
  autovacuum_enabled=true)
;
COMMENT ON COLUMN "Pessoa_Endereco"."idPessoaEndereco" IS 'Código do Endereço da Pessoa'
;
COMMENT ON COLUMN "Pessoa_Endereco"."idPessoa" IS 'Código da Pessoa'
;
COMMENT ON COLUMN "Pessoa_Endereco"."idLogradouro" IS 'Código do Logradouro'
;
COMMENT ON COLUMN "Pessoa_Endereco"."complementoEndereco" IS 'Complemento do Endereço'
;
COMMENT ON COLUMN "Pessoa_Endereco"."numeroEndereco" IS 'Número do Endereço'
;
COMMENT ON COLUMN "Pessoa_Endereco"."tagEndereco" IS 'Como esse endereço será nomeada ?'
;
COMMENT ON COLUMN "Pessoa_Endereco"."enderecoPadrao" IS 'É o endereço Padrão ?'
;
COMMENT ON COLUMN "Pessoa_Endereco"."estaAtivo" IS 'O Endereço está Ativo ?'
;
COMMENT ON COLUMN "Pessoa_Endereco"."tipoEndereco" IS 'Tipo de Endereço'
;

ALTER TABLE "Pessoa_Endereco" ADD CONSTRAINT "PK_Pessoa_Endereco" PRIMARY KEY ("idPessoaEndereco")
;

-- Table Configuracoes

CREATE TABLE "Configuracoes"
(
  "chaveCfg" Character varying(30) NOT NULL,
  "valorCfg" Text NOT NULL,
  "description" Text NOT NULL,
  "tipoValorCfg" Character varying(20) DEFAULT 'varchar' NOT NULL
)
WITH (
  autovacuum_enabled=true)
;
COMMENT ON COLUMN "Configuracoes"."chaveCfg" IS 'Código do Atribuito'
;
COMMENT ON COLUMN "Configuracoes"."valorCfg" IS 'Valor do Atributo'
;
COMMENT ON COLUMN "Configuracoes"."description" IS 'Descrição do Atributo'
;
COMMENT ON COLUMN "Configuracoes"."tipoValorCfg" IS 'Tipo do Valor'
;

ALTER TABLE "Configuracoes" ADD CONSTRAINT "PK_Configuracoes" PRIMARY KEY ("chaveCfg")
;

-- Table Pessoa_Fisica

CREATE TABLE "Pessoa_Fisica"
(
  "idPessoa" Integer NOT NULL,
  "cpf" Character varying(11) NOT NULL,
  "dataNascimento" Date NOT NULL,
  "dataFalescimento" Date,
  "sexo" Character(1) NOT NULL,
  "generoSexual" Character(1),
  "possueDeficiencia" Character(1)
)
WITH (
  autovacuum_enabled=true)
;
COMMENT ON COLUMN "Pessoa_Fisica"."idPessoa" IS 'Código da Pessoa'
;
COMMENT ON COLUMN "Pessoa_Fisica"."cpf" IS 'CPF Único'
;
COMMENT ON COLUMN "Pessoa_Fisica"."dataNascimento" IS 'Data de Nascimento'
;
COMMENT ON COLUMN "Pessoa_Fisica"."dataFalescimento" IS 'Data de Falescimento'
;
COMMENT ON COLUMN "Pessoa_Fisica"."sexo" IS 'Sexo Biologico'
;
COMMENT ON COLUMN "Pessoa_Fisica"."generoSexual" IS 'Gênero Sexual'
;
COMMENT ON COLUMN "Pessoa_Fisica"."possueDeficiencia" IS 'Possue alguma deficiência ?'
;

CREATE INDEX "IX_Relationship24" ON "Pessoa_Fisica" ("idPessoa")
;

ALTER TABLE "Pessoa_Fisica" ADD CONSTRAINT "PK_Pessoa_Fisica" PRIMARY KEY ("idPessoa")
;

ALTER TABLE "Pessoa_Fisica" ADD CONSTRAINT "cpf" UNIQUE ("cpf")
;

-- Table Pessoa_Juridica

CREATE TABLE "Pessoa_Juridica"
(
  "idPessoa" Integer NOT NULL,
  "cnpj" Character varying(14) NOT NULL,
  "inscricaoEstadual" Character varying(20),
  "inscricaoMunicipal" Character varying(20),
  "empresaAtiva" Smallint NOT NULL
)
WITH (
  autovacuum_enabled=true)
;
COMMENT ON COLUMN "Pessoa_Juridica"."idPessoa" IS 'Código da Pessoa'
;
COMMENT ON COLUMN "Pessoa_Juridica"."cnpj" IS 'CNPJ da Empresa'
;
COMMENT ON COLUMN "Pessoa_Juridica"."inscricaoEstadual" IS 'Inscricao Estadual da Empresa'
;
COMMENT ON COLUMN "Pessoa_Juridica"."inscricaoMunicipal" IS 'Inscricao Muncipal'
;
COMMENT ON COLUMN "Pessoa_Juridica"."empresaAtiva" IS 'Identifica se a empresa está ativa'
;

ALTER TABLE "Pessoa_Juridica" ADD CONSTRAINT "PK_Pessoa_Juridica" PRIMARY KEY ("idPessoa")
;

ALTER TABLE "Pessoa_Juridica" ADD CONSTRAINT "cnpj" UNIQUE ("cnpj")
;

-- Table Entrega

CREATE TABLE "Entrega"
(
  "idEntrega" Character(1) NOT NULL,
  "idTransportadora" Integer NOT NULL,
  "idPedido" Integer NOT NULL,
  "codigoEntrega" Character varying(20) NOT NULL,
  "situacaoEntrega" Character(1) NOT NULL
)
WITH (
  autovacuum_enabled=true)
;
COMMENT ON COLUMN "Entrega"."idEntrega" IS 'Código Sequencial da Entrega'
;
COMMENT ON COLUMN "Entrega"."idTransportadora" IS 'Código da Transportadora'
;
COMMENT ON COLUMN "Entrega"."idPedido" IS 'Código do Pedido'
;
COMMENT ON COLUMN "Entrega"."codigoEntrega" IS 'Código da Entrega'
;
COMMENT ON COLUMN "Entrega"."situacaoEntrega" IS 'Situação da Entrega'
;

CREATE INDEX "IX_Relationship27" ON "Entrega" ("idPedido")
;

CREATE INDEX "IX_Relationship29" ON "Entrega" ("idTransportadora")
;

CREATE UNIQUE INDEX "UK_Entrega" ON "Entrega" ("idPedido","idTransportadora")
;

ALTER TABLE "Entrega" ADD CONSTRAINT "PK_Entrega" PRIMARY KEY ("idEntrega")
;

-- Table EntregaEtapas

CREATE TABLE "EntregaEtapas"
(
  "idEntregaEtapa" Character(1) NOT NULL,
  "idEntrega" Character(1) NOT NULL,
  "horarioRecebimento" Timestamp NOT NULL,
  "horarioEntrega" Timestamp,
  "Detalhes" Text
)
WITH (
  autovacuum_enabled=true)
;
COMMENT ON COLUMN "EntregaEtapas"."idEntregaEtapa" IS 'Código Sequencial da Etapa de Entrega'
;
COMMENT ON COLUMN "EntregaEtapas"."idEntrega" IS 'Código da Entrega'
;
COMMENT ON COLUMN "EntregaEtapas"."horarioRecebimento" IS 'Horário que Iniciou A Etapa'
;
COMMENT ON COLUMN "EntregaEtapas"."horarioEntrega" IS 'Horário que Finalizou a Etapa'
;
COMMENT ON COLUMN "EntregaEtapas"."Detalhes" IS 'Informações Adicionais'
;

CREATE INDEX "IX_Relationship30" ON "EntregaEtapas" ("idEntrega")
;

ALTER TABLE "EntregaEtapas" ADD CONSTRAINT "PK_EntregaEtapas" PRIMARY KEY ("idEntregaEtapa")
;

-- Table Transportadora

CREATE TABLE "Transportadora"
(
  "idTransportadora" Integer NOT NULL,
  "descricaoTransportadora" Character(1)
)
WITH (
  autovacuum_enabled=true)
;
COMMENT ON COLUMN "Transportadora"."idTransportadora" IS 'Código da Transportadora'
;

ALTER TABLE "Transportadora" ADD CONSTRAINT "PK_Transportadora" PRIMARY KEY ("idTransportadora")
;

-- Table FormaPagamento

CREATE TABLE "FormaPagamento"
(
  "idFormaPagamento" Smallint NOT NULL,
  "grupoFormaPagamento" Character varying(2) DEFAULT 'U' NOT NULL,
  "nomeFormaPagamento" Character varying(80) NOT NULL
)
WITH (
  autovacuum_enabled=true)
;
COMMENT ON COLUMN "FormaPagamento"."idFormaPagamento" IS 'Código da Forma de Pagamento'
;
COMMENT ON COLUMN "FormaPagamento"."grupoFormaPagamento" IS 'Grupo da Forma de Pagamento'
;
COMMENT ON COLUMN "FormaPagamento"."nomeFormaPagamento" IS 'Nome da Forma de Pagamento'
;

ALTER TABLE "FormaPagamento" ADD CONSTRAINT "PK_FormaPagamento" PRIMARY KEY ("idFormaPagamento")
;

-- Table Pedido_Pagamento

CREATE TABLE "Pedido_Pagamento"
(
  "idPedidoPagamento" Integer NOT NULL,
  "idPedido" Integer NOT NULL,
  "idFormaPagamento" Smallint NOT NULL,
  "previsaoPagamento" Date NOT NULL,
  "horarioPagamento" Timestamp,
  "situacaoPagamento" Character(1)
)
WITH (
  autovacuum_enabled=true)
;
COMMENT ON TABLE "Pedido_Pagamento" IS 'Tabela de Pagamentos do Pedido, Foi criada para possbilitar a divisão em mais de uma forma de pagamento.'
;
COMMENT ON COLUMN "Pedido_Pagamento"."idPedidoPagamento" IS 'Código Sequencial do Pedido de Pagamento'
;
COMMENT ON COLUMN "Pedido_Pagamento"."idPedido" IS 'Código do Pedido'
;
COMMENT ON COLUMN "Pedido_Pagamento"."idFormaPagamento" IS 'Código da Forma de Pagamento'
;
COMMENT ON COLUMN "Pedido_Pagamento"."previsaoPagamento" IS 'Previsão Pagamento'
;
COMMENT ON COLUMN "Pedido_Pagamento"."horarioPagamento" IS 'Identifica se a fatura foi paga'
;
COMMENT ON COLUMN "Pedido_Pagamento"."situacaoPagamento" IS 'Identifica a Situação do Pagamento'
;

CREATE INDEX "IX_Relationship31" ON "Pedido_Pagamento" ("idFormaPagamento")
;

CREATE INDEX "IX_Relationship32" ON "Pedido_Pagamento" ("idPedido")
;

ALTER TABLE "Pedido_Pagamento" ADD CONSTRAINT "PK_Pedido_Pagamento" PRIMARY KEY ("idPedidoPagamento")
;

-- Table Cliente_FormaPagamento

CREATE TABLE "Cliente_FormaPagamento"
(
  "idClienteFormaPagamento" Integer NOT NULL,
  "idCliente" Integer NOT NULL,
  "idFormaPagamento" Smallint NOT NULL,
  "numeroForma" Character varying(255),
  "identificacao" Character varying(120),
  "validade" Timestamp
)
WITH (
  autovacuum_enabled=true)
;
COMMENT ON COLUMN "Cliente_FormaPagamento"."idClienteFormaPagamento" IS 'Código sequencial do cliente forma de pagamento'
;
COMMENT ON COLUMN "Cliente_FormaPagamento"."idCliente" IS 'Código do Cliente'
;
COMMENT ON COLUMN "Cliente_FormaPagamento"."idFormaPagamento" IS 'Código Forma de Pagamento'
;
COMMENT ON COLUMN "Cliente_FormaPagamento"."numeroForma" IS 'Número da Forma de Pagamento'
;
COMMENT ON COLUMN "Cliente_FormaPagamento"."identificacao" IS 'Identificação da forma de Pagamento'
;
COMMENT ON COLUMN "Cliente_FormaPagamento"."validade" IS 'Validade da Forma de Pagamento'
;

CREATE INDEX "IX_Relationship33" ON "Cliente_FormaPagamento" ("idFormaPagamento")
;

CREATE INDEX "IX_Relationship34" ON "Cliente_FormaPagamento" ("idCliente")
;

ALTER TABLE "Cliente_FormaPagamento" ADD CONSTRAINT "PK_Cliente_FormaPagamento" PRIMARY KEY ("idClienteFormaPagamento")
;

-- Create foreign keys (relationships) section -------------------------------------------------

ALTER TABLE "Fornecedor"
  ADD CONSTRAINT "Relationship1"
    FOREIGN KEY ("idFornecedor")
    REFERENCES "Pessoa" ("idPessoa")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
;

ALTER TABLE "Cliente"
  ADD CONSTRAINT "Relationship2"
    FOREIGN KEY ("idCliente")
    REFERENCES "Pessoa" ("idPessoa")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
;

ALTER TABLE "Estoque"
  ADD CONSTRAINT "Relationship3"
    FOREIGN KEY ("idProduto")
    REFERENCES "Produto" ("idProduto")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
;

ALTER TABLE "Produto"
  ADD CONSTRAINT "Relationship4"
    FOREIGN KEY ("idFornecedor")
    REFERENCES "Fornecedor" ("idFornecedor")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
;

ALTER TABLE "Pedido_Produto"
  ADD CONSTRAINT "Relationship5"
    FOREIGN KEY ("idProduto")
    REFERENCES "Produto" ("idProduto")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
;

ALTER TABLE "Pedido_Produto"
  ADD CONSTRAINT "Relationship6"
    FOREIGN KEY ("idPedido")
    REFERENCES "Pedido" ("idPedido")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
;

ALTER TABLE "Revenda"
  ADD CONSTRAINT "Relationship9"
    FOREIGN KEY ("idRevenda")
    REFERENCES "Pessoa" ("idPessoa")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
;

ALTER TABLE "Revenda_Produto"
  ADD CONSTRAINT "Relationship11"
    FOREIGN KEY ("idRevenda")
    REFERENCES "Revenda" ("idRevenda")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
;

ALTER TABLE "Revenda_Produto"
  ADD CONSTRAINT "Relationship12"
    FOREIGN KEY ("idProduto")
    REFERENCES "Produto" ("idProduto")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
;

ALTER TABLE "Estoque_Revenda"
  ADD CONSTRAINT "Relationship17"
    FOREIGN KEY ("idRevenda", "idProduto")
    REFERENCES "Revenda_Produto" ("idRevenda", "idProduto")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
;

ALTER TABLE "Estado"
  ADD CONSTRAINT "Relationship18"
    FOREIGN KEY ("idPais")
    REFERENCES "Pais" ("idPais")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
;

ALTER TABLE "Cidade"
  ADD CONSTRAINT "Relationship19"
    FOREIGN KEY ("idEstado")
    REFERENCES "Estado" ("idEstado")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
;

ALTER TABLE "Logradouro"
  ADD CONSTRAINT "Relationship20"
    FOREIGN KEY ("idCidade")
    REFERENCES "Cidade" ("idCidade")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
;

ALTER TABLE "Logradouro"
  ADD CONSTRAINT "Relationship21"
    FOREIGN KEY ("idTipoLogradouro")
    REFERENCES "TipoLogradouro" ("idTipoLogradouro")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
;

ALTER TABLE "Pessoa_Endereco"
  ADD CONSTRAINT "Relationship22"
    FOREIGN KEY ("idPessoa")
    REFERENCES "Pessoa" ("idPessoa")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
;

ALTER TABLE "Pessoa_Endereco"
  ADD CONSTRAINT "Relationship23"
    FOREIGN KEY ("idLogradouro")
    REFERENCES "Logradouro" ("idLogradouro")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
;

ALTER TABLE "Pessoa_Fisica"
  ADD CONSTRAINT "Relationship24"
    FOREIGN KEY ("idPessoa")
    REFERENCES "Pessoa" ("idPessoa")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
;

ALTER TABLE "Pessoa_Juridica"
  ADD CONSTRAINT "Relationship25"
    FOREIGN KEY ("idPessoa")
    REFERENCES "Pessoa" ("idPessoa")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
;

ALTER TABLE "Pedido"
  ADD CONSTRAINT "Relationship26"
    FOREIGN KEY ("idPessoaEndereco")
    REFERENCES "Pessoa_Endereco" ("idPessoaEndereco")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
;

ALTER TABLE "Entrega"
  ADD CONSTRAINT "Relationship27"
    FOREIGN KEY ("idPedido")
    REFERENCES "Pedido" ("idPedido")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
;

ALTER TABLE "Transportadora"
  ADD CONSTRAINT "Relationship28"
    FOREIGN KEY ("idTransportadora")
    REFERENCES "Pessoa" ("idPessoa")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
;

ALTER TABLE "Entrega"
  ADD CONSTRAINT "Relationship29"
    FOREIGN KEY ("idTransportadora")
    REFERENCES "Transportadora" ("idTransportadora")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
;

ALTER TABLE "EntregaEtapas"
  ADD CONSTRAINT "Relationship30"
    FOREIGN KEY ("idEntrega")
    REFERENCES "Entrega" ("idEntrega")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
;

ALTER TABLE "Pedido_Pagamento"
  ADD CONSTRAINT "Relationship31"
    FOREIGN KEY ("idFormaPagamento")
    REFERENCES "FormaPagamento" ("idFormaPagamento")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
;

ALTER TABLE "Pedido_Pagamento"
  ADD CONSTRAINT "Relationship32"
    FOREIGN KEY ("idPedido")
    REFERENCES "Pedido" ("idPedido")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
;

ALTER TABLE "Cliente_FormaPagamento"
  ADD CONSTRAINT "Relationship33"
    FOREIGN KEY ("idFormaPagamento")
    REFERENCES "FormaPagamento" ("idFormaPagamento")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
;

ALTER TABLE "Cliente_FormaPagamento"
  ADD CONSTRAINT "Relationship34"
    FOREIGN KEY ("idCliente")
    REFERENCES "Cliente" ("idCliente")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
;

CREATE OR REPLACE FUNCTION "checaPessoa"() RETURNS TRIGGER
AS $$
DECLARE
  has_register BOOLEAN;
  tabela VARCHAR;
BEGIN
  IF ( TG_TABLE_NAME = 'Pessoa_Fisica' ) THEN
    SELECT INTO has_register count(*) > 0 FROM "Pessoa_Juridica" WHERE "idPessoa" = NEW."idPessoa";
    tabela := 'Pessoa_Juridica';
  ELSE
    SELECT INTO has_register count(*) > 0 FROM "Pessoa_Fisica" WHERE "idPessoa" = NEW."idPessoa";
    tabela := 'Pessoa_Fisica';
  END IF;
  IF has_register IS TRUE THEN 
    RAISE EXCEPTION 'A Pessoa ID = % já está cadastrada na tabela %.', NEW."idPessoa", tabela;
  END IF;
  Return NEW;
END;
$$ Language plpgsql;

CREATE TRIGGER "checaPessoa" BEFORE INSERT ON "Pessoa_Fisica" FOR EACH ROW EXECUTE PROCEDURE "checaPessoa"();
CREATE TRIGGER "checaPessoa" BEFORE INSERT ON "Pessoa_Juridica" FOR EACH ROW EXECUTE PROCEDURE "checaPessoa"();

ALTER TABLE "Pedido_Produto" ADD COLUMN "idRevenda" INT NOT NULL REFERENCES "Revenda" ( "idRevenda" );