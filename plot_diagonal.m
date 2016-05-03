function plot_diagonal(D, clr, lbl)

% PLOT_DIAGONAL(D, color_table, labels)
% plot diagonal fractions of MiSeq RAW counts
% sum counts of each diagonal (cDNA fragament length low to high)
% plot both fraction and cumulated sums of fraction

if ~exist('clr','var') || isempty(clr); clr = {'b','g','r','c','m','y','k'}; end;
if ~exist('lbl','var') || isempty(lbl); lbl = ''; end;

if ~iscell(D);
    plot_diagonal_each(D, clr)
else
    for x = 1:length(D);
        plot_diagonal_each(D{x}, clr{mod(x - 1, length(clr)) + 1});
    end;
end;

set_print_page(gcf, 0);
subplot(2,1,1);
title('Fraction distribution','fontweight','bold','fontsize',15);
xlabel('Fragment length');
ylabel('Fraction of total counts');
if ~isempty(lbl); legend(lbl); end;
subplot(2,1,2);
title('Cumulated fraction','fontweight','bold','fontsize',15);
xlabel('Fragment length');
ylabel('Cumulated fraction of total counts');
if ~isempty(lbl); legend(lbl); end;


function plot_diagonal_each(D, clr)
    
D = D(1:min(size(D)), 1:min(size(D)));

if all(all(tril(D) == 0)); D = D'; end;

dg = zeros(1, length(D));
for i = 1:length(D)
	dg(i) = sum(diag(D, 1 - i));
end;

if iscell(clr); clr = clr{1}; end;
subplot(2,1,1);
plot(dg ./ sum(dg), 'color', clr);
hold on;
subplot(2,1,2);
plot(cumsum(dg) ./ sum(dg), 'color', clr);
hold on;
