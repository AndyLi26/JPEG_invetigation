% Initialize parameters and load data
close all;clc;%clear all;
tic
load_addr=".\imag\";show_img=false;
%init parameter
Quality=5:10:95;
n_size=length(Quality);
ave_r2=zeros(1,n_size);brk=false;counter=zeros(1,n_size);
ave_z0s=zeros(1,n_size);
ave_syms=zeros(1,n_size);
image=readImage(load_addr);
if show_img
    figure;
    imshow(uint8(image{1}))
end
for n=1:n_size
    sum_r2=0;sum_z0s=0;sum_syms=0;
    N=2^3;
    for j=1:length(image)
        %preprocess
        fprintf("%d %d\n",n,j);
        crt_image=double(image{j});
        crt_image=crop(N,crt_image);
        if size(crt_image,1)==0 || size(crt_image,2)==0
            continue;
        end
        counter(n)=counter(n)+1;
        %run the process
        [new_img,syms,z0s]=JPEG(crt_image,N,Quality(n));
        %collect data
        sum_r2=sum_r2+r2(crt_image,new_img);
        sum_z0s=sum_z0s+z0s;
        sum_syms=sum_syms+syms;
        % Image after DCT
        if show_img
            figure;title(sprintf("n=%d",n));
            imshow(uint8(new_img))
        end
    end
    % no image is larger enought to continue the process
    if sum_r2==0
        break
    end
    %collect data
    ave_r2(n)=sum_r2/j;
    ave_z0s(n)=sum_z0s/j;
    ave_syms(n)=sum_syms/j;
end
figure;
plot(5:10:95,ave_r2(1:n));title("error");
xlabel("Quality");ylabel("average r^2");
figure;
plot(5:10:95,ave_z0s(1:n));title("0s");
xlabel("Quality");ylabel("zeros in each image (%)");
figure;
plot(5:10:95,ave_syms(1:n));title("symbols");
xlabel("Quality");ylabel("numbers of symbols used");
%save data for later use
clear image;
save("data\collected_3");
toc