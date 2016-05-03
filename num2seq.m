function str = num2seq(array)

str = '';
dict = 'ACDEFGHIKLMNPQRSTVWY';

for i = 1:length(array);
    val = ceil(array(i)/2) + 10;
%     if val < 11; val = val + 1; end;
    val = max(1, min(val, 20));
    str = [str, dict(val)];
end;
