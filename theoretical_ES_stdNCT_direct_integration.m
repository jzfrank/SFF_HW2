% df: degree of freedom
% mu: noncentrality 
function ES = theoretical_ES_stdNCT_direct_integration(df, mu, alpha)
    c01 = nctinv(alpha, df, mu); % left tail quantile, for loc-0 scale-1
%     ES01 = -tpdf(c01,df)/tcdf(c01,df) * (df+c01^2)/(df-1);
    I01 = @(x) x .* stdnctpdf(x, df, mu);
    ES = integral(I01, -Inf, c01) / alpha; % true theoretical ES through integration
end