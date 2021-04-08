function [mat]=covariance(data_trn,size_cls_trn,n,L,X_mean,U)
    mat=zeros(L,L);
    for j=1:6 % on parcourt toutes les classes
        for i=1:size_cls_trn(j) % on parcourt les images de chaque classe
            mat=mat+( (W(data_trn(:,(j-1)*size_cls_trn(j)+i),X_mean,U,L,n)-moy_classe(data_trn,j,L,size_cls_trn,X_mean,U,n))...
                *(W(data_trn(:,(j-1)*size_cls_trn(j)+i),X_mean,U,L,n)-moy_classe(data_trn,j,L,size_cls_trn,X_mean,U,n))');
        end
    end
    mat=(1/n)*mat;
end