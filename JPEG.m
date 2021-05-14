function [new_img,syms,z0s]=JPEG(img,N,Q_factor)
img=img-128;
YCbCr=toYCbCr(img);
new_img_YCbCr=zeros(size(img));
unique_list=[];z0s=0;
Q=getQ(N);T=getDCTmatrix(N);
for i=1:3
    D=Dct(YCbCr(:,:,i),T);
    compressed_image=compress(D,Q);%DCT domain
    unique_list=[unique_list;unique(compressed_image)];
    z0s=z0s+sum(compressed_image(:)==0);
    depressed_image=depress(compressed_image,Q);
    retrived_image=iDCT(depressed_image,T);
    new_img_YCbCr(:,:,i)=retrived_image;
end
syms=unique(unique_list);z0s=z0s/numel(img)*100;
new_img=toRGB(new_img_YCbCr);
new_img=new_img+128;
span=max(max(max(new_img)))-min(min(min(new_img)));
new_img=round(new_img*255/span);
new_img=new_img-min(min(min(new_img)));
end