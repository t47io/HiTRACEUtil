function bpps = get_mutant_bpp(muts, seq_WT, flag, SHAPE, EX)
if ~exist('flag','var') || isempty( flag ); flag = 1; end;
if ~exist('SHAPE','var'); SHAPE = []; end;
if ~exist('EX','var'); EX = []; end;

N = length(muts);
seqs = repmat({seq_WT}, 1, N);
bpps = repmat({[]}, 1, N);

for i = 1:N;
    temp = strsplit(muts{i}(6:end), ';');
    if strcmp(temp{1}, 'WT');
        continue;
    end;
    
    for j = 1:length(temp);
        nt_WT = strrep(temp{j}(1),'T','U');
        nt_mut = strrep(temp{j}(end),'T','U');
        nt_pos = str2num(temp{j}(2:end-1));
        if seqs{i}(nt_pos) == nt_WT;
            seqs{i} = [seqs{i}(1:nt_pos-1), nt_mut, seqs{i}(nt_pos+1:end)];
        else;
            fprintf('Mismatch of nucleotide %d: should be %s instead of %s in %s.\n', nt_pos, seq_WT(nt_pos), nt_WT, temp{j});
            pause;
        end;
    end;
end;

if flag;
    parfor i = 1:N;
        bpps{i} = run_rnastructure_partition(seqs{i}, SHAPE, EX);
        fprintf('Finished %d / %d ...', i, N);
    end;
else;
    parfor i = 1:N;
        bpps{i} = run_rnastructure_allsub(seqs{i});
        fprintf('Finished %d / %d ...', i, N);
    end;
end;
