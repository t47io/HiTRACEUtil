function p_dist = eu_dist(p_1, p_2)

p_dist = sqrt(mean((p_1 - p_2).^2));
