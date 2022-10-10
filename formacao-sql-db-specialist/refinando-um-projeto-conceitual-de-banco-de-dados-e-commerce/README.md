# **Descrição do Desafio**

O esquema deverá ser adicionado a um repositório do Github para futura avaliação do desafio de projeto. Adicione ao Readme a descrição do projeto conceitual para fornecer o contexto sobre seu esquema.

## **Objetivo:**

Refine o modelo apresentado acrescentando os seguintes pontos:

- #### Cliente PJ e PF – Uma conta pode ser PJ ou PF, mas não pode ter as duas informações;
- Eu poderia ter feito uma tipagem de informação na pessoa, mas como não foi proposto em nenhum momento na atividade, eu não o fiz;
- Foi criada uma trigger no before insert para bloquear a inserção de uma pessoa física com o mesmo código da pessoa juridica, caso ele tente inserir a mesma pessoa para os dois (usando o db), já que na aplicação isso seria controlável, o sistema irá bloquear;

- ### Pagamento – Pode ter cadastrado mais de uma forma de pagamento;
- Foi criada uma entidade de FormaPagamento (para que passa ter vários metodos diferentes de pagamento);
- Foi criada uma entidade ClienteFormaPagamento e associada ao pedido, para que ele possa parcelar em vários cartões ou utilizar diferentes formas de pagamento para compor o pagamento do pedido.

- ### Entrega – Possui status e código de rastreio;
- O rastrei foi feito iniciamente de maneira global, através da entidade Entrega e segmentado para que possamos saber o status de todas as etapas do transporte EntregaEtapas, para que ele consiga gerar rastreabilidade à entrega.

**Agora é a sua vez de ser o protagonista! Implemente o desafio sugerido pela expert e suba seu projeto para um repositório próprio, com isso, você aumentará ainda mais seu portfólio de projetos no GitHub!**