function Q=getQ(N,Q_factor)
if N==8
    %standard Q
    Q=[16 11 10 16 24 40 51 61;
12 12 14 19 26 58 60 55;
14 13 16 24 40 57 69 56;
14 17 22 29 51 87 80 62;
18 22 37 56 68 109 103 77;
24 35 55 64 81 104 113 92;
49 64 78 87 103 121 120 101;
72 92 95 98 112 100 103 99];
    if Q_factor>50
        Q=Q*(100-Q_factor)/50;
    else
        Q=Q*50/Q_factor;
    end
else
    %linear Q, factor will increase when it moves to higher frequency
    Q=zeros(N);stepSize=(120-10)/2/(N-1);
    start=10;
    for i=1:N
        current=start;
        for j=1:N
            Q(i,j)=current;
            current=current+stepSize;
        end
        start=start+stepSize;
    end
    Q(1,1)=16;Q(N,N)=99;
    if Q_factor>50
        Q=Q*(100-Q_factor)/50;
    else
        Q=Q*50/Q_factor;
    end
end
end