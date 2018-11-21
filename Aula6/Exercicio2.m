%Exercicio2
%Teste as fun��es que desenvolveu na cria��o de um pequeno � Bloom Filter para guardar uma lista de
%pa�ses. Insira alguns nomes de pa�ses no filtro e teste a perten�a desses e de alguns pa�ses adicionais que
%n�o perten�am a essa lista inicial.

%Definir arrays
paises = {"Portugal","Espanha","Fran�a", "Alemanha","Inglaterra"};
paises_adicionais = {"Argentina", "Italia", "Belgica", "Portugal"};

%Tamanho do Bloomfilter
s = 100;
%N�mero de hash
k = 3;
%Inicializar o Bloomfilter
B = inicializar(s);

%Inserir todos os elementos do array no Bloomfilter
for i = 1:length(paises)
  B = inserir(B, k, paises{i});
end

%Verificar de os paises adicionais pertencem ou n�o
for i = 1:length(paises_adicionais) %corre o array
  
  %Ver a presen�a do elemento no Bloomfilter
  contem = verificar(B, k, paises_adicionais{i});
  
  if (contem == 1)
           fprintf('%s Provavelmente pertence! \n', paises_adicionais{i});
  else
           fprintf('%s Nao pertence! \n', paises_adicionais{i});
  end
end