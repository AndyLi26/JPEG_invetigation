function new_img=JPEG(img,N,Q_factor)
YCbCr=toYCbCr(img);
new_img_YCbCr=zeros(size(img));
for i=1:3
    T=getDCTmatrix(N);
    D=Dct(img(:,:,i)-128,T);
    Q=getQ(N,2,Q_factor);
    compressed_image=compress(D,Q);%DCT domain
    depressed_image=depress(compressed_image,Q);
    retrived_image=iDCT(depressed_image,T);
    new_img_YCbCr(:,:,i)=retrived_image+128;
end
new_img=toRGB(new_img_YCbCr);
end