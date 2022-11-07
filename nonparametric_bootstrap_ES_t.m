function [coverage_accuracy, avg_interval_length] = ...
    nonparametric_bootstrap_ES_t(T, rep, loc, scale, df, alpha, trueES)

    data_generator = @(T) loc + scale * trnd(df, T, 1);
    bootfunc = @(data) empirical_ES(data, alpha);
    [coverage_accuracy, avg_interval_length] = bootstrap_ES_general(... 
        T, rep, trueES, data_generator, bootfunc);

%     B = 500;
%     CIs = zeros(rep, 2);
%     parfor i = 1:rep
%         data = loc + scale * trnd(df, T, 1);
%         ci = bootci(B, {@(data) empirical_ES(data, alpha), data},...
%             'Alpha', 0.1);
%         CIs(i, :) = ci;
%     end
%     coverage_accuracy = mean( (CIs(:, 1) <= trueES) & (CIs(:, 2) >= trueES));
%     avg_interval_length = mean(CIs(:, 2) - CIs(:, 1));
end