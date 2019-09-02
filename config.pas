unit config;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, Buttons,
  Common, Spin;

type
  TfmConfig = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edIntervalMin: TEdit;
    edWaiting: TEdit;
    edCount: TEdit;
    Label4: TLabel;
    edIntervalMax: TEdit;
    Label5: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label6: TLabel;
    edDelta: TEdit;
    TabSheet2: TTabSheet;
    Label7: TLabel;
    tbD50: TTrackBar;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    edMaxFireCo: TEdit;
    Label11: TLabel;
    seEps: TSpinEdit;
    TabSheet3: TTabSheet;
    Label12: TLabel;
    Label13: TLabel;
    edIntervalMinA: TEdit;
    Label14: TLabel;
    edIntervalMaxA: TEdit;
    Label15: TLabel;
    edCountA: TEdit;
    Label16: TLabel;
    edWaitingA: TEdit;
    BitBtn3: TBitBtn;
    seKirSize: TSpinEdit;
    Label17: TLabel;
    edMaxFire: TSpinEdit;
    Label18: TLabel;
    Label19: TLabel;
    BitBtn4: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure BitBtn3Click(Sender: TObject);
    procedure PageControl1DrawTab(Control: TCustomTabControl;
      TabIndex: Integer; const Rect: TRect; Active: Boolean);
    procedure BitBtn4Click(Sender: TObject);
  private
    { Private declarations }
    function GetData: TWinControl;
    procedure SetData;
  public
    { Public declarations }
  end;

var
  fmConfig: TfmConfig;
procedure SaveCfg(Cfg0: boolean);
procedure LoadCfg;

implementation

{$R *.dfm}

var     SI: smallint;


procedure TfmConfig.FormShow(Sender: TObject);
begin
  PageControl1.Width := ClientWidth*70 div 100;
  PageControl1.Left:= (ClientWidth -PageControl1.Width) div 2;;
  PageControl1.Top:= (ClientHeight -PageControl1.Height) div 2;
  Label19.Left:= (ClientWidth -label19.Width) div 2;
  Label19.Top:= PageControl1.Top-100;
  BitBtn3.Left:=(ClientWidth-(BitBtn3.Width+BitBtn1.Width+BitBtn2.Width+230))div 2;
  BitBtn1.Left:= BitBtn3.Left+BitBtn3.Width+150;
  BitBtn2.Left:= BitBtn1.Left+BitBtn1.Width+80;
  BitBtn3.Top:=  PageControl1.Top+ PageControl1.Height+30;
  BitBtn4.Left:=BitBtn3.Left;
  BitBtn4.Top:=BitBtn3.Top+BitBtn3.Height+10;
  BitBtn1.Top:= BitBtn3.Top;
  BitBtn2.Top:= BitBtn3.Top;

  SetData;
end;

procedure TfmConfig.SetData;
Begin
  edIntervalMin.Text:=IntToStr(cfintervalMin);
  edIntervalMax.Text:=IntToStr(cfintervalMax);
  edDelta.Text:=IntToStr(cfDelta);
  edCount.Text:=IntToStr(cfCount);
  edWaiting.Text:=IntToStr(cfWaiting);
  tbD50.Position:=cfD50;
  edMaxFireCo.Text:=IntToStr(cfMaxFireCo);
  seEps.Value:=cfEps;
  seKirSize.Value:=cfKirSize;
  edIntervalMinA.Text:=IntToStr(cfintervalMinA);
  edIntervalMaxA.Text:=IntToStr(cfintervalMaxA);
  edCountA.Text:=IntToStr(cfCountA);
  edWaitingA.Text:=IntToStr(cfWaitingA);
  edMaxFire.Value:=cfMaxFire;
End;

function TfmConfig.GetData: TWinControl;
var Res: TWinControl;
Begin
  Res:=nil;

  cfEps:=seEps.Value;
  try
    cfMaxFireCo:=StrToInt(edMaxFireCo.Text);
  except
    Res:=edMaxFireCo;
  end;
  cfD50:=tbD50.Position;
  try
    cfIntervalMin:=StrToInt(edIntervalMin.Text);
  except
    Res:=edIntervalMin;
  end;
  try
    cfIntervalMax:=StrToInt(edIntervalMax.Text);
  except
    Res:=edIntervalMax;
  end;
  try
    cfDelta:=StrToInt(edDelta.Text);
  except
    Res:=edDelta;
  end;
  try
    cfCount:=StrToInt(edCount.Text);
  except
    Res:=edCount;
  end;
  try
    cfWaiting:=StrToInt(edWaiting.Text);
  except
    Res:=edWaiting;
  end;

  try
    cfIntervalMinA:=StrToInt(edIntervalMinA.Text);
  except
    Res:=edIntervalMinA;
  end;
  try
    cfIntervalMaxA:=StrToInt(edIntervalMaxA.Text);
  except
    Res:=edIntervalMaxA;
  end;
  try
    cfCountA:=StrToInt(edCountA.Text);
  except
    Res:=edCountA;
  end;
  try
    cfWaitingA:=StrToInt(edWaitingA.Text);
  except
    Res:=edWaitingA;
  end;
  cfKirSize:=seKirSize.Value;
  try
    cfMaxFire:=StrToInt(edMaxFire.Text);
  except
    Res:=edMaxFire;
  end;
  Result:=Res;
End;

procedure TfmConfig.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var ErrorEl: TWinControl;
begin
 If (ModalResult=mrOK) Then begin
   ErrorEl:= GetData;
   If ErrorEl<>nil Then begin
     showmessage('Ошибка! Проверьте введенную информацию!'); ErrorEl.SetFocus; CanClose:=false;
   end;
{  cfEps:=seEps.Value;
  try
    cfMaxFireCo:=StrToInt(edMaxFireCo.Text);
  except
    showmessage('ERROR!'); edMaxFireCo.SetFocus;
    CanClose:=false;
  end;
  cfD50:=tbD50.Position;

  try
    cfIntervalMin:=StrToInt(edIntervalMin.Text);
  except
    showmessage('ERROR!'); edIntervalMin.SetFocus;
    CanClose:=false;
  end;
  try
    cfIntervalMax:=StrToInt(edIntervalMax.Text);
  except
    showmessage('ERROR!'); edIntervalMax.SetFocus;
    CanClose:=false;
  end;
  try
    cfDelta:=StrToInt(edDelta.Text);
  except
    showmessage('ERROR!'); edDelta.SetFocus;
    CanClose:=false;
  end;
  try
    cfCount:=StrToInt(edCount.Text);
  except
    showmessage('ERROR!'); edCount.SetFocus;
    CanClose:=false;
  end;
  try
    cfWaiting:=StrToInt(edWaiting.Text);
  except
    showmessage('ERROR!'); edWaiting.SetFocus;
    CanClose:=false;
  end;

  try
    cfIntervalMinA:=StrToInt(edIntervalMinA.Text);
  except
    showmessage('ERROR!'); edIntervalMinA.SetFocus;
    CanClose:=false;
  end;
  try
    cfIntervalMaxA:=StrToInt(edIntervalMaxA.Text);
  except
    showmessage('ERROR!'); edIntervalMaxA.SetFocus;
    CanClose:=false;
  end;
  try
    cfCountA:=StrToInt(edCountA.Text);
  except
    showmessage('ERROR!'); edCountA.SetFocus;
    CanClose:=false;
  end;
  try
    cfWaitingA:=StrToInt(edWaitingA.Text);
  except
    showmessage('ERROR!'); edWaitingA.SetFocus;
    CanClose:=false;
  end;}
 end;
end;

procedure SaveCfg(Cfg0: boolean);
var //F: TFileStream;
    F: File;
    stri: string;
Begin
  AssignFile(F, 'medicalTest.cfg');
  ReWrite(F, 1);
  BlockWrite(F,cfintervalMin,SI);
  BlockWrite(F,cfintervalMax,SI);
  BlockWrite(F,cfDelta,SI);
  BlockWrite(F,cfCount,SI);
  BlockWrite(F,cfWaiting,SI);
  BlockWrite(F,cfEps,SI);
  BlockWrite(F,cfMaxFireCo,SI);
  BlockWrite(F,cfD50,SI);
  BlockWrite(F,cfIntervalMinA,SI);
  BlockWrite(F,cfIntervalMaxA,SI);
  BlockWrite(F,cfCountA,SI);
  BlockWrite(F,cfWaitingA,SI);
  BlockWrite(F,cfKirSize,SI);
  BlockWrite(F,cfMaxFire,SI);
  CloseFile(F);

{  F:=TFileStream.Create('medicalTest.cfg', fmCreate);
  F.Write(cfintervalMin,SizeOf(smallint));
  F.Write(cfintervalMax,SizeOf(smallint));
  F.Write(cfDelta,SizeOf(smallint));
  F.Write(cfCount,SizeOf(smallint));
  F.Write(cfWaiting,SizeOf(smallint));
  F.Write(cfEps,SizeOf(smallint));
  F.Write(cfMaxFireCo,SizeOf(smallint));
  F.Write(cfD50,SizeOf(smallint));
  F.Write(cfintervalMinA,SizeOf(smallint));
  F.Write(cfintervalMaxA,SizeOf(smallint));
  F.Write(cfCountA,SizeOf(smallint));
  F.Write(cfWaitingA,SizeOf(smallint));
  F.Write(cfKirSize,SizeOf(smallint));
  F.Write(cfMaxFire,SizeOf(smallint));
  F.Free;}
  If Cfg0 Then stri:='Восстановлена исходная настройка'
    Else stri:='Настройка сохранена в MedicalTest.cfg';
  MessageDlg(stri,mtInformation,[mbOK],0);
//  messageBeep(MB_ICONEXCLAMATION);
End;

procedure InitCfg;
Begin
  cfintervalMin:=2000;
  cfintervalMax:=10000;
  cfDelta:=200;
  cfCount:=12;
  cfWaiting:=2000;
  cfEps:=2;
  cfMaxFireCo:=2;
  cfD50:=5;
  cfintervalMinA:=2000;
  cfintervalMaxA:=10000;
  cfCountA:=12;
  cfWaitingA:=2000;
  cfKirSize:=2;
  cfMaxFire:=25;
End;

procedure LoadCfg;
var //F: TFileStream;
    F: File;
Begin
try
{  F:=TFileStream.Create('medicalTest.cfg', fmOpenRead);
  F.Read(cfintervalMin,SizeOf(smallint));
  F.Read(cfintervalMax,SizeOf(smallint));
  F.Read(cfDelta,SizeOf(smallint));
  F.Read(cfCount,SizeOf(smallint));
  F.Read(cfWaiting,SizeOf(smallint));
  F.Read(cfEps,SizeOf(smallint));
  F.Read(cfMaxFireCo,SizeOf(smallint));
  F.Read(cfD50,SizeOf(smallint));
  F.Read(cfintervalMinA,SizeOf(smallint));
  F.Read(cfintervalMaxA,SizeOf(smallint));
  F.Read(cfCountA,SizeOf(smallint));
  F.Read(cfWaitingA,SizeOf(smallint));
  F.Read(cfKirSize,SizeOf(smallint));
  F.Read(cfMaxFire,SizeOf(smallint));
  F.Free;}

  AssignFile(F, 'medicalTest.cfg');
  Reset(F, 1);
  BlockRead(F,cfintervalMin,SI);
  BlockRead(F,cfintervalMax,SI);
  BlockRead(F,cfDelta,SI);
  BlockRead(F,cfCount,SI);
  BlockRead(F,cfWaiting,SI);
  BlockRead(F,cfEps,SI);
  BlockRead(F,cfMaxFireCo,SI);
  BlockRead(F,cfD50,SI);
  BlockRead(F,cfIntervalMinA,SI);
  BlockRead(F,cfIntervalMaxA,SI);
  BlockRead(F,cfCountA,SI);
  BlockRead(F,cfWaitingA,SI);
  BlockRead(F,cfKirSize,SI);
  BlockRead(F,cfMaxFire,SI);
  CloseFile(F);

except
  InitCfg;
end;
End;

procedure TfmConfig.BitBtn3Click(Sender: TObject);
Var ErrorEl: TWinControl;
begin
  ErrorEl:=GetData;
  If ErrorEl=nil Then SaveCfg(false)
   Else begin
     showmessage('Ошибка! Проверьте введенную информацию!');
     ErrorEl.SetFocus; 
   end;
end;

procedure TfmConfig.PageControl1DrawTab(Control: TCustomTabControl;
  TabIndex: Integer; const Rect: TRect; Active: Boolean);
  var s: string;
   i: smallint;
 begin
    i:=0;
    s := PageControl1.Pages[TabIndex].Caption;
    with PageControl1.Canvas do begin
         while PageControl1.Pages[i].TabIndex <> TabIndex do inc(i);
         if Active  then Brush.Color:=clSkyBlue
         else Brush.Color:=clMenu;
         Font.Color := clBlack;
         FillRect(Rect);
         TextRect(Rect, Rect.Left, Rect.Top, s);
    end;
end;

procedure TfmConfig.BitBtn4Click(Sender: TObject);
begin
  InitCfg;
  SetData;
  SaveCfg(true);
end;

Begin
  SI:=SizeOf(smallint);
end.
