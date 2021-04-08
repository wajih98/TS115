% P. Vallet (Bordeaux INP), 2019

clc;
clear all;
close all;

%% Data extraction
% Training set
adr = './database/training1/';
fld = dir(adr);
nb_elt = length(fld);
% Data matrix containing the training images in its columns 
data_trn = []; 
% Vector containing the class of each training image
lb_trn = []; 
for i=1:nb_elt
    if fld(i).isdir == false
        lb_trn = [lb_trn ; str2num(fld(i).name(6:7))];
        img = double(imread([adr fld(i).name]));
        data_trn = [data_trn img(:)];
    end
end
% Size of the training set
[P,N] = size(data_trn);
% Classes contained in the training set
[~,I]=sort(lb_trn);
data_trn = data_trn(:,I);
[cls_trn,bd,~] = unique(lb_trn);
Nc = length(cls_trn); 
% Number of training images in each class
size_cls_trn = [bd(2:Nc)-bd(1:Nc-1);N-bd(Nc)+1]; 
% Display the database
F = zeros(192*Nc,168*max(size_cls_trn));
 for i=1:Nc
     for j=1:size_cls_trn(i)
           pos = sum(size_cls_trn(1:i-1))+j;
           F(192*(i-1)+1:192*i,168*(j-1)+1:168*j) = reshape(data_trn(:,pos),[192,168]);
     end
 end
 figure (1)
 imagesc(F);
 colormap(gray);
 axis off;
 
 
 
 
 %% Rmatrix
%on teste sur la premiere image F(1:192,1:168)
p=size(data_trn,1);
n=size(data_trn,2);
X_img=data_trn;
s=zeros(p,1);
for i=1:n
    s=s+X_img(:,i);
end
X_mean=s/n;
for i=1:n
    X_img(:,i)=X_img(:,i)-X_mean;
end
X_submean=1/sqrt(n)*X_img;

GRAM_X=X_submean'*X_submean;
% R=X_submean*X_submean';
[V,D]=eig(GRAM_X);
U=X_submean*V*(V'*X_submean'*X_submean*V)^(-0.5);
figure (2)
for i=1:n
    subplot (6,10,i)
    img=reshape(U(:,i),[192,168]);
    imagesc(img);
    colormap(gray);
    axis off;
end
alpha=0.9;
k=zeros(1,n);
lambda=flip(sort(diag(D)));
for l=1:n
    k(l)=sum(lambda(1:l))/sum(lambda);
end
L=find(k>=alpha,1);
figure(3)
plot(1:n,k)
xlabel(l)
ylabel('Ratio')
title('Evolution du ratio de reconstruction')
hold on
plot(1:n,alpha*ones(n))
%% application de l'ACP

for f=0:5
figure (f+4)
for e=1:10
    subplot(2,5,e)
    img=ACP(data_trn(:,10*f+1),U,e,L,p,n,X_mean);
    imagesc(img);
    colormap(gray);
    axis off;
    ch=num2str(e);
    c=strcat("l=",ch);
    title(c)
end
end

%ACP OK

%% classifieur KNN
%k_nn is a lil bit slow because getimg charges big variables ".mat" but
%works like a charm
%K=5 for example
predict_class=k_nn(5, getimg('test2', 5,5),X_mean, U,L,n);
%% classifieur gaussien

x=data_trn(:,12); % faire varier l'image vectorisée en entrée, c renvoie la classe a laquelle appartient cette image
c=classifieur_gaussien(data_trn,size_cls_trn,n,L,X_mean,U,x);


