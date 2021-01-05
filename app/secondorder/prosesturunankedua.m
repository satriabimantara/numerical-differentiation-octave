
















































function [hasil,namaMetode,kompleksitas,ada]= prosesturunankedua(x0,x,y,length)
  hasil = []; #Nilai output setiap metode
  namaMetode = {}; #nama metode yang digunakan dalam bentuk cell
  kompleksitas = {};
  index = 1; #index untuk array hasil dan namaMetode
  ada = 1;
  if x0 == x(1)
    #Jika x0 didepan metode yang dapat dikerjakan
    #1. Maju O(h) --> Uji jika ada dua data didepan bisa dikerjakan
    if x(2) != "\0" && x(3) != "\0"
      h = x(2) - x(1);
      namaMetode(index) = "Maju";
      kompleksitas(index) = "O(h)";
      hasil(index) = (y(3) - 2*y(2) + y(1))/(h^2);
      index++;
      if  x(4) != "\0"
        #2. Maju O(h2) --> uji jika ada 3 data didepan bisa dikerjakan
        namaMetode(index) = "Maju";
        kompleksitas(index) = "O(h^2)";
        hasil(index) = (-y(4) + 4*y(3) - 5*y(2) + 2*y(1))/(12*(h^2));
        index++;
      endif
    endif
  
  elseif x0 == x(length)
    h = x(length) - x(length-1);
    #Jika x0 dipaling belakang, metode yang dapat dikerjakan
    #1. Mundur O(h)
    namaMetode(index) = "Mundur";
    kompleksitas(index) = "O(h)";
    hasil(index) = (y(length-2) - 2*y(length-1) + y(length))/(h^2);
    index++;
    
  elseif (x0 > x(1)) && (x0 < x(length))
    #Jika x0 terletak diantara dua data dan nilai h sama
    #,metode yang dapat dikerjakan
    #A B C D E F G --> uji data diantara A dan C dan apakah itu B? dst
      #1. Central O(h^2)
      #2. Mundur O(h) --> jika terdapat 2 data sebelum x0
      #3. Maju O(h) --> Jika terdapat 2 data sesudah x0
      #4. Maju O(h^2) --> Jika terdapat 3 data sesudah x0
      #5. Pusat O(h^4) --> Jika ada dua data sebelum dan dua data sesudah x0
    #A B C D E F G --> uji data diantara A dan B, dan bukan B
      #Tidak ada metode yang bisa dikerjakan, kembalikan ada = 0;
      
    #===========================================
    #A B C D E F G --> uji data diantara A dan C dan apakah itu B? dst
    bool=0;
    poss = 0;
    for i=2:length-1
      if x0 == x(i)
        poss = i;
        bool=1;
      endif
    endfor
    #Jika iya B C D E ... length -1
    if bool == 1
      h = x0 - x(poss-1);
      #Variabel untuk mengecek dua data sebelum dan dua data sesudah
      bool2after = 0;
      bool2before = 0;
      #1. Central O(h^2)
      namaMetode(index) = "Pusat";
      kompleksitas(index) = "O(h^2)";
      hasil(index) = (y(poss+1) - 2*y(poss) + y(poss-1))/h;
      index++;
      #2. Mundur O(h)
        #uji jika ada dua data sebelum x0 (jika poss-2 ga sama dengan indeks awal)
      if (poss-2) >= 1
        namaMetode(index) = "Mundur";
        kompleksitas(index) = "O(h)";
        hasil(index) = (y(poss) - 2*y(poss-1) + y(poss-2))/(h^2);
        index++;
        bool2before=1; # ada dua data sebelum x0
      endif
      
      #3. Maju O(h)
        #uji jika ada dua data sesudah x0 (jika poss+2 ga sama dengan indeks akhir)
      if (poss+2) <= length
        namaMetode(index) = "Maju";
        kompleksitas(index) = "O(h)";
        hasil(index) = (y(poss) - 2*y(poss+1) + y(poss+2))/(h^2);
        index++;
        bool2after = 1; #ada dua data sesudah x0
        #4. Maju O(h^2)
          #uji jika ada tiga data sesudah x0 (jika poss+3 ga sama dengan indeks akhir)
          if (poss+3) <= length
            namaMetode(index) = "Maju";
            kompleksitas(index) = "O(h^2)";
            hasil(index) = (2*y(poss) - 5*y(poss+1) + 4*y(poss+2) - y(poss+3))/(12*(h^2));
            index++;
          endif
      endif
      #5. Pusat O(h^4)
        #Jika ada 2 data sebelum dan sesudah x0
      if (bool2after==1) && (bool2before==1)
        namaMetode(index) = "Pusat";
        kompleksitas(index) = "O(h^4)";
        hasil(index) = (-30*y(poss) - y(poss+2) + 16*y(poss+1) + 16*y(poss-1) - y(poss-2))/(12*(h^2));
        index++;
      endif
    endif
    
    if bool == 0
      #Jika A B C D E .. dan x0 berada di antara A dan B, maka tidak ada
      #metode yang bisa dikerjakan
     ada = 0;
    endif 
  else
    #Jika x0 berada di luar rentang array
    #tampilkan pesan tidak bisa dicari turunan pada titik tersebut
    fprintf("Data tidak dapat dicari turunannya pada titik %.3f\n",x0);
    ada = 0;
    #2. Uji data jika terletak di luar range array
  endif
endfunction
