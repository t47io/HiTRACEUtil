function bpp = get_bpp_estimate(temp_helix_bins, ratios, helix_len_adjust)
if ~exist('helix_len_adjust','var') || isempty(helix_len_adjust); helix_len_adjust = 0; end;

helix_len = length(ratios) + helix_len_adjust;
helix_len = min(7, helix_len) - 2;
if helix_len < 0;
    bpp = NaN;
else;
    if helix_len == 0; helix_len = 1; end;
    
    ratio = mean(ratios);
    bins = cell2mat(temp_helix_bins{helix_len}(1,:));
    idx = find(bins <= ratio);
    if isempty(idx); idx = 1; else; idx = max(1, idx(end)); end;
    
    bpp = temp_helix_bins{helix_len}{3, idx}([3,2,4]);
%     bpp = temp_helix_bins{helix_len}{4, idx}(1);
    fprintf('%2.f%% (%2.f%% - %2.f%%)\n', bpp(1)*100, bpp(2)*100, bpp(3)*100);
end;
