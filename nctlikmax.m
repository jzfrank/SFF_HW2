function MLE = nctlikmax(x, initvec)
    tol = 1e-2; % initially 1e-5 but too slow
    opts = optimset('Disp', 'none', 'LargeScale', 'Off', ...
        'TolFun', tol, 'TolX', tol, 'Maxiter', 200); % maxiter initially 200 but too slow
    MLE = fminunc(@(param) nctloglik(param, x), initvec, opts);
end