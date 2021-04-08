function [vect]=W(x,X_mean,U,L,n)
    vect=zeros(L,1);
    for i=0:L-1
        vect(i+1)=dot(x-X_mean,U(:,n-i));
    end
end