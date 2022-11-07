function MLE = tlikmax(x, initvec)
    tol = 1e-5;
    opts = optimset('Disp', 'none', 'LargeScale', 'Off', ...
        'TolFun', tol, 'TolX', tol, 'Maxiter', 200);
    MLE = fminunc(@(param) tloglik(param, x), initvec, opts);
end