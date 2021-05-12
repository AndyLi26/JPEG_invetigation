%% Initialize parameters and load data
%init parameter
N=8;Q_factor=50;load_addr=".\imag\";

%load image
%load(load_addr);
image=readImage(load_addr);
image=double(cell2mat(image));

%show the initial image
figure
imshow(uint8(image))

%JPEG
new_img=JPEG(image,N,Q_factor);

% Image after DCT
figure
imshow(uint8(new_img))