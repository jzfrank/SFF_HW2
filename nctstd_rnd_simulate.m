% k: degrees of freedom 
% mu: non-centrality parameter 
function nct = nctstd_rnd_simulate(k, mu, M, N)
    X = normrnd(mu, 1, M, N);
    Y = chi2rnd(k, M, N);
    nct = X ./ sqrt(Y ./k);
end