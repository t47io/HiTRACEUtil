function result = simulate_rfam_entry(seq, name)

bpp_WT = run_rnastructure_partition(seq);
pairs = scan_bpp_pairs(bpp_WT);
keys{1} = 'Lib1-WT';
for i = 1:size(pairs,2);
    mut_1 = pairs(1,i);
    mut_2 = pairs(2,i);
    mut_nt = mutate_pair([seq(mut_1), seq(mut_2)]);
    keys{i*3-1} = ['Lib1-', seq(mut_1), num2str(mut_1), mut_nt(1)];
    keys{i*3} = ['Lib1-', seq(mut_2), num2str(mut_2), mut_nt(2)];
    keys{i*3+1} = ['Lib1-', seq(mut_1), num2str(mut_1), mut_nt(1), ';' , seq(mut_2), num2str(mut_2), mut_nt(2)];
end;

bpps_is = get_mutant_bpp(keys, seq, 1);
rxs_is = bpps_to_rxs(bpps_is);
bpp_is = zeros(1, size(pairs,2));
for i = 1:(length(keys)-1)/3
    quartet_is{i} = rxs_is([1, ((i-1)*3+2):i*3+1],:);
    dist_is(i,:) = get_quartet_dist(quartet_is{i});
    bpp_is(i) = bpp_WT(pairs(1,i),pairs(2,i));
end;

result.name = name;
result.seq = seq;
result.bpp_WT = bpp_WT;

result.pairs = pairs;
result.keys = keys;
result.rxs = rxs_is;
result.quartet = quartet_is;
result.dist = dist_is;
result.bpp = bpp_is;
