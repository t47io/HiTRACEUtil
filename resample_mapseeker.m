function SNs = resample_mapseeker(inpath, sample_ratios)

if inpath(end) == '/'; inpath = inpath(1:end-1); end;
if ~exist('sample_ratios', 'var') || isempty(sample_ratios); sample_ratios = [1, 1/2, 1/5, 1/10, 1/20, 1/50]; end;

SNs = zeros(1, length(sample_ratios));

for i = 1:length(sample_ratios);
    dir_name = ['FASTQ_RESAMP_', num2str(i)];
    if exist('./MOHCA.fasta', 'file');
        copyfile( 'MOHCA.fasta', [dir_name, '/MOHCA.fasta']);
    end;
    if exist('./primers.fasta', 'file');
        copyfile( 'primers.fasta', [dir_name, '/primers.fasta']);
    end;
    if exist('./RNA_sequences.fasta', 'file');
        copyfile( 'RNA_sequences.fasta', [dir_name, '/RNA_sequences.fasta']);
    end;
    cd(dir_name);
    
    [ D, D_err, RNA_info, primer_info, D_raw, D_ref, D_ref_err, RNA_info_ref, prjc_clvg, prjc_mdf ] = quick_look_MAPseeker( [], [], [], [], {'-A', 'output_raw_rdat'} );
    close all;
    SNs(i) = estimate_signal_to_noise_ratio( D{1}, D_err{1} );
    
    if exist('MOHCA.fasta', 'file');
        delete( 'MOHCA.fasta');
    end;
    if exist('primers.fasta', 'file');
        delete( 'primers.fasta');
    end;
    if exist('RNA_sequences.fasta', 'file');
        delete( 'RNA_sequences.fasta');
    end;
    delete( 'RESAMP_R1.fastq');
    delete( 'RESAMP_R2.fastq');
    if exist(['FASTQ_RESAMP_', num2str(i), '.1.rdat'], 'file');
        movefile( ['FASTQ_RESAMP_', num2str(i), '.1.rdat'], 'D.rdat');
    end;
    if exist(['FASTQ_RESAMP_', num2str(i), '.2.rdat'], 'file');
        movefile( ['FASTQ_RESAMP_', num2str(i), '.2.rdat'], 'D_2.rdat');
    end;
    if exist(['FASTQ_RESAMP_', num2str(i), '.RAW.1.rdat'], 'file');
        movefile( ['FASTQ_RESAMP_', num2str(i), '.RAW.1.rdat'], 'D_raw.rdat');
    end;    
    if exist(['FASTQ_RESAMP_', num2str(i), '.RAW.2.rdat'], 'file');
        movefile( ['FASTQ_RESAMP_', num2str(i), '.RAW.2.rdat'], 'D_raw_2.rdat');
    end;    
    
    cd ..;
end;
