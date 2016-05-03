function plot_1d_ligand(seqpos, d_SHAPE,d_DMS,d_CMCT,num_unbound,num_ligand,num_analogue,name_ligand,name_analogue)

figure; clf;
set_print_page(gcf, 0, [0 0 800 600], name_analogue);

subplot(3,1,1);
plot(seqpos,d_SHAPE(:,num_unbound), 'Color',[0.4 0.4 0.4], 'linewidth', 2);hold on;
plot(seqpos,d_SHAPE(:,num_ligand), 'b', 'linewidth', 2);hold on;
plot(seqpos,d_SHAPE(:,num_analogue), 'r', 'linewidth', 2);hold on;
set(gca, 'FontSize',8);
legend('Unbound',name_ligand,name_analogue);
title('SHAPE','FontWeight','Bold','FontSize',15,'Color', 'k');
axis([min(seqpos) max(seqpos) -0.5 2]);
make_lines_horizontal(-0.5);
make_lines([-23:0,72:92]-0.5, 'k', 0.5, 1, 0);
make_lines([-13:-9,80:84]-0.5,'g',1,1,0);


subplot(3,1,2);
plot(seqpos,d_DMS(:,num_unbound), 'Color',[0.4 0.4 0.4], 'linewidth', 2);hold on;
plot(seqpos,d_DMS(:,num_ligand), 'b', 'linewidth', 2);hold on;
plot(seqpos,d_DMS(:,num_analogue), 'r', 'linewidth', 2);hold on;
set(gca, 'FontSize',8);
legend('Unbound',name_ligand,name_analogue);
title('DMS','FontWeight','Bold','FontSize',15,'Color', 'k');
axis([min(seqpos) max(seqpos) -1 5]);
make_lines_horizontal(-0.5);
make_lines([-23:0,72:92]-0.5, 'k', 0.5, 1, 0);
make_lines([-13:-9,80:84]-0.5,'g',1,1,0);


subplot(3,1,3);
plot(seqpos,d_CMCT(:,num_unbound), 'Color',[0.4 0.4 0.4], 'linewidth', 2);hold on;
plot(seqpos,d_CMCT(:,num_ligand), 'b', 'linewidth', 2);hold on;
plot(seqpos,d_CMCT(:,num_analogue), 'r', 'linewidth', 2);hold on;
set(gca, 'FontSize',8);
legend('Unbound',name_ligand,name_analogue);
title('CMCT','FontWeight','Bold','FontSize',15,'Color', 'k');
axis([min(seqpos) max(seqpos) -1 8]);
make_lines_horizontal(-0.5);
make_lines([-23:0,72:92]-0.5, 'k', 0.5, 1, 0);
make_lines([-13:-9,80:84]-0.5,'g',1,1,0);

print_save_figure(gcf, ['5HTP-Analogue [',name_analogue,']'], '', 0);