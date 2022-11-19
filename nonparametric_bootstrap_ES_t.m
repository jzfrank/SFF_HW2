function [coverage_accuracy, avg_interval_length] = ...
    nonparametric_bootstrap_ES_t(T, rep, loc, scale, df, alpha, trueES)

    B = 250; 
    CIs = zeros(rep, 2);
    parfor i = 1:rep
        data = loc + scale * trnd(df, T, 1);
        ES_vec = bootstrp(B, @(data) empirical_ES(data, alpha), data);
        ci = quantile(ES_vec, [0.05, 0.95]);
        % using quantile for ci: 
        % https://www.sciencedirect.com/topics/mathematics/bootstrap-confidence-interval
        CIs(i, :) = ci;
    end
    coverage_accuracy = mean( (CIs(:, 1) <= trueES) & (CIs(:, 2) >= trueES));
    avg_interval_length = mean(CIs(:, 2) - CIs(:, 1));

end