function print_quartet( d_align, wt_index, mutant_index, num_quartet, scale_factor, labels)

if ~exist('wt_index','var') || isempty(wt_index); wt_index = 1; end;
if ~exist('num_quartet','var') || isempty(num_quartet); num_quartet = size(mutant_index,1); end;
if ~exist('scale_factor','var') || isempty(scale_factor); scale_factor = 50; end;
if ~exist('labels','var') || isempty(labels); labels = repmat({' '},1, size(d_align,2)); end;

figure();
set_print_page(gcf,0);

for i = 1:num_quartet
    subplot(1, num_quartet, i);
    if i <= size(mutant_index,1);
        image(d_align(:, [wt_index, mutant_index(i,:)]) * scale_factor);
        colormap(1-gray());
        set(gca, 'fontsize',9,'fontweight','bold','ycolor','k');
        set(gca,'yticklabel',{'3''','5'''},'ytick',[1,size(d_align,1)]);
        make_lines(1:3,'k',0.5);
        set(gca,'Xtick',1:(size(mutant_index,2)+1),'XTickLabel',labels([wt_index, mutant_index(i,:)]));
        xticklabel_rotate;
    end;
end;
