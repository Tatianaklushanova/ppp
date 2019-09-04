unit test_ear;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, DateUtils, Math,
  Common, Buttons;

type
  TfmTest_Ear = class(TForm)
    Timer1: TTimer;
    Timer3: TTimer;
    Label2: TLabel;
    Button1: TButton;
    Button2: TButton;
    Memo1: TMemo;
    Label1: TLabel;
    Button3: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Timer3Timer(Sender: TObject);
    procedure Timer4Timer(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormShow(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
  private
    { Private declarations }
    T0: TDateTime;
    i_colmax,i_count,errors: smallint;
    TimeMax,TimeMin,summa: single;
    isWait, isClick: boolean;
    procedure BeginTest ;
    procedure NewTest;
  public
    { Public declarations }
 
  end;

var
  fmTest_Ear: TfmTest_Ear;

implementation

{$R *.dfm}

procedure TfmTest_Ear.BeginTest;
Begin
  errors:=0; summa:=0;
//  Randomize;
  i_count:=0;
  isWait:=false; isClick:=false;
  Timer3.Interval:=cfWaitingA;
//  i_colmax:=3;
  NewTest;
end;

procedure TfmTest_Ear.NewTest;
var dt: smallint;
Begin
  dt:=Random(cfIntervalMaxA-cfIntervalMinA);
//  label3.Caption:=inttostr(dt);
  Timer1.Interval:=cfIntervalMinA+dt; Timer1.Enabled:=true;
End;

procedure TfmTest_Ear.Button1Click(Sender: TObject);
begin
  BorderIcons:=[];
  Memo1.Visible:=false;
  Label1.Visible:=false;
  Button1.Visible:=false; Button2.Visible:=false;
  If (Sender=Button1) Then  i_colmax:=5
  Else begin
    i_colmax:=cfCountA;
    Label2.Caption:='';
  end;
  TimeMin:=100000; TimeMax:=0; errors:=0;

  BeginTest;
end;

procedure TfmTest_Ear.Timer1Timer(Sender: TObject);
begin
//  BorderIcons:=[];
  Timer1.Enabled:=false;
//  messageBeep(MB_ICONINFORMATION);
//  beep;
  messageBeep(0);
//  label3.Caption:='';
    T0:=now;
//    timer2.Enabled:=true;
//    timer4.enabled:=true;

  Inc(i_count);
  If (i_count<i_colmax) Then NewTest;
  isWait:=true; isClick:=false; Timer3.Enabled:=true;
end;

procedure TfmTest_Ear.Timer3Timer(Sender: TObject);
begin
  Timer3.Enabled:=false; isWait:=false;
  if (not isClick) Then Inc(errors);
  If (i_count>=i_colmax) Then
    begin
      messageBeep(MB_ICONEXCLAMATION);
      BorderIcons:=[biSystemMenu];
      Label2.Caption:='';
    //  showmessage(Format('Timemin=%5.2f c, TimeMax=%5.2f c',[timemin,timemax]));
    If (i_colmax-errors-2>0) Then
        RezTest:=100*(summa-timeMin-TimeMax)/(i_colmax-errors-2)
    Else RezTest:=100;
        If RezTest<=15.9 Then ball:=5
        Else If RezTest<=21.6 Then ball:=4
        Else If RezTest<=26.1 Then ball:=3
        Else If RezTest<=29.9 Then ball:=2
        Else ball:=1;
        RezTest:= RoundTo(RezTest,-1);
        If (i_colmax<cfCountA) Then begin{тренировка}
           Memo1.Visible:=true;
           Label1.Visible:=true;
           Button1.Visible:=true; Button2.Visible:=true;
           application.MessageBox(PChar('Результат: '+ FloatToStr(RezTest)
         +#10+#13+'Баллы: '+ IntToStr(Ball)),'Тренировка окончена',MB_ICONINFORMATION)
        end 
        Else {тестирование} begin
          application.MessageBox(PChar('Результат: '+ FloatToStr(RezTest)
            +#10+#13+'Баллы: '+ IntToStr(Ball)),'Тест окончен',MB_ICONINFORMATION);
          Close;
        end
    end; // добавлено

end;

procedure TfmTest_Ear.Timer4Timer(Sender: TObject);
begin
//  timer2.Enabled:=false;
//  timer4.Enabled:=false;
end;

procedure TfmTest_Ear.Button2Click(Sender: TObject);
begin
  messageBeep(0);
  T0:=now;
end;

procedure TfmTest_Ear.FormMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var T1: TDateTime;
    res: single;
begin
 If IsWait Then begin
    T1:=now;
    res:=MilliSecondSpan(T1,T0)/1000;
    If Res<TimeMin Then TimeMin:=Res;
    If Res>TimeMax Then TimeMax:=Res;
    If i_colmax<cfCountA Then label2.Caption:=Format('Время: %4.2f с',[res]);
    isClick:=true;
    summa:=summa+res;
    If (i_count>=i_colmax) Then Timer3Timer(self);
  end
    Else begin
    //  Label2.Caption:='Не спешите!';
      Inc(errors);
    end;

end;

procedure TfmTest_Ear.FormShow(Sender: TObject);
begin
  RezTest:=0;
  Ball:=0;
   Memo1.Left:= (ClientWidth - Memo1.Width) div 2;
   Memo1.Top:= (ClientHeight - Memo1.Height) div 2;
   Label1.Left:= (ClientWidth - Label1.Width) div 2;
   Label1.Top:= Memo1.Top- 160;
   Button1.Left:= (ClientWidth - 480) div 2;      // ширина каждой кнопки 140+расстояние между ними 200
   Button1.Top:= Memo1.Top+Memo1.Height+80 ;
   Button2.Left:= Button1.Left+340;      // ширина каждой кнопки 140+расстояние между ними 200
   Button2.Top:= Button1.Top;
   Button3.Top:=5;
   Button3.Left:=ClientWidth-Button3.Width-5;
end;

procedure TfmTest_Ear.Button3Click(Sender: TObject);
begin
  If MessageDlg('Вы уверены, что хотите прервать тест?',mtConfirmation,[mbOK,mbCancel],0)=mrOK
    Then begin
      Timer1.Enabled:=false;
      RezTest:=0;
      Ball:=0;
      Close;
    end;

end;

procedure TfmTest_Ear.FormMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  // проверка видимости кнопки "прервать тест"
  If ((BorderIcons=[]) and (y>=Button3.Top)and(y<Button3.Top+Button3.Height)and
      (x>=Button3.Left)and(x<Button3.Left+Button3.Width))
    Then Button3.Visible:=true
    Else Button3.Visible:=false;
 end;

end.
