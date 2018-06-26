H = load('h.mat');
H = gf(H.x,2);
G = load('g.mat');
G = gf(G.x,2);

[rows,cols] = size(H);
mIterations = 15;

m = (randint(1,cols-rows));
c = m*G;

qpk_i = 1;
for i=1:2:length(c)
 switch c(i:i+1)
 case [0 0]
    qpk(qpk_i) = 1+1j;
 case [0 1]
    qpk(qpk_i) = -1+1j;
 case [1 1]
    qpk(qpk_i) = -1-1j;
 case [1 0]
    qpk(qpk_i) = 1-1j;
 otherwise
	error("Invalid");
 endswitch
 qpk_i+=1;
end
	rx = qpk +(-1+2*rand(1,length(qpk)))+1j*(-1+2*rand(1,length(qpk)));
j=1;
for i = 1:length(qpk)
 [llrx(j),llrx(j+1)] = llr(qpk(i));
 j+=2;
end

%Create q and r;
q = zeros(mIterations,cols);
r = zeros(mIterations,rows);
  for j=1:cols
	q(1,j) = llrx(j);
  end

for itr = 2:mIterations
	for i=1:rows
  	for j=1:cols 
			if(H(i,j) == 1)
				r(itr,i) = 	r(itr,i) + q(itr-1,i);
			end				
		end
	end

	for j=1:cols 
		for i=1:rows
			if(H(i,j) == 1)
				q(itr,j) = 	q(itr,j) + r(itr,i);
			end				
		end
	end 

	for i=1:cols
	if(q(mIterations,i) > 0)
		rxdec(i) = 1;
	else
		rxdec(i) = 0;
	end
	end

	if(rxdec*H' == 0)
	break;
	end

end


rxdec*H'

(rxdec(rows+1:cols)-m)
