function  [D_norm, D_norm_err] = apply_boxplot_normalization( D, D_err, fid )

D_norm = D;
D_norm_err = D_err;

for i = 1:length( D )
    [~, scalefactors] = mapseeker_boxplot_normalize( D{i} );
    scalefactors = scalefactors( find( scalefactors ) > 0 );
    scalefactor = median( scalefactors  );
    print_it( fid, sprintf(  'Boxplot-based normalization: following reactivity is rescaled to unity for primer %d: %10.6f\n', i,  scalefactor ) );
    if ~isnan( scalefactor ) & scalefactor > 0
        D_norm{i} = D{i} / scalefactor;
        D_norm_err{i} = D_err{i} / scalefactor;
    end
end
