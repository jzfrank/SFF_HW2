# SFF_HW2

## What remains:

1. **Speed up the process**. Currently the speed (mainly MLE) is too slow. 
   
   [Before any optimization]
   - (for rep=1, T=250, Q1 costs around 2.5 seconds; for rep=12, T=250, Q1 costs around 25 seconds; for rep=1, T=1000, Q1 costs around 9 to 10 seconds; so for 12 rep, T=250, it uses around 15~20 seconds; If we set rep=100, T=1000, it costs 20 * 100 * 4 = 8000 seconds = 2 to 3 hours)
   
   - for Q2: rep=1, T=250 -> around 2 to 3 seconds
   
   - for Q3: rep=1, T=250 -> around 15 seconds
   
   - for Q4: rep=1, T=250 -> around 215 seconds (if tol=1e-5, maxiter=200); 120 seconds (if tol=1e-2, maxiter=100)
   
   [Optimization: parloop]
   
   **parloop** With parfor instead of for loop (6 workers on local computer), the speed increases significantly, now Q1 (rep=100, T=250) costs around 60 seconds; Q1(rep=100, T=500) costs around 80 seconds; Q1(rep=100; T=2000) costs around 322 seconds;
   
   [Optimization: quantile ci]
   
   bootci is slow -> use boostrp to generate a vector of statistics, then compute quantile of it as ci. 
2. Check if location scale NCT is necessary (currently just NCT with loc=0, scale=1)
3. Write reports. 