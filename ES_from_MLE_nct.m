function ES = ES_from_MLE_nct(data, alpha, df, mu, loc, scale)
    % mle estimation is too slow, how to solve this issue? 
    tmp = nctlikmax(data, [4, -2, 1, 2]);
    df = tmp(1);
    mu = tmp(2);
    loc = tmp(3);
    scale = tmp(4);
    if df < 0
        % prevent theoretical_ES_NCT_direct_integration throwing error
        df = abs(df);
    end

    if scale < 0
        % prevent theoretical_ES_NCT_direct_integration throwing error
        scale = abs(scale);
    end
    ES = theoretical_ES_NCT_from_simulation(df, mu, loc, scale, alpha, 1e5);
end
