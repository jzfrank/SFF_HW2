function [coverage_accuracy, avg_interval_length] = ...
    parametric_bootstrap_ES_nct_assume_nct(T, rep, df, mu, loc, scale, alpha, trueES)

    data_generator = @(T) nct_rnd_simulate(df, mu, loc, scale, T, 1);
    bootfunc = @(data) ES_from_MLE_nct(data, alpha, df, mu, loc, scale);
    [coverage_accuracy, avg_interval_length] = bootstrap_ES_general(... 
        T, rep, trueES, data_generator, bootfunc);

end 