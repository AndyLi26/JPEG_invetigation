function rgb = toRGB(ycbcr)

rgb = zeros(size(ycbcr));
fY = ycbcr(:, :, 1);
fCb = ycbcr(:, :, 2);
fCr = ycbcr(:, :, 3);

% rgb(:,:,1) = fY + 1.403.*fCr;
% rgb(:,:,2) = fY - 0.34414 .*(fCb-128) - 0.71414 .*(fCr-128);
% rgb(:,:,3) = fY + 1.772 .*(fCb-128);
rgb(:,:,1) = 1.164383 * (fY-16) + 1.596027 * (fCr-128);
rgb(:,:,2) = 1.164383 * (fY-16) - 0.391762 * (fCb-128)- 0.812969 * (fCr-128);
rgb(:,:,3) = 1.164383 * (fY-16) + 2.017230 * (fCb-128);
rgb=round(rgb);
