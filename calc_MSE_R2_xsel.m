function calc_MSE_R2_xsel(xsel_x, xsel_y, xsel_ref, E, file_name)

if length(xsel_x) ~= length(xsel_ref); return; end;
if length(xsel_y) ~= length(xsel_ref); return; end;

MSE_x = sum((xsel_x - xsel_ref) .^2)/ length(xsel_ref);
MSE_y = sum((xsel_y - xsel_ref) .^2)/ length(xsel_ref);

temp = corrcoef(xsel_x, xsel_ref); R2_x = temp(2);
temp = corrcoef(xsel_y, xsel_ref); R2_y = temp(2);

% fprintf(['mean squared error = ',num2str(MSE),'.\n']);
% fprintf(['Pearson''s correlation coefficient = ',num2str(R2),'.\n']);

figure();
set_print_page(gcf,0);
set(gcf,'PaperPosition', [1 2 11 2.25]);
plot(abs(xsel_x - xsel_ref),'o-','markersize',3); hold on;
plot(abs(xsel_y - xsel_ref),'ro-','markersize',3);
plot([1, length(xsel_ref)],[20,20],'k:');
legend(...
    ['x: MSE(',sprintf('%1.1E',MSE_x),'), R2(',sprintf('%1.4f',R2_x),')'],...
    ['y: MSE(',sprintf('%1.1E',MSE_y),'), R2(',sprintf('%1.4f',R2_y),'), E(',sprintf('%1.4f',E),')']);
print_save_figure(gcf,file_name,'/Users/t47/Desktop/');
