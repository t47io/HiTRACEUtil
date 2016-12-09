function p_dist = eu_dist_weighted(p_1, p_2, weights)

p_dist = sqrt( sum((p_1 - p_2).^2 .* weights) / sum(weights) );


