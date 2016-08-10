function output = mutate_pair(input)

if strcmp(input, 'AU') || strcmp(input, 'GC') || strcmp(input, 'GU');
    output = 'CG';
elseif strcmp(input, 'UA') || strcmp(input, 'CG') || strcmp(input, 'UG');
    output = 'GC';
end;
