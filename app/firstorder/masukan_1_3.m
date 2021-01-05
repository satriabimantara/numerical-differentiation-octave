
























function masukan_1_3()
  [x,y,panjang] = data;
   x0 = double(input("\nMasukan nilai x yang dicari >> "));
   [hasil,namaMetode,kompleksitas,ada]= prosesturunanpertama(x0,x,y,panjang);
   fprintf("KOMPLEKSITAS\n");
   fprintf("1.O(h)\n");
   fprintf("2.O(h^2)\n");
   fprintf("3.O(h^4)\n");
   pil = input("\nMasukan pilihan >> ");
   if pil == 1
     pil = "O(h)";
   elseif pil ==2
     pil = "O(h^2)";
   elseif pil==3
     pil = "O(h^4)";
   else
     fprintf("Pilihan tidak ada di dalam menu!");
     animasi();
     menu();
   endif
   
   if ada == 1
    bool=0;
    fprintf("\n\tTURUNAN PERTAMA f`(%.3f) : \n",x0);
    fprintf("\tKompleksitas %s >> \n\n",pil);
    fprintf("\tMETODE\t\tHASIL\n");
    for i = 1:length(hasil)
      if strcmp(pil,kompleksitas{i}) == 1
        fprintf("\t%s",namaMetode{i});
        fprintf(" %s",kompleksitas{i});
        fprintf("\t%.4f\n",hasil(i));
        bool=1;
        break;
      endif
    endfor
    #Jika setelah dicari di cell kompleksitas tidak ada,
    if bool == 0
      fprintf("\n\n\tKompleksitas %s tidak dapat diterapkan pada titik %.3f\n",pil,x0);
      animasi();
    endif
  else
    fprintf("Tidak ada penyelesaian, mungkin interval beda atau diluar range array!\n");
    animasi();
  endif
endfunction
