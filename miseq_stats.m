function [sizes, SNs, sample_ratios] = miseq_stats(inpath, sample_ratios)

if ~exist('inpath', 'var') || isempty(inpath); inpath = './'; end;
if inpath(end) == '/'; inpath = inpath(1:end-1); end;
if ~exist('sample_ratios', 'var') || isempty(sample_ratios); sample_ratios = [1, 1/2, 1/5, 1/10, 1/20, 1/50, 1/100, 1/200, 1/500, 1/1000, 1/2000, 1/5000]; end;

t = tic;
sizes = resample_fastq(inpath, sample_ratios);
SNs = resample_mapseeker(inpath, sample_ratios);

figure();
set_print_page(gcf, 0);

for i = 1:length(sample_ratios);
    dir_name = ['FASTQ_RESAMP_', num2str(i)];

    d = read_rdat_file([dir_name, '/D.rdat']);
    
    subplot(3,4,i);
    sc = 20/mean(mean(d.reactivity(2:end-1, :)));
    image(d.reactivity'*sc); axis image; axis off;
    title(['fraction = {\color{blue}\bf{1/', num2str(1/sample_ratios(i)), '}}; reads =  {\color{red}\bf{', num2str(sizes(i)), '}}; S/N =  {\color[rgb]{0,0.5,0}\bf{', num2str(SNs(i)), '}}'], 'fontsize', 12);
    
end;

fprintf('========================\n');
fprintf(['Total time: ', num2str(toc(t)), ' s.\n']);
fprintf('========================\n');
