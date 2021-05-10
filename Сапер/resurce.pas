unit resurce;

interface
uses
  GraphABC,ABCObjects;


procedure Res_Load();
procedure MouseDown(x,y,mb: integer);
procedure RandomPole();
function MyButtonClick(X,Y,SX,SY,mx,my,mb:integer):boolean;
procedure Calcpole();
procedure Calchole();
procedure Win();
procedure The_End();

implementation
uses Saper;

procedure Win();
var
  I,X:integer;
begin
X:=0;  
  for I:=0 to 99 do
    begin
      if (Mass[I]<>9) and (myB[I].chek=true) then begin
        X:=X+1;
      end;
    end;
    If X=90 then begin
        font.Color:=clBlue;
        font.Size:=40;        
        textout(50,130,'Победа!'); 
        Gamemode:=true;        
    end;
end;

procedure The_End();
var
  I:integer;
begin
  for I:=0 to 99 do
    begin
      if (Mass[I]=9) and (myB[I].chek=true) then begin
        font.Color:=clred;
        font.Size:=40;
        textout(20,130,'Поражение!');
        Gamemode:=true;
      end;
    end;  
end;

procedure Res_Load();
var
 I:integer;
begin
    window.Height:=352; 
    window.Width:=320;   
    window.Caption:='Сапер';
    window.IsFixedSize:=true; 
    
    n[1]:=Picture.Create('resurce\bclear.png');
    n[1].Load('resurce\bclear.png');
    
    n[2]:=Picture.Create('resurce\b1.png');
    n[2].Load('resurce\b1.png'); 
    
    n[3]:=Picture.Create('resurce\b2.png');
    n[3].Load('resurce\b2.png');
    
    n[4]:=Picture.Create('resurce\b3.png');
    n[4].Load('resurce\b3.png');       

    n[5]:=Picture.Create('resurce\b4.png');
    n[5].Load('resurce\b4.png');     
    
    n[6]:=Picture.Create('resurce\b5.png');
    n[6].Load('resurce\b5.png'); 
    
    n[7]:=Picture.Create('resurce\b6.png');
    n[7].Load('resurce\b6.png');    

    n[8]:=Picture.Create('resurce\b7.png');
    n[8].Load('resurce\b7.png');
    
    n[9]:=Picture.Create('resurce\b8.png');
    n[9].Load('resurce\b8.png');        
    
    n[10]:=Picture.Create('resurce\bb.png');
    n[10].Load('resurce\bb.png');
    
    n[11]:=Picture.Create('resurce\Smile.png');
    n[11].Load('resurce\Smile.png');  
    
    n[12]:=Picture.Create('resurce\bnoch.png');
    n[12].Load('resurce\bnoch.png');  
    
    n[13]:=Picture.Create('resurce\flag.png');
    n[13].Load('resurce\flag.png');    
    
end;

procedure MouseDown(x,y,mb: integer);
var 
  b:boolean;
  I,gab:integer;
begin


if GameMode=false then begin  
  for I:=0 to 99 do
    begin
      if mb=1 then begin 
      b:=MyButtonClick(myB[I].X,myB[I].Y,32,32,x,y,mb);
        if b=true then  
          begin 
             myB[I].chek:=true;             
          end;                    
    end;      
      if mb=2 then begin 
        b:=MyButtonClick(myB[I].X,myB[I].Y,32,32,x,y,mb);
        if b=true then  
          begin 
             if myB[I].chek<>true then begin
              if myB[I].flag=true then begin
                myB[I].flag:=false;             
                Calcpole();
                end else
                begin
                  myB[I].flag:=true; 
                end;
             end;          
          end;           
        end;      
     end;
    end;  
       
   b:=MyButtonClick(20,0,32,32,x,y,mb); 
     if b=true then  
       begin              
           window.clear;
           RandomPole();  
           Calcpole();
           n[11].Draw(20,0,0,32,32);
           Gamemode:=false;
           sec:=0;
           min:=0;
          end;       
  DrawPoleSapera();
end;

procedure RandomPole();
var 
  I,O,P,k:integer;
  chisla:array[0..9] of integer; 
begin
  i:=0;
  randomize;
  while I<10 do
    begin
      chisla[i] := random(100);
      for k := 0 to i - 1 do
        begin
            if chisla[i] = chisla[k] then I:=I-1;
        end;
      i:=i+1;
    end;
  for I:=0 to 99 do
    for O:=0 to 9 do
      begin
        Mass[I]:=0;  
      end; 
  for I:=0 to 99 do
    for O:=0 to 9 do
      begin
        if I= chisla[O] then Mass[I]:=9;  
      end;    
P:=0;
  for I:=0 to 9 do
    for O:=0 to 9 do
      begin
        myB[P].x:=I*32;
        myB[P].y:=O*32+32;
        myB[P].sx:=32;
        myB[P].sy:=32;
        myB[P].chek:=false;
        myB[P].flag:=false;
        if Mass[P]=9 then myB[P].bomb:=true;
        if Mass[P]<>9 then myB[P].bomb:=false;        
       P:=P+1;      
      end;
end;

function MyButtonClick(X,Y,SX,SY,mx,my,mb:integer):boolean;
begin 
  if(mx>=x)and(mx<=x+sx)and(my>=y)and(my<=y+sy) then
    begin
      result:=true;
    end
    else
    begin
      result:=false;
    end;       
end;

procedure Calcpole();
var I:integer;
B:integer;
begin
  B:=0;
 for I:=0 to 99 do
 begin
   
if Mass[I]<>9 then begin 

     if (I=0) then begin
       If mass[I+1]=9 then B:=B+1; 
       If mass[I+11]=9  then B:=B+1;        
       If mass[I+10]=9  then B:=B+1;        
       mass[I]:=B;
       B:=0;
     end;     
     if (I=9) then begin
       If mass[I-1]=9 then B:=B+1; 
       If mass[I+9]=9  then B:=B+1;        
       If mass[I+10]=9  then B:=B+1;        
       mass[I]:=B;
       B:=0;       
     end;      
     if (I=99) then begin
       If mass[I-1]=9 then B:=B+1; 
       If mass[I-10]=9  then B:=B+1;        
       If mass[I-11]=9  then B:=B+1;        
       mass[I]:=B;
       B:=0;         
     end;      

     if (I=90) then begin
       If mass[I+1]=9 then B:=B+1; 
       If mass[I-10]=9  then B:=B+1;        
       If mass[I-9]=9  then B:=B+1;        
       mass[I]:=B;
       B:=0;         
     end;  
   
     if (I<9) and (I>0) then begin
       If mass[I+1]=9 then B:=B+1; 
       If mass[I-1]=9  then B:=B+1;         
       If mass[I+9]=9  then B:=B+1;
       If mass[I+10]=9  then B:=B+1;       
       If mass[I+11]=9  then B:=B+1;        
       mass[I]:=B;
       B:=0;         
     end;
      if (I<99) and (I>90) then begin
       If mass[I+1]=9 then B:=B+1; 
       If mass[I-1]=9  then B:=B+1;         
       If mass[I-9]=9  then B:=B+1;
       If mass[I-10]=9  then B:=B+1;       
       If mass[I-11]=9  then B:=B+1;        
       mass[I]:=B;
       B:=0;         
     end;    

      if (I=10) or (I=20) or (I=30) or (I=40) or (I=50) or (I=60) or (I=70) or (I=80)  then begin
       If mass[I+1]=9 then B:=B+1;        
       If mass[I+10]=9  then B:=B+1;
       If mass[I-10]=9  then B:=B+1;       
       If mass[I-9]=9  then B:=B+1; 
       If mass[I+11]=9  then B:=B+1;        
       mass[I]:=B;
       B:=0;           
     end;  

      if (I=19) or (I=29) or (I=39) or (I=49) or (I=59) or (I=69) or (I=79) or (I=89)  then begin
       If mass[I-1]=9 then B:=B+1;        
       If mass[I-10]=9  then B:=B+1;
       If mass[I+10]=9  then B:=B+1;       
       If mass[I+9]=9  then B:=B+1; 
       If mass[I-11]=9  then B:=B+1;        
       mass[I]:=B;
       B:=0;         
     end;  
     
      if   (I<>19) and (I<>29) and (I<>39) and (I<>49) and (I<>59) and (I<>69) and (I<>79) and (I<>89) and (I>9) and (I<90) 
      and  (I<>10) and (I<>20) and (I<>30) and (I<>40) and (I<>50) and (I<>60) and (I<>70) and (I<>80)       then    begin
       If mass[I-1]=9 then B:=B+1; 
       If mass[I+1]=9 then B:=B+1;        
       If mass[I-10]=9  then B:=B+1;
       If mass[I+10]=9  then B:=B+1;       
       If mass[I+11]=9  then B:=B+1; 
       If mass[I-11]=9  then B:=B+1; 
       If mass[I+9]=9  then B:=B+1; 
       If mass[I-9]=9  then B:=B+1;        
       
       mass[I]:=B;
       B:=0;          
     end;  
   end;
  end;
end;

procedure Calchole();
var I:integer;
begin 
if gamemode=false then begin   
 for I:=0 to 99 do
 begin
   
if Mass[I]=0 then begin 

     if (I=0) and (myB[I].chek=true) then begin 
       myB[I+1].chek:=true;
       myB[I+11].chek:=true;        
       myB[I+10].chek:=true;        
     end;     
     if (I=9) and (myB[I].chek=true) then begin
       myB[I-1].chek:=true;
       myB[I+9].chek:=true;        
       myB[I+10].chek:=true;             
     end;      
     if (I=99) and (myB[I].chek=true) then begin      
       myB[I-1].chek:=true;
       myB[I-10].chek:=true;        
       myB[I-11].chek:=true;         
     end;      

     if (I=90) and (myB[I].chek=true) then begin       
       myB[I+1].chek:=true;
       myB[I-10].chek:=true;        
       myB[I-9].chek:=true;     
     end;  
 
     if (I<9) and (I>0) and (myB[I].chek=true) then begin      
       myB[I+1].chek:=true;
       myB[I-1].chek:=true;        
       myB[I+9].chek:=true; 
       myB[I+10].chek:=true;
       myB[I+11].chek:=true;              
     end;
      if (I<99) and (I>90) and (myB[I].chek=true) then begin      
       myB[I+1].chek:=true;
       myB[I-1].chek:=true;        
       myB[I-9].chek:=true; 
       myB[I-10].chek:=true;
       myB[I-11].chek:=true;        
     end;    

      if (I=10) and (myB[I].chek=true) or (I=20) and (myB[I].chek=true) or (I=30) and (myB[I].chek=true) or (I=40) and (myB[I].chek=true) or (I=50) and (myB[I].chek=true)
      or (I=60) and (myB[I].chek=true) or (I=70) and (myB[I].chek=true) or (I=80) and (myB[I].chek=true)  then begin       
       myB[I+1].chek:=true;       
       myB[I+10].chek:=true; 
       myB[I-10].chek:=true;
       myB[I-9].chek:=true;    
       myB[I+11].chek:=true;           
     end;  

      if (I=19) and (myB[I].chek=true) or (I=29) and (myB[I].chek=true) or (I=39) and (myB[I].chek=true) or (I=49) and (myB[I].chek=true)
      or (I=59) and (myB[I].chek=true) or (I=69) and (myB[I].chek=true) or (I=79) and (myB[I].chek=true) or (I=89) and (myB[I].chek=true)  then begin     
       myB[I-1].chek:=true;       
       myB[I-10].chek:=true; 
       myB[I+10].chek:=true;
       myB[I+9].chek:=true;    
       myB[I-11].chek:=true;         
     end; 
     
      if   (I<>19) and (I<>29) and (I<>39) and (I<>49) and (I<>59) and (I<>69) and (I<>79) and (I<>89) and (I>9) and (I<90) 
      and  (I<>10) and (I<>20) and (I<>30) and (I<>40) and (I<>50) and (I<>60) and (I<>70) and (I<>80) and (myB[I].chek=true)  then    begin       
       myB[I-1].chek:=true;       
       myB[I+1].chek:=true;       
       myB[I+10].chek:=true; 
       myB[I-10].chek:=true;
       myB[I-9].chek:=true; 
       myB[I+9].chek:=true;        
       myB[I+11].chek:=true;  
       myB[I-11].chek:=true;         
     end;       
   end;
  end;
DrawPoleSapera();
end;  
end;
end.