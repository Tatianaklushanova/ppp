unit testVn;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, MPlayer, StdCtrls, DateUtils, Math,
  Common, Buttons;

const
//d50=50;
d5=1; d2=3; d10=10; //d24=64;
  col_count=15;
   clr: array[0..col_count-1]of TColor=
   (clMaroon,clGreen,clOlive,
    clNavy,clPurple,clTeal,clGray,
    clSilver,clRed,clLime,clYellow,
    clBlue,clFuchsia,clAqua,clWhite);

type
  PFire = ^TFire;
  TFire = record
    colo: TColor;
    r: single;
    po: TPoint;
    Interv: integer;
    Visible: boolean;
  end;

  TfmTestVn = class(TForm)
    Timer1: TTimer;
    PaintBox1: TPaintBox;
    Button2: TButton;
    Button1: TButton;
    Memo1: TMemo;
    lError: TLabel;
    Label1: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure PaintBox1Paint(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure PaintBox1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
    poKir: TPoint;
    y00: integer;
    summa1, summa2, d50, d24, {это макс. размер вспышек}
    dd4, {параметр, связанный со скоростю роста вспышек}
    expCoMax,expCo,errCo1,errCo2,Interv,kirWid,kirHei: integer;
    isTest,isLine,isClick,kirVisible,isFire: boolean;
    dt0: TDateTime;
//    busi: boolean;
    poin: array[0..12]of TPoint;
    Li: TList;
    procedure NewKir;
    procedure DrawKir(Po: TPoint);
    procedure DrawFire(PF: PFire);
    procedure NewFire;
    procedure GreenLine;
    procedure NewError;
    procedure FinishTest;
  public
    { Public declarations }
//    RezTest: single;
//    ball: smallint;
  end;

var
  fmTestVn: TfmTestVn;

implementation

{$R *.dfm}

procedure TfmTestVn.Button1Click(Sender: TObject);
begin
{MediaPlayer1.FileName:='sib_fin.mp3';
MediaPlayer1.Open;
MediaPlayer1.Play;}
end;

function GetPoint(po0: TPoint; fi,r: single): TPoint;
var TP: TPoint;
 Rfi: single;
Begin
  Rfi:=fi*3.14159/180;
  TP.X:=po0.X+round(r*cos(Rfi));
  TP.Y:=po0.Y-round(r*sin(Rfi));
  result:=TP;
End;

procedure TfmTestVn.DrawFire(PF: PFire);
var  pm: TPenMode;
Begin
  pm:=PaintBox1.Canvas.Pen.Mode;
  PaintBox1.Canvas.Pen.Mode:=pmXOR;
//  PaintBox1.Canvas.Pen.Mode:=pmCopy;
  With PF^ do begin
  poin[0]:=GetPoint(Po,0,r);
  poin[1]:=GetPoint(Po,25,r*2.5);
  poin[2]:=GetPoint(Po,60,r/2);
  poin[3]:=GetPoint(Po,70,r*1.75);
  poin[4]:=GetPoint(Po,100,r*0.7);
  poin[5]:=GetPoint(Po,105,r*3.5);
  poin[6]:=GetPoint(Po,170,r*0.9);
  poin[7]:=GetPoint(Po,185,r*3);
  poin[8]:=GetPoint(Po,225,r);
  poin[9]:=GetPoint(Po,265,r*2);
  poin[10]:=GetPoint(Po,290,r/2);
  poin[11]:=GetPoint(Po,330,r*1.75);
  poin[12]:=poin[0];
  PaintBox1.Canvas.Pen.Width:=1;
  PaintBox1.Canvas.Pen.Color:=clNavy;
  PaintBox1.Canvas.Brush.Color:=clAqua;  //colo; //clBlue;
  end;
  PaintBox1.Canvas.Polygon (Poin);
  PaintBox1.Canvas.Pen.Mode:=pm;

End;

procedure TfmTestVn.DrawKir(Po: TPoint);
var Rect: TRect;
  pm: TPenMode;
Begin
//  busi:=true;
  With PaintBox1.Canvas do begin
{}    pm:=Pen.Mode;
{}    Pen.Mode:=pmXOR;
    Pen.Color:=clYellow;
    Brush.Color:=clYellow;
    Rect.TopLeft:=Po;
    Rect.Right:=Po.X+kirWid;
    Rect.Bottom:=Po.Y+kirHei;
    Rectangle(Rect);
{}    Pen.Mode:=pm;
  end;
End;

procedure TfmTestVn.NewFire;
Var PF: PFire;
Begin
  PF:=New(PFire);
  PF^.r:=5;
  PF^.po.X:=Random(PaintBox1.ClientWidth);
  PF^.po.Y:=Random(PaintBox1.ClientHeight);
//  PF^.colo:=clr[Random(col_count)];
  PF^.Interv:=d50*(Random(3+d5));
  PF^.Visible:=false;
  Li.Add(PF);
End;

procedure TfmTestVn.FinishTest;
Begin
        Timer1.Enabled:=false;
//        label2.Caption:=IntToStr(round(Summa/10));
{        RezTest:=(errCo2+Summa2/10)/12;
        If RezTest<=1.45 Then ball:=5
        Else If RezTest<=2.55 Then ball:=4
        Else If RezTest<=3.50 Then ball:=3
        Else If RezTest<=4.20 Then ball:=2
        Else ball:=1;}
        RezTest:=RoundTo((errCo2-errCo1)*100/12,0);
//        Panel3.Visible:=true;
        If expCoMax<24 Then begin   {тренировка}
          Button2.Visible:=true;
          Button1.Visible:=true;
          PaintBox1.Visible:=false;
          Memo1.Visible:=true;
          Label1.Visible:=true;
          lError.Visible:=false;
//          BorderIcons:=[biSystemMenu];
          application.MessageBox(PChar('Ошибок: '+ IntToStr(errCo1)),
          'Тренировка окончена', MB_ICONINFORMATION);
        end
        Else begin {тестирование}
            application.MessageBox(PChar('Результат: '+ FloatToStr(RezTest)+'%'+#10+#13+
            'Баллы: '+ IntToStr(Ball)),'Тест окончен', MB_ICONINFORMATION);
            IsTest:=true;
            Close;
        end;
End;

procedure TfmTestVn.Timer1Timer(Sender: TObject);
var hour,min,sec,msec: word;
    dt1: TDateTime;
    i,liCo,betwI: integer;
    PF: PFire;
begin
  If kirVisible Then begin
    If (not isLine)and(Abs(poKir.Y+kirHei div 2-y00)<d10) Then begin
     If isClick Then begin
       dt1:=now; isLine:=true;
       betwI:=MilliSecondsBetween(dt0,dt1);
       If expCo<=12 Then
         summa1:=summa1+betwi
       Else summa2:=summa2+betwi;

       newError;
     end
     Else begin
      dt0:=now; isLine:=true;
     end;
    end;
    DrawKir(poKir);
    If (poKir.Y<PaintBox1.ClientHeight-kirHei) Then begin
      poKir.Y:=poKir.Y+d10;
      DrawKir(poKir);
    end
    Else begin
     If not isClick Then begin
      NewError;
      dt1:=now;
      betwI:=MilliSecondsBetween(dt0,dt1);
       If expCo<=12 Then
         summa1:=summa1+betwi
       Else summa2:=summa2+betwi;
     end;
      If expCo<expCoMax Then NewKir
      Else begin
        FinishTest;
        If (expCoMax=24) Then Close;
      end;
    end;
  end // kirVisible
  Else begin
    If (poKir.Y<PaintBox1.ClientHeight-kirHei) Then
      poKir.Y:=poKir.Y+d10
    Else
      If expCo<expCoMax Then NewKir
      Else begin
        FinishTest;
        If (expCoMax=24) Then Close;
      end;
  end; // not KirVisible

  If (expCo>12) Then begin
    For i:=0 to Li.Count-1 do begin
      PF:=Li.Items[i];
      If (not PF^.Visible) Then begin
        Dec(PF^.Interv,d50);
        If (PF^.Interv<=0) Then begin
          PF^.Visible:=true;
          DrawFire(PF);
        end;
      end
      Else begin
          DrawFire(PF);
          PF^.r:=PF^.r+dd4;
          If (PF^.r<=d24) Then DrawFire(PF);
      end;
    end; // for
    liCo:=Li.Count;
    For i:=liCo-1 downto 0 do begin
      PF:=Li.Items[i];
      If (PF^.Visible)and(PF^.r>d24) Then begin
        Li.Remove(PF); Dispose(PF);
      end;
    end;
    If Li.Count<cfMaxFireCo Then NewFire;
//    label2.Caption:=label2.Caption+','+IntToStr(cfMaxFireCo);
  end;

end;

procedure TfmTestVn.GreenLine;
var y0: integer;
Begin
  With PaintBox1.Canvas do begin
    Pen.Color:=clGreen;
    Pen.Width:=3;
    y0:=ClientHeight*2 div 4;
    MoveTo(0,y0); LineTo(ClientWidth-1,y0);
  end;
End;

procedure TfmTestVn.PaintBox1Paint(Sender: TObject);
var Rect: TRect;
begin
  Rect:=PaintBox1.ClientRect;
  With PaintBox1.Canvas do begin
    Brush.Color:= clMoneyGreen;
    FillRect(Rect);
    y00:=ClientHeight*2 div 4;
    MoveTo(0,y00);
    Pen.Mode:=pmCopy;
    Pen.Color:=clGreen;
    Pen.Width:=3;
    LineTo(ClientWidth-1,y00);
    Pen.Width:=1;
    If KirVisible Then DrawKir(PoKir);
//    GreenLine;
  end;
end;

procedure TfmTestVn.FormShow(Sender: TObject);
begin
   Memo1.Left:= (ClientWidth - Memo1.Width) div 2;
   Memo1.Top:= (ClientHeight - Memo1.Height) div 2;
   Label1.Left:= (ClientWidth - Label1.Width) div 2;
   Label1.Top:= Memo1.Top- 140;
   Button2.Left:= (ClientWidth - 460) div 2;      // ширина каждой кнопки 140+расстояние между ними 200
   Button2.Top:= Memo1.Top+Memo1.Height+80 ;
   Button1.Left:= Button2.Left+340;      // ширина каждой кнопки 140+расстояние между ними 200
   Button1.Top:= Button2.Top;
   lError.Top:= 40;
   lError.Left:= Button2.Left;
   PaintBox1.Width:= ClientWidth;
   PaintBox1.Height:= ClientHeight-70;
   PaintBox1.Top:= 70;

  Randomize;
  kirWid:=30*cfKirSize div 2; kirHei:=12*cfKirSize div 2;
  isFire:=false;
  d50:=(11-cfD50)*10;
  d24:=20+4*cfmaxFire;
  If cfMaxFire>10 Then dd4:=8
  Else If cfMaxFire<6 Then dd4:=4
  Else dd4:=6;
  Timer1.Interval:=d50;
  PaintBox1.Visible:=false;
  isTest:=false;
  lError.Visible:=false;
  RezTest:=0;
  Ball:=0;
end;

procedure TfmTestVn.NewKir;
Begin
  Inc(expCo);
  If expCo=13 Then
     MessageBeep(MB_ICONEXCLAMATION);
  poKir.X:=Random(PaintBox1.ClientWidth-kirWid);
  poKir.Y:=0;
  DrawKir(poKir); KirVisible:=true;
  isClick:=false; isLine:=false;
End;

procedure TfmTestVn.Button2Click(Sender: TObject);
begin
  Button2.Visible:=false;
  Button1.Visible:=false;
  Label1.Visible:=false;
  Memo1.Visible:=false;
  PaintBox1.Visible:=true;
  PaintBox1.Canvas.Pen.Mode:=pmXOR; lError.Caption:='';
  errCo1:=0; errCo2:=0;
  expCo:=0;
  If (Sender=Button2) Then begin {тренировка}
      expCoMax:=6; lError.Visible:=true;
  end
  Else begin
    expCoMax:=24; lError.Visible:=false;
  end;
//  Interv:=d50*(Random(1+d5));
  Summa1:=0; Summa2:=0;
  NewKir;
  Timer1.Enabled:=true;
  Li:=TList.Create;
  Li.Capacity:=5;
end;

procedure TfmTestVn.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Timer1.Enabled:=false;
  If IsTest Then ModalResult:=mrOK
    Else begin
      RezTest:=0; Ball:=0;
    end;
end;

procedure TfmTestVn.NewError;
Begin
  If expCo<=12 Then Inc(errCo1) Else Inc(errCo2);
  If expCoMax<24 Then
    lError.Caption:='Ошибок: '+IntToStr(errCo1);
//    +', '+IntToStr(errCo2);
End;

procedure TfmTestVn.PaintBox1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var  dt1: TDateTime;
      betw: single;
      betwI: integer;
begin
  If isClick Then exit;
  isClick:=true;
  If (Abs(PoKir.Y+kirHei div 2-y00)<=kirHei*cfEps div 2) // возле линии
    Then begin
       DrawKir(poKir); kirVisible:=false;
    end
    Else If isLine Then begin
      dt1:=now;
      betwI:=MilliSecondsBetween(dt0,dt1);
      If expCo<=12 Then
        summa1:=summa1+betwi
      Else summa2:=summa2+betwi;
      newError;
    end
    Else begin
      dt0:=now;
    end;
end;

end.
