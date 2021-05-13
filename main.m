% Initialize parameters and load data
close all;clc;load_addr=".\imag\";show_img=false;
ave_r2=zeros(1,15);
%init parameter
for i=1:15
    sum_r2=0;
    try
    N=2^n;
    %load image
    %load(load_addr);
    image=readImage(load_addr);
    for j=1:length(image)
        image=double(cell2mat(image));
        image=crop(N,image);
        %show the initial image
        if show_img
            figure
            imshow(uint8(image))
        end

        %JPEG
        [new_img,syms,z0s]=JPEG(image,N);
        sum_r2=sum_r2+r2(image,new_img);
        % Image after DCT
        if show_img
            figure
            imshow(uint8(new_img))
        end
    end
    catch
        ave_r2=sum_r2/j;
    end
    ave_r2(i)=sum_r2/j;
end
plot(ave_r2(1:i));