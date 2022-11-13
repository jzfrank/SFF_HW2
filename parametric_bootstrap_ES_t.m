function [coverage_accuracy, avg_interval_length] = ...
    parametric_bootstrap_ES_t(T, rep, loc, scale, df, alpha, trueES)

    data_generator = @(T) loc + scale * trnd(df, T, 1);
    bootfunc = @(data) ES_from_MLE_t(data, alpha);
    [coverage_accuracy, avg_interval_length] = bootstrap_ES_general(... 
        T, rep, trueES, data_generator, bootfunc);

end