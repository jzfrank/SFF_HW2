% Q1
function Q1_t()
    warning("off", "all");
    randSeed = "default";
    rng(randSeed);
    
    loc = 1; scale = 2; df = 4; alpha = 0.01; % possibly new paramters 
    trueES = theoretical_ES_t(loc, scale, df, alpha);
    rep = 100; % parametric bootstrap mle is too slow
    
    file_name = strcat('Q1_diary', '_rep', num2str(rep), '_loc', num2str(loc), ...
        '_scale', num2str(scale), '_df', num2str(df), '_alpha', num2str(alpha), ...
         datestr(now,'_yyyy_mm-dd_HH:MM:SS'), '.txt');
    diary(file_name);
    disp(["rep", rep, "loc", loc, "scale", scale, "df", df, "alpha", alpha, "randSeed", randSeed]);
    
    for T=[250, 500, 2000]
        tic;
        [coverage_accuracy, avg_interval_length] = nonparametric_bootstrap_ES_t(T, ...
            rep, loc, scale, df, alpha, trueES);
        disp(["nonparametric", "T", T, coverage_accuracy, avg_interval_length]);
        [coverage_accuracy, avg_interval_length] = parametric_bootstrap_ES_t(T, ...
            rep, loc, scale, df, alpha, trueES);
        disp(["parametric", "T", T, coverage_accuracy, avg_interval_length]);
        toc;
    end

end