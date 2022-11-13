function ES = ES_from_MLE_t(data, alpha)
%     tmp = mle(data, "Distribution", "tLocationScale");
%     loc = tmp(1);
%     scale = tmp(2);
%     df = tmp(3);
    tmp = tlikmax(data, [rand, rand, rand]);
    df = tmp(1);
    loc = tmp(2);
    scale = tmp(3);
    ES = theoretical_ES_t(loc, scale, df, alpha);
end
