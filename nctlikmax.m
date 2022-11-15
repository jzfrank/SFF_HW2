function MLE = nctlikmax(x, initvec)
    tol = 1e-5; % initially 1e-5
    opts = optimset('Disp', 'none', 'LargeScale', 'Off', ...
        'TolFun', tol, 'TolX', tol, 'Maxiter', 200); % maxiter initially 200
    A = []; b = [];
    Aeq = []; beq = [];
    lb = [1, -Inf, -Inf, 0.01];
    ub = [10, 10, Inf, 100];
    nonlcon = [];
    MLE = fmincon(@(param) nctloglik(param, x), initvec, ...
        A, b, Aeq, beq, lb, ub, nonlcon, opts);
    
end