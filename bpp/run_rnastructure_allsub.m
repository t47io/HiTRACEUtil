function bpp = run_rnastructure_allsub(sequence)
kT = 0.5905;

uuid = char(floor(26*rand(1, 4)) + 65);

fid = fopen(['tmp_', uuid, '.seq'], 'w');
fprintf(fid, ';\ntmp seq\n');
fprintf(fid, [sequence, '1']);
fclose(fid);

CMD = [get_exe_dir(), 'allsub tmp_', uuid, '.seq tmp_', uuid, '.ct'];
system(CMD);
CMD = [get_exe_dir(), 'efn2 tmp_', uuid, '.ct tmp_', uuid, '.eng'];
system(CMD);

lines = strsplit(fileread(['tmp_', uuid, '.eng']),'\n');
N = length(lines) - 1;
fprintf('%d structures to weigh in ensemble...\n', N);

% CMD = [get_exe_dir(), 'EnsembleEnergy tmp_', uuid, '.seq --sequence > tmp_', uuid, '.txt'];
% system(CMD);
% lines = strsplit(fileread(['tmp_', uuid, '.txt']),'\n');
% eng_ensemble = str2double(strrep(strrep(lines{4}, ['Ensemble energy for tmp_', uuid, '.seq:'], ''), 'kcal/mol', ''));

bpp = zeros(length(sequence), length(sequence));
bpps = repmat({bpp}, 1, N);
weights = zeros(1, N);
for i = 1:N;
    CMD = [get_exe_dir(), 'ct2dot tmp_', uuid, '.ct ', num2str(i), ' this_', uuid, '.dot >> /dev/null'];
    system(CMD);
    CMD = [get_exe_dir(), 'dot2ct this_', uuid, '.dot this_', uuid, '.ct >> /dev/null'];
    system(CMD);
    
    fid = fopen(['this_', uuid, '.ct'], 'r');
    line = strsplit(fgets(fid),' ');
    eng = str2double(line{5});
    
    while ~feof(fid);
        line = strsplit(fgets(fid),' ');
        a = str2num(line{2});
        b = str2num(line{6});
        if b ~= 0;
            bpps{i}(a, b) = 1;
            bpps{i}(b, a) = 1;
        end;
    end;
    fclose(fid);
    weights(i) = exp(-eng / kT);
end;

weight_total = sum(weights);
for i = 1:N;
    bpp = bpp + bpps{i} * weights(i) / weight_total;
end;

system(['rm tmp_', uuid, '.* this_', uuid, '.*']);
