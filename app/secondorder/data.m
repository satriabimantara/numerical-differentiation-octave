










































function [x,y,length] = data
  A = [1.3,1.5,1.7,1.9,2.1,2.3,2.5];
  Y = [3.669,4.482,5.474,6.686,9.974,12.182];
  n = 6; #banyak data
  fprintf("\tDATA YANG DIKETAHUI\n\n");
  fprintf("\tX[i]\tF(X[i])\n");
  for i =1:n
    fprintf("\t%.3f\t%.3f\n",A(i),Y(i));
  endfor
  #return value
  x = A;
  y = Y;
  length = n;
endfunction
