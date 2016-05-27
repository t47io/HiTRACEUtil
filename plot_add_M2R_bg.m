function plot_add_M2R_bg(d_align, bp_1, bp_2, sequence, offset, helix)

rectangle('Position',[3-0.5 0.5 7 4.5], 'FaceColor',[0.76,0.56,0.87], 'EdgeColor','none');hold on;
rectangle('Position',[63-0.5 0.5 7 4.5], 'FaceColor',[0.76,0.56,0.87], 'EdgeColor','none');hold on;
rectangle('Position',[100-0.5 0.5 11 4.5], 'FaceColor',[0.76,0.56,0.87], 'EdgeColor','none');hold on;
rectangle('Position',[13-0.5 0.5 6 4.5], 'FaceColor',[1,0.57,0.18], 'EdgeColor','none');hold on;
rectangle('Position',[28-0.5 0.5 6 4.5], 'FaceColor',[1,0.57,0.18], 'EdgeColor','none');hold on;
rectangle('Position',[42-0.5 0.5 6 4.5], 'FaceColor',[0.24,0.83,0.91], 'EdgeColor','none');hold on;
rectangle('Position',[55-0.5 0.5 6 4.5], 'FaceColor',[0.24,0.83,0.91], 'EdgeColor','none');hold on;
rectangle('Position',[77-0.5 0.5 6 4.5], 'FaceColor',[0.93,0.7,0.07], 'EdgeColor','none');hold on;
rectangle('Position',[93-0.5 0.5 6 4.5], 'FaceColor',[0.93,0.7,0.07], 'EdgeColor','none');hold on;
rectangle('Position',[100-0.5 0.5 3 4.5], 'FaceColor',[0.16, 0.75, 0.57], 'EdgeColor','none');hold on;
rectangle('Position',[108-0.5 0.5 3 4.5], 'FaceColor',[0.16, 0.75, 0.57], 'EdgeColor','none');hold on;

rectangle('Position',[bp_1-0.5 4.5 1 0.5], 'FaceColor',[1, 0.36, 0.17], 'EdgeColor','none');hold on;
rectangle('Position',[bp_2-0.5 4.5 1 0.5], 'FaceColor',[1, 0.36, 0.17], 'EdgeColor','none');hold on;

image(-25:152,1:4, d_align'*40); colormap(1-gray);
set(gca, 'fontsize',10,'ycolor','k');
set(gca,'xticklabel',{'5''','3'''},'xtick',[-25, 152]);
set(gca,'ytick', -20:10:150, 'ydir', 'reverse'); hold on;
% axis image; 
axis([-25 152 0.5 5]); 
alpha(0.9);

make_lines_horizontal(1:3,'k',0.5);
ylabel(helix, 'fontsize',11,'fontweight','bold');
% set(gca,'ytick',3,'yticklabel', helix);
make_lines([0, 129], [0.33,0.59,0.84], 1.5);
h = title([strrep(sequence(bp_1+offset), 'T', 'U'), num2str(bp_1), ' - ', strrep(sequence(bp_2+offset), 'T', 'U'), num2str(bp_2)], 'fontsize',12,'fontweight','bold');
p = get(h,'Position');
set(h,'Position',[p(1), p(2)+0.5, p(3)]);