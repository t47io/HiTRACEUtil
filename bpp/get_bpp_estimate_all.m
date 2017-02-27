function bpp = get_bpp_estimate_all(temp_all_bins, ratios)

helix_len = length(ratios);
% helix_len = min(7, helix_len) - 2;
if helix_len == 0;
    bpp = NaN;
else;
    ratio = mean(ratios);
    bins = cell2mat(temp_all_bins(1,:));
    idx = find(bins <= ratio);
    if isempty(idx); idx = 1; else; idx = max(1, idx(end)); end;
    
    bpp = temp_all_bins{3, idx}([3,2,4]);
%     bpp = temp_all_bins{4, idx}(1);
    fprintf('%2.f%% (%2.f%% - %2.f%%)\n', bpp(1)*100, bpp(2)*100, bpp(3)*100);
end;
