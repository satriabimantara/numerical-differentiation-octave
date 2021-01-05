function [hasil,namaMetode,kompleksitas,ada]= prosesturunanpertama(x0,x,y,length)
  hasil = []; #Output setiap metode
  namaMetode = {};
  kompleksitas = {};
  index = 1; #index untuk array hasil dan namaMetode
  ada = 1;
  if x0 == x(1)
    #Jika x0 didepan metode yang dapat dikerjakan
    if x(2) != "\0"
      h = x(2) - x(1);
      #1. Maju O(h)
      namaMetode(index) = "Maju";
      kompleksitas(index) = "O(h)";
      hasil(index) = (y(2) - y(1))/h;
      index++;
      #2. Maju O(h^2)
      namaMetode(index) = "Maju";
      kompleksitas(index) = "O(h^2)";
      hasil(index) = (-3*y(1) + 4*y(2) - y(3))/2*h;
      index++;
    endif
  elseif x0 == x(length)
    h = x(length) - x(length-1);
    #Jika x0 dipaling belakang, metode yang dapat dikerjakan
    #1. Mundur O(h)
      namaMetode(index) = "Mundur";
      kompleksitas(index) = "O(h)";
      hasil(index) = (y(length) - y(length-1))/h;
      index++;
    
  elseif (x0 > x(1)) && (x0 < x(length))
    #Jika x0 terletak diantara dua data dan nilai h sama
    #,metode yang dapat dikerjakan
    #A B C D E F G --> uji data diantara A dan C dan apakah itu B? dst
      #1. Maju O(h)
      #2. Mundur O(h)
      #3. Pusat O(h^2) jika nilai h sama
      #4. Jika (poss+2) !=NULL --> maju O(h^2)
      #5. Jika (poss+2) !=NULL && (poss-2) !=NULL --> pusat O(h^4)
    #A B C D E F G --> uji data diantara A dan B, dan bukan B
      #3. Pusat O(h^2) jika nilai h sama
      
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
    if bool == 1
      h = x0 - x(poss-1);
      #1. Maju O(h)
      namaMetode(index) = "Maju";
      kompleksitas(index) = "O(h)";
      hasil(index) = (y(poss+1) - y(poss))/h;
      index++;
      #2. Mundur O(h)
      namaMetode(index) = "Mundur";
      kompleksitas(index) = "O(h)";
      hasil(index) = (y(poss) - y(poss-1))/h;
      index++;
      #3. Pusat O(h^2), nilai H untuk kasus ini sudah pasti sama yaitu 0.2
      namaMetode(index) = "Pusat";
      kompleksitas(index) = "O(h^2)";
      hasil(index) = (y(poss+1) - y(poss-1))/(2*h);
      index++;
      # Uji apakah bisa dikerjakan dengan metode 4 dan 5
      if (poss+2) != length+1;
        if (poss-2) !=0
          #5. Jika (poss+2) !=NULL && (poss-2) !=NULL --> pusat O(h^4)
          namaMetode(index) = "Pusat";
          kompleksitas(index) = "O(h^4)";
          hasil(index) = (-1*y(poss+2)+8*y(poss+1)-8*y(poss-1)+y(poss-2))/(12*h);
          index++;
        else  
          #4. Jika (poss+2) !=NULL --> maju O(h^2)
          namaMetode(index) = "Maju";
          kompleksitas(index) = "O(h^2)";
          hasil(index) = (-3*y(poss) + 4*y(poss+1) - y(poss+2))/(2*h);
          index++;
        endif
      endif
    endif
    
    if bool == 0
     poss = 0;
     #A B C D E F G --> uji data diantara A dan B, dan bukan B
      for i = 1:length-1
        if (x0 > x(i)) && (x0 < x(i+1))
          poss=i;
          break;
        endif
      endfor
      #Uji nilai h, apakah intervalnya sama
      a = x0 - x(poss);
      b = x(poss+1) - x0;
      #eps(1) = 2.2204 x 10^-16
      #eps(2) = 4.4409 x 10 ^ -16
      #dst
      #Setiap data diubah maka, eps harus menyesuaikan
      if abs(a-b)<=eps(2) # avoid comparasion between floating number
        #3. Metode pusat O(h^2) jika nilai h sama
        namaMetode(index) = "Pusat";
        kompleksitas(index) = "O(h^2)";
        h = x0 - x(poss);
        hasil(index) = (y(poss+1)-y(poss))/(2*h);
        index++;
      else
        ada = 0;
      endif
    endif 
  else
    #Jika x0 berada di luar rentang array
    #tampilkan pesan tidak bisa dicari turunan pada titik tersebut
    fprintf("Data tidak dapat dicari turunannya pada titik %.3f\n",x0);
    ada = 0;
    #2. Uji data jika terletak di luar range array
  endif
endfunction
