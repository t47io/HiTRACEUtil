function ratio = chisq_fit(d_WT, d_1, d_2, e_WT, e_1, e_2, labels)
if ~exist('labels','var'); labels = {}; end;

N_bins = 50;

chisq_score = zeros(1, N_bins + 1);

for i = 0:N_bins;
    alpha = i / N_bins;
    d_fit = alpha*d_1 + (1-alpha)*d_2;
    e_fit = alpha*e_1.^2 + (1-alpha)*e_2.^2;
    chisq_score(i + 1) = nansum((d_WT - d_fit).^2 ./ (e_WT.^2 + e_fit));
end;

[min_dist, idx] = min(chisq_score);
ratio = (idx - 1) / N_bins;

% offset = 1;
% chi_offset_range = find(chisq_score >= (min_dist+offset) & chisq_score < (min_dist+offset+1));
% ratio
% chi_conf_min = abs(chi_offset_range(1)-find(chisq_score == min_dist))*0.02
% chi_conf_max = abs(chi_offset_range(end)-find(chisq_score == min_dist))*0.02

figure();
plot(0:(1/N_bins):1, chisq_score, 'bo-');
hold on;
plot(ratio, chisq_score(idx), 'ro');

% figure();
% linear_fit_plot(ratio, d_WT, d_1, d_2, labels);
