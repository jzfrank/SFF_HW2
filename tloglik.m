function ll = tloglik(param, x)
%     v = param(1); mu = param(2); c = param(3);
%     if v < 0, v = abs(v); end
%     if c < 0, c = abs(c); end
%     if v == 0, v = 1;end;

    df = param(1); loc = param(2); scale = param(3);
    df = abs(df); scale = abs(scale);
    if df == 0, df = 1; end
    if loc == 0, loc = 1; end
    K = beta(df/2, 0.5) * sqrt(df); z = (x-loc) / scale;
    ll = -log(scale) - log(K) - ((df+1)/2 * log(1 + (z.^2)/df));
    ll = -sum(ll);
end