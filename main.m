% Initialize parameters and load data
close all;clc;clear all;
load_addr=".\imag\";show_img=false;
load(".\data\data")
%init parameter
ave_r2=zeros(1,15);brk=false;
for n=1:15
    sum_r2=0;
    %try
    N=2^n;
    %load image
    %load(load_addr);
    %image=readImage(load_addr);
    for j=1:length(image)
        fprintf("%d %d",n,j);
        crt_image=double(image{j});
        crt_image=crop(N,crt_image);
        if size(crt_image,1)==0 || size(crt_image,2)==0
            continue;
        end
        %show the initial image
        if show_img
            figure
            imshow(uint8(crt_image))
        end

        %JPEG
        [new_img,syms,z0s]=JPEG(crt_image,N);
        sum_r2=sum_r2+r2(crt_image,new_img);
        % Image after DCT
        if show_img
            figure
            imshow(uint8(new_img))
        end
    end
%     catch
%         ave_r2=sum_r2/j;
%         break
%     end
    if sum_r2==0
        break
    end
    ave_r2(n)=sum_r2/j;
end
plot(1:n,ave_r2(1:n));