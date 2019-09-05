unit testR3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Common, Math, DateUtils;

type
  TfmTestR3 = class(TForm)
    PB: TPaintBox;
    Timer1: TTimer;
    Label1: TLabel;
    Button2: TButton;
    Button1: TButton;
    Memo1: TMemo;
    Label2: TLabel;
    Button3: TButton;
    Label3: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ShowP;
    procedure Timer1Timer(Sender: TObject);
    procedure PBPaint(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
    T0,TClick: TDateTime;
    errco,errco_p,tCountMax,tCount,RR,R,x,y,x0,y0: smallint;
    is0,isClick,right: boolean;
    Summa,delfi,fi: single;
    procedure CalcOtkl;
  public
    { Public declarations }

  end;

var
  fmTestR3: TfmTestR3;

implementation

{$R *.dfm}

procedure TfmTestR3.Button1Click(Sender: TObject);
begin
 BorderIcons:=[];
 Memo1.Visible:=false; Label1.Visible:=true; Label1.Caption:='';
 Button1.Visible:=false;
 Button2.Visible:=false;
 Label2.Visible:=false;
 ShowP;
 PB.Visible:=true;
 Timer1.Enabled:=true; isClick:=false;
 Timer1.Interval:=100;
 tCountMax:=10; tCount:=0;
end;

procedure TfmTestR3.FormShow(Sender: TObject);
begin
   PB.Left:= (ClientWidth - PB.Width) div 2;
   PB.Top:= (ClientHeight - PB.Height) div 2;
   Memo1.Left:= (ClientWidth - Memo1.Width) div 2;
   Memo1.Top:= (ClientHeight - Memo1.Height) div 2;
   Label2.Left:= (ClientWidth - Label2.Width) div 2;
   Label2.Top:= Memo1.Top- 160;
   Button1.Left:= (ClientWidth - 480) div 2;      // ширина каждой кнопки 140+расстояние между ними 200
   Button1.Top:= Memo1.Top+Memo1.Height+80 ;
   Button2.Left:= Button1.Left+340;      // ширина каждой кнопки 140+расстояние между ними 200
   Button2.Top:= Button1.Top;
   Button3.Top:=5;
   Button3.Left:=ClientWidth-Button3.Width-5;
   Label1.Left:= PB.Left;
   Label1.Top:= PB.Top+PB.Height+15;

  x0:=PB.Width div 2; y:=30; R:=7; RR:=PB.Height-60; fi:=-Pi/3;
  right:=true; delfi:=0.04; tCountMax:=30; tCount:=0;
//  maxDT:=Pi/3/delfi*Timer1.Interval/10;
  Summa:=0;   RezTest:=0; Ball:=0;
 with PB.Canvas do begin
   Pen.Color:=clYellow;
   Brush.Style:=bsSolid;
   Brush.Color:=clYellow;
   Pen.Mode:=pmXOR;
 end;
 Memo1.Visible:=true;
 end;

procedure TfmTestR3.ShowP;
Begin
 with PB.Canvas do begin
   x:=Round(x0+RR*sin(fi)); y:=Round(y0+RR*cos(fi));
   Pen.Color:=clYellow;
   Brush.Style:=bsSolid;
   Brush.Color:=clYellow;
   Ellipse(x-R,y-r,x+r,y+r);
 end;
End;

procedure TfmTestR3.CalcOtkl;
var res: single;
Begin
  If isClick and is0 Then begin
    If T0<TClick Then begin
        res:=MilliSecondSpan(TClick,T0)/10;
    end
    Else begin
        res:=-MilliSecondSpan(T0,TClick)/10;
    end;
    Label1.Caption:=Format('Отклонение: %4.1f сс',[res]);
    Summa:=Summa+Abs(res);
  end;
End;

procedure TfmTestR3.Timer1Timer(Sender: TObject);
//var sgn: integer;
var res, dt: single;
begin
  ShowP; // скрыть предыдущий
  if right then begin
    fi:=fi+delfi;
    If Abs(fi)<delfi/2 Then begin
      is0:=true; T0:=now;
      If isClick Then begin
        CalcOtkl;
      end
     end
    Else
    if fi>Pi/3 then begin
      If not isClick Then begin
        Inc(errco_p); Inc(errco);
        dt:=MilliSecondSpan(now,T0)/10;
        Label1.Caption:='ОШИБКА: Вы пропустили нажатие!';
        If errco_p>=10 Then begin
          Timer1.Enabled:=false; Close; Exit;
        end
        Else Summa:=Summa+dt;

      end;

      right:=not right; isClick:=false; is0:=false;
      inc(tCount);
      If (tcount=tCountMax) Then Timer1.Enabled:=false
      Else If tCount>18 Then Timer1.Interval:=30
      Else If tCount>6 Then Timer1.Interval:=60;
    end;
  end
  Else begin
//    sgn:=-1;
    fi:=fi-delfi;
    If Abs(fi)<delfi/2 Then begin
      is0:=true; T0:=now;
      If isClick Then begin
{        res:=MilliSecondSpan(T0,TClick)/10;
        showmessage(Format('res=%4.2f',[res]));}
        CalcOtkl;
      end;
    end
    Else
    If fi<-Pi/3 then begin
      If not isClick Then begin
        Inc(errco_p); Inc(errco);
        dt:=MilliSecondSpan(now,T0)/10;
        Label1.Caption:='ОШИБКА: Вы пропустили нажатие!';
        If errco_p>=10 Then begin
          Timer1.Enabled:=false; Close; Exit;
        end
        Else Summa:=Summa+dt;
      end;
      right:=not right; isClick:=false; is0:=false;
      inc(tCount);
      If (tcount=tCountMax) Then Timer1.Enabled:=false
      Else If tCount>tCountMax*3/5 Then Timer1.Interval:=30
      Else If tCount>tCountMax/5 Then Timer1.Interval:=60;
    end;
  end;
  If Timer1.Enabled Then ShowP
  Else If (tCountMax=10) Then begin
     RezTest:= RoundTo(Summa/tCountMax, -1);
     Ball:=0;
     application.MessageBox(PChar('Результат: '+ FloatToStr(RezTest)+
     #10+#13+'Баллы: '+ IntToStr(Ball)),'Тренировка окончена',MB_ICONINFORMATION);
     Memo1.Visible:=true; Label1.Visible:=false;
     Button1.Visible:=true;
     Button2.Visible:=true;
     PB.Visible:=false;
     Label2.Visible:=true;
     BorderIcons:=[biSystemMenu];
    end
    Else begin
      RezTest:= RoundTo(Summa/tCountMax, -1);
      Ball:=0;
//      showmessage('errco='+inttostr(errco));
//      showmessage('errco_p='+inttostr(errco_p));
      application.MessageBox(PChar('Результат: '+ FloatToStr(RezTest)+
   #10+#13+'Баллы: '+ IntToStr(Ball)),'Тест окончен',MB_ICONINFORMATION);
   Close;
  end;

end;

procedure TfmTestR3.PBPaint(Sender: TObject);
var PM: TPenMode;
    bc: TColor;
begin
  With PB.Canvas do begin
    Pen.Color:=clNavy;
    PM:=Pen.Mode;
    Pen.Mode:=pmCopy;
    bc:=Brush.Color;
    Brush.Color:=clMoneyGreen;
    Rectangle(PB.ClientRect);
    Pen.Width:=3;
    MoveTo(20,y0+RR+20);
    LineTo(PB.ClientWidth-20, y0+RR+20);
    MoveTo(x0,y0+RR+20);
    LineTo(x0, y0+RR);
    bc:=Brush.Color;
    Pen.Mode:=pmXOR;
  end;


end;

procedure TfmTestR3.Button2Click(Sender: TObject);
begin
 errco:=0; errco_p:=0;
 BorderIcons:=[];
 Button1.Visible:=false;
 Button2.Visible:=false;
 Memo1.Visible:=false;
 Label1.Visible:=true;  Label1.Caption:='';
 Label2.Visible:=false;
 ShowP;
 PB.Visible:=true;
 Timer1.Enabled:=true; isClick:=false;
 tCountMax:=30; tCount:=0;
 Timer1.Interval:=100;
end;

procedure TfmTestR3.FormMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  If not isClick Then begin
   errco_p:=0; IsClick:=true; TClick:=now; CalcOtkl;
  end;

end;

procedure TfmTestR3.FormMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  // проверка видимости кнопки "прервать тест"
  If (PB.Visible and (y>=Button3.Top)and(y<Button3.Top+Button3.Height)and
      (x>=Button3.Left)and(x<Button3.Left+Button3.Width))
    Then Button3.Visible:=true
    Else Button3.Visible:=false;


end;

procedure TfmTestR3.Button3Click(Sender: TObject);
begin
  If MessageDlg('Вы уверены, что хотите прервать тест?',mtConfirmation,[mbOK,mbCancel],0)=mrOK
    Then begin
      Timer1.Enabled:=false;
      RezTest:=0; Ball:=0;
      Close;
    end;
end;

end.
