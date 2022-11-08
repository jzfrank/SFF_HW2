function [coverage_accuracy, avg_interval_length] = ...
    bootstrap_ES_general(T, rep, trueES, data_generator, bootfunc)
    B = 1000; 
    CIs = zeros(rep, 2);
    parfor i = 1:rep
        data = data_generator(T);
        bootstrap = bootstrp(B, @(data) bootfunc(data), data);
        % using quantile for ci: 
        % https://www.sciencedirect.com/topics/mathematics/bootstrap-confidence-interval
        ci = [quantile(bootstrap, 0.05), quantile(bootstrap, 0.95)];
        % alternatively, can use matlab built-in bootci, but it is slower
        % also, empirically, quantile method yields narrower ci 
        % ci = bootci(B, {@(data) bootfunc(data), data},...
        %    'Alpha', 0.1);
        CIs(i, :) = ci;
    end
    coverage_accuracy = mean( (CIs(:, 1) <= trueES) & (CIs(:, 2) >= trueES));
    avg_interval_length = mean(CIs(:, 2) - CIs(:, 1));
end