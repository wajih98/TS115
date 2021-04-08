function pred_class=k_nn(K,input, X_mean, U, L, n)
    %input is compared to training_1 
    
    all_distances=zeros(1,n); %n is the number of images in training dataset
    for k=1:n
        %defining current class and current image in class (col_image)
        if floor((k-1)/10)<1
            current_class=0;
        else
            current_class=floor((k-1)/10);

        end
     
        
            col_image=mod((k-1),10);
        
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        
        all_distances(k)=euc_dist(input,getimg('training_1', current_class+1, col_image), X_mean, U, L, n);
       
    end
    [B,I]=sort(all_distances,'ascend');
    k_nn_indexes=I(1:K);
    k_nn_classes=zeros(size(k_nn_indexes));

    %transforming image indexes to its classes
    for j=1:length(k_nn_indexes)
          if floor(k_nn_indexes(j)/10)==0
            k_nn_classes(j)=1;
        else 
            k_nn_classes(j)=floor((k_nn_indexes(j))/10)+1;
          end
    end
    pred_class=mode(k_nn_classes'); %most frequent integer 
end