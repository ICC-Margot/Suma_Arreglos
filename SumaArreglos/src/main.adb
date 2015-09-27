with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure Main is
   n,s,i:Integer:= 0;
   arreglo : array (0..5000) of Integer;

   task sumaA is
      entry valor (id:Integer);
   end sumaA;

   task sumaB is
      entry valor (b:Integer);
   end sumaB;

   task body sumaA is
      i: Integer:=0;
   begin
      n:=0;
      accept valor(id:Integer) do
         s:=id;
      end valor;
      loop
         n:=n+s;
         i:= i + 1;
         exit when i=1000;
      end loop;
      sumaB.valor (n);
   end sumaA;

   task body sumaB is
      t:Integer:=0;
   begin
      loop
        accept valor (b:Integer) do
            s:=n;
            t:=t+s;
         end valor;
         i:=i+1;
       exit when i=5;
      end loop;
      Put(t);
   end sumaB;

   --tarea1, tarea2, tarea3:tarea;
begin
   for i in 0..2000 loop
      arreglo(i):=1;
   end loop;

end Main;
