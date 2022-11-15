function [coverage_accuracy, avg_interval_length] = ...
    parametric_bootstrap_ES_ss(T, rep, pd, alpha, trueES)

    data_generator = @(T) random(pd, [T, 1]);
    bootfunc = @(data) ES_from_MLE_t(data, alpha);
    [coverage_accuracy, avg_interval_length] = bootstrap_ES_general(... 
        T, rep, trueES, data_generator, bootfunc);

end