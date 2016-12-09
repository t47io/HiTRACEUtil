function p_dist = weighted_dist(p_1, p_2)

p_dist = sqrt(sum( (p_1 - p_2).^2 ./ (p_1.^2 + p_2.^2) ) / sum(p_1.^2 + p_2.^2) );
