function falsePositives = fpositivos_main (bloomFilterSize, m2, k, m, tamanho, alphabet)

% Inicializa o Bloomfilter
B = inicializar(bloomFilterSize);

%Criar rand strings e adicionar ao Bloomfilter
for i = 1 : m
    nums = randi(numel(alphabet),[1 tamanho]); %Gera random nums
    string_gerada = alphabet (nums); %Gera a random string de length = 40
    B = inserir (B, k, string_gerada);
end 

%Verificar se as strings geradas pertencem ou não ao Bloomfilter
falsePositives=0;

for i = 1 : m2
    nums = randi(numel(alphabet),[1 tamanho]); %Gera random nums
    string_gerada = alphabet (nums); %Gera a random string de length = 40
    r = verificar (B, k, string_gerada);
    
    if r == 1
        falsePositives=falsePositives+1;
    end
end 