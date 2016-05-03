function resample_plot(sizes, SNs, sample_ratios)

figure();
set_print_page(gcf, 0);

for i = 1:length(sample_ratios);
    dir_name = ['FASTQ_RESAMP_', num2str(i)];

    d = read_rdat_file([dir_name, '/D.rdat']);
    sc = 10/mean(mean(d.reactivity(2:end-1, :)));
    
    subplot(3,4,i);
    image(d.reactivity'*sc); 
    axis image; axis off;
    colormap(1-gray);
    title(['fraction = {\color{blue}\bf{1/', num2str(1/sample_ratios(i)), '}}', char(10), ...
        'reads =  {\color{red}\bf{', num2str(sizes(i)), '}};',char(10), ...
        'S/N =  {\color[rgb]{0,0.5,0}\bf{', num2str(SNs(i)), '}}'], 'fontsize', 12);
    
end;
print_save_figure(gcf, 'all', './');