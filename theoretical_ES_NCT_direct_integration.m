% df: degree of freedom
% mu: noncentrality 
function ES = theoretical_ES_NCT_direct_integration(df, mu, loc, scale, alpha)
    ES = loc + scale * theoretical_ES_stdNCT_direct_integration(df, mu, alpha); % true theoretical ES through integration
end