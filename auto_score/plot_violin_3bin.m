function [plot_theta, plot_ratio] = plot_violin_3bin(ans_3bin, dist_all, theta, A, caption)
plot_theta = {...
    max(dist_all(ans_3bin == 0,2), dist_all(ans_3bin == 0,3)), ...
    max(dist_all(ans_3bin == 1,2), dist_all(ans_3bin == 1,3)), ...
    max(dist_all(ans_3bin == 0.5,2), dist_all(ans_3bin == 0.5,3)), ...
};
plot_ratio = {...
    dist_all(ans_3bin == 0,1) ./ plot_theta{1}, ...
    dist_all(ans_3bin == 1,1) ./ plot_theta{2}, ...
    dist_all(ans_3bin == 0.5,1) ./ plot_theta{3}, ...
};

for i = 1:3;
    if isempty(plot_theta{i});
        plot_theta{i} = -1;
        plot_ratio{i} = -1;
    end;
end;

label_x = {['Fail = ', num2str(length(plot_theta{1})), ' '], ['Success = ', num2str(length(plot_theta{2})), ' '], ['Uncertain = ', num2str(length(plot_theta{3})), ' ']};

figure(); set_print_page(gcf,0);
subplot(1,2,1);
violin(plot_theta, 'xlabel',label_x, 'facecolor', [1 0.32 0.17; 0.62 0.78 0.02; 0.73 0.72 0.77], 'medc','b', 'bw',0.01);
hold on; make_lines_horizontal(theta-0.5,'c',2);
set(gca,'fontsize',16);
title([caption, ' THETA = ', num2str(theta), ' '],'fontsize',20,'fontweight','bold');
text(0.6,theta-0.02,num2str(sum(plot_theta{1}<theta)),'fontsize',16);
text(0.6,theta+0.02,num2str(sum(plot_theta{1}>=theta)),'fontsize',16);
text(1.6,theta-0.02,num2str(sum(plot_theta{2}<theta)),'fontsize',16);
text(1.6,theta+0.02,num2str(sum(plot_theta{2}>=theta)),'fontsize',16);
text(2.6,theta-0.02,num2str(sum(plot_theta{3}<theta)),'fontsize',16);
text(2.6,theta+0.02,num2str(sum(plot_theta{3}>=theta)),'fontsize',16);
ylabel('max( [WT-A], [WT-B] ) ', 'fontsize',16, 'fontweight','bold');

subplot(1,2,2);
violin(plot_ratio, 'xlabel',label_x, 'facecolor', [1 0.32 0.17; 0.62 0.78 0.03; 0.73 0.72 0.77], 'medc','b', 'bw',0.01);
hold on; make_lines_horizontal(A-0.5,'c');
set(gca,'fontsize',16);
title([caption, ' A = ', num2str(A), ' '],'fontsize',20,'fontweight','bold');
text(0.6,A-0.03,num2str(sum(plot_ratio{1}<A)),'fontsize',16);
text(0.6,A+0.03,num2str(sum(plot_ratio{1}>=A)),'fontsize',16);
text(1.6,A-0.03,num2str(sum(plot_ratio{2}<A)),'fontsize',16);
text(1.6,A+0.03,num2str(sum(plot_ratio{2}>=A)),'fontsize',16);
text(2.6,A-0.03,num2str(sum(plot_ratio{3}<A)),'fontsize',16);
text(2.6,A+0.03,num2str(sum(plot_ratio{3}>=A)),'fontsize',16);
ylabel('[WT-AB] / max( [WT-A], [WT-B] ) ', 'fontsize',16, 'fontweight','bold');

