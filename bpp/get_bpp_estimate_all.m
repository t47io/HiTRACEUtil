function bpp = get_bpp_estimate_all(temp_all_bins, ratios)

helix_len = length(ratios);
helix_len = min(7, helix_len) - 2;
if helix_len == 0;
    bpp = NaN;
else;
    ratio = mean(ratios);
    bins = cell2mat(temp_all_bins(1,:));
    idx = find(bins <= ratio);
    idx = idx(end);
    
    bpp = temp_all_bins{3, idx}(3);
%     bpp = temp_all_bins{4, idx}(1);
end;
