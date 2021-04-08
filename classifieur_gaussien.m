function [c]=classifieur_gaussien(data_trn,size_cls_trn,n,L,X_mean,U,x)
V=zeros(1,6);
for j=1:6
   a=covariance(data_trn,size_cls_trn,n,L,X_mean,U).^(-0.5)*( W(x,X_mean,U,L,n)-moy_classe(data_trn,j,L,size_cls_trn,X_mean,U,n));
   V(j)= norm(a)^2;
end
c=find((V==min(V)),1);
end