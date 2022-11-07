function ES = ES_from_MLE_nct(data, alpha)
    % mle estimation is too slow, how to solve this issue? 
%     tmp = mle(data, "Distribution", "tLocationScale");
%     loc = tmp(1);
%     scale = tmp(2);
%     df = tmp(3);
    tmp = nctlikmax(data, [4, 0]);
    df = tmp(1);
    mu = tmp(2);
    if df < 0
        % prevent theoretical_ES_NCT_direct_integration throwing error
        disp("df < 0");
        df = abs(df);
    end
%     disp(["df", df, "mu", mu]);
    ES = theoretical_ES_NCT_direct_integration(df, mu, alpha);
end
