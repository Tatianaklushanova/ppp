unit test_ZMRd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, DateUtils, Mask, Math,
  Common, Buttons;

type
  TfmTest_ZMRd = class(TForm)
    PaintBox1: TPaintBox;
    Timer1: TTimer;
    Timer2: TTimer;
    Timer3: TTimer;
    Label2: TLabel;
    Label3: TLabel;
    Timer4: TTimer;
    Button1: TButton;
    Button2: TButton;
    Memo1: TMemo;
    Label1: TLabel;
    Button3: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure Timer3Timer(Sender: TObject);
    procedure Timer4Timer(Sender: TObject);
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormShow(Sender: TObject);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
    T0: TDateTime;
    colLime,i_colmax,X0,Y0,i_count,errors: smallint;
    coloTec,colo: TColor;
    minT,maxT,summa: single;
    isLock,isWait, isClick: boolean;
    RandT: array[1..100] of smallint;
    RandC: array[1..100] of byte;
    procedure BeginTest;
    procedure NewTest;
    procedure FillPole;
  public
    { Public declarations }
//    ball: smallint;
  end;

var
  fmTest_ZMRd: TfmTest_ZMRd;

implementation

{$R *.dfm}

const rad=100;

procedure TfmTest_ZMRd.FillPole;
var tr: TRect;
Begin
  TR:=PaintBox1.ClientRect;
  PaintBox1.Canvas.Brush.Color:=clGray;
  PaintBox1.Canvas.FillRect(TR);
End;

procedure TfmTest_ZMRd.NewTest;
var dt,cl: smallint;
Begin
  Timer1.Interval:=RandT[i_count+1];
  If (RandC[i_count+1]=1) Then colo:=clRed Else colo:=clLime;
  Timer1.Enabled:=true;
  Inc(i_count);
  isClick:=false;
End;

procedure TfmTest_ZMRd.BeginTest;
var ind,i: smallint;
    SS: string;
Begin
  errors:=0; summa:=0; minT:=10000; maxT:=0;
  For i:=1 to i_colmax do begin
    RandT[i]:=Random(cfIntervalMax-cfIntervalMin);
//    ShowMessage(IntToStr(RandT[i]));
  end;
{  For i:=1 to i_colmax do
    RandC[i]:=Random(2);}
  For i:=1 to i_colmax do RandC[i]:=1;

  For i:=1 to i_colmax div 2 do begin
    repeat
      ind:=Random(i_colmax);
//      ShowMessage(IntToStr(ind));
    until (RandC[ind+1]=1);
    RandC[ind+1]:=0;
  end;
  SS:='[';
  For i:=1 to i_colmax do SS:=SS+IntToStr(RandC[i])+'-';
  SS[Length(SS)]:=']';
 // ShowMessage(SS);

  i_count:=0; colLime:=0;
  isWait:=false; isClick:=false;
  Timer2.Interval:=cfDelta;
  Timer3.Interval:=cfIntervalMin;
  Timer4.Interval:=cfWaiting; //cfIntervalMin;
  PaintBox1.Canvas.Pen.Width:=3;
  PaintBox1.Canvas.Brush.Style:=bsSolid;
  Timer3.Enabled:=true;
//  NewTest;
End;

procedure TfmTest_ZMRd.Button1Click(Sender: TObject);
begin
  Button1.Visible:=false;
  Button2.Visible:=false;
  Label1.Visible:=false;
  Memo1.Visible:=false;
  BorderIcons:=[];

  PaintBox1.Visible:=true;
  rePaint;
  errors:=0;
  x0:=PaintBox1.Width div 2;
  y0:=PaintBox1.Height div 2;
  FillPole;

  If (Sender=Button1) Then begin
    Label2.Visible:=true;
    Label3.Visible:=true;
    Label3.Caption:='Ошибок: нет';
    i_colmax:=10;
  end
  Else begin
      i_colmax:=cfCount;
      Label2.Caption:='';
  end;

  BeginTest;

end;

procedure TfmTest_ZMRd.Timer1Timer(Sender: TObject);
begin
 If not isLock Then begin
  Timer1.Enabled:=false;
  PaintBox1.Canvas.Pen.Color:=colo;
  coloTec:=colo;
//  PaintBox1.Canvas.Pen.Width:=3;
//  PaintBox1.Canvas.Brush.Style:=bsVertical;
  PaintBox1.Canvas.Brush.Color:=colo;
  PaintBox1.Canvas.Ellipse(x0-rad,y0-rad,x0+rad,y0+rad);
  If coloTec=clLime Then Inc(colLime);
  Timer2.Enabled:=true;
  isWait:=true;
  //isClick:=false;
  //Timer3.Enabled:=true; // добавлено
 end;

end;

procedure TfmTest_ZMRd.Timer2Timer(Sender: TObject);
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

procedure TfmTest_ZMRd.Timer3Timer(Sender: TObject);
//var pokaz: single;
//    stri: string;
begin
  If not isLock Then begin
    Timer3.Enabled:=false;
    NewTest;
  end;  
end;

procedure TfmTest_ZMRd.Timer4Timer(Sender: TObject);
//var pokaz: single;
//    Stri: string;
begin
 If not isLock Then begin
  Timer4.Enabled:=false; isWait:=false;
  if (not isClick)and(coloTec=clLime) Then Inc(errors);
  If (i_colmax=10) then label3.Caption:='Ошибок: '+inttostr(errors);
  label2.Caption:='';
  If (i_count>=i_colmax) Then
  begin
      messageBeep(MB_ICONEXCLAMATION);

      if (i_count>errors)and(colLime-errors-2>0) Then
         RezTest:=(summa-minT-maxT)/(colLime-errors-2)
      Else RezTest:=100;
      RezTest:= RoundTo(RezTest, -1);
      ball:=getBall(RezTest);
   //   showmessage(Format('summa=%4.2f, minT=%4.2f, maxT=%4.2f',[summa,minT,maxT]));
     // stri:=Format('Ошибок: %u, время: %5.2f сс, min: %5.2f, max: %5.2f, итог: %5.2f, оценка: %d'
      //   ,[Errors,summa,minT,maxT,RezTest,ball]);
        if (i_colmax=cfCount) then begin
         application.MessageBox(PChar('Результат: '+ FloatToStr(RezTest)+
          #10+#13+'Баллы: '+ IntToStr(Ball)),'Тест окончен',MB_ICONINFORMATION);
         Close;
      end // это была не тренировка
      Else begin
         application.MessageBox(PChar('Результат: '+FloatToStr(RezTest)+
            #10#13+'Баллы: '+IntToStr(Ball)),'Тренировка окончена',MB_ICONINFORMATION);
         Button1.Visible:=true;
         Button2.Visible:=true;
         Memo1.Visible:=true;
         Label3.Visible:=false;
         Label1.Visible:=true;
         BorderIcons:=[biSystemMenu];
         Label2.Caption:='';
      end;
 end
 Else NewTest;
 end;
end;

procedure TfmTest_ZMRd.FormMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var T1: TDateTime;
    res: double;
begin
  T1:=now;
  res:=MilliSecondSpan(T1,T0)/10;
  If IsWait and (not isClick) Then
    If coloTec=clLime Then begin
      If (i_colmax=10) Then label2.Caption:=Format('Время: %4.1f сс',[res]);
      isClick:=true;
      If (res>maxT) Then maxT:=res;
      If (res<minT) Then minT:=res;
      summa:=summa+res;
      If (i_count>=i_colmax) Then Timer4Timer(self);
    end
    Else If (i_colmax=10) then begin
      Label2.Caption:='Ошибка!'; Inc(errors);
      label3.Caption:='Ошибок: '+inttostr(errors);
    end
  Else begin
    //  If (i_colmax=10) then Label2.Caption:='Не спешите!';
      Inc(errors);
      If (i_colmax=10) then label3.Caption:='Ошибок: '+inttostr(errors);
  end;
 
end;

procedure TfmTest_ZMRd.FormShow(Sender: TObject);
begin
  RezTest:=0;
  Ball:=0;
   PaintBox1.Left:= (ClientWidth - PaintBox1.Width) div 2;
   PaintBox1.Top:= (ClientHeight - PaintBox1.Height) div 2;
   Label2.Left:= PaintBox1.Left;
   Label2.Top:= PaintBox1.Top - 30;
   Label3.Left:= PaintBox1.Left+PaintBox1.Width div 3;
   Label3.Top:= PaintBox1.Top - 30;
   Memo1.Left:= (ClientWidth - Memo1.Width) div 2;
   Memo1.Top:= (ClientHeight - Memo1.Height) div 2;
   Label1.Left:= (ClientWidth - Label1.Width) div 2;
   Label1.Top:= Memo1.Top - 140;
   Button1.Left:= (ClientWidth - 480) div 2;      // ширина каждой кнопки 140+расстояние между ними 200
   Button1.Top:= Memo1.Top+Memo1.Height+80 ;
   Button2.Left:= Button1.Left+340;      // ширина каждой кнопки 140+расстояние между ними 200
   Button2.Top:= Button1.Top;
   Button3.Top:=5;
   Button3.Left:=ClientWidth-Button3.Width-5;
end;

procedure TfmTest_ZMRd.FormMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  // проверка видимости кнопки "прервать тест"
  If ((BorderIcons=[]) and (y>=Button3.Top)and(y<Button3.Top+Button3.Height)and
      (x>=Button3.Left)and(x<Button3.Left+Button3.Width))
    Then Button3.Visible:=true
    Else Button3.Visible:=false;

end;

procedure TfmTest_ZMRd.Button3Click(Sender: TObject);
begin
  If MessageDlg('Вы уверены, что хотите прервать тест?',mtConfirmation,[mbOK,mbCancel],0)=mrOK
    Then  begin RezTest:=0; Ball:=0; Close; end;
end;

end.
