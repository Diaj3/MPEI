function [ contains ] = verificar( B, k,  elem )
    %verificar se o elemento j� pertence ao Bloomfilter
    
    %definir vari�veis
    m = length(B);
    contains = 1; % =1 caso contenha
    
    %Correr o Bloomfilter
    for i = 1: k
        %disp(elem)
        temp = string2hash(elem);
        h = rem (temp, m) + 1; %� somado +1 caso rem = 0
        if B(h) == 0 %Caso o elem do array do Bloomfilter = 0 sabemos que o mesmo n�o cont�m a string
            contains = 0;
            break;
        end
    end
end