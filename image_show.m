%init parameter
load_addr=".\data\data.mat";
load(load_addr);
image=double(cell2mat(image));


imshow(image)