 function T= getDCTmatrix(N)
 %return a N x N Transformation Matrix
T=zeros(N,N);
T(1,:)=ones(1,N)/sqrt(N);
for i=2:N
    for j=1:N
        T(i,j)=sqrt(2/N)*cos((2*(j-1)+1)*(i-1)*pi/(2*N));
    end
end
 end
