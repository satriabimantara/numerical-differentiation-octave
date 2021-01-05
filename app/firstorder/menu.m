
function menu()
  clear
  clc
  fprintf("\tTURUNAN PERTAMA\n");
  fprintf("\t  MENU PROGRAM\n\n");
  fprintf("1. Masukan big O yang pasti\n");
  fprintf("2. Tampilkan semua kemungkinan big O\n");
  fprintf("3. Masukan sembarang big O dan uji\n");
  pilihan = input("\ninput pilihan >> ");
  fprintf("\n");
  if pilihan == 1 || pilihan ==3
   fprintf("\n");
   masukan_1_3();
   
  elseif pilihan == 2
    fprintf("\n");
    masukan();
  else
    fprintf("Pilihan tidak ada di dalam menu\n");
    fprintf("Silahkan inputkan ulang!\n\n");
    animasi();
    menu();
  endif
endfunction
