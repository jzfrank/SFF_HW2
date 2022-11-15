function pdf = nctpdf_j(x, nu, gam, loc, scale)
    y = (x-loc) / scale;
%     prof's implementation
%     pdf = stdnctpdf(y, nu, gam) / scale;
%     they yield similar results
%     Matlab implementation
    pdf = nctpdf(y, nu, gam) / scale;
end 