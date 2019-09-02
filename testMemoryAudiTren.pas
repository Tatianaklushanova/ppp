unit testMemoryAudiTren;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MPlayer, ExtCtrls, Grids, StdCtrls, Math;

type
  TfmTestMemoryAudiTren = class(TForm)
    Timer1: TTimer;
    Timer2: TTimer;
    MediaPlayer1: TMediaPlayer;
    StringGrid1: TStringGrid;
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    Timer3: TTimer;
    Button1: TButton;
    procedure FormShow(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure Timer3Timer(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

Const word_nach: array[0..5] of string[9] =('Театр','Молоко','Отец',
                                           'Сказка','Собака','Торт');
var
  fmTestMemoryAudiTren: TfmTestMemoryAudiTren;
  Count, TotalCount, Time: smallint;
  Vibor : array[0..2] of array[0..3] of boolean;

implementation

{$R *.dfm}

// открытие формы

procedure TfmTestMemoryAudiTren.FormShow(Sender: TObject);
var i,j :smallint;
path0: string;
begin
  StringGrid1.Width:= StringGrid1.DefaultColWidth*4+StringGrid1.GridLineWidth*3;
  StringGrid1.Height:= StringGrid1.DefaultRowheight*3+StringGrid1.GridLineWidth*2;
   StringGrid1.Top:= (ClientHeight - StringGrid1.Height) div 2;;
   StringGrid1.Left:=(ClientWidth - StringGrid1.Width) div 2;
   Label1.Left:= StringGrid1.Left;
   Edit1.Left:= Label1.Left+Label1.Width+7;
   Label2.Left:= Label1.Left+Label1.Width+ Edit1.Width+15;
   Label1.Top:= StringGrid1.Top - 120;
   Label2.Top:= Label1.Top;
   Edit1.Top:= Label1.Top-7;
   Button1.Top:= StringGrid1.Top + StringGrid1.Height + 40;
   Button1.Left:= (ClientWidth - Button1.Width) div 2;

   StringGrid1.Visible:=false;
   Timer1.Enabled:=true;
   Count:=0; TotalCount:=0;  Time:=30;
   Button1.Visible:=false;
   path0:=ExtractFilePath(ParamStr(0));
   i:=Length(path0)-1;
   while path0[i]<>'\' do Dec(i);
   path0:=Copy(path0,1,i)+'MP3\';
   MediaPlayer1.FileName:= path0+'tren.mp3';

   For i:=0 to 2 do
     For j:=0 to 3 do
        Vibor[i][j]:=false;

   MediaPlayer1.Open;
   MediaPlayer1.Play;
end;

//  1 таймер завершение минуты - формирование таблицы

procedure TfmTestMemoryAudiTren.Timer1Timer(Sender: TObject);
const word : array[0..11] of string[9] =('Театр','Молоко','Отец','Сказка',
          'Собака','Торт','Ребенок','Песок','Звезда','Бинт','Голос','Обед');
 probel: string =' ';
var i,k, ii,jj,nn,res : smallint;
 MA : array[0..11] of  smallint;

begin
 Timer1.Enabled:=False;
 Timer2.Enabled:=true;
 Timer3.Enabled:=true;
 Label1.Visible:=true;
 Label2.Visible:=true;
 Edit1.Visible:=true;
 Button1.Visible:=true;
 Edit1.Text:= IntTostr(Time);
 MediaPlayer1.Close;

 For i:=0 to 11 do MA[i]:=i;
   Randomize;
   For i:=0 to 11 do begin
       nn:=Random(11-i);
       If (nn <> 11-i) then begin
         res:=MA[nn];
         MA[nn]:=MA[11-i];
         MA[11-i]:=res;
       end;
   end;
   For k:=0 to 11 do  begin
       ii:= MA[k] div 4;
       jj:= MA[k] mod 4;
       StringGrid1.Cells[jj,ii]:= probel+word[k];
   end;
   StringGrid1.Visible:=true;
end;

//  выбор слова в таблице

procedure TfmTestMemoryAudiTren.StringGrid1SelectCell(Sender: TObject;
  ACol, ARow: Integer; var CanSelect: Boolean);
const  probel: string=' ';
var i:smallint;
var pr: boolean;

  begin
  pr:=false;
  For i:=0 to 5 do
      If (StringGrid1.Cells[ACol,ARow] = (probel+word_nach[i])) then begin
         if  Vibor[ARow][ACol] then begin
             if(TotalCount<=6) then begin
                 Vibor[ARow][ACol]:= false;
                 dec(TotalCount);
                 dec(Count)
              end;
          end
          else  begin
             if(TotalCount<6) then begin
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
          if (TotalCount<=6) then begin
              dec(TotalCount);
              Vibor[ARow][ACol]:= false;
              end;
      end
      else   begin
      if (TotalCount<6) then begin
             inc(TotalCount);
             Vibor[ARow][ACol]:= true;
             end;
      end;
end;

//  отрисовка фона в таблице

procedure TfmTestMemoryAudiTren.StringGrid1DrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
var i,j:smallint;
  begin
  with stringGrid1.Canvas do
  begin
     For i:=0 to 2 do
        For j:=0 to 3 do  begin
           if ((aRow = i) and (aCol = j)) then
              if Vibor[aRow][aCol] then Brush.Color := clSkyBlue
              else  Brush.Color := clWindow;
              Font.Color := clBlack;
           FillRect (Rect);
           TextRect(Rect, Rect.Left, Rect.Top, stringGrid1.cells[ACol, ARow]);
      end;
  end;
end;

//  2 таймер завершение 2 минуты - результат

procedure TfmTestMemoryAudiTren.Timer2Timer(Sender: TObject);
var tren: double;
begin
  Timer2.Enabled:=False;
  Timer3.Enabled:=False;
  tren:= RoundTo(Count/6*100,-1);
  Label1.Visible:=false;
  Label2.Visible:=false;
  Edit1.Visible:= False;
  Button1.Visible:= False;
  StringGrid1.Visible:=false;
  application.MessageBox(PChar('Количество верных ответов: '+IntToStr(Count)+','
   +#10+#13+'Результат: '+ FloatToStr(tren)+'%'),'Тестирование окончено',MB_ICONINFORMATION);
  Close;
end;

// 3 таймер 1 сек

procedure TfmTestMemoryAudiTren.Timer3Timer(Sender: TObject);
begin
 dec(Time);
 Edit1.Text:= IntTostr(Time);
end;

// Завершить по кнопке

procedure TfmTestMemoryAudiTren.Button1Click(Sender: TObject);
var tren: double;
begin
  Timer2.Enabled:=False;
  Timer3.Enabled:=False;
  tren:= RoundTo(Count/6*100,-1);
  Label1.Visible:=false;
  Label2.Visible:=false;
  Edit1.Visible:= False;
  Button1.Visible:= False;
  StringGrid1.Visible:=false;
  application.MessageBox(PChar('Количество верных ответов: '+IntToStr(Count)+','
   +#10+#13+'Результат: '+ FloatToStr(tren)+'%'),'Тестирование окончено',MB_ICONINFORMATION);
  Close;
end;

end.
