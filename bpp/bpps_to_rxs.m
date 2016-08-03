function rxs = bpps_to_rxs(bpps)

rxs = zeros(length(bpps), length(bpps{1}));
for i = 1:length(bpps);
    rxs(i, :) = 1 - sum(bpps{i});
end;
