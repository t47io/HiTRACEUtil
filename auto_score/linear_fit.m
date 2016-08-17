function ratio = linear_fit(d_WT, d_1, d_2, labels)
if ~exist('labels','var'); labels = {}; end;

eu_dist = zeros(1,51);

for i = 0:0.02:1
    d_fit = i*d_1 + (1-i)*d_2;
    eu_dist(int8(i*50+1)) = norm(d_fit - d_WT);
end;

[~, idx] = min(eu_dist);
ratio = (idx-1)/50;

figure();
plot(0:0.02:1, eu_dist, 'bo-');
hold on;
plot(ratio, eu_dist(idx), 'ro');

figure();
linear_fit_plot(ratio, d_WT, d_1, d_2, labels);
