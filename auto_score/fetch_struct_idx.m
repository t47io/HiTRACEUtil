function struct_res = fetch_struct_idx(idxs, struct_all, idxs_bin, rf_name)

struct_res = [];
for i = 1:length(idxs);
    idx_temp = find((idxs(i) <= idxs_bin) == 1);
    idx_temp = idx_temp(1);
    struct_temp = struct_all(idx_temp);
    temp.seq = struct_temp.seq;
    
    if idxs(i) <= idxs_bin(1);
        idx_diff = idxs(i);
    else
        idx_diff = idxs(i) - idxs_bin(idx_temp-1);
    end;
    temp.key = struct_temp.keys{idx_diff*3+1};
    temp.quartet = struct_temp.quartet{idx_diff};
    temp.dist = struct_temp.dist(idx_diff,:);
    temp.pair = struct_temp.pairs(:,idx_diff);
    temp.bpp = struct_temp.bpp(idx_diff);
    temp.name = rf_name(idx_temp);
    temp.idx = idxs(i);
    
    struct_res = [struct_res, temp];
end;
