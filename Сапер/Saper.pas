uses GraphABC,ABCObjects,Events,resurce,Timers;

type sbutton = record 
  x,y,sx,sy:integer;
  chek,flag,bomb:boolean;
end;


var 
  n:array[0..13] of Picture; 
  mass:array[0..100] of integer; 
  myB:array[0..100] of sbutton;   
  Gamemode:boolean;  
  TWin,Tend,secunds,calcul:Timer; 
  sec,min:integer;   
  
procedure DrawPoleSapera();
var I,O,P:integer;
begin
  P:=0;  
    for I:=0 to 99 do
      begin
        if myB[I].chek=false then begin
         n[12].Draw(myB[I].x,myB[I].Y);            
        end;
        if myB[I].flag=true then n[13].Draw(myB [I].x,myB[I].y);   
        if myB[I].chek=true then begin
        If (Mass[I]=0) then  n[1].Draw(myB[I].x,myB[I].Y);   
        If (Mass[I]=1) then  n[2].Draw(myB[I].x,myB[I].Y);  
        If (mass[I]=2) then  n[3].Draw(myB[I].x,myB[I].Y);
        if (mass[I]=3) then  n[4].Draw(myB[I].x,myB[I].Y);
        if (mass[I]=4) then  n[5].Draw(myB[I].x,myB[I].Y);   
        If (mass[I]=5) then  n[6].Draw(myB[I].x,myB[I].Y);
        if (mass[I]=6) then  n[7].Draw(myB[I].x,myB[I].Y);
        if (mass[I]=7) then  n[8].Draw(myB[I].x,myB[I].Y);          
        If (mass[I]=8) then  n[9].Draw(myB[I].x,myB[I].Y);
        if (mass[I]=9) then  n[10].Draw(myB[I].x,myB[I].Y);
        if (mass[I]=10) then  n[11].Draw(myB[I].x,myB[I].Y);          
        end;         
        end;
end;

procedure Secundomer();
begin
  font.Color:=clblack;
  font.Size:=14;        
  textout(100,10,'Таймер: '+min+' : '+sec+'');
    if GameMode=false then begin       
      sec:=sec+1;
      if sec>59 then begin
        sec:=0;
        min:=min+1;
      end;
    end;

end;

begin
  Gamemode:=false; 
  Res_Load(); 
  RandomPole(); 
  Calcpole();   
  DrawPoleSapera();    
  n[11].Draw(20,0,0,32,32); 
  OnMouseDown:=MouseDown;  

  Tend := Timer.Create(100, Win); 
  Tend.Start;  

  TWin := Timer.Create(100, The_End);  
  TWin.Start;    
  
  secunds := Timer.Create(1000, Secundomer); 
  secunds.Start;  
  
  calcul := Timer.Create(200, Calchole);  
  calcul.Start;    
  
end.