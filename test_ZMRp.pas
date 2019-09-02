unit test_ZMRp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Math,
  DateUtils, Mask, Buttons,
  Common, Config;

type
  TfmTest_ZMRp = class(TForm)
    PaintBox1: TPaintBox;
    Button1: TButton;
    Timer1: TTimer;
    Timer2: TTimer;
    Timer3: TTimer;
    Label2: TLabel;
    Button2: TButton;
    Timer4: TTimer;
    Memo1: TMemo;
    Label1: TLabel;
    Button3: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure Timer3Timer(Sender: TObject);
    procedure PaintBox1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Timer4Timer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
 //   procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
    T0: TDateTime;
    i_colmax,X0,Y0,i_count,errors: smallint;
    minT,maxT,summa: single;
    isLock,isWait,isClick: boolean;
    procedure BeginTest;
    procedure NewTest;
    procedure FillPole;
  public
    { Public declarations }
//    ball: smallint;
  end;

var
  fmTest_ZMRp: TfmTest_ZMRp;

implementation

{$R *.dfm}

const rad=100;

procedure TfmTest_ZMRp.FillPole;
var tr: TRect;
Begin
  TR:=PaintBox1.ClientRect;
  PaintBox1.Canvas.Brush.Color:=clGray;
  PaintBox1.Canvas.FillRect(TR);
//   Memo1.Visible:= true;
End;

procedure TfmTest_ZMRp.NewTest;
var dt: smallint;
Begin
  dt:=Random(cfIntervalMax-cfIntervalMin);
  Timer1.Interval:=dt;
  Timer1.Enabled:=true;
  Inc(i_count);
  isClick:=false;
//  label3.Caption:=IntToStr(i_count)+' isClick=false';
End;

procedure TfmTest_ZMRp.BeginTest;
Begin
  errors:=0; summa:=0; minT:=10000; maxT:=0;
  Randomize;
  i_count:=0;
  isWait:=false; isClick:=false;
//  label3.caption:=IntToStr(i_count)+' isClick=false';
  Timer2.Interval:=cfDelta;
  Timer3.Interval:=cfIntervalMin;
  Timer4.Interval:=cfWaiting; //cfIntervalMin;
  PaintBox1.Canvas.Pen.Color:=clLime;
  PaintBox1.Canvas.Pen.Width:=3;
  PaintBox1.Canvas.Brush.Style:=bsSolid;
  isLock:=false;
  Timer3.Enabled:=true;
//  PaintBox1.Canvas.Brush.Color:=clLime;
End;

procedure TfmTest_ZMRp.Button1Click(Sender: TObject);
begin
  Button1.Visible:=false;
  Button2.Visible:=false;
  Label1.Visible:=false;
  Memo1.Visible:= false;
  BorderIcons:=[];
  PaintBox1.Visible:=true;
  errors:=0;
  x0:=PaintBox1.Width div 2;
  y0:=PaintBox1.Height div 2;
  FillPole;
  If (Sender=Button1) Then i_colmax:=5
  Else begin
    i_colmax:=cfCount;
    Label2.Caption:='';
  end;

  BeginTest;
end;

procedure TfmTest_ZMRp.Timer1Timer(Sender: TObject);
// рисует вспышку
begin
 If not isLock Then begin
  Timer1.Enabled:=false;
  PaintBox1.Canvas.Brush.Color:=clLime;
  PaintBox1.Canvas.Ellipse(x0-rad,y0-rad,x0+rad,y0+rad);
  Timer2.Enabled:=true;
  isWait:=true;
 end;
end;

procedure TfmTest_ZMRp.Timer2Timer(Sender: TObject);
// убирает вспышку
begin
 If not isLock Then begin
  Timer2.Enabled:=false;
  Timer4.Enabled:=true;
  FillPole;
  T0:=now;
 end;
end;

function getBall(T: single): smallint;
var Res: smallint;
begin
  If (T<19.7) Then Res:=5
  Else If (T<24.5) Then Res:=4
  Else If (T<28.3) Then Res:=3
  Else If (T<31.5) Then Res:=2
  Else Res:=1;
  Result:=Res;
end;

procedure TfmTest_ZMRp.Timer3Timer(Sender: TObject);
var pokaz: single;
    Stri: string;
begin
  If not isLock Then begin
    Timer3.Enabled:=false;
    NewTest;

{isWait:=false;
  if (not isClick) Then Inc(errors);
//  If (i_count>=i_colmax+2) Then
  If (i_count>=i_colmax) Then
    begin
      messageBeep(MB_ICONEXCLAMATION);
      if (i_count>errors)and(i_colmax-errors-2>0) Then
        pokaz:=(summa-minT-maxT)/(i_colmax-errors-2)
      Else pokaz:=100;
      stri:=Format('Ошибок: %u, время: %5.2f сс, min: %5.2f, max: %5.2f, итог: %5.2f, оценка: %d'
         ,[Errors,summa,minT,maxT,pokaz,getBall(pokaz)]);
      if (i_colmax=cfCount) then begin
        lResult.Caption:=Stri;
        Panel3.Visible:=true;
      end // это была не тренировка
        Else begin
      if i_count>errors Then begin
        ShowMessage(Stri)
      end
      else ShowMessage('Ой!');
      Label2.Caption:='';
          Button2.Visible:=true;
        end;
    end; // добавлено
 }
 end;
end;

procedure TfmTest_ZMRp.PaintBox1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var T1: TDateTime;
    res: single;
begin
  // проверка видимости кнопки "прервать тест"
  If (PaintBox1.Visible and (y>=Button3.Top)and(y<Button3.Top+Button3.Height)and
      (x>=Button3.Left)and(x<Button3.Left+Button3.Width))
    Then Button3.Visible:=true
    Else Button3.Visible:=false;

  T1:=now;
  res:=MilliSecondSpan(T1,T0)/10;
  If (isWait) Then begin
   If (not isClick) Then begin
    If (i_colmax=5) Then label2.Caption:=Format('Время: %4.1f сс',[res]);
    isClick:=true; //isWait:=false;
    If (res>maxT) Then maxT:=res
     Else If (res<minT) Then minT:=res;
    summa:=summa+res;
    If (i_count>=i_colmax) Then
      Timer4Timer(self);
   end;
  end
    Else If (not isClick) Then begin
    // Label2.Caption:='Не спешите!';
      isClick:=true;
      Inc(errors);
    end;

end;

procedure TfmTest_ZMRp.Timer4Timer(Sender: TObject);
var
//pokaz: single;
    Stri: string;
begin
 If not isLock Then begin
  Timer4.Enabled:=false; isWait:=false;
  if (not isClick) Then Inc(errors);

  If (i_count>=i_colmax) Then begin
      messageBeep(MB_ICONEXCLAMATION);
      if (i_count>errors)and(i_colmax-errors-2>0) Then
        RezTest:=(summa-minT-maxT)/(i_colmax-errors-2)
      Else RezTest:=100;
     RezTest:= RoundTo(RezTest, -1);
      ball:=getBall(RezTest);
      stri:=Format('Ошибок: %u, время: %5.1f сс, min: %4.1f, max: %4.1f, итог: %5.2f.'+#13+#10+'Оценка: %d'
         ,[Errors,summa,minT,maxT,RezTest,ball]);
  if (i_colmax=cfCount) then begin
      application.MessageBox(PChar('Результат: '+ FloatToStr(RezTest)+
      #10+#13+'Баллы: '+ IntToStr(Ball)),'Тест окончен',MB_ICONINFORMATION);
      Close;
  end     // это была не тренировка
  Else begin
     application.MessageBox(PChar('Результат: '+ FloatToStr(RezTest)+
     #10+#13+'Баллы: '+ IntToStr(Ball)),'Тренировка окончена',MB_ICONINFORMATION);
     Button1.Visible:=true;
     Button2.Visible:=true;
     Memo1.Visible:=true;
     Label1.Visible:=true;
     BorderIcons:=[biSystemMenu];
     Label2.Caption:='';
  end;
end  
  Else  NewTest;

 end;
end;

{procedure TfmTest_ZMRp.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  If ModalResult=mrCancel Then begin
    isLock:=true;
    If MessageDlg('Вы хотите прервать тест?',mtConfirmation,[mbYes,mbNo],0) = mrYes
      Then CanClose:=true Else CanClose:=false;
    isLock:=false;
  end;
end; }

procedure TfmTest_ZMRp.FormShow(Sender: TObject);
begin
  RezTest:=0;
  Ball:=0;
  PaintBox1.Left:= (ClientWidth - PaintBox1.Width) div 2;
   PaintBox1.Top:= (ClientHeight - PaintBox1.Height) div 2;
   Label2.Left:= PaintBox1.Left;
   Label2.Top:= PaintBox1.Top - 30;
   Memo1.Left:= (ClientWidth - Memo1.Width) div 2;
   Memo1.Top:= (ClientHeight - Memo1.Height) div 2;
   Label1.Left:= (ClientWidth - Label1.Width) div 2;
   Label1.Top:= Memo1.Top - 160;
   Button1.Left:= (ClientWidth - 480) div 2;      // ширина каждой кнопки 140+расстояние между ними 200
   Button1.Top:= Memo1.Top+Memo1.Height+80 ;
   Button2.Left:= Button1.Left+340;      // ширина каждой кнопки 140+расстояние между ними 200
   Button2.Top:= Button1.Top;
   Button3.Top:=5;
   Button3.Left:=ClientWidth-Button3.Width-5;
end;

procedure TfmTest_ZMRp.Button3Click(Sender: TObject);
begin
  If MessageDlg('Вы уверены, что хотите прервать тест?',mtConfirmation,[mbOK,mbCancel],0)=mrOK
    Then  begin RezTest:=0; Ball:=0; Close; end;

end;

procedure TfmTest_ZMRp.FormMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  // проверка видимости кнопки "прервать тест"
  If ((BorderIcons=[]) and (y>=Button3.Top)and(y<Button3.Top+Button3.Height)and
      (x>=Button3.Left)and(x<Button3.Left+Button3.Width))
    Then Button3.Visible:=true
    Else Button3.Visible:=false;
end;

end.
