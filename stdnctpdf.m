function pdf = stdnctpdf(x, nu, gam)
    pdf = exp(stdnctpdfln_j(x, nu, gam));
end