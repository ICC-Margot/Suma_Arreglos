with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure Main is
   arreglo : array (1..500000) of Integer;


   task sumaA;
   task sumaB;
   task sumaC;
   task sumaD;

    task sumaT is
      entry valor (b:Integer);
   end sumaT;

   task body sumaA is
      s: Integer:= 0;
     begin
        for i in 1..2000 loop
          s:= arreglo(i)+s;
      end loop;
      sumaT.valor(s);
   end sumaA;

   task body sumaB is
      s1: Integer:= 0;
     begin
        for i in 2001..3000 loop
          s1:= arreglo(i)+s1;
        end loop;
      sumaT.valor(s1);
   end sumaB;

   task body sumaC is
      s2: Integer:= 0;
     begin
        for i in 3001..4000 loop
          s2:= arreglo(i)+s2;
        end loop;
      sumaT.valor(s2);
   end sumaC;

   task body sumaD is
      s3: Integer:= 0;
     begin
        for i in 4001..5000 loop
          s3:= arreglo(i)+s3;
        end loop;
      sumaT.valor(s3);
   end sumaD;

   task body sumaT is
      T:array (0..4) of Integer;
      i:Integer:=0;
      r:Integer:=0;
   begin
      loop
        accept valor (b:Integer) do
            T(i):=b;
            i:=i+1;
        end valor;
       exit when i=5;
      end loop;

      for i in 0..4 loop
          r:= T(i)+r;
        end loop;
      Put(r);
   end sumaT;


begin
   Put_Line("Llenado de Arreglo");
   for i in 1..500000 loop
             arreglo(i):=1;
   end loop;
   null;
end Main;
