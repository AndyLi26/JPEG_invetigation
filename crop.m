function image=crop(N,image)
img_size=size(image);
row_max=floor(img_size(2)/N);
image=image(:,1:row_max*N,:);
col_max=floor(img_size(1)/N);
image=image(1:col_max*N,:,:);
end