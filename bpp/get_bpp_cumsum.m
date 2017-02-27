function bpp_cumsum = get_bpp_cumsum(temp_helix_bins, ratios, helix_len_adjust)
if ~exist('helix_len_adjust','var') || isempty(helix_len_adjust); helix_len_adjust = 0; end;

helix_len = length(ratios) + helix_len_adjust;
helix_len = min(7, helix_len) - 2;
if helix_len < 0;
    bpp_cumsum = NaN;
else;
    if helix_len == 0; helix_len = 1; end;
    ratio = mean(ratios);
    bins = cell2mat(temp_helix_bins{helix_len}(1,:));
    idx = find(bins <= ratio);
    if isempty(idx); idx = 1; else; idx = max(1, idx(end)); end;
    
    helix_freq = temp_helix_bins{helix_len}{2, idx};

    bpp_bins = 0:0.05:1;
    bpp_temp = zeros(1, length(bpp_bins));
    for k = 1:length(helix_freq);
        x = find(helix_freq(k) > bpp_bins);
        bpp_temp(x(end)) = bpp_temp(x(end)) + 1;
    end;

    bpp_cumsum = cumsum(bpp_temp) / sum(bpp_temp);
end;
