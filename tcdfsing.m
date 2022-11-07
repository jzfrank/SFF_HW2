% page 372 of intermediate-probability-a-computational-approach.pdf
% k: degrees of freedom, mu: non-central parameter
function cdf = tcdfsing(tvec,k,mu)
    cdf=zeros(length(tvec),1);
    for tloop=1:length(tvec)
        t=tvec(tloop);
        intsum=0; lo=0; up=1; done=0; 
        while ~done
            s = quadl(@ff,lo,up,1e-10,0,t,k,mu); intsum=intsum+s;
            if (s<1e-12) & (ff(up,t,k,mu) <= ff(up,t,k,mu)), done=1; end
            % this piece of the integrand is extremely small and decreasing 
            lo=up; up=2*up;
        end
    cdf(tloop) = intsum * 2^(1-k/2) * k^(k/2) / gamma(k/2); 
    end
end

function s=ff(z,t,k,mu)
    s=normcdf(t*z,mu,1) .* z.^(k-1) .* exp(-0.5 * k * z.^2);
end