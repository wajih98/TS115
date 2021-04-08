 function img=getimg(dir_class, class)
%    input:
%        - dir class: exemple test1, test2,...
%        - class: class of the image exemple 1
%    output: random image of the class in class_dir
    
    switch class
        case 1
            n=0;
        case 2
            n=1;
        case 3
            n=2;
        case 4
            n=3;
        case 5
            n=4;
        case 6
            n=5;
            
        
    end
    switch dir_class
        
        case "test1"
            load('./mat_files/test1.mat');
            data=test1;
        case "test2"
            load('./mat_files/test2.mat');
            data=test2;
         case "test3"
            load('./mat_files/test3.mat');
            data=test3;
         case "test4"
            load('./mat_files/test4.mat');
            data=test4;
         case "test5"
            load('./mat_files/test5.mat');
            data=test5;
         case "test6"
            load('./mat_files/test6.mat');
            data=test6;
        case "traning_1"
            load('./mat_files/training_1.mat');
            data=training_1;
    end
    r=randi([0,-1+width(data)/168 ]);
    img=data(n*192+1:(n+1)*192,r*168+1:(r+1)*168);
    imagesc(img)
 end