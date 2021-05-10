function [D]=Dct(original_image,T)
N=length(T);
D=zeros(floor(size(original_image,1)/N)*N,floor(size(original_image,2)/N)*N);
for i = 1:floor(size(original_image,1)/N)
    for j = 1:floor(size(original_image,2)/N)
        M=original_image((i-1)*N+1:i*N,(j-1)*N+1:j*N);
        D((i-1)*N+1:i*N,(j-1)*N+1:j*N)=T*M*T';
    end
end
end