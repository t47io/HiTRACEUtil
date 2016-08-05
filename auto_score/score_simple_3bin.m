function sc = simple_score_3bin(d_dist, THRESHOLD)

if ~exist('THRESHOLD','var') || isempty(THRESHOLD); THRESHOLD = 0.1; end;

% 1-yes; 0-no; 0.5-uncertain
if d_dist(1) > THRESHOLD;
    sc = 0;
else
    if max(d_dist(2), d_dist(3)) < d_dist(1);
        sc = 0.5;
    else
        sc = 1;
    end;
end;
