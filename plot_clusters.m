%plotting w1 and w2 for the images of 3 classes
[num_classes, num_imgs]=get_infos("training_1");

vec_proj1=[];
vec_proj2=[];

%first class
moy_class=zeros(1,8);
for i=0:num_imgs-1
    
    proj=W(getimg("training_1",1,i), X_mean, U, L, n);
    moy_class=moy_class+proj';
    vec_proj1=[vec_proj1, proj(1)];
    vec_proj2=[vec_proj2, proj(2)];
    
    end
mu=(moy_class)/num_imgs;
scatter(vec_proj1, vec_proj2);
scatter(mu(1), mu(2));
hold on;

vec_proj1=[];
vec_proj2=[];

moy_class=zeros(1,8);
%second class
for i=0:num_imgs-1
    proj=W(getimg("training_1",2,i), X_mean, U, L, n);
    moy_class=moy_class+proj;

    vec_proj1=[vec_proj1, proj(1)];
    vec_proj2=[vec_proj2, proj(2)];
    

    
end
mu=(moy_class)/num_imgs; 
scatter(vec_proj1, vec_proj2);
scatter(mu(1), mu(2));

vec_proj1=[];
vec_proj2=[];
moy_class=zeros(1,8);
%third class
for i=0:num_imgs-1
    proj=W(getimg("training_1",3,i), X_mean, U, L, n);
    moy_class=moy_class+proj;

    vec_proj1=[vec_proj1, proj(1)];
    vec_proj2=[vec_proj2, proj(2)];
    mu=sum(proj)/num_imgs;

    end
mu=(moy_class)/num_imgs; 
scatter(vec_proj1, vec_proj2);
scatter(mu(1), mu(2));
  

hold off;



