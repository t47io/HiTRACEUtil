function ele_fig_output(d,index,labels,sc,fn,ln)

figure;
set_print_page(gcf,1);
image(d(:,index)*sc);
colormap(1-gray());
set(gca, 'XTick', 1:length(index), 'XTickLabel', labels);
xticklabel_rotate;
axis off;
make_lines_horizontal([400,1790],'r',2);
make_lines;
make_lines(ln,'b');
print_save_figure(gcf,fn);
