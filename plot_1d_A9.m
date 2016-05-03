function plot_1d_A9 ( d, d_err, colors, labels, cap, file_name)

sub = 212;

figure();
set_print_page(gcf,1);

for j = 1:6
    subplot(6,1,j);
    for i = 1: size(d,2)
        range = (j-1)*sub+1:min(j*sub,size(d,1));
        if i == 1;
            c_flag = colors{i};
            w_flag = 1;
        else
            c_flag = 'none';
            w_flag = 0.5;
        end;
        plot(range,d(range,i),'-o','color',colors{i},'linewidth',w_flag,'markersize',3, 'markerfacecolor',c_flag); hold on;
    end;
    axis([min(range) max(max(range),j*sub) 0 min(max(max(d)),10)]);
    set(gca,'xgrid','on');
    legend(labels,'Location','EastOutside');
    if exist('d_err','var') && ~isempty(d_err);
        for i = 1:size(d_err,2)
            range = (j-1)*sub+1:min(j*sub,size(d,1));
            if i == 1;
                c_flag = colors{i};
                w_flag = 1;
            else
                c_flag = 'none';
                w_flag = 0.5;
            end;
            errorbar(range,d(range,i),d_err(range,i),'-o','color',colors{i},'linestyle','none'); hold on;
        end;
    end;
end;
subplot(6,1,1);
title(cap);
print_save_figure(gcf,file_name);

