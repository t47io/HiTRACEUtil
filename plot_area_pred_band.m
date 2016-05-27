function plot_area_pred_band (bpp, ac_pair, dim, file_name)

figure(); hold on;
set(gcf,'Position',[100, 0, 600, 600]);
set(gcf, 'PaperOrientation', 'landscape', 'PaperPositionMode', 'auto', 'color', 'white');
set(gca,'fontsize',14);
set(gca, 'ydir', 'reverse');
grid on; axis equal;

for j = 1:length(ac_pair);
    area_pred = triu(ac_pair{j}{1},1) + tril(ac_pair{j}{1},-1);
    
    if length(ac_pair{j}) > 1;
        clr = ac_pair{j}{2};
        area_pred = sum(area_pred);
        for i = 1:length(area_pred)
            if area_pred(i) > 0;
                rectangle('position', [0 i dim 1], 'FaceColor',clr, 'EdgeColor','none');
                rectangle('position', [i 0 1 dim], 'FaceColor',clr, 'EdgeColor','none');
            end;
        end;
    end;
end;

for i = 100:102;
    rectangle('position', [0 i dim 1], 'FaceColor',[1, 0.36, 0.17], 'EdgeColor','none');
    rectangle('position', [i 0 1 dim], 'FaceColor',[1, 0.36, 0.17], 'EdgeColor','none');
end;
for i = 108:110;
    rectangle('position', [0 i dim 1], 'FaceColor',[0.16, 0.75, 0.57], 'EdgeColor','none');
    rectangle('position', [i 0 1 dim], 'FaceColor',[0.16, 0.75, 0.57], 'EdgeColor','none');
end;

image(bpp*100);colormap(1-gray()); hold on;
plot(0:128,0:128,'k');
axis([0 128 0 128]);
alpha 0.7;

print_save_figure(gcf, file_name);