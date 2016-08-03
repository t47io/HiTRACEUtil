function bpp = run_rnastructure_partition(sequence, SHAPE, EX)
if ~exist('SHAPE','var'); SHAPE = []; end;
if ~exist('EX','var'); EX = []; end;
uuid = char(floor(26*rand(1, 4)) + 65);

fid = fopen(['tmp_', uuid, '.seq'], 'w');
fprintf(fid, ';\ntmp seq\n');
fprintf(fid, [sequence, '1']);
fclose(fid);

CMD = [get_exe_dir(), 'partition tmp_', uuid, '.seq tmp_', uuid, '.pfs'];
if ~isempty(SHAPE);
    fid = fopen(['tmp_', uuid, '.shape'], 'w');
    for i = 1:length(SHAPE);
        if isnan(SHAPE(i)); SHAPE(i) = -999; end;
        fprintf(fid, '%d %9.4f\n', i, SHAPE(i));
    end;
    fclose(fid);
    CMD = [CMD, ' -sh tmp_', uuid, '.shape'];
end;
if ~isempty(EX);
    save(['tmp_', uuid, '.ex'], 'EX', '-ascii');
    CMD = [CMD, ' -x tmp_', uuid, '.ex'];
end;    
system(CMD);
CMD = [get_exe_dir(), 'ProbabilityPlot tmp_', uuid, '.pfs tmp_', uuid, '.txt -t'];
system(CMD);

fid = fopen(['tmp_', uuid, '.txt'], 'r');
N = str2num(fgets(fid));
bpp = zeros(N, N);

fgets(fid);
this = fgets(fid);
while this ~= -1;
    [i, this] = strtok(this, char(9));
    [j, this] = strtok(this, char(9));
    i = str2num(i);
    j = str2num(j);
    val = 10^(-str2num(this));
    bpp(i, j) = val;
    bpp(j, i) = val;
    
    this = fgets(fid);
end;

fclose(fid);
system(['rm tmp_', uuid, '.*']);
