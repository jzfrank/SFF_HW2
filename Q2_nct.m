% Q2
function Q2_nct(df, mu)
    warning("off", "all");
    loc = 1; scale = 2; 
%     mu = 0; df = 6; 
    alpha = 0.01; % possibly new paramters 
    trueES_nct1 = theoretical_ES_NCT_direct_integration(df, mu, loc, scale, alpha);
    trueES_nct2 = theoretical_ES_NCT_from_simulation(df, mu, loc, scale, alpha, 1e7);
    trueES_t = theoretical_ES_t(loc, scale, df, alpha);
    % when mu = 0, nct should be same as t 
    disp("--------------------------");
    disp(["trueES_nct1", trueES_nct1, ...
        "trueES_nct2", trueES_nct2, ...
        "trueES_t", trueES_t]);
    % 
    rep = 100; 
    
    file_name = strcat('Q2_diary', '_rep', num2str(rep), '_mu', num2str(mu), ...
        '_df', num2str(df), '_alpha', num2str(alpha), ...
         datestr(now,'_yyyy_mm-dd_HH:MM:SS'), '.txt');
    diary(file_name);
    disp(["rep", rep, "df", df, ...
        "mu", mu, "alpha", alpha, ...
        "loc", loc, "scale", scale]);
    disp("--------------------------");
    
    for T=[100, 500, 2000]
        tic;
        [coverage_accuracy, avg_interval_length] = ...
            nonparametric_bootstrap_ES_nct(T, rep, df, mu, loc, scale, alpha, trueES_nct1);
        disp(["nonparametric", "T", T, coverage_accuracy, avg_interval_length]);
        [coverage_accuracy, avg_interval_length] = ...
            parametric_bootstrap_ES_nct_assume_t(T, rep, df, mu, loc, scale, alpha, trueES_nct1);
        disp(["parametric", "T", T, coverage_accuracy, avg_interval_length]);
        toc;
    end

end