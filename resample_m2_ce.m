function resample_m2_ce(area_peak, name_str)

a_round = round(area_peak);
a_seril = [];
for i = 1:length(a_round(:));
    a_seril = [a_seril, repmat(i,1,a_round(i))];
end;

N = length(a_seril);

sample_ratios = [1, 4/5, 2/3, 1/2, 1/3, 1/5, 1/8, 1/10, 1/20, 1/50, 1/100, 1/200];
sizes = zeros(1,length(sample_ratios));

figure();
set_print_page(gcf,0);

for j = 1:length(sample_ratios);
    sizes(j) = round(N*sample_ratios(j));
    idxs{j} = randperm(N, round(N*sample_ratios(j)));
    
    a_temp = a_seril(idxs{j});
    a_samp = zeros(size(a_round));
    for i = 1:length(a_temp);
        x = floor((a_temp(i)-1)/size(a_round,1))+1;
        y = mod((a_temp(i)-1), size(a_round,1))+1;
        a_samp(y,x) = a_samp(y,x)+1;
    end;
    
    sc = 40/mean(a_samp(:));
    
    subplot(3,4,j);
    image( a_samp *sc );
    colormap(1-gray); axis image; axis off;
    title(['fraction = {\color{blue}\bf{1/', num2str(1/sample_ratios(j)), '}}', char(10), ...
        'reads =  {\color{red}\bf{', num2str(sizes(j)), '}}'], 'fontsize', 12);
end;
print_save_figure(gcf, ['resamp_',name_str, '_bin'], './');


figure();
set_print_page(gcf,0);

for j = 1:length(sample_ratios);
    
    a_samp = zeros(size(area_peak));
    for a = 1:size(area_peak,1);
        for b = 1:size(area_peak,2);
            lam = area_peak(a,b) * sample_ratios(j);
            if lam<0; lam=0; end;
            a_samp(a,b) = poissrnd(lam);
        end;
    end;
    
    sc = 40/mean(a_samp(:));
    
    subplot(3,4,j);
    image( a_samp *sc );
    colormap(1-gray); axis image; axis off;
    title(['fraction = {\color{blue}\bf{1/', num2str(1/sample_ratios(j)), '}}', char(10), ...
        'reads =  {\color{red}\bf{', num2str(sum(a_samp(:))), '}}'], 'fontsize', 12);
end;
print_save_figure(gcf, ['resamp_',name_str, '_pss'], './');

