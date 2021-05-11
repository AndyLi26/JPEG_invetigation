%% Initialize parameters and load data
%init parameter
N=8;Q_factor=50;load_addr=".\data\data.mat";

%load image
load(load_addr);
image=double(cell2mat(image));

%show the initial image
imshow(uint8(image))

%% Image array processing
%image = toYCbCr(image);
%image = rgb2ycbcr(image); %matlab function - toolbox required

image1=(image(:,:,1))-128;
image2=(image(:,:,2))-128;
image3=(image(:,:,3))-128;
test=[154 123 123 123 123 123 123 136;
192	180 136 154 154 154 136 110;
254 198 154 154 180 154 123 123;
239 180 136 180 180 166 123 123;
180 154 136 169 166 149 136 136;
128 136 123 136 154 180 198 154;
123 105 110 149 136 136 180 166;
110 136 123 123 123 136 154 136]-128;

%% Perform DCT and inverse DCT
%JPEG
T=getDCTmatrix(N);
D=Dct(image1,T);
Q=getQ(N,2,Q_factor);
compressed_image=compress(D,Q);%DCT domain
depressed_image=depress(compressed_image,Q);
retrived_image=iDCT(depressed_image,T);
final_image=retrived_image+128;

%% Image after DCT
imshow(uint8(final_image))