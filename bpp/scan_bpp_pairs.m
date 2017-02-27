function [pairs, helix_len] = scan_bpp_pairs(bpp, CUTOFF)
if ~exist('CUTOFF','var') || isempty(CUTOFF); CUTOFF = 1e-3; end;

pairs_yes = zeros(2,0);
pairs_no = zeros(2,0);
helix_len = [];

for i = 1:size(bpp,1);
    for j = (i+1):size(bpp,2);
        if sum(pairs_yes(1,:) == i & pairs_yes(2,:) == j) > 0; continue; end;
        if sum(pairs_no(1,:) == i & pairs_no(2,:) == j) > 0; continue; end;
        
        if bpp(i, j) >= CUTOFF;
            len_scan = 0;
            pairs_temp = [];
            for k = 0:floor((j-i)/2);
                if bpp(i+k, j-k) > CUTOFF;
                    len_scan = len_scan + 1;
                    pairs_temp = [pairs_temp, [i+k; j-k]];
                else
                    if len_scan == 2;
                        pairs_yes = [pairs_yes, pairs_temp];
                        helix_len = [helix_len, len_scan];
                    else
                        pairs_no = [pairs_no, pairs_temp];
                    end;
                    break;
                end;
            end;
        end;
        
    end;
end;

pairs = pairs_yes;