function [ B ] = inicializar ( m )
    %m = tamanho do Bloomfilter
    fprintf("Criando Bloomfilter: \n");  
    
    if (m <= 0)
      error("O tamanho do Bloomfilter tem de ser superior a 0");
      exit
    endif
    
    %Cria um array de zeros para o bloomfilter
    B = zeros(1, m, 'uint8'); %Ocupa 1bit em vez de 8
end
