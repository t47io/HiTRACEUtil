function plot_4bin_hist(score_test_to_compare, bpp_all, label, hist_manual_std)

hist_test_to_compare = [histc(bpp_all(score_test_to_compare==0), 0:0.05:1); ...
    histc(bpp_all(score_test_to_compare==0.5), 0:0.05:1); ...
    histc(bpp_all(score_test_to_compare==0.7), 0:0.05:1); ...
    histc(bpp_all(score_test_to_compare==1), 0:0.05:1)];

figure(); set_print_page(gcf,0);
subplot(4,2,1);
h = bar(0.025:0.05:1.025,hist_manual_std(5,:), 1,'stacked');
set(h,'FaceColor',[0.62 0.78 0.02]);
set(gca,'fontsize',16); xlim([0 1]);ylim([0 85]);
xlabel('bpp(i,j)'); ylabel('#');
legend('Confirmed');
title('242 manual in silico','fontsize',20,'fontweight','bold');
subplot(4,2,3);
h = bar(0.025:0.05:1.025,hist_manual_std(1,:), 1,'stacked');
set(h,'FaceColor',[1 0.32 0.17]);
set(gca,'fontsize',16); xlim([0 1]);ylim([0 85]);
legend('Not Confirmed');
xlabel('bpp(i,j)'); ylabel('#');
subplot(4,2,5);
h = bar(0.025:0.05:1.025,hist_manual_std(2,:), 1,'stacked');
set(h,'FaceColor',[0.73 0.72 0.77]);
set(gca,'fontsize',16); xlim([0 1]);ylim([0 85]);
legend('Uncertain');
xlabel('bpp(i,j)'); ylabel('#');
subplot(4,2,7);
h = bar(0.025:0.05:1.025,hist_manual_std([3,4],:)', 1,'stacked');
set(h,{'FaceColor'},{[1 0.76 0.03]; [0.24 0.83 0.91]});
set(gca,'fontsize',16); xlim([0 1]);ylim([0 85]);
legend('Partial', 'Expected Partial');
xlabel('bpp(i,j)'); ylabel('#');
subplot(4,2,2);
h = bar(0.025:0.05:1.025,hist_test_to_compare(4,:), 1,'stacked');
set(h,'FaceColor',[0.62 0.78 0.02]);
set(gca,'fontsize',16); xlim([0 1]);ylim([0 85]);
xlabel('bpp(i,j)'); ylabel('#');
legend('Confirmed');
title(['242 auto in silico: ',label],'fontsize',20,'fontweight','bold');
subplot(4,2,4);
h = bar(0.025:0.05:1.025,hist_test_to_compare(1,:), 1,'stacked');
set(h,'FaceColor',[1 0.32 0.17]);
set(gca,'fontsize',16); xlim([0 1]);ylim([0 85]);
legend('Not Confirmed');
xlabel('bpp(i,j)'); ylabel('#');
subplot(4,2,6);
h = bar(0.025:0.05:1.025,hist_test_to_compare(2,:), 1,'stacked');
set(h,'FaceColor',[0.73 0.72 0.77]);
set(gca,'fontsize',16); xlim([0 1]);ylim([0 85]);
legend('Uncertain');
xlabel('bpp(i,j)'); ylabel('#');
subplot(4,2,8);
h = bar(0.025:0.05:1.025,hist_test_to_compare(3,:)', 1,'stacked');
set(h,'FaceColor',[1 0.76 0.03]);
set(gca,'fontsize',16); xlim([0 1]);ylim([0 85]);
legend('Partial');
xlabel('bpp(i,j)'); ylabel('#');
