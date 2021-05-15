% Initialize parameters and load data
close all;clc;clear all;
tic
load_addr=".\imag\";show_img=false;
%load(".\data\data")
%image=[image(12),image(65)];
%init parameter
ave_r2=zeros(1,15);brk=false;counter=zeros(1,15);
ave_z0s=zeros(1,15);
ave_syms=zeros(1,15);
image=readImage(load_addr);
for n=2:12
    sum_r2=0;sum_z0s=0;sum_syms=0;
    %try
    N=2^n;
    %load image
    %load(load_addr);
    %image=readImage(load_addr);
    for j=1:length(image)
        fprintf("%d %d\n",n,j);
        crt_image=double(image{j});
        crt_image=crop(N,crt_image);
        if size(crt_image,1)==0 || size(crt_image,2)==0
            continue;
        end
        counter(n)=counter(n)+1;
        %show the initial image
        if show_img
            figure
            imshow(uint8(crt_image))
        end

        %JPEG
        [new_img,syms,z0s]=JPEG(crt_image,N);
        sum_r2=sum_r2+r2(crt_image,new_img);
        sum_z0s=sum_z0s+z0s;
        sum_syms=sum_syms+syms;
        % Image after DCT
        if show_img
            figure
            imshow(uint8(new_img))
            pause();
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
    ave_z0s(n)=sum_z0s/j;
    ave_syms(n)=sum_syms/j;
end
figure;
plot(1:n-1,ave_r2(1:n-1));
xlabel("n");ylabel("average r^2");
figure;
plot(1:n-1,ave_z0s(1:n-1));
xlabel("n");ylabel("zeros in each image (%)");
clear image;
save("data\collected_3");
toc