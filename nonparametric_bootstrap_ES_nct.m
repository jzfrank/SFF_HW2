function [coverage_accuracy, avg_interval_length] = ...
    nonparametric_bootstrap_ES_nct(T, rep, df, mu, loc, scale, alpha, trueES)

    data_generator = @(T) nct_rnd_simulate(df, mu, loc, scale, T, 1);
    bootfunc = @(data) empirical_ES(data, alpha);
    [coverage_accuracy, avg_interval_length] = bootstrap_ES_general(... 
        T, rep, trueES, data_generator, bootfunc);
    
end