%%Exercicio6 ----- NÃO ESTÁ TERMINADO! NÃO CONSEGUI IMPLEMENTAR O COUNTFILTER CORRETAMENTE

clear;
clc;
%Adapte as suas func¸oes para implementar um ˜ Count Filter. Aplique estas novas func¸oes para conseguir ˜
%mostrar para uma qualquer palavra de um livro o numero de vezes que ocorre no livro. Esta contagem ´
%apenas deve ser mostrada para palavras que pertenc¸am ao livro.
%Sugere-se a utilizac¸ao de um livro do projecto Gutemberg.

% Open file
file = fopen('teste.txt'); %file correto é livro.txt

file_contents = fscanf(file, '%c', inf);
wordsFile = strsplit(file_contents); %wordsFile é um cell array com as palavras to file
words = strtok(wordsFile, ',.!?;-_');

% Adicionar as palavras ao BloomFilter
n =  length(wordsFile);  %numero de palavras
m = n * 15; %tamanho do Bloomfilter
k = round ((m / n) * log(2)); %“Optimal” value of k: n/m ln(2)

%Criar o Bloomfilter
B = inicializar (m);

for i = 1: n
    B = inserirCountFilter (B, k, words{i});
end

fprintf('Numero de ocorrencias da palavra: \n');

%remove palavras repetidas
words = sort(unique(words));
n = length(words); 
values = zeros(1, n);

%COUNT FILTER
for i = 1: n
    word = words{i};
    values(i) = CountFilter(B, k, word);
    fprintf('\t%s -> %d\n', word, values(i));
end