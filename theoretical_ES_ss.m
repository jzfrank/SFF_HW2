% alpha_dist: alpha used to define symmetric stable (alpha, beta=0, 0, 1)
% alpha: probability 
function ES = theoretical_ES_ss(pd, alpha_dist, alpha)
    ES = ES_stoy(pd, alpha, alpha_dist);
end