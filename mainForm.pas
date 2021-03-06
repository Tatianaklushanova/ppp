unit mainForm;
{$DEFINE AllData} // ��� DM, Clients

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, Grids, ExtCtrls, DBCtrls, DBGrids, jpeg, StdCtrls, Math;

type
  TfmMain = class(TForm)
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N5: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    N14: TMenuItem;
    N15: TMenuItem;
    N16: TMenuItem;
    N17: TMenuItem;
    N18: TMenuItem;
    N19: TMenuItem;
    N20: TMenuItem;
    N21: TMenuItem;
    N22: TMenuItem;
    miFiles: TMenuItem;
    miExport: TMenuItem;
    Image1: TImage;
    Label1: TLabel;
    miExLine: TMenuItem;
    miExit: TMenuItem;
    miImport: TMenuItem;
    procedure N11Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure N10Click(Sender: TObject);

    procedure N12Click(Sender: TObject);
    procedure N13Click(Sender: TObject);
    procedure N14Click(Sender: TObject);
    procedure N15Click(Sender: TObject);
    procedure N16Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N17Click(Sender: TObject);
    procedure N18Click(Sender: TObject);
    procedure N19Click(Sender: TObject);
    procedure N20Click(Sender: TObject);
    procedure N21Click(Sender: TObject);
    procedure N22Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure miExportClick(Sender: TObject);
    procedure miExitClick(Sender: TObject);
    procedure miImportClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure miFilesAdvancedDrawItem(Sender: TObject; ACanvas: TCanvas;
      ARect: TRect; State: TOwnerDrawState);
    procedure N1AdvancedDrawItem(Sender: TObject; ACanvas: TCanvas;
      ARect: TRect; State: TOwnerDrawState);
    procedure N2AdvancedDrawItem(Sender: TObject; ACanvas: TCanvas;
      ARect: TRect; State: TOwnerDrawState);
    procedure N3AdvancedDrawItem(Sender: TObject; ACanvas: TCanvas;
      ARect: TRect; State: TOwnerDrawState);
    procedure N6AdvancedDrawItem(Sender: TObject; ACanvas: TCanvas;
      ARect: TRect; State: TOwnerDrawState);
    procedure N22AdvancedDrawItem(Sender: TObject; ACanvas: TCanvas;
      ARect: TRect; State: TOwnerDrawState);
    procedure N4AdvancedDrawItem(Sender: TObject; ACanvas: TCanvas;
      ARect: TRect; State: TOwnerDrawState);
      
  private
    { Private declarations }
  public
    { Public declarations }
  end;


var
  fmMain: TfmMain;

implementation

uses clients, profesion, city, vvod, sprav_clients, company, work,
  cex, testChulte, testChulteNach, testMemoryVisionNach,
  getComp, common,
  testMemoryAudiNach, testEmotionalNach, testing, print, test_ear,
  test_ZMRp, test_ZMRd, testVn, config, testR3;

{$R *.dfm}

// ********** ���� ������ � ������� � ������������ ****************

procedure TfmMain.N2Click(Sender: TObject);
begin
if not FileExists('client.txt') then begin
  fmVvod:=TfmVvod.Create(Self);
  if fmvvod.ShowModal = mrOK  then
     begin
       fmClients := TfmClients.Create(Self);
       fmClients.showmodal;
       fmClients.Free;
       if Pr_test  then application.MessageBox
                (PChar('������������ ������� ���������'),'',MB_ICONINFORMATION);
     end;
  fmVvod.Free;
end
else begin
   MyClient:= TStringlist.create;
   MyClient.LoadFromFile('client.txt');
   IdKod:= MyClient.Strings[0];
   
   fmClients := TfmClients.Create(Self);
   fmClients.showmodal;
   fmClients.Free;
   if Pr_test  then application.MessageBox
           (PChar('������������ ������� ���������'),'',MB_ICONINFORMATION);
end;

end;

// ********** ���������� ����� ****************

procedure TfmMain.N11Click(Sender: TObject);
begin
  fmCex.Show;
end;

// ********** ���������� �������� ****************

procedure TfmMain.N5Click(Sender: TObject);
begin
fmSpravClients.Show;
end;

// ********** ���������� ��������� ****************

procedure TfmMain.N7Click(Sender: TObject);
begin
fmProfesion.show;
end;

// ********** ���������� ������� ****************

procedure TfmMain.N8Click(Sender: TObject);
begin
fmCity.show;
end;

// ********** ���������� ����������� ****************

procedure TfmMain.N9Click(Sender: TObject);
begin
fmCompany.show;
end;

// ********** ���������� ����� ����� ****************

procedure TfmMain.N10Click(Sender: TObject);
begin
 fmWork.show;
end;

// ********** ���������� ������������ ****************

procedure TfmMain.N16Click(Sender: TObject);
begin
  fmTesting.show;
end;

// ***********����� ********************************
// ********** ���� ������-��������� ****************

procedure TfmMain.N12Click(Sender: TObject);
begin
 fmTestChulteNach:= TfmTestChulteNach.Create(Self);
 fmTestChulteNach.show;
end;

// ********** ���������� ������ ****************

procedure TfmMain.N13Click(Sender: TObject);
begin
fmTestMemoryVisionNach:=TfmTestMemoryVisionNach.Create(Self);
fmTestMemoryVisionNach.show;
end;

// ********** �������� ������ ****************


procedure TfmMain.N14Click(Sender: TObject);
begin
 fmTestMemoryAudiNach:=TfmTestMemoryAudiNach.Create(Self);
 fmTestMemoryAudiNach.show;
end;

// ********** ������������� ������������ ****************

procedure TfmMain.N15Click(Sender: TObject);
begin
 fmTestEmotionalNach:= TfmTestEmotionalNach.Create(Self);
 fmTestEmotionalNach.show;
end;

// ********** ������� �� ���������� ������ ****************

procedure TfmMain.N17Click(Sender: TObject);
begin
 fmTestR3:= TfmTestR3.Create(Self);
 fmTestR3.show;
end;

// ********** ������� �� �������� ������ ****************

procedure TfmMain.N18Click(Sender: TObject);
begin
 fmTest_ear:= TfmTest_ear.Create(Self);
 fmTest_ear.show;
end;

// ********** ������������� �������(������� ����) ****************

procedure TfmMain.N19Click(Sender: TObject);
begin
 fmTest_ZMRp:= TfmTest_ZMRp.Create(Self);
 fmTest_ZMRp.show;
end;

// ********** ������������� ������� ����.(�������, ������� �����) ****

procedure TfmMain.N20Click(Sender: TObject);
begin
 fmTest_ZMRd:= TfmTest_ZMRd.Create(Self);
 fmTest_ZMRd.show;
end;

// ********** ������������ � �������� *************

procedure TfmMain.N21Click(Sender: TObject);
begin
 fmTestVn:= TfmTestVn.Create(Self);
 fmTestVn.show;
end;

// ********** �������� ����� ****************

procedure TfmMain.N3Click(Sender: TObject);
begin
  fmPrint.show;
end;

procedure TfmMain.N22Click(Sender: TObject);
begin
  fmConfig.ShowModal;
end;


procedure TfmMain.FormCreate(Sender: TObject);
begin
  LoadCFG;
  miExit.ShortCut:= ShortCut(Word('X'), [ssAlt]);
  {$IFNDEF AllData}
    miExport.Visible:=false;
    miImport.Visible:=false;
    miExLine.Visible:=false;
  {$ENDIF}
end;

procedure TfmMain.miExportClick(Sender: TObject);
begin
  If fmGetComp.ShowModal=mrOK Then
    MessageDlg('���� ������ �������� �������',
    mtInformation,[mbOK],0);
end;

procedure TfmMain.miExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfmMain.miImportClick(Sender: TObject);
begin
  If (MessageDlg('������������� �������� ����?',mtConfirmation,[mbOK,mbCancel],0)=mrOK)
    Then fmGetComp.ImportBase;
end;

procedure TfmMain.FormShow(Sender: TObject);
 // const menu: array[1..6] of string[14] =('����','�����','������������',
 //                 '�������� �����','�����������','���������');
 // var i, len, ecran, kol_prob: smallint;
//  str: array[1..7] of string[25];
begin
   Image1.Width:= ClientWidth*35 div 100;
   Image1.Height:= ClientHeight*40 div 100;
   Image1.Top:= (ClientHeight - Image1.Height) div 2;
   Image1.Left:= (ClientWidth - Image1.Width) div 2;
   Label1.Left:= (ClientWidth - Label1.Width) div 2;
   Label1.Top:=(Image1.Top-Label1.Height) div 2;
   Screen.MenuFont.Size:=12;
   Screen.MenuFont.Name:= 'Bookman Old Style';
   Screen.MenuFont.Style:= [fsBold];

{   if ClientWidth > 1280 then ecran:= ClientWidth div 83
   else ecran:= ClientWidth div 54;
    for i:=1 to 7 do begin
      str[i]:='                         ';
      len:= (ecran - Length(menu[i])) div 2;
      if len <= 0 then len:=1;
      Insert(menu[i],str[i], len+1);
      Delete(str[i],len*2+1+Length(menu[i]),25);
   end; }

   miFiles.Caption:= '       ����       ';
   N1.Caption:='       �����      ';
   N2.Caption:= '   ������������   ';
   N3.Caption:= '  �������� �����  ';
   N6.Caption:= '    �����������   ';
   N22.Caption:= '     ���������    ';
  
end;

procedure TfmMain.miFilesAdvancedDrawItem(Sender: TObject;
  ACanvas: TCanvas; ARect: TRect; State: TOwnerDrawState);
begin
//showmessage('=='+inttostr(ARect));
  with TMenuItem(Sender) do
  begin
    with ACanvas do
    begin
    //  Brush.Color := clGradientInactiveCaption;
      Brush.Color := clBtnFace;

  //    Inc(ARect.Bottom,1);
      FillRect(ARect);
   //   Font.Color := clBlue;
      DrawText(ACanvas.Handle, PChar(Caption),Length(Caption),ARect,DT_SINGLELINE or DT_VCENTER);
    end;
  end;
end;

procedure TfmMain.N1AdvancedDrawItem(Sender: TObject; ACanvas: TCanvas;
  ARect: TRect; State: TOwnerDrawState);
begin
  with TMenuItem(Sender) do
  begin
    with ACanvas do
    begin
   //   Brush.Color := clGradientInactiveCaption;
   Brush.Color := clBtnFace;
   //   Inc(ARect.Bottom,1);
      FillRect(ARect);
   //   Font.Color := clBlue;
      DrawText(ACanvas.Handle, PChar(Caption),Length(Caption),ARect,DT_SINGLELINE or DT_VCENTER);
    end;
  end;
end;

procedure TfmMain.N2AdvancedDrawItem(Sender: TObject; ACanvas: TCanvas;
  ARect: TRect; State: TOwnerDrawState);
begin
  with TMenuItem(Sender) do
  begin
    with ACanvas do
    begin
  //    Brush.Color := clGradientInactiveCaption;
  Brush.Color := clBtnFace;
   //   Inc(ARect.Bottom,1);
      FillRect(ARect);
   //   Font.Color := clBlue;
      DrawText(ACanvas.Handle, PChar(Caption),Length(Caption),ARect,DT_SINGLELINE or DT_VCENTER);
    end;
  end;
end;

procedure TfmMain.N3AdvancedDrawItem(Sender: TObject; ACanvas: TCanvas;
  ARect: TRect; State: TOwnerDrawState);
begin
  with TMenuItem(Sender) do
  begin
    with ACanvas do
    begin
 //     Brush.Color := clGradientInactiveCaption;
 Brush.Color := clBtnFace;
    //  Inc(ARect.Bottom,1);
      FillRect(ARect);
      DrawText(ACanvas.Handle, PChar(Caption),Length(Caption),ARect,DT_SINGLELINE or DT_VCENTER);
    end;
  end;
end;

procedure TfmMain.N6AdvancedDrawItem(Sender: TObject; ACanvas: TCanvas;
  ARect: TRect; State: TOwnerDrawState);
begin
  with TMenuItem(Sender) do
  begin
    with ACanvas do
    begin
 //     Brush.Color := clGradientInactiveCaption;
 Brush.Color := clBtnFace;
   //   Inc(ARect.Bottom,1);
      FillRect(ARect);
      DrawText(ACanvas.Handle, PChar(Caption),Length(Caption),ARect,DT_SINGLELINE or DT_VCENTER);
    end;
  end;
end;

procedure TfmMain.N22AdvancedDrawItem(Sender: TObject; ACanvas: TCanvas;
  ARect: TRect; State: TOwnerDrawState);
begin
  with TMenuItem(Sender) do
  begin
    with ACanvas do
    begin
 //     Brush.Color := clGradientInactiveCaption;
 Brush.Color := clBtnFace;
   //   Inc(ARect.Bottom,1);
      FillRect(ARect);
      DrawText(ACanvas.Handle, PChar(Caption),Length(Caption),ARect,DT_SINGLELINE or DT_VCENTER);
    end;
  end;
end;

procedure TfmMain.N4AdvancedDrawItem(Sender: TObject; ACanvas: TCanvas;
  ARect: TRect; State: TOwnerDrawState);
begin
   with TMenuItem(Sender) do
  begin
    with ACanvas do
    begin
   //   Brush.Color := clGradientinactiveCaption;
   Brush.Color := clBtnFace;
   //   Inc(ARect.Bottom,1);
      FillRect(ARect);
   //   Font.Color := clBlue;
      DrawText(ACanvas.Handle, PChar(Caption),Length(Caption),ARect,DT_SINGLELINE or DT_VCENTER);
    end;
  end;
end;


end.
