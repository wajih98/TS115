function [img]=ACP(vect_img,U,e,L,p,n,X_mean)  %e varie de 0 à n-L 
    P=zeros(p,1);
    for j=n:-1:n-(L+e-1)
        P=P+dot(vect_img,U(:,j))*U(:,j);
    end
    img=reshape(P+X_mean,[192,168]);
end