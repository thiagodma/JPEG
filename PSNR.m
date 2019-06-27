function value = PSNR(filename1,filename2)

iimg = imread(filename1);
qimg = imread(filename2);

value = 10*log10((2^8 -1)^2/MSE(iimg,qimg));

end