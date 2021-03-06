function image=readImage(file_path)
%% Read image under the imag file       
    file_path =  '.\imag\';
    img_path_list =  dir(strcat(file_path,'*.jpg'));%get jpg file
    image=cell(1,length(img_path_list));
    for j = 1:length(img_path_list)
        image_name = img_path_list(j) .name;
        image{j} =  imread(strcat(file_path,image_name));
    end
    
%%  Save image as matlab data
    save('.\data\data','image');

