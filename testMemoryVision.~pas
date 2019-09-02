unit testMemoryVision;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, ExtCtrls, common, Math;

type
  TfmTestMemoryVision = class(TForm)
    Memo1: TMemo;
    StringGrid1: TStringGrid;
    Timer1: TTimer;
    Timer2: TTimer;
    Timer3: TTimer;
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Button1: TButton;
    Button3: TButton;
    procedure FormShow(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure Timer2Timer(Sender: TObject);
    procedure Timer3Timer(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    
  private

public
  pr_tip:boolean;   // тип теста: 0 - тренировка, 1 - тест
    { Public declarations }
  end;

Const word_nach: array[0..11] of string[9] =('Молоток','Лампа','Авария','Книга',
        'Завод','Машина','Шахта','Окно','Шляпа','Гвоздь','Вода','Пожар');

var

  fmTestMemoryVision: TfmTestMemoryVision;
  Count, TotalCount, Time: smallint;
  Vibor : array[0..3] of array[0..5] of boolean;
 
implementation

{$R *.dfm}

procedure TfmTestMemoryVision.FormShow(Sender: TObject);
var i,j :smallint;
 begin
  StringGrid1.Width:= StringGrid1.DefaultColWidth*6+StringGrid1.GridLineWidth*5;
  StringGrid1.Height:= StringGrid1.DefaultRowheight*4+StringGrid1.GridLineWidth*3;
   StringGrid1.Top:= (ClientHeight - StringGrid1.Height) div 2;
   StringGrid1.Left:=(ClientWidth - StringGrid1.Width) div 2;
   Label1.Left:= StringGrid1.Left;
   Edit1.Left:= Label1.Left+Label1.Width+7;
   Label2.Left:= Label1.Left+Label1.Width+ Edit1.Width+15;
   Label1.Top:= StringGrid1.Top - 120;
   Label2.Top:= Label1.Top;
   Edit1.Top:= Label1.Top-7;
   Memo1.Left:=(ClientWidth - Memo1.Width) div 2;
   Memo1.Top:= (ClientHeight - Memo1.Height) div 2;
   Button1.Top:= StringGrid1.Top + StringGrid1.Height + 40;
   Button1.Left:= (ClientWidth - Button1.Width) div 2;
   Button3.Top:=5;
   Button3.Left:=ClientWidth-Button3.Width-5;

   Label1.Visible:=false;
   Label2.Visible:=false;
   Edit1.Visible:=false;
   StringGrid1.Visible:=false;
   Memo1.Visible:=true;
   Timer1.Enabled:=true;
   Count:=0;  TotalCount:=0; Time:=60;  

   For i:=0 to 3 do
     For j:=0 to 5 do
        Vibor[i][j]:=false;
  
 end;


procedure TfmTestMemoryVision.Timer1Timer(Sender: TObject);
const word : array[0..23] of string[9] =('Молоток','Лампа','Авария','Книга','Завод','Машина',
 'Шахта','Окно','Шляпа','Гвоздь','Вода','Пожар',
 'Дружба','Голос','Взрыв','Автобус','Война','Цветок',
 'Тетрадь','Топор','Солнце','Носилки','Дерево','Сирена');
 probel: string =' ';

var i,k, ii, jj,nn,res : smallint;
 MA : array[0..23] of  smallint;

 begin
 Timer1.Enabled:=False;
 Memo1.Visible:=false;
 Timer2.Enabled:=true;
 Timer3.Enabled:=true;
 Label1.Visible:=true;
 Label2.Visible:=true;
 Edit1.Visible:=true;
 Button1.Visible:= true;
 Edit1.Text:= IntTostr(Time);

 For i:=0 to 23 do MA[i]:=i;
   Randomize;
   For i:=0 to 23 do begin
       nn:=Random(23-i);
       If (nn <> 23-i) then begin
         res:=MA[nn];
         MA[nn]:=MA[23-i];
         MA[23-i]:=res;
       end;
   end;
   For k:=0 to 23 do  begin
       ii:= MA[k] div 6;
       jj:= MA[k] mod 6;
       StringGrid1.Cells[jj,ii]:= probel+word[k];
   end;
   StringGrid1.Visible:=true;
end;

// отрисовка фона в таблице

procedure TfmTestMemoryVision.StringGrid1DrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
  var i,j:smallint;
begin
  with stringGrid1.Canvas do
  begin
     For i:=0 to 3 do
        For j:=0 to 5 do  begin
           if ((aRow = i) and (aCol = j)) then
              if Vibor[aRow][aCol] then Brush.Color := clSkyBlue
              else  Brush.Color := clWindow;
              Font.Color := clBlack;
           FillRect (Rect);
           TextRect(Rect, Rect.Left, Rect.Top, stringGrid1.cells[ACol, ARow]);
      end;
  end;
end;

// выбор слова в таблице

procedure TfmTestMemoryVision.StringGrid1SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
  const  probel: string=' ';
  var i:smallint;
  var pr: boolean;
begin
   pr:=false;
   For i:=0 to 11 do
       If (StringGrid1.Cells[ACol,ARow] = (probel+word_nach[i])) then begin
          if  Vibor[ARow][ACol] then begin
              if(TotalCount<=12) then begin
                 Vibor[ARow][ACol]:= false;
                 dec(TotalCount);
                 dec(Count)
              end;
          end
          else  begin
             if(TotalCount<12) then begin
                Vibor[ARow][ACol]:=true;
                inc(TotalCount);
                inc(Count)
             end;
          end;
     pr:= true;
     break;
     end;

  if (not pr)  then
      if Vibor[ARow][ACol]  then  begin
          if (TotalCount<=12) then begin
              dec(TotalCount);
              Vibor[ARow][ACol]:= false;
              end;
      end
      else   begin
      if (TotalCount<12) then begin
             inc(TotalCount);
             Vibor[ARow][ACol]:= true;
             end;
      end;
end;

// окончание периода выбора слов (2 таймер)

procedure TfmTestMemoryVision.Timer2Timer(Sender: TObject);
begin
  Timer2.Enabled:=False;
  Timer3.Enabled:=False;
  RezTest:= RoundTo(Count/12*100,-1);
  if RezTest >= 75 then Ball:=5;
  if (RezTest >= 58.3)AND(RezTest <= 74.9) then Ball:=4;
  if (RezTest >= 50)AND(RezTest <= 58.2) then Ball:=3;
  if (RezTest >= 41.6)AND(RezTest <= 49.9) then Ball:=2;
  if RezTest <= 41.5 then Ball:=1;
  Label1.Visible:=false;
  Label2.Visible:=false;
  Edit1.Visible:= False;
  Button1.Visible:= False;
  StringGrid1.Visible:=false;

  application.MessageBox(PChar('Количество верных ответов: '+IntToStr(Count)+
   #10+#13+'Результат: '+ FloatToStr(RezTest)+'%'+
   #10+#13+'Баллы: '+ IntToStr(Ball)),'Тест окончен',MB_ICONINFORMATION);
  Close;
end;

  //  3 таймер - время,оставшееся до окончания 1 минуты

procedure TfmTestMemoryVision.Timer3Timer(Sender: TObject);
begin
  dec(Time);
  Edit1.Text:= IntTostr(Time);
end;

procedure TfmTestMemoryVision.Button3Click(Sender: TObject);
begin
  If MessageDlg('Вы уверены, что хотите прервать тест?',mtConfirmation,[mbOK,mbCancel],0)=mrOK
    Then  begin
     Timer1.Enabled:=False;
     Timer2.Enabled:=False;
     Timer3.Enabled:=False;
     RezTest:=0;
     Ball:=0;
     Close;
   end;
end;

procedure TfmTestMemoryVision.FormMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  // проверка видимости кнопки "прервать тест"
  If ((BorderIcons=[]) and (y>=Button3.Top)and(y<Button3.Top+Button3.Height)and
      (x>=Button3.Left)and(x<Button3.Left+Button3.Width))
    Then Button3.Visible:=true
    Else Button3.Visible:=false;

end;

end.
