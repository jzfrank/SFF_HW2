function ES = theoretical_ES_t(loc, scale, df, alpha)
    c01 = tinv(alpha , df); % left tail quantile, for loc-0 scale-1
    ES01 = -tpdf(c01,df)/tcdf(c01,df) * (df+c01^2)/(df-1);
    ES = loc+scale*ES01; % true theoretical ES
end