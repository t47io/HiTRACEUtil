function [mdf_prjcs, mdf_rates] = reactivity_projection(D, Noffset)

mdf_rates = zeros(1, length(D));
mdf_prjcs = zeros(size(D{1},1), length(D));
for j = 1:length(D)
    
    Dsub = D{j};
    for i = 1:size(Dsub,1)
        mdf_prjcs(i,j) = mean(Dsub(i,i+Noffset+1:end));
    end;

end;