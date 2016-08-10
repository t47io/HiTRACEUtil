function plot_violin_4bin(ans_4bin, dist_all, theta, A, B, caption)
plot_theta = {...
    max(dist_all(ans_4bin == 0,2), dist_all(ans_4bin == 0,3)), ...
    max(dist_all(ans_4bin == 1,2), dist_all(ans_4bin == 1,3)), ...
    max(dist_all(ans_4bin == 0.5,2), dist_all(ans_4bin == 0.5,3)), ...
    max(dist_all(ans_4bin == 0.7,2), dist_all(ans_4bin == 0.7,3)), ...
};
plot_ratio = {...
    dist_all(ans_4bin == 0,1) ./ plot_theta{1}, ...
    dist_all(ans_4bin == 1,1) ./ plot_theta{2}, ...
    dist_all(ans_4bin == 0.5,1) ./ plot_theta{3}, ...
    dist_all(ans_4bin == 0.7,1) ./ plot_theta{4}, ...
};
for i = 1:4;
    if isempty(plot_theta{i});
        plot_theta{i} = -1;
        plot_ratio{i} = -1;
    end;
end;

label_x = {['Fail = ', num2str(length(plot_theta{1})), ' '], ['Success = ', num2str(length(plot_theta{2})), ' '], ['Uncertain = ', num2str(length(plot_theta{3})), ' '], ['Partial = ', num2str(length(plot_theta{4})), ' ']};

figure(); set_print_page(gcf,0);
subplot(1,2,1);
violin(plot_theta, 'xlabel',label_x, 'facecolor', [1 0.32 0.17; 0.62 0.78 0.02; 0.73 0.72 0.77; 1 0.76 0.03], 'medc','b', 'bw',0.01);
hold on; make_lines_horizontal(theta-0.5,'c',2);
set(gca,'fontsize',16);
title([caption, ' THETA = ', num2str(theta), ' '],'fontsize',20,'fontweight','bold');
text(0.6,theta-0.02,num2str(sum(plot_theta{1}<theta)),'fontsize',16);
text(0.6,theta+0.02,num2str(sum(plot_theta{1}>=theta)),'fontsize',16);
text(1.6,theta-0.02,num2str(sum(plot_theta{2}<theta)),'fontsize',16);
text(1.6,theta+0.02,num2str(sum(plot_theta{2}>=theta)),'fontsize',16);
text(2.6,theta-0.02,num2str(sum(plot_theta{3}<theta)),'fontsize',16);
text(2.6,theta+0.02,num2str(sum(plot_theta{3}>=theta)),'fontsize',16);
text(3.6,theta-0.02,num2str(sum(plot_theta{4}<theta)),'fontsize',16);
text(3.6,theta+0.02,num2str(sum(plot_theta{4}>=theta)),'fontsize',16);
ylabel('max( [WT-A], [WT-B] ) ', 'fontsize',16, 'fontweight','bold');

subplot(1,2,2);
violin(plot_ratio, 'xlabel',label_x, 'facecolor', [1 0.32 0.17; 0.62 0.78 0.02; 0.73 0.72 0.77; 1 0.76 0.03], 'medc','b', 'bw',0.01);
hold on; make_lines_horizontal([A,B]-0.5,'c');
set(gca,'fontsize',16);
title([caption, ' A = ', num2str(A), '; B = ', num2str(B), ' '],'fontsize',20,'fontweight','bold');
text(0.6,A-0.02,num2str(sum(plot_ratio{1}<A)),'fontsize',16);
text(0.6,B+0.02,num2str(sum(plot_ratio{1}>=B)),'fontsize',16);
text(0.6,(A+B)/2,num2str(length(plot_ratio{1})-sum(plot_ratio{1}<A)-sum(plot_ratio{1}>=B)),'fontsize',16);
text(1.6,A-0.02,num2str(sum(plot_ratio{2}<A)),'fontsize',16);
text(1.6,B+0.02,num2str(sum(plot_ratio{2}>=B)),'fontsize',16);
text(1.6,(A+B)/2,num2str(length(plot_ratio{2})-sum(plot_ratio{2}<A)-sum(plot_ratio{2}>=B)),'fontsize',16);
text(2.6,A-0.02,num2str(sum(plot_ratio{3}<A)),'fontsize',16);
text(2.6,B+0.02,num2str(sum(plot_ratio{3}>=B)),'fontsize',16);
text(2.6,(A+B)/2,num2str(length(plot_ratio{3})-sum(plot_ratio{3}<A)-sum(plot_ratio{3}>=B)),'fontsize',16);
text(3.6,A-0.02,num2str(sum(plot_ratio{4}<A)),'fontsize',16);
text(3.6,B+0.02,num2str(sum(plot_ratio{4}>=B)),'fontsize',16);
text(3.6,(A+B)/2,num2str(length(plot_ratio{4})-sum(plot_ratio{4}<A)-sum(plot_ratio{4}>=B)),'fontsize',16);
ylabel('[WT-AB] / max( [WT-A], [WT-B] ) ', 'fontsize',16, 'fontweight','bold');
