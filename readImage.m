function a = readImage()

a = 0; %random for return

%% Read image under the imag file           
    file_path =  '.\imag\';
    img_path_list =  dir(strcat(file_path,'*.jpg'));%get jpg file
    for j = 1:length(img_path_list)
        image_name = img_path_list(j) .name;
        image(j) =  imread(strcat(file_path,image_name));
    end
    
%%  Save image as matlab data
    save('.\data\data');
    
%% Save image as txt
    % f = fopen('.\data\data.txt','w');
    % fprintf(f,'%f',image);
    % close all;

