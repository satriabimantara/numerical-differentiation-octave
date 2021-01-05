
























function masukan
  [x,y,panjang] = data;
  x0 = double(input("\nMasukan nilai x yang dicari >> "));
  [hasil,namaMetode,kompleksitas,ada]= prosesturunankedua(x0,x,y,panjang);
  if ada == 1
    fprintf("\n\tTURUNAN KEDUA f``(%.3f) : \n",x0);
    fprintf("\tSemua metode yang mungkin >> \n\n");
    fprintf("\tMETODE\t\tHASIL\n");
    for i = 1:length(hasil)
      fprintf("\t%s",namaMetode{i});
      fprintf(" %s",kompleksitas{i});
      fprintf("\t%.4f\n",hasil(i));
    endfor
  else
    fprintf("Tidak ada penyelesaian !\n");
    animasi();
  endif
endfunction

