function Z = Zscore_from_D_rx (D, Noffset, MEAN_EXPOSURE_CUTOFF, APPLY_ZSCORE_OFFSET, ZSCORE_OFFSET, ONLY_A_C)

if ~exist( 'MEAN_EXPOSURE_CUTOFF','var' ); MEAN_EXPOSURE_CUTOFF = 1.0; end;
if ~exist( 'APPLY_ZSCORE_OFFSET','var' ); APPLY_ZSCORE_OFFSET = 1; end;
if ~exist( 'ZSCORE_OFFSET','var' ); ZSCORE_OFFSET = 0.0; end;
if ~exist( 'ONLY_A_C','var' ); ONLY_A_C = 0; end;

Z = zeros(size(D));
normbins = [ 10: size( D,1)-10 ];
D_norm = quick_norm( D, normbins );

mean_exposure = zeros(1,size(D_norm,1));
for i = 1:min(size(D_norm))-Noffset
    row_temp = D_norm(i, min(i+Noffset,size(D_norm,2)):end);
    Z_temp = (row_temp - mean(row_temp) )/ std(row_temp,0,2);
    Z(i,:) =  [zeros(1,i+Noffset-1),Z_temp,zeros(1,size(D,2)+1-i-Noffset-length(Z_temp))];
    mean_exposure(i) = mean( row_temp );
end

% Don't include rows that have uniformly high chemical modification --
% mutate/map looks for 'release' of protected residues.
 for i = 1:size( D_norm, 1 )
     if ( mean_exposure(i) > MEAN_EXPOSURE_CUTOFF  )
         Z(i,:) = 0.0;
     end
 end

if ( ONLY_A_C )
    for i = 1:size( D_norm, 1 )
        seqchar =   d.sequence( d.seqpos( i ) - d.offset );
        if ( seqchar ~='A' && seqchar ~='C' )
            Z(i,:) = 0.0;
        end
    end
end

% Filter to make sure Z-score is above some cutoff.
if APPLY_ZSCORE_OFFSET`
    Z = max( ( Z - ZSCORE_OFFSET ), 0.0 );
end

Z = Z(1:min(size(D_norm)),1:min(size(D_norm)));
