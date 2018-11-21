function [ contains ] = CountFilter( B, k,  elem )
    %verificar se o elemento já pertence ao Bloomfilter
    
    %definir variáveis
    m = length(B);
    contains = 1; % =1 caso contenha
    a = zeros(1, k);
    
    %Correr o Bloomfilter
    for i = 1: k
        elem = [elem num2str(i)];
        temp = string2hash(elem);
        h = rem (temp, m) + 1; %é somado +1 caso rem = 0
        a(i) = B(h); %Caso o elem do array do Bloomfilter = 0 sabemos que o mesmo não contém a string
    end
    
    contains = min(a);
end