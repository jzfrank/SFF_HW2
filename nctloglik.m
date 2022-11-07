function ll = nctloglik(param, x)
    df=param(1); mu = param(2); 
%     disp(["ll", "df", df, "mu", mu]);
    if df < 0, df = abs(df); end
    ll = - sum(log(nctpdf(x, df, mu)));
end