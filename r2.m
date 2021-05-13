function err=r2(original,new)
err=sum(sum(sum((new-original).^2)))/10^4;
end