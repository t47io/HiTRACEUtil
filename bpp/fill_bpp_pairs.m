function bpp = fill_bpp_pairs(bpp, pairs, val, flag)

if ~exist('flag','var') || isempty(flag); flag = 'both'; end;
if size(pairs,1) > size(pairs,2) && size(pairs,2) ~= 1; pairs = pairs'; end;

for i = 1:size(pairs,2);
    x = pairs(:, i);
    if x(1) > x(2); x = [x(2), x(1)]; end;

    if flag == 'triu';
        bpp(x(1), x(2)) = val;
    elseif flag == 'tril';
        bpp(x(2), x(1)) = val;
    else;
        bpp(x(1), x(2)) = val;
        bpp(x(2), x(1)) = val;
    end;
end;
