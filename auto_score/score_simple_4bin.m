function sc = score_simple_4bin(d_dist, THRESHOLD, PARTIAL)

if ~exist('THRESHOLD','var') || isempty(THRESHOLD); THRESHOLD = 0.1; end;
if ~exist('PARTIAL','var') || isempty(PARTIAL); PARTIAL = 0.2; end;


% 1-yes; 0-no; 0.5-uncertain; 0.7-partial
if d_dist(1) > THRESHOLD;
    if d_dist(1) >= PARTIAL;
        sc = 0;
    else
        sc = 0.7;
    end;
else
    if max(d_dist(2), d_dist(3)) < d_dist(1);
        sc = 0.5;
    else
        sc = 1;
    end;
end;
