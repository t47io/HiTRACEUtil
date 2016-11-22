function counts = plot_3bin_diag(auto_in, manual_in)

counts = zeros(4,4);

for i = 1:length(auto_in);
    idx_i = get_diag_idx(auto_in(i));
    idx_j = get_diag_idx(manual_in(i));
    counts(idx_i, idx_j) = counts(idx_i, idx_j) + 1;
end;
counts = counts([1,2,4],[1,2,4]);

figure();
imagesc(counts'); colormap(1-gray); 
axis image; hold on;
for i = 1:3;
    for j = 1:3;
        text(i,j, num2str(counts(i,j)), 'color', 'r', 'fontsize',20);
    end;
end;
set(gca,'fontsize',16);
set(gca,'xtick',1:3,'xticklabel',{'Fail','Success','Uncertain'});
set(gca,'ytick',1:3,'yticklabel',{'Fail','Success','Uncertain'});
xlabel('Prediction','fontsize',16,'fontweight','bold');
ylabel('Standard','fontsize',16,'fontweight','bold');

