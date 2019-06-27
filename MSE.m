function value = MSE(iimg,qimg)

iimg = double(iimg);
qimg = double(qimg);

[m,n] = size(iimg);

aux_iimg = iimg(:);
aux_qimg = qimg(:);

aux = (aux_iimg - aux_qimg).^2;
aux = sum(aux);
value = aux/(m*n);

end