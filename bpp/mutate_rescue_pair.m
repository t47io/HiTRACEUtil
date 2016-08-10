function mut_seq = mutate_rescue_pair(sequence, mutpos)

sequence = strrep(sequence,'T','U');
nt = mutate_pair([sequence(mutpos(1)), sequence(mutpos(2))]);
mut_seq = [sequence(1:(mutpos(1)-1)), nt(1), sequence((mutpos(1)+1):(mutpos(2)-1)), nt(2), sequence((mutpos(2)+1):end)];

