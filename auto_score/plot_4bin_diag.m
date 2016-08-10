function counts = plot_4bin_diag(auto_in, manual_in)

counts = zeros(4,4);

for i = 1:length(auto_in);
    idx_i = get_diag_idx(auto_in(i));
    idx_j = get_diag_idx(manual_in(i));
    counts(idx_i, idx_j) = counts(idx_i, idx_j) + 1;
end;

figure();
imagesc(counts'); colormap(1-gray); 
axis image; hold on;
for i = 1:4;
    for j = 1:4;
        text(i,j, num2str(counts(i,j)), 'color', 'r', 'fontsize',20);
    end;
end;
set(gca,'fontsize',16);
set(gca,'xtick',1:4,'xticklabel',{'Fail','Success','Partial','Uncertain'});
set(gca,'ytick',1:4,'yticklabel',{'Fail','Success','Partial','Uncertain'});
xlabel('Prediction','fontsize',16,'fontweight','bold');
ylabel('Standard','fontsize',16,'fontweight','bold');

