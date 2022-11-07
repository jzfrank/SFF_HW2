function ES = empirical_ES(data, alpha)
    VaR = quantile(data, alpha);
    tmp = data(data <= VaR);
    ES = mean(tmp);
end 