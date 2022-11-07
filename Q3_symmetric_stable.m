% Q3 symmetric stable (ss) 
warning("off", "all");
alpha_dist = 1.6; 
pd = makedist('Stable','alpha', alpha_dist,'beta',0,'gam',1,'delta',0);
alpha = 0.01; % possibly new paramters 
trueES_ss = theoretical_ES_ss(pd, alpha_dist, alpha);
trueES_ss

rep = 100; % parametric bootstrap mle is too slow

file_name = strcat('Q2_diary', '_rep', num2str(rep), "_alpha_dist", ...
    num2str(alpha_dist), "_alpha", num2str(alpha), ...
     datestr(now,'_yyyy_mm-dd_HH:MM:SS'), '.txt');
diary(file_name);
disp(["rep", rep, "alpha_dist", alpha_dist, "alpha", alpha]);

for T=[250, 500, 2000]
    tic;
    [coverage_accuracy, avg_interval_length] = ...
        nonparametric_bootstrap_ES_ss(T, rep, pd, alpha, trueES_ss);
    disp(["nonparametric", "T", T, coverage_accuracy, avg_interval_length]);
    [coverage_accuracy, avg_interval_length] = ...
        parametric_bootstrap_ES_ss(T, rep, pd, alpha, trueES_ss);
    disp(["parametric", "T", T, coverage_accuracy, avg_interval_length]);
    toc;
end
