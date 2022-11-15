function ll = nctloglik(param, x)
    df=param(1); mu = param(2); loc=param(3); scale=param(4);
    if df < 0, df = abs(df); end
    if scale < 0, scale = abs(scale); end
    ll = - mean(log(nctpdf_j(x, df, mu, loc, scale)));
end