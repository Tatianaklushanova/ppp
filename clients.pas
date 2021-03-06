unit clients;
{$DEFINE AllData}     // ��� DM, MainForm   {���� �� ������ - �� ������ Medic2}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, common,
  DM, Grids, DBGrids, ExtCtrls, DBCtrls, StdCtrls, Mask, Buttons, ComCtrls;

type
  TfmClients = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label6: TLabel;
    TDBEdit1: TDBEdit;
    TDBEdit2: TDBEdit;
    TDBEdit3: TDBEdit;
    DBText3: TDBText;
    DBRadioGroup1: TDBRadioGroup;
    DBLookupComboBox1: TDBLookupComboBox;
    DateTimePicker1: TDateTimePicker;
    Label8: TLabel;
    DBLookupComboBox2: TDBLookupComboBox;
    Label9: TLabel;
    Label10: TLabel;
    DBLookupComboBox3: TDBLookupComboBox;
    Label11: TLabel;
    RadioGroup1: TRadioGroup;
    DBLookupComboBox4: TDBLookupComboBox;
    DBLookupComboBox5: TDBLookupComboBox;
    DBLookupComboBox6: TDBLookupComboBox;
    btNewComp: TButton;
    Label12: TLabel;
    Label13: TLabel;
    Button2: TButton;
    Button3: TButton;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure btNewCompClick(Sender: TObject);
    procedure DBLookupComboBox2Click(Sender: TObject);
    procedure DBLookupComboBox2CloseUp(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure DBLookupComboBox1Click(Sender: TObject);
    procedure DBLookupComboBox3Click(Sender: TObject);
    procedure DBLookupComboBox4Click(Sender: TObject);
    procedure DBLookupComboBox5Click(Sender: TObject);
    procedure DBLookupComboBox6Click(Sender: TObject);
    procedure DateTimePicker1Change(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBLookupComboBox3DropDown(Sender: TObject);

  private

    { Private declarations }
    NewClient: boolean;
    Procedure ExtrFile;
    Procedure ZapFileClient;
    Procedure ExtrClient;
  public
    { Public declarations }
  end;

var
  fmClients: TfmClients;
  vibor_comp, vibor_cex, vibor_prof, vibor_work1, vibor_work2,
  vibor_work3, vibor_data : boolean;
  Pr_work: smallint;
  FNach: TextFile;
  masrez: array[1..9] of double;
  masball: array[1..9] of smallint;
  masform: array[1..9] of string[25];
  MyText: TStringlist;
  MyClient: TStringlist;

  implementation

uses newcompany, newprof, newcex, testMemoryVisionNach, testMemoryAudiNach,
     testChulteNach, testEmotionalNach, test_ZMRp, test_ZMRd,
     test_ear, testR3, testVn;

{$R *.dfm}

////// �������� ����� /////////

procedure TfmClients.FormShow(Sender: TObject);
var i: smallint;
begin

  Panel1.Left:= (ClientWidth - Panel1.Width) div 2;
  Panel2.Left:= Panel1.Left;
  Panel3.Left:= Panel1.Left;
  Panel1.Top:=((ClientHeight-Panel1.Height-Panel2.Height-Panel3.Height) div 2)-30;
  Panel2.Top:= Panel1.Top+ Panel1.Height+5;
  Panel3.Top:= Panel2.Top+ Panel2.Height+5;;
  BitBtn1.Top:= Panel3.Top+ Panel3.Height+30;
  BitBtn2.Top:= BitBtn1.Top;
  BitBtn1.Left:= (ClientWidth - 440) div 2;
  BitBtn2.Left:= BitBtn1.Left+310;
  
  RegisterClass(TfmTestMemoryAudiNach);
  RegisterClass(TfmTestMemoryVisionNach);
  RegisterClass(TfmTestChulteNach);
  RegisterClass(TfmTest_ZMRp);
  RegisterClass(TfmTest_ZMRd);
  RegisterClass(TfmTest_ear);
  RegisterClass(TfmTestR3);
  RegisterClass(TfmTestVn);
  RegisterClass(TfmTestEmotionalNach);
  
   Pr_work:=1;
   vibor_comp := false;
   vibor_cex := false;
   vibor_prof := false;
   vibor_work1 := false;
   vibor_work2 := false;
   vibor_work3 := false;
   vibor_data := false;
   for i:=1 To 9 do begin
      masform[i]:= '                         ';
      masrez[i]:= 0;
      masball[i]:=0;
   end;
   if not FileExists('client.txt') then begin
      DBLookupComboBox4.KeyValue:= Null;
      DBLookupComboBox5.KeyValue:= Null;
      DBLookupComboBox6.KeyValue:= Null;
   end;

   DataModule2.city.Open;
   DataModule2.cex.Open;
   DataModule2.wwork.Open;
   DataModule2.profesion.Open;
   DataModule2.company.Open;
   DataModule2.clients.Active:=true;
   DataModule2.testing.Active:=true;

   DataModule2.clients.IndexName:='INNIndex';
   DataModule2.clients.SetKey;
   DataModule2.clients.FieldByName('Inn').AsString := IdKod;
   If (not DataModule2.clients.GotoKey) Then
   begin
        DataModule2.clients.Insert;
        DataModule2.clients.FieldByName('Inn').AsString:= IdKod;
        if  not FileExists('client.txt') then DBRadioGroup1.ItemIndex:=0
        else ExtrClient;
   end
   else
   begin
    DataModule2.clients.Edit;
    kodcompp := DBLookupComboBox2.listsource.dataset.fieldbyname('Kod').asinteger;
    vibor_comp := true;
    vibor_cex := true;
    vibor_prof := true;
    vibor_data := true;
    TDBEdit1.ReadOnly :=true;
    TDBEdit2.ReadOnly :=true;
    TDBEdit3.ReadOnly :=true;
    DateTimePicker1.Enabled:=False;
  end;
  Label12.Caption := DataModule2.company.fieldbyname('Edrpoy').AsString;
  Label13.Caption := DataModule2.company.fieldbyname('LooCity').AsString;

  {$IFNDEF AllData}
    btNewComp.Visible:=false;
  {$ENDIF}

end;

///// ���������� ����������� �� ����� ��� ����///////////

procedure TfmClients.ExtrFile;
var str,ss: string;
    i,k,l: smallint;
begin
  MyText:= TStringlist.create;
  MyText.LoadFromFile('nach.txt');

 for i:=0 to MyText.Count-1 do begin
     str:= MyText.Strings[i];
     k:=1;
     while str[k]<>' ' do Inc(k);
     masform[i+1]:= Copy(str,1,k-1);
     l:=k+1;
     while str[l]<>' ' do Inc(l);
     ss:= Copy(str,k+1,l-k-1);
     masrez[i+1]:= StrToFloat(ss);
     ss:= Copy(str,l+1,1);
     masball[i+1]:= StrToInt(ss);
  end;
end;

Procedure TfmClients.ExtrClient;
var rr:smallint;
begin
   DBLookupComboBox4.KeyValue:= strtoint(MyClient.Strings[1]);
   vibor_work1 := true;
   if MyClient.Strings[2] ='' then  DBLookupComboBox5.KeyValue:= Null
   else  begin
         DBLookupComboBox5.KeyValue:= strtoint(MyClient.Strings[2]);
         vibor_work2 := true;
         Pr_work:= 2;
         RadioGroup1.ItemIndex:=1;
         DBLookupComboBox5.Visible:=true;
    end;
    if MyClient.Strings[3] ='' then  DBLookupComboBox6.KeyValue:= Null
    else  begin
          DBLookupComboBox6.KeyValue:= strtoint(MyClient.Strings[3]);
          vibor_work3 := true;
          RadioGroup1.ItemIndex:=2;
          Pr_work:= 3;
          DBLookupComboBox6.Visible:=true;
    end;

    DBRadioGroup1.ItemIndex:= strtoint(MyClient.Strings[4]);  // ���
    TDBEdit1.Text:= MyClient.Strings[5];        // �������
    TDBEdit2.Text:= MyClient.Strings[6];        // ���
    TDBEdit3.Text:= MyClient.Strings[7];        // ��������
    DateTimePicker1.DateTime := StrToDateTime(MyClient.Strings[8]);    // ���� ��������
    DBLookupComboBox1.KeyValue:= strtoint(MyClient.Strings[9]);      // ���������
    DBLookupComboBox1.datasource.dataset.fieldbyname('Profesion').AsInteger:=strtoint(MyClient.Strings[9]);

    DBLookupComboBox2.KeyValue:= strtoint(MyClient.Strings[10]);  // �����������
    DBLookupComboBox2.datasource.dataset.fieldbyname('Company').AsInteger:=strtoint(MyClient.Strings[10]);

    if MyClient.Strings[11] ='' then  begin
       DBLookupComboBox3.KeyValue:= Null;
       DBLookupComboBox3.datasource.dataset.fieldbyname('Cex').AsInteger:=0;
    end
    else begin
        DBLookupComboBox3.KeyValue:= strtoint(MyClient.Strings[11]);  // ���
        DBLookupComboBox3.datasource.dataset.fieldbyname('Cex').AsInteger:=strtoint(MyClient.Strings[11]);
    end;
    vibor_comp := true;
    vibor_cex := true;
    vibor_prof := true;
    vibor_data := true;
end;

///// ����������� � ���� client.txt ///////////

procedure TfmClients.ZapFileClient;
begin
  MyClient:= TStringlist.create;
    MyClient.Add(IdKod);
    MyClient.Add(vartostr(DBLookupComboBox4.KeyValue));
    MyClient.Add(vartostr(DBLookupComboBox5.KeyValue));
    MyClient.Add(vartostr(DBLookupComboBox6.KeyValue));
    MyClient.Add(inttostr(DBRadioGroup1.ItemIndex));  // ���
    MyClient.Add(TDBEdit1.Text);        // ������
    MyClient.Add(TDBEdit2.Text);        // ���
    MyClient.Add(TDBEdit3.Text);        // ��������
    MyClient.Add (DateTimeToStr(DateTimePicker1.DateTime));    // ���� ��������
    MyClient.Add(inttostr(DBLookupComboBox1.KeyValue));  //���������
    MyClient.Add(inttostr(DBLookupComboBox2.KeyValue));  //�����������
    MyClient.Add(vartostr(DBLookupComboBox3.KeyValue));  // ���
    MyClient.SaveToFile('client.txt');
 end;

///// ������ ������ ///////////

procedure TfmClients.BitBtn2Click(Sender: TObject);
begin
  DataModule2.clients.Cancel;
  DataModule2.testing.Cancel;
  DataModule2.cex.Filtered:= false;
end;

///// ����� ���� ������ ///////////

procedure TfmClients.RadioGroup1Click(Sender: TObject);
begin

Pr_work:= RadioGroup1.ItemIndex +1;
case  RadioGroup1.ItemIndex of
    0: begin
          DBLookupComboBox4.Visible := true;
          DBLookupComboBox5.Visible := false;
          DBLookupComboBox6.Visible := false;
        end;
    1: begin
          DBLookupComboBox5.Visible := true;
          DBLookupComboBox6.Visible := false;
        end;
    2: begin
           DBLookupComboBox5.Visible := true;
           DBLookupComboBox6.Visible := True;
       end;
end;

end;

///// ����� ����������� ///////////

procedure TfmClients.DBLookupComboBox2Click(Sender: TObject);
 begin
    vibor_comp := true;
    Label12.Caption := DBLookupComboBox2.listsource.dataset.
                                    fieldbyname('Edrpoy').AsString;
    Label13.Caption := DBLookupComboBox2.listsource.dataset.
                                    fieldbyname('LooCity').AsString;
 end;

 ///// ����� ������ ����������� ������ �����  ///////////

procedure TfmClients.DBLookupComboBox2CloseUp(Sender: TObject);
begin
  if(vibor_comp) then
    begin
      kodcompp := DBLookupComboBox2.listsource.dataset.fieldbyname('Kod').asinteger;
      DataModule2.cex.Filtered:=true;
      DBLookupComboBox3.datasource.dataset.fieldbyname('Cex').Clear;
    end

end;

/////// ���� ����� ���������////////////////

procedure TfmClients.Button2Click(Sender: TObject);
begin
   fmNewProf := TfmNewProf.Create(Self);
//   fmNewprof.showmodal;
   If fmNewprof.showmodal=mrOK Then begin
     DataModule2.clientsProfesion.AsInteger:=fmNewprof.NewKod;
     vibor_prof:=true;
   end;
   fmNewProf.Free;
end;

/////// ���� ������ �����������////////////////

procedure TfmClients.btNewCompClick(Sender: TObject);
begin
fmNewCompany := TfmNewCompany.Create(Self);
fmNewCompany.showmodal;
fmNewCompany.Free;
end;

/////// ���� ������ ����////////////////

procedure TfmClients.Button3Click(Sender: TObject);
begin
   fmNewCex := TfmNewCex.Create(Self);
//   fmNewCex.showmodal;
   fmNewCex.Compa:=DataModule2.clientsCompany.AsInteger;
   If fmNewCex.showmodal=mrOK Then begin
     DataModule2.clientsCex.AsInteger:=fmNewCex.NewKod;
     vibor_cex:=true;
   end;
   fmNewCex.Free;
end;


/////// ����� �� ����� �� �� - �������� �� ���������� �����
/////  ������ � ���� ��������, ������������, ������ ����������� ������������

procedure TfmClients.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);

var field, fieldrez, fieldball, str_err, sname,ss:string;
 maswork: array[1..3] of variant;
 i, j,k,ii: smallint;
 pr_f, pr_err, Pr_existfile : boolean;
 fc : TFormClass;
 f : TForm;

begin

  // �������� �� ���������� �����

If ModalResult = mrOK then  begin

   pr_err:=false; str_err:='';
   if TDBEdit1.Text='' then begin pr_err:=true; str_err:='�� ������� �������'; end;
   if TDBEdit2.Text='' then begin pr_err:=true; str_err:='�� ������� ���'; end;
   if TDBEdit3.Text='' then begin pr_err:=true; str_err:='�� ������� ��������'; end;
   if not vibor_comp then begin pr_err:=true; str_err:='�� ������� �����������'; end;
   if  not vibor_prof then begin pr_err:=true; str_err:='�� ������� ���������'; end;
   if ((not vibor_cex) and (DBLookupComboBox3.listsource.dataset.RecordCount<>0))
          then begin pr_err:=true; str_err:='�� ������ ���'; end;
   if not vibor_data then begin pr_err:=true; str_err:='�� ������� ���� ��������'; end;
   if ((Pr_work=1) and (not vibor_work1)) or ((Pr_work=2)and(not vibor_work2))or
      ((Pr_work=3) and (not vibor_work3)) then begin pr_err:=true; str_err:='�� ������� ������'; end;


  if pr_err then begin
    application.MessageBox(PChar(str_err),'������',16);
    CanClose:= false;
  end
  else  begin
      // ������ � ���� ������ � �������

 {$IFNDEF AllData}  //  �����������, ���� ��������� �������
    If NewClient Then begin
      DataModule2.clients.FieldByName('New').AsString:='I';
{      quMaxClientKod.Open;
      DataModule2.clients.FieldByName('Kod').AsInteger:=quMaxClientKodmaxKod.AsInteger+1;
      quMaxClientKod.Close;}
    end
    Else DataModule2.clients.FieldByName('New').AsString:='U';
{$ENDIF}
  DataModule2.clients.FieldByName('Data_r').AsDateTime := DateTimePicker1.DateTime;
  DataModule2.clients.Post;
  DataModule2.cex.Filtered:= false;

 // ������������
 Pr_test:= true;   //  �������, ���� �� ������������

 maswork[1]:= DBLookupComboBox4.KeyValue;
 maswork[2]:= DBLookupComboBox5.KeyValue;
 maswork[3]:= DBLookupComboBox6.KeyValue;
 if not FileExists('client.txt') then ZapFileClient; // ����������� � ���� client

 if FileExists('nach.txt') then begin
    Pr_existfile:=true;
    ExtrFile;
    k:= MyText.Count+1;
 end
 else  begin
   k:=1;
   Pr_existfile:= false;
   MyText:= TStringlist.create;
 end;

 For j:=1 to Pr_work do begin
    DataModule2.wwork.RecNo:= maswork[j];
    DataModule2.testing.Insert;

   pr_f:=false;
   For i:=1 to 9 do begin
     field:= 'fm'+intToStr(i);
     fieldrez:= 'Rez'+intToStr(i);
     fieldball:= 'Ball'+intToStr(i);
     sname :=  DataModule2.wwork.FieldByName(field).asString;
     if (sname='') then break;  //  �������� �� ������� ����� � ������

  If ((j>1) OR Pr_existfile) then begin
     pr_f:=false;
     For ii:=1 to 9 do begin
        if (sname = masform[ii]) then begin pr_f:=true; break; end;
     end;
  End;
     if not pr_f then begin
        fc := TFormClass(FindClass(sname));
        f := fc.Create(Application);
        f.Showmodal;
        DataModule2.testing.FieldByName(fieldrez).AsFloat := RezTest;
        DataModule2.testing.FieldByName(fieldball).AsInteger := Ball;
        masform[k]:= sname;
        masrez[k]:= RezTest;
        masball[k]:= Ball;
        inc(k);

        MyText.Add(sname+' '+FloatToStr(RezTest)+' '+IntToStr(Ball));
        MyText.SaveToFile('nach.txt');
     end
     else  begin
         DataModule2.testing.FieldByName(fieldrez).AsFloat := masrez[ii];
         DataModule2.testing.FieldByName(fieldball).AsInteger := masball[ii];
      //   if Pr_existfile then k:= ii+1;
     //    Writeln(FNach, (sname+' '+FloatToStr(masrez[ii])+' '+IntToStr(masball[ii])));
     end;
  end;  // ����� ����� �� i

  DataModule2.testing.FieldByName('Inn').AsString:= IdKod;
  DataModule2.testing.FieldByName('Data').AsDateTime := Now;
  DataModule2.testing.FieldByName('Work1').AsInteger:= maswork[j];
  DataModule2.testing.Post;

end;   // ����� ����� �� j
CanClose:= true;
end;    // �� ���� ������, ������������

End   // ������ ������ ��
Else  begin CanClose:= true; Pr_test:= false;  End;  // ������ ������ ������

end;

/// ����� ���������
procedure TfmClients.DBLookupComboBox1Click(Sender: TObject);
begin
 vibor_prof:= true;
end;

/// ����� ����
procedure TfmClients.DBLookupComboBox3Click(Sender: TObject);
begin
  vibor_cex:= true;
end;

// �������������� ������ ����� - ������ �� ���������� �����������
procedure TfmClients.DBLookupComboBox3DropDown(Sender: TObject);
begin
  kodcompp := DBLookupComboBox2.listsource.dataset.fieldbyname('Kod').asinteger;
      DataModule2.cex.Filtered:=true;
      DBLookupComboBox3.datasource.dataset.fieldbyname('Cex').Clear;
end;

/// ����� 1 ������
procedure TfmClients.DBLookupComboBox4Click(Sender: TObject);
begin
  vibor_work1:= true;
end;

// ����� 2-� �����
procedure TfmClients.DBLookupComboBox5Click(Sender: TObject);
begin
  vibor_work2:= true;
end;

// ����� 3-� ������
procedure TfmClients.DBLookupComboBox6Click(Sender: TObject);
begin
   vibor_work3:= true;
end;

procedure TfmClients.DateTimePicker1Change(Sender: TObject);
begin
  vibor_data:= true;
end;

procedure TfmClients.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   DataModule2.city.Close;
   DataModule2.cex.Close;
   DataModule2.wwork.Close;
   DataModule2.profesion.Close;
   DataModule2.company.Close;
   DataModule2.clients.Close;
   DataModule2.testing.Close;
   MyText.Free;
   DeleteFile('nach.txt');
   MyClient.Free;
   DeleteFile('client.txt');
end;

end.
