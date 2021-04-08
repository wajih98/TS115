function [vect]=moy_classe(data_trn,j,L,size_cls_trn,X_mean,U,n) %j indice de la classe, varie de 1 à 6
    vect=zeros(L,1);
    classe=data_trn(:,(j-1)*size_cls_trn(j)+1:j*size_cls_trn(j));
    for i=1:size(classe,2)
    vect=vect+W(classe(:,i),X_mean,U,L,n);    
    end
    vect=vect/size_cls_trn(j);
end