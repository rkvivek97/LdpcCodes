function [H,G] = matGenPar(n,r,wc)
 wr = n*wc/r;
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
    k = n-r;
    rank_H1 = r-1;
    tic
    count=0;
    while (rank_H1~=r)
        count=count+1;
        count
        %toc;
        p = randperm(n,n);
        B = p<=wr;
        C = [];%B;
        for i=1:r
            p = randperm(n,n);
            C = [C; B(:,p)];
        end
        H  = gf(C, 2);
        %toc;
         try
            H1 = H(: , 1:r)';
            %rank_H1 = rank(H1)
            inv_H1 = inv(H1);
            %toc;
         catch
             continue;
         end
         rank_H1 = r;
    end
        H1 = H(: , 1:r)';
        inv_H1 = inv(H1);
        H2 = H(: , (r+1):n)';
        %toc;
        G = [H2*inv_H1, eye(k)];
        %toc
