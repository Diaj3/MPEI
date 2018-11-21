function [ B ] = inserir ( B, k, elem )
    %B = Bloomfilter criado anteriormente
    %elem = string a ser inserida no bloomfilter
    %k = número de hash
    
    m = length(B);
    
    for i = 1: k %Vai correr a hash
        temp = string2hash(elem);
        h = rem (temp, m) + 1; %+1 para o caso de rem = 0
        B(h) = 1; %Definir o value no array do Bloomfilter para 1
    end
end