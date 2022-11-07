function [coverage_accuracy, avg_interval_length] = ...
    parametric_bootstrap_ES_ss(T, rep, pd, alpha, trueES)

    data_generator = @(T) random(pd, [T, 1]);
    bootfunc = @(data) ES_from_MLE_t(data, alpha);
    [coverage_accuracy, avg_interval_length] = bootstrap_ES_general(... 
        T, rep, trueES, data_generator, bootfunc);

%     B = 500;
%     CIs = zeros(rep, 2);
%     parfor i = 1:rep
%         data = random(pd, [T, 1]);
%         ci = bootci(B, {@(data) ES_from_MLE_t(data, alpha), data},...
%             'Alpha', 0.1);
%         CIs(i, :) = ci;
%     end
%     coverage_accuracy = mean( (CIs(:, 1) <= trueES) & (CIs(:, 2) >= trueES));
%     avg_interval_length = mean(CIs(:, 2) - CIs(:, 1));
end