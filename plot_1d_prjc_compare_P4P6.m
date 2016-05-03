function plot_1d_prjc_compare_P4P6(D, Dnum, Dnomod, N, D_raw, Noff, fl_ext_corr_fc, rx_1D, rx_RMDB, ttl, fnm)

lgd = cell(1, N);
for i = 2:N
    lgd{i} = num2str(i-1);
end;
lgd{1} = 'STAR';
colorcode = jet(N);

figure(); set_print_page(gcf,1);
subplot(5,1,1);
a = D{Dnum}(:,end-N+1:end);
b = D{Dnomod}(:,end-N+1:end);
for i = 1:size(a,2);
    plot(a(:,i),'color',colorcode(i,:)); hold on;
end;
legend(lgd);
set(gca,'ygrid','on');
ylabel('2D plot reactivity');

subplot(5,1,2);
title('MiSeq mean compare'); hold on;
plot(mean(a,2),'ko-','linewidth',1,'markerfacecolor','none','markersize',4); hold on;
plot(mean(b,2),'color',[1 0.5 0],'linewidth',1); hold on;
errorbar(1:size(a,1), mean(a,2),std(a,0,2),'k');
axis([0 300 0 3]);
legend('rx','nomod');
set(gca,'ygrid','on');
ylabel('2D plot reactivity');

subplot(5,1,3);
title('MiSeq mean vs. 1D projection, boxplot normalized'); hold on;
c = mean(a,2)-mean(b,2);
%c(c<0) = 0;
plot(boxplot_normalize(c),'k','linewidth',1.5);hold on;
mdf_prjcs(:,1) = get_modification_projection(D_raw{Dnomod}, fl_ext_corr_fc, Noff);
mdf_prjcs(:,2) = get_modification_projection(D_raw{Dnum}, fl_ext_corr_fc, Noff);
d = mdf_prjcs(:,2)-mdf_prjcs(:,1);
d = d(2:end-1);
%d(d<0) = 0;
plot(boxplot_normalize(d),'c','linewidth',1); hold on;
axis([0 300 -0.25 5]);
make_lines_horizontal(-0.5,[0.5 0.5 0.5],0.5);
make_lines(1:30-0.5,[0.5 0.5 0.5],0.5,1,0);
make_lines(191:227-0.5,[0.5 0.5 0.5],0.5,1,0);
make_lines(14:18-0.5,'g',0.5,1,0);
make_lines(207:211-0.5,'g',0.5,1,0);
make_lines(227:247-0.5,'m',0.5,1,0);
legend('MiSeq mean bsub','1D mdf prjc bsub',['N\_offset = ',num2str(Noff)], ['fl\_ext\_corr\_fc = ',num2str(fl_ext_corr_fc)]);
set(gca,'ygrid','on');
ylabel('boxplot reactivity');

subplot(5,1,4);
title('MiSeq mean vs. CE check, boxplot normalized'); hold on;
plot(boxplot_normalize(c),'k','linewidth',1.5);hold on;
plot(boxplot_normalize(rx_1D),'r','linewidth',1); hold on;
axis([0 300 -0.25 5]);
make_lines_horizontal(-0.5,[0.5 0.5 0.5],0.5);
make_lines(1:30-0.5,[0.5 0.5 0.5],0.5,1,0);
make_lines(191:227-0.5,[0.5 0.5 0.5],0.5,1,0);
make_lines(14:18-0.5,'g',0.5,1,0);
make_lines(207:211-0.5,'g',0.5,1,0);
make_lines(227:247-0.5,'m',0.5,1,0);
legend('MiSeq mean bsub','CE rx bsub');
set(gca,'ygrid','on');
ylabel('boxplot reactivity');

subplot(5,1,5);
title('RMDB compare'); hold on;
plot(rx_RMDB,'b','linewidth',1.5);hold on;
plot(rx_1D,'r','linewidth',1); hold on;
plot(boxplot_normalize(rx_RMDB),'color',[0.5 0.5 0.5]);hold on;
axis([0 300 -0.1 5]);
make_lines_horizontal(-0.5,[0.5 0.5 0.5],0.5);
make_lines(1:30-0.5,[0.5 0.5 0.5],0.5,1,0);
make_lines(191:227-0.5,[0.5 0.5 0.5],0.5,1,0);
make_lines(14:18-0.5,'g',0.5,1,0);
make_lines(207:211-0.5,'g',0.5,1,0);
make_lines(227:247-0.5,'m',0.5,1,0);
legend('RMDB','CE rx bsub','RMDB boxplot');
set(gca,'ygrid','on');
ylabel('reference reactivity');
xlabel('Sequence position');

subplot(5,1,1);
title(ttl,'fontsize',20,'fontweight','bold');
print_save_figure(gcf,fnm);

figure();
plot(rx_RMDB,'k','linewidth',1.5);hold on;
plot(boxplot_normalize(d)/2,'r','linewidth',1.5); hold on;
axis([0 250 -0.1 3.5]);
make_lines_horizontal(-0.5,[0.5 0.5 0.5],0.5);
make_lines(1:30-0.5,[0.5 0.5 0.5],0.5,1,0);
make_lines(191:227-0.5,[0.5 0.5 0.5],0.5,1,0);
make_lines(14:18-0.5,'g',0.5,1,0);
make_lines(207:211-0.5,'g',0.5,1,0);
make_lines(227:247-0.5,'m',0.5,1,0);
h=legend('RMDB','1D Projc');
set(h,'fontweight','bold','fontsize',20);
set(gca,'xgrid','on');
ylabel('Normalized Reactivity','fontweight','bold','fontsize',20);
xlabel('Sequence position','fontweight','bold','fontsize',20);
set_print_page(gcf,0);

