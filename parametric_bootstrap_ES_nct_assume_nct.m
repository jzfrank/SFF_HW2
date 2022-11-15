function [coverage_accuracy, avg_interval_length] = ...
    parametric_bootstrap_ES_nct_assume_nct(T, rep, df, mu, loc, scale, alpha, trueES)


%     method 2
    B = 250; 
    CIs = zeros(rep, 2);
    parfor i = 1:rep
        data = nct_rnd_simulate(df, mu, loc, scale, T, 1);
        param = nctlikmax(data, [4, -2, 1, 2]);
        df1=param(1); mu1= param(2); loc1=param(3); scale1=param(4);
        simulated_data = nct_rnd_simulate(df1, mu1, loc1, scale1, B, T);
        left_quantile = quantile(simulated_data, alpha, 2);
        ind = (simulated_data < left_quantile);
        ES_vec = mean(simulated_data(ind), 2);
        ci = quantile(ES_vec, [0.05, 0.95]);
        % using quantile for ci: 
        % https://www.sciencedirect.com/topics/mathematics/bootstrap-confidence-interval
        CIs(i, :) = ci;
    end
    coverage_accuracy = mean( (CIs(:, 1) <= trueES) & (CIs(:, 2) >= trueES));
    avg_interval_length = mean(CIs(:, 2) - CIs(:, 1));


%     method 1
%     data_generator = @(T) nct_rnd_simulate(df, mu, loc, scale, T, 1);
%     bootfunc = @(data) ES_from_MLE_nct(data, alpha, df, mu, loc, scale);
%     [coverage_accuracy, avg_interval_length] = bootstrap_ES_general(... 
%         T, rep, trueES, data_generator, bootfunc);

end 