function sc = score_ratio_4bin_weighted(d_dist, THETA, A, B)

if ~exist('THETA','var') || isempty(THETA); THETA = 0.1; end;
if ~exist('A','var') || isempty(A); A = 0.4; end;
if ~exist('B','var') || isempty(B); B = 0.7; end;

% 1-yes; 0-no; 0.5-uncertain; 0.7-partial
dist_perturb = max(d_dist(2), d_dist(3));
if dist_perturb <= THETA;
    sc = 0.5;
else
    ratio = d_dist(1) / dist_perturb;
    if ratio < A;
        sc = 1;
    elseif ratio > B;
        sc = 0;
    else
        sc = 0.7;
    end;
end;
