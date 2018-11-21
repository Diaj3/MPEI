%Exercicio2
%Teste as funções que desenvolveu na criação de um pequeno ˜ Bloom Filter para guardar uma lista de
%países. Insira alguns nomes de países no filtro e teste a pertença desses e de alguns países adicionais que
%não pertençam a essa lista inicial.

%Definir arrays
paises = {"Portugal","Espanha","França", "Alemanha","Inglaterra"};
paises_adicionais = {"Argentina", "Italia", "Belgica", "Portugal"};

%Tamanho do Bloomfilter
s = 100;
%Número de hash
k = 3;
%Inicializar o Bloomfilter
B = inicializar(s);

%Inserir todos os elementos do array no Bloomfilter
for i = 1:length(paises)
  B = inserir(B, k, paises{i});
end

%Verificar de os paises adicionais pertencem ou não
for i = 1:length(paises_adicionais) %corre o array
  
  %Ver a presença do elemento no Bloomfilter
  contem = verificar(B, k, paises_adicionais{i});
  
  if (contem == 1)
           fprintf('%s Provavelmente pertence! \n', paises_adicionais{i});
  else
           fprintf('%s Nao pertence! \n', paises_adicionais{i});
  end
end