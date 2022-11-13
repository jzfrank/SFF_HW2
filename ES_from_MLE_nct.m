function ES = ES_from_MLE_nct(data, alpha, df, mu, loc, scale)
    % mle estimation is too slow, how to solve this issue? 
%     tmp = mle(data, "Distribution", "tLocationScale");
%     loc = tmp(1);
%     scale = tmp(2);
%     df = tmp(3);
    tmp = nctlikmax(data, [4, -2, 1, 2]);
    df = tmp(1);
    mu = tmp(2);
    loc = tmp(3);
    scale = tmp(4);
%     disp(["df", df, "mu", mu, "loc", loc, "scale", scale]);
    if df < 0
        % prevent theoretical_ES_NCT_direct_integration throwing error
%         disp("df < 0");
        df = abs(df);
    end

    if scale < 0
        % prevent theoretical_ES_NCT_direct_integration throwing error
%         disp("scale < 0");
        scale = abs(scale);
    end
    ES = theoretical_ES_NCT_from_simulation(df, mu, loc, scale, alpha, 1e5);
end
