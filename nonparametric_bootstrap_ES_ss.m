function [coverage_accuracy, avg_interval_length] = ...
    nonparametric_bootstrap_ES_ss(T, rep, pd, alpha, trueES)
    B = 500;
    captures_trueES_cnt = 0;
    interval_length = 0;
    parfor i = 1:rep
        data = random(pd, [T, 1]);
        ci = bootci(B, {@(data) empirical_ES(data, alpha), data},...
            'Alpha', 0.1);
        lower = ci(1);
        upper = ci(2);
        
        if (lower < trueES) && (trueES < upper)
            captures_trueES_cnt = captures_trueES_cnt + 1;
        end
        interval_length = interval_length + (upper - lower);
    end
    coverage_accuracy = captures_trueES_cnt / rep;
    avg_interval_length = interval_length / rep;
end