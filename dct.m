function [CN,c] = dct(N,x)

len_x=length(x);
X=[x zeros(1,N-len_x)];
CN=zeros(N);
for n=0:N-1
    for k=0:N-1
        if k==0
            CN(k+1,n+1)=sqrt(1/N);
        else
            CN(k+1,n+1)=sqrt(2/N)*cos(pi*(n+0.5)*k/N);
        end
    end
end
c = CN*X.';
c = c';

% subplot(211);
% stem(x);
% title('Input sequence');
% subplot(212);
% stem(c);
% title('Output dct sequence');
