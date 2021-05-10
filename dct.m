function [D]=Dct(original_image,N)

D=zeros(floor(size(original_image,1)/N)*N,floor(size(original_image,2)/N)*N);
T=getDCTmatrix(N);
for i = 1:floor(size(original_image,1)/N)
    for j = 1:floor(size(original_image,2)/N)
        block=original_image((i-1)*N+1:i*N,(j-1)*N+1:j*N);
        D((i-1)*N+1:i*N,(j-1)*N+1:j*N)=T*block*T';
    end
end
end