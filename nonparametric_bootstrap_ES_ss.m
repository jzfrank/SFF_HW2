function [coverage_accuracy, avg_interval_length] = ...
    nonparametric_bootstrap_ES_ss(T, rep, pd, alpha, trueES)

    B = 250; 
    CIs = zeros(rep, 2);
    parfor i = 1:rep
        data = random(pd, [T, 1]);
        ES_vec = bootstrp(B, @(data) empirical_ES(data, alpha), data);
        ci = quantile(ES_vec, [0.05, 0.95]);
        % using quantile for ci: 
        % https://www.sciencedirect.com/topics/mathematics/bootstrap-confidence-interval
        CIs(i, :) = ci;
    end
    coverage_accuracy = mean( (CIs(:, 1) <= trueES) & (CIs(:, 2) >= trueES));
    avg_interval_length = mean(CIs(:, 2) - CIs(:, 1));

%     data_generator = @(T) random(pd, [T, 1]);
%     bootfunc = @(data) empirical_ES(data, alpha);
%     [coverage_accuracy, avg_interval_length] = bootstrap_ES_general(... 
%         T, rep, trueES, data_generator, bootfunc);
end