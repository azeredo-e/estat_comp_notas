# Notas

Notas para a apresentação do seminário

## Slide 1

Autores: Ethan Goen e Clinton Fookes, 2020

## Slide 2

$N_1$ é a dimensão do input.

## Slide 3

$N_2$ número de hidden layers.

## Slide 5

BNNs começaram como uma forma de combater overfitting nos modelos de NN

Comentar sobre como os trabalhos são antigos e que por muito tempo foi limitado por poder computacional.

Foi somente em 2013 que se popularizou métodos de rodar modelos de NN na GPU

## Slide 6

A escolha do prior é um ponto muito importante se tratando de BNNs, a regra de bolso costuma ser o uso de uma Normal centrada ao redor de 0. Mas isso vem ainda da "tradição" frequentista de enxergar uma NN, mas ainda funciona em alguns casos.

Um ponto é que estamos assumindo que sabemos muito aqui né: um bom prior, bons parâmetros para esse prior, etc. Isso raramente é o caso e muitas vezes se faz inferência bayesiana também para estes (mais para frente eu toco nisso) o que aumenta o nosso número de parâmetros

## Slide 8

$q_\theta(w)$ se lê: distribuição q da densidade de w limitado por uma distribuição parametrizada por theta.

Nosso objetivo é achar os theta que melhor minimiza o KL

Contudo $p(w|D)$ é a própria posterior, então o que faremos?

## Slide 9

$F[q(theta)]$ é normalmente chamado de Evidence Lower Bound (ELBO)

Importante dizer que esse método permite o uso da backpropagation que já era e ainda é o padrão no treinamento de redes neurais

Contudo há algumas limitações:

- A literatura se concentra no caso em que há apenas uma camada escondida

## Slide 10

Se usa Mean Field Variational Bayes (MFVB) que assume que $q_\theta(w)$ pode ser fatorizada como uma multiplicação de uma distribuição conhecida (cada peso vai ser a sua distribuição), normalmente uma normal.

Barber Bishop precisavam que a arquitetura da rede fosse uma função de ativação sigmoide de e apenas uma hidden layer

## Slide 11

Mini-batches é bom para quando estanoms lidando com um volume muito grande de dados como normalmente é o caso hoje em dia

Usamos subconjunto de $D$ para cada passagem do nosso algoritmo de otimização em vez de usar ele inteiro na hora de calcular a verossimilhança

Graves (2011) é um dos papers que reacendeu o interesse por BNN.

Contudo, as estimativas da integração MC tinham uma variância muito alta, assim, embora permitissem a criação de redes com mais de uma hidden layer ainda tinham desempenho abaixo do esperado.

truque da reparametriazação

Nossa v.a. $w$ assume a forma uma forma determinística $w = \mu + \sigma \odot \epsilon$

## Slide 12

a single dropout variable is shared amongst each row of the weight matrix, allowing some correlation within rows to be maintained

Podemos juntar isso dos métodos listados até aqui.

- Os nossos pesos são reparametrizados
- Integração MC é usada para estimar a verossimilança
- The KL divergence between the approximate posterior and the prior distribution in the ELBO is then found by approximating the scaled Bernoulli approximate posterior as a mixture of two Gaussians with very small variance.

## Slide 14

Distribuição conjunta = distribuição canonica (probabilidade de que o nosso sistema esteja em algum estado de energia específico)

importante dizer que já definimos a $U(w)$ como a forma canonica da posterior

## Slide 15

O método não e muito usado por ser computacionalmente custoso

Fora do padrão que vemos até então de backpropagation por isso não muito visto

## Slide 17

BBB é um método baseado em reparametrização que permite mudar a forma do ELBO facilitando o uso de integração MC para resolver o problema

Modelos BBB mostram uma boa média de previsões, mas subestimam a variância quando comparada com uma GP

Modelos MC Dropout tem maior variância fora da amostra, mas mantém ela alta demais dentro da amostra
