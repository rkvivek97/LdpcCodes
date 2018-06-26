function [lb1,lb0] = llr(r)
	%s1=00,s2=01,s3=11,s4=10
	%Assuming p(si)=0.25
s1 = 1+1j;
s2 = -1+1j;
s3 = -1-1j;
s4 = 1-1j;
N0 = 0.1;
prs1 = lhood(r,s1 ,N0);
prs2 = lhood(r,s2 ,N0);
prs3 = lhood(r,s3 ,N0);
prs4 = lhood(r,s4 ,N0);
p11 = prs3+prs4;
p10 = prs1+prs2;
p01 = prs2 + prs3;
p00 = prs1+prs4;
lb1 = log(p11/p10);
lb0 = log(p01/p00);
end
