function print_add_2D_bg(area_norm, i, ligand, labels, seqpos, sequence, offset)

figure(); set_print_page(gcf, 1);
rectangle('Position',[0 3-0.5 130 7], 'FaceColor',[0.76,0.56,0.87], 'EdgeColor','none');hold on;
rectangle('Position',[0 63-0.5 130 7], 'FaceColor',[0.76,0.56,0.87], 'EdgeColor','none');hold on;
rectangle('Position',[0 100-0.5 130 11], 'FaceColor',[0.76,0.56,0.87], 'EdgeColor','none');hold on;
rectangle('Position',[0 13-0.5 130 6], 'FaceColor',[1,0.57,0.18], 'EdgeColor','none');hold on;
rectangle('Position',[0 28-0.5 130 6], 'FaceColor',[1,0.57,0.18], 'EdgeColor','none');hold on;
rectangle('Position',[0 42-0.5 130 6], 'FaceColor',[0.24,0.83,0.91], 'EdgeColor','none');hold on;
rectangle('Position',[0 55-0.5 130 6], 'FaceColor',[0.24,0.83,0.91], 'EdgeColor','none');hold on;
rectangle('Position',[0 77-0.5 130 6], 'FaceColor',[0.93,0.7,0.07], 'EdgeColor','none');hold on;
rectangle('Position',[0 93-0.5 130 6], 'FaceColor',[0.93,0.7,0.07], 'EdgeColor','none');hold on;
rectangle('Position',[0 100-0.5 130 3], 'FaceColor',[0.16, 0.75, 0.57], 'EdgeColor','none');hold on;
rectangle('Position',[0 108-0.5 130 3], 'FaceColor',[0.16, 0.75, 0.57], 'EdgeColor','none');hold on;
if i ~= 0; rectangle('Position',[0 i-0.5 130 1], 'FaceColor',[1, 0.36, 0.17], 'EdgeColor','none');hold on; end;

scale_fc = 50 / mean(mean(area_norm));
if length(seqpos) == size(area_norm, 1) + 1; seqpos = seqpos(2:end); end;

image(1:length(labels),seqpos, area_norm * scale_fc); colormap(1-gray);
set(gca,'ytick', -20:10:150, 'ydir', 'normal'); hold on;
axis([0 129 -25 152]); axis image;
make_lines_horizontal([0, 128], [0.33,0.59,0.84], 1.5);
alpha 0.7;

if i ~= 0; mut = [complement(sequence(i-offset)), num2str(i), sequence(i-offset)]; else; mut = 'WT'; end;
title(['add140 ', mut, ' (', ligand, ')-ligand'], 'fontsize',20, 'fontweight', 'bold');
if ligand == '-'; lig = 'no'; else; lig = ''; end;
print_save_figure(gcf, ['2D_', mut, '-', lig, 'lig']);
