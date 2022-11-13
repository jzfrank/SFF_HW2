function pdf = nctpdf_j(x, nu, gam, loc, scale)
    y = (x-loc) / scale;
    pdf = stdnctpdf(y, nu, gam) / scale;
end 