function Compressed_image=compress(D,Q)
N=length(Q);
Compressed_image=zeros(floor(size(D,1)/N)*N,floor(size(D,2)/N)*N);
for i = 1:floor(size(D,1)/N)
    for j = 1:floor(size(D,2)/N)
        M=D((i-1)*N+1:i*N,(j-1)*N+1:j*N);
        Compressed_image((i-1)*N+1:i*N,(j-1)*N+1:j*N)=round(M./Q);
    end
end
end