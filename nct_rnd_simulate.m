% k: degrees of freedom 
% mu: non-centrality parameter 
% loc: location
% scale
function nct = nct_rnd_simulate(k, mu, loc, scale, M, N)
    nct = loc + scale * nctstd_rnd_simulate(k, mu, M, N);
end