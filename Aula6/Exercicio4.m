%%Exercicio4
clear;
clc;
%Repita o teste da questao anterior para um n ˜ umero diferente de func¸ ´ oes de dispers ˜ ao ( ˜ k = 1, . . . , 15),
%obtendo o numero de falsos positivos para cada ´ k. Represente num grafico os valores obtidos, em func¸ ´ ao˜
%de k e sobreponha nesse grafico os valores te ´ oricos (Assuma a independ ´ encia de hash functions e que ˆ
%cada uma seleciona cada posic¸ao do bloom filter com igual probabilidade). Nota: Assume-se que as ˜
%10000 strings de teste sao todas diferentes das 1000 inseridas no ˜ Bloom filter. No entanto pode haver
%strings iguais.

fprintf("Exercicio4 \n");

%Definir variáveis
m = 1000; %Número das strings
tamanho = 40; %Tamanho da string
n = 8000; %Tamanho do Bloomfilter
m2 = 10000; %Número das segundas strings
kMax = 15; %Valor máximo de k (começa em k = 1)
alphabet = ['A':'Z' 'a':'z' '1', '2', '3', '4', '5', '6', '7', '8', '9', '0'];  % Carateres disponiveis

%Falsos positivos (teóricos)
FalsosPositivos_teoricos = zeros (1, kMax);
%Falsos positivos
FalsosPositivos = zeros(1, kMax);

for k = 1: kMax
  FalsosPositivos(k) = fpositivos_main(n, m2, k, m, tamanho, alphabet);
  %disp(FalsosPositivos(k))
  FalsosPositivos_teoricos(:, k) = (1 - exp(-k*m/n))^k; %Probabilidade de um falso positivo (slides (10))
  fprintf('\n\t%d :  Probabilidade de falsos positivos = %.4f\n', k, FalsosPositivos(k)/m2);
   
  figure(1);
  hold on 
  %Gráfico para valores de simulação
  plot(1:k, FalsosPositivos(1:k)/m2, 'r');
  xlabel('Numero de hash functions');
  ylabel('Probabilidade de falsos positivos');
  drawnow;
    
  %Gráfico para valores teóricos
  plot(1:k, FalsosPositivos_teoricos(1:k), 'b');
  drawnow;
  hold off
  legend('Valores de simulacao', 'Valores teoricos')
end