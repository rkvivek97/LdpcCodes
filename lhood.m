function p = lhood(r,s,N0)
	x = norm(r-s)^2;
	p = exp(-x/(2*N0))/sqrt(N0*pi);
end
