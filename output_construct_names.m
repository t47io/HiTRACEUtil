function output_construct_names( construct_names, construct_name )
keys_file = [construct_name,'_keys.txt'];
fprintf( 'Creating Keys file: %s\n',keys_file);
fid = fopen( keys_file,'w');

for i = 1:length( construct_names )
    fprintf( fid, '%s\n', construct_names{i} );
end

fclose( fid );