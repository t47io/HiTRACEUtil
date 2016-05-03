function sizes = resample_fastq(inpath, sample_ratios)

if inpath(end) == '/'; inpath = inpath(1:end-1); end;
if ~exist('sample_ratios', 'var') || isempty(sample_ratios); sample_ratios = [1, 1/2, 1/5, 1/10, 1/20, 1/50]; end;

fastqs = dir( [inpath, '/*.fastq'] );
if isempty( fastqs ); fprintf( 'Could not find FASTQ files! \n' ); return; end;
if length( fastqs ) > 2;
    fprintf( '%s\n,More than two fastq files -- not sure what to do! \n',pwd()); return;
end;

fprintf('Loading FASTQ data #1...\n');
tic;
fq1 = fastqread(fastqs(1).name);
toc;

N = length(fq1);
idx = cell(1, length(sample_ratios));
sizes = zeros(1,length(sample_ratios));

for i = 1:length(sample_ratios);
    dir_name = ['FASTQ_RESAMP_', num2str(i)];
    if ~exist(dir_name, 'dir'); mkdir(dir_name); end;
    
    sizes(i) = round(N*sample_ratios(i));
    idx{i} = randperm(N, round(N*sample_ratios(i)));

    fprintf(['Writing resampled FASTQ #1 for No.', num2str(i), '...\n']);
    tic;    
    fastqwrite([dir_name, '/RESAMP_R1.fastq'] , fq1(idx{i}));
    toc;
end;

fprintf('Unloading FASTQ data #1...\n');
tic;
clear fq1;
toc;

fprintf('========================\n');
fprintf('Loading FASTQ data #2...\n');
tic;
fq2 = fastqread(fastqs(2).name);
toc;

for i = 1:length(sample_ratios);
    dir_name = ['FASTQ_RESAMP_', num2str(i)];
    
    fprintf(['Writing resampled FASTQ #2 for No.', num2str(i), '...\n']);
    tic;    
    fastqwrite([dir_name, '/RESAMP_R2.fastq'] , fq2(idx{i}));
    toc;
end;

fprintf('Unloading FASTQ data #2...\n');
tic;
clear fq2;
toc;
fprintf('========================\n');
