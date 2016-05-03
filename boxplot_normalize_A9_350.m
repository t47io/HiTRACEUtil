function d_new_350 = boxplot_normalize_A9_350(d_new)

d_new(1:350) = boxplot_normalize(d_new(1:350));
d_new(351:650) = boxplot_normalize(d_new(351:650));
d_new(651:950) = boxplot_normalize(d_new(651:950));
d_new(951:end) = boxplot_normalize(d_new(951:end));
d_new_350 = d_new(3:end);