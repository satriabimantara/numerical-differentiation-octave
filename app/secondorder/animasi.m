function animasi
  #Animasi untuk menampilkan titik-titik waiting
    fprintf("Please wait");
     for i=0:7
       pause(0.5);
       fprintf(".");
     endfor
     menu();
endfunction
