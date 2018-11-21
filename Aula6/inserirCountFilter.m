function [B] = inserirCountFilter (B, k, elem)
   %B = Bloomfilter criado anteriormente
    %elem = string a ser inserida no bloomfilter
    %k = número de hash
    m = length(B);
    
    for i = 1: k %Vai correr a hash
        elem = [elem num2str(i)];
        temp = string2hash(elem);
        h = rem (temp, m) + 1; %+1 para o caso de rem = 0
        B(h) += 1; 
    end
endfunction
