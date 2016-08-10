function hist_list = bpp_dist(bpp, pairs, ans_bins, n_bins)

temp = zeros(1, size(pairs,2));
for i = 1:size(pairs,2);
    temp(i) = bpp(pairs(1,i), pairs(2,i));
end;

if n_bins == 4;
    hist_list = [histc(temp(ans_bins==0), 0:0.05:1); ...
        histc(temp(ans_bins==0.5), 0:0.05:1); ...
        histc(temp(ans_bins==0.7), 0:0.05:1); ...
        histc(temp(ans_bins==1), 0:0.05:1)];
elseif n_bins == 3;
    hist_list = [histc(temp(ans_bins==0), 0:0.05:1); ...
        histc(temp(ans_bins==0.5), 0:0.05:1); ...
        histc(temp(ans_bins==1), 0:0.05:1)];    
end;
