function ES = theoretical_ES_NCT_from_simulation(df, mu, alpha, N)
    data = nctrnd_simulate(df, mu, N, 1);
    ES = empirical_ES(data, alpha);
end