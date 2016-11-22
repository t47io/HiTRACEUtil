function plot_4bin_pred_table(auto_is, auto_iv, manual_is, manual_iv, caption, groups, labels, defaults)

figure(); set_print_page(gcf,1); hold on;
idx_h = 0;
idx_l = 0;
for i = 1:length(groups);
    idx_l = idx_l + 1;
%     if sum(i == [1,20,31,33,35,37,39,43,47]) == 1; idx_l = idx_l + 1; end;
    for j = 1:groups(i);
        idx_h = idx_h + 1;
        plot(j*0.1, idx_l, 'o', 'color',get_icon_color(defaults(idx_h)), 'markerfacecolor',get_icon_color(defaults(idx_h)));
        plot(1+j*0.1, idx_l, 'o', 'color',get_icon_color(manual_iv(idx_h)), 'markerfacecolor',get_icon_color(manual_iv(idx_h)));
        plot(2+j*0.1, idx_l, 'o', 'color',get_icon_color(auto_iv(idx_h)), 'markerfacecolor',get_icon_color(auto_iv(idx_h)));
        plot(3+j*0.1, idx_l, 'o', 'color',get_icon_color(manual_is(idx_h)), 'markerfacecolor',get_icon_color(manual_is(idx_h)));
        plot(4+j*0.1, idx_l, 'o', 'color',get_icon_color(auto_is(idx_h)), 'markerfacecolor',get_icon_color(auto_is(idx_h)));
    end;
end;
axis([0 5 0 length(groups)+1]);
set(gca,'ydir','reverse','fontsize',16);
set(gca,'ytick', 1:length(labels), 'yticklabel',labels);
set(gca,'xtick', 0.5:4.5, 'xticklabel', {'expected','manual in vitro', 'auto in vitro', 'manual in silico', 'auto in silico'});
make_lines([0:5]-0.5,'k');
make_lines([1,3]-0.5,'k',2);
% make_lines_horizontal([1,21,33,39,45,55]-0.5,'k');
title(caption, 'fontsize',20,'fontweight','bold');



function clr = get_icon_color(val)

if val == 0;
    clr = [1 0.32 0.17];
elseif val == 1;
    clr = [0.62 0.78 0.02];
elseif val == 0.5;
    clr = [0.73 0.72 0.77];
elseif val == 0.7;
    clr = [1 0.76 0.03];
end;


