carateres = ['a':'z' 'A':'Z' '0':'9']; %carateres disponiveis

a = {};
b = ['aaa', 'eee', 'ddd']

for i = 1:10
  nums = randi(numel(carateres),[1 5]); %Gera random nums
  string_gerada = carateres (nums);
  a = [a string_gerada];
endfor

disp(a{1})
disp(a)