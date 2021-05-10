%init parameter
N=8;Q_factor=50;load_addr=".\data\data.mat";
%load image
load(load_addr);
image=cell2mat(image);
image1=double(image(:,:,1))-128;
image2=double(image(:,:,2))-128;
image3=double(image(:,:,3))-128;
test=[154 123 123 123 123 123 123 136;
192	180 136 154 154 154 136 110;
254 198 154 154 180 154 123 123;
239 180 136 180 180 166 123 123;
180 154 136 169 166 149 136 136;
128 136 123 136 154 180 198 154;
123 105 110 149 136 136 180 166;
110 136 123 123 123 136 154 136]-128;
T=getDCTmatrix(N);
D=Dct(image1,T);
Q=getQ(N,2,Q_factor);
compressed_image=compress(D,Q);
depressed_image=depress(compressed_image,Q);
retrived_image=iDCT(depressed_image,T);
