function [coverage_accuracy, avg_interval_length] = ...
    parametric_bootstrap_ES_nct_assume_nct(T, rep, df, mu, loc, scale, alpha, trueES)

    B = 250; 
    CIs = zeros(rep, 2);
    for i = 1:rep
        data = nct_rnd_simulate(df, mu, loc, scale, T, 1);
        % mle
        param = nctlikmax(data, [df, mu, loc, scale]);
        df_mle=param(1); mu_mle= param(2); loc_mle=param(3); scale_mle=param(4);
        % simulate data based on fitted mle
        simulated_data = nct_rnd_simulate(df_mle, mu_mle, loc_mle, scale_mle, B, T);
        % fit mle based on simulated data
        ES_vec = zeros(B, 1);
        parfor j = 1:B
            tmp = nctlikmax(simulated_data(j, :), [df, mu, loc, scale]);
            df_mle1 = tmp(1);
            mu_mle1 = tmp(2);
            loc_mle1 = tmp(3);
            scale_mle1 = tmp(4);
            ES_vec(j) = theoretical_ES_NCT_from_simulation( ...
                df_mle1, mu_mle1, loc_mle1, scale_mle1, alpha, 1e5); 
        end
        ci = quantile(ES_vec, [0.05, 0.95]);
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