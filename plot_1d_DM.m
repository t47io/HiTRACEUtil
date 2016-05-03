function plot_1d_DM(seqpos, reactivity, error, labels, color_code, file_name, flg)

if ~exist('color_code','var') || isempty(color_code); 
    color_code = {'k','g','m','c','r','b'}; 
end;
if ~exist('flg','var'); flg = 0; end;

figure; clf;
set_print_page(gcf, 1);
plots = size(reactivity, 2);

for i = 1:plots;
    subplot(plots+1, 1, i);
    errorbar(seqpos, reactivity(:,i), error(:,i), 'Color',color_code{i});
    title(labels{i},'FontWeight','Bold','FontSize',15,'Color', color_code{i});
    axis([100 260 -.5 3]);
    
    make_lines_horizontal(-0.5);
    make_lines([100:125,236:259]-0.5, 'k', 0.5, 1, 0);
    make_lines([111:115, 245:249]-0.5,'y', 1, 1, 0);
end;

subplot(plots+1, 1, plots+1);
errorbar(seqpos, reactivity(:,1), error(:,1), 'Color',color_code{1},'Linewidth',2); hold on;
if ~flg; errorbar(seqpos, reactivity(:,plots-1), error(:,plots-1), 'Color',color_code{plots-1}); hold on; end;
errorbar(seqpos, reactivity(:,plots), error(:,plots), 'Color',color_code{plots}); hold on;
title('Overlay','FontWeight','Bold','FontSize',15,'Color', 'k');
axis([100 260 -.5 3]);

make_lines_horizontal(-0.5);
make_lines([100:125,236:259]-0.5, 'k', 0.5, 1, 0);
make_lines([111:115, 245:249]-0.5,'y', 1, 1, 0);

print_save_figure(gcf, ['1D_', file_name]);
