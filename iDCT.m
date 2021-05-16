function [retrived_image]=iDCT(depressed_image,N)
%N=length(T);
retrived_image=zeros(floor(size(depressed_image,1)/N)*N,floor(size(depressed_image,2)/N)*N);
for i = 1:floor(size(depressed_image,1)/N)
    for j = 1:floor(size(depressed_image,2)/N)
        M=depressed_image((i-1)*N+1:i*N,(j-1)*N+1:j*N);
        %self coded DCT
%         retrived_image((i-1)*N+1:i*N,(j-1)*N+1:j*N)=round(T'*M*T);
        %matlab dct
        retrived_image((i-1)*N+1:i*N,(j-1)*N+1:j*N)=idct(M);
    end
end
end