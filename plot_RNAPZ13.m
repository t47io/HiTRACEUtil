function plot_RNAPZ13( d, str, conc)

figure();
set_print_page(gcf,1);
image(d*20); colormap(1-gray);
make_lines; make_lines(0:5:20,'b');
title(['Titration: ', str], 'fontsize',20,'fontweight','bold');

hold on;
x = [0,0,21,21]; y = [1700,2000,2000,1700];
fill(x,y, 'w', 'edgecolor','none');
for i = 0:5:20;
    plot([i+0.5,i+0.5],[1700,2000],'b');
    x = [i+1,i+5,i+5]; y = [1800,1800,1750];
    fill(x,y, 'r', 'edgecolor','none');
end;
set(gca,'ytick',[]);
set(gca,'fontsize',16);
set(gca,'xtick',3:5:18, 'xticklabel', {'nomod','SHAPE','CMCT','DMS'});
xlabel([str, ' conc.: ', conc], 'fontweight','bold', 'color', [0 0.5 0]);

print_save_figure(gcf,['fig_', str],'./');
