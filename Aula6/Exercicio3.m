%%Exercicio3
clear;
clc;
%% a)
% Gere m=1000 strings aleatorias com 40 caracteres (considere como caracteres poss ´ ´iveis o conjunto
%de caracteres minusculos, mai ´ usculos e algarismos) e preencha um ´ Bloom Filter, de tamanho
%n=8000. Este Bloom Filter deve ter k = 3 func¸oes de dispersão e as strings geradas devem obdecer ˜
%as diferentes probabilidades de ocorr ` encia das letras em português.

%definir variáveis
m = 1000; %nº de strings
n = 8000; %tamanho do Bloomfilter
k = 3; %nº de funções de dispersão
tamanho = 40; %tamanho da string

carateres = ['a':'z' 'A':'Z' '0':'9']; %carateres disponiveis

%Inicializando o Bloomfilter
B = inicializar(n);

%Inserir as random strings no Bloomfilter
for i = 1:1000
  nums = randi(numel(carateres),[1 40]); %Gera random nums
  string_gerada = carateres (nums); %Gera a random string de length = 40
  B = inserir ( B, k, string_gerada );  
  %disp(B)
endfor

%% b) Gere um segundo conjunto de 10000 strings aleatorias com 40 caracteres e teste a pertenc¸a das ´
%mesmas ao Bloom Filter que preencheu antes. Quantas destas strings foram consideradas como
%pertencendo ao conjunto com que o filtro foi preenchido? Estava a espera deste resultado?

for i = 1:10000
  nums = randi(numel(carateres),[1 40]); %Gera random nums
  string2_gerada = carateres (nums); %Gera a random string de length = 40
  contem = verificar ( B, k, string2_gerada ); 
  if (contem == 1)
           fprintf('%s Provavelmente pertence! \n', string2_gerada);
  else
           fprintf('%s Nao pertence! \n', string2_gerada);
  end
endfor