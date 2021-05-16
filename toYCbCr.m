function ycbcr = toYCbCr(rgb)

ycbcr = zeros(size(rgb));
fR = rgb(:, :, 1);
fG = rgb(:, :, 2);
fB = rgb(:, :, 3);

ycbcr(:,:,1) = 0.299.*fR + 0.587.*fG + 0.114.*fB;
ycbcr(:,:,2) = -0.172.*fR - 0.339.*fG + 0.511.*fB + 128;
ycbcr(:,:,3) = 0.511.*fR - 0.428.*fG - 0.083.*fB + 128;
