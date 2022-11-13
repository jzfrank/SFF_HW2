function ES = theoretical_ES_NCT_from_simulation(df, mu, loc, scale, alpha, N)
    data = nct_rnd_simulate(df, mu, loc, scale, N, 1);
    ES = empirical_ES(data, alpha);
end