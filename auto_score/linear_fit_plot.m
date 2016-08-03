function linear_fit_plot(ratio, d_WT, d_1, d_2, labels)
if ~exist('labels','var'); labels = {}; end;

plot(d_WT,'ko-','linewidth',5);
hold on;
plot(d_1,'bo-');
plot(d_2,'go-');
plot(ratio*d_1 + (1-ratio)*d_2, 'ro-', 'linewidth',2);
set(gca,'fontsize',16);

if ~isempty(labels);
    legend('WT',labels{1},labels{2},'fit');
else
    legend('WT','trace-1','trace-2','fit');
end;
