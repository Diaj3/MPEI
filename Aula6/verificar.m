function [ contains ] = verificar( B, k,  elem )
    %verificar se o elemento já pertence ao Bloomfilter
    
    %definir variáveis
    m = length(B);
    contains = 1; % =1 caso contenha
    
    %Correr o Bloomfilter
    for i = 1: k
        %disp(elem)
        temp = string2hash(elem);
        h = rem (temp, m) + 1; %é somado +1 caso rem = 0
        if B(h) == 0 %Caso o elem do array do Bloomfilter = 0 sabemos que o mesmo não contém a string
            contains = 0;
            break;
        end
    end
end