function [err,symbols_saved,z0s]=after_process(original,new)
err=sum(sum(sum((new-original).^2)));
a=length(unique(original))
b=length(unique(new))
unique(new)
symbols_saved=length(unique(original))-length(unique(new));
z0s=sum(sum(sum(new(:,:,:)==0)));
end