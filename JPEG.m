function new_img=JPEG(img,N,Q_factor)
img=img-128;
YCbCr=toYCbCr(img);
new_img_YCbCr=zeros(size(img));
for i=1:3
    T=getDCTmatrix(N);
    D=Dct(YCbCr(:,:,i),T);
    Q=getQ(N,2,Q_factor);
    compressed_image=compress(D,Q);%DCT domain
    depressed_image=depress(compressed_image,Q);
    retrived_image=iDCT(depressed_image,T);
    new_img_YCbCr(:,:,i)=retrived_image;
end
new_img=toRGB(new_img_YCbCr);
new_img=new_img+128;
end