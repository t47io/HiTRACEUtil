function stats = calc_roc(ans_pred, ans_gold)

tp = 0;
fp = 0;
tn = 0;
fn = 0;

for i = 1:length(ans_pred);
    if ans_pred(i)== 0 && ans_gold(i) == 0;
        tn = tn + 1;
    elseif ans_pred(i) == 0 && ans_gold(i) == 1;
        fn = fn + 1;
    elseif ans_pred(i) == 1 && ans_gold(i) == 0;
        fp = fp + 1;
    elseif ans_pred(i) == 1 && ans_gold(i) == 1;
        tp = tp + 1;
    end;
end;

stats = [tp fp tn fn] / length(ans_pred);
