function [coverage_accuracy, avg_interval_length] = ...
    parametric_bootstrap_ES_t(T, rep, loc, scale, df, alpha, trueES)
    
    B = 250; 
    CIs = zeros(rep, 2);
    for i = 1:rep
        data = loc + scale * trnd(df, T, 1);
        % mle
        tmp = tlikmax(data, [df, loc, scale]);
        df_mle = tmp(1);
        loc_mle = tmp(2);
        scale_mle = tmp(3);
        % simulate data based on fitted mle
        simulated_data = loc_mle + scale_mle * trnd(df_mle, B, T);
        % fit mle based on simulated data
        ES_vec = zeros(B, 1);
        parfor j = 1:B
            tmp = tlikmax(simulated_data(j, :), [df, loc, scale]);
            df_mle1 = tmp(1);
            loc_mle1 = tmp(2);
            scale_mle1 = tmp(3);
            ES_vec(j) = theoretical_ES_t(loc_mle1, scale_mle1, df_mle1, alpha);
        end
        ci = quantile(ES_vec, [0.05, 0.95]);
        CIs(i, :) = ci;
    end
    coverage_accuracy = mean( (CIs(:, 1) <= trueES) & (CIs(:, 2) >= trueES));
    avg_interval_length = mean(CIs(:, 2) - CIs(:, 1));

    
    
%     data_generator = @(T) loc + scale * trnd(df, T, 1);
%     bootfunc = @(data) ES_from_MLE_t(data, alpha);
%     [coverage_accuracy, avg_interval_length] = bootstrap_ES_general(... 
%         T, rep, trueES, data_generator, bootfunc);

end