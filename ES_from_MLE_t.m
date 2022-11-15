function ES = ES_from_MLE_t(data, alpha)
    tmp = tlikmax(data, [rand, rand, rand]);
    df = tmp(1);
    loc = tmp(2);
    scale = tmp(3);
    ES = theoretical_ES_t(loc, scale, df, alpha);
end
