function depressed_image=depress(compressed_image,Q)
N=length(Q);
depressed_image=zeros(floor(size(compressed_image,1)/N)*N,floor(size(compressed_image,2)/N)*N);
for i = 1:floor(size(compressed_image,1)/N)
    for j = 1:floor(size(compressed_image,2)/N)
        temp=compressed_image((i-1)*N+1:i*N,(j-1)*N+1:j*N);
        depressed_image((i-1)*N+1:i*N,(j-1)*N+1:j*N)=temp.*Q;
    end
end
end