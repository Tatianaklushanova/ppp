unit clients;
{$DEFINE AllData}     // еще DM, MainForm   {если не закомм - то полная Medic2}

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
  public
    { Public declarations }
  end;

var
  fmClients: TfmClients;
  vibor_comp, vibor_cex, vibor_prof, vibor_work1, vibor_work2,
  vibor_work3, vibor_data : boolean;
  Pr_work: smallint;

implementation

uses newcompany, newprof, newcex, testMemoryVisionNach, testMemoryAudiNach,
     testChulteNach, testEmotionalNach, test_ZMRp, test_ZMRd,
     test_ear, testR3, testVn ;

{$R *.dfm}

////// открытие формы /////////

procedure TfmClients.FormShow(Sender: TObject);
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
   DBLookupComboBox4.KeyValue:= Null;
   DBLookupComboBox5.KeyValue:= Null;
   DBLookupComboBox6.KeyValue:= Null;
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
        DBRadioGroup1.ItemIndex:=0;
     end
  Else
  begin
    DataModule2.clients.Edit;
    kodcompp := DBLookupComboBox2.listsource.dataset.fieldbyname('Kod').asinteger;
    Label12.Caption := DataModule2.company.fieldbyname('Edrpoy').AsString;
    Label13.Caption := DataModule2.company.fieldbyname('LooCity').AsString;
    vibor_comp := true;
    vibor_cex := true;
    vibor_prof := true;
    vibor_data := true;
    TDBEdit1.ReadOnly :=true;
    TDBEdit2.ReadOnly :=true;
    TDBEdit3.ReadOnly :=true;
    DateTimePicker1.Enabled:=False;
  end;
  {$IFNDEF AllData}
    btNewComp.Visible:=false;
  {$ENDIF}

end;


///// Кнопка Отмена ///////////

procedure TfmClients.BitBtn2Click(Sender: TObject);
begin
  DataModule2.clients.Cancel;
  DataModule2.testing.Cancel;
  DataModule2.cex.Filtered:= false;
end;

///// Выбор вида работы ///////////

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

///// выбор предприятия ///////////

procedure TfmClients.DBLookupComboBox2Click(Sender: TObject);
 begin
    vibor_comp := true;
    Label12.Caption := DBLookupComboBox2.listsource.dataset.
                                    fieldbyname('Edrpoy').AsString;
    Label13.Caption := DBLookupComboBox2.listsource.dataset.
                                    fieldbyname('LooCity').AsString;
 end;

 ///// после выбора предприятия фильтр цехов  ///////////

procedure TfmClients.DBLookupComboBox2CloseUp(Sender: TObject);
begin
  if(vibor_comp) then
    begin
      kodcompp := DBLookupComboBox2.listsource.dataset.fieldbyname('Kod').asinteger;
      DataModule2.cex.Filtered:=true;
      DBLookupComboBox3.datasource.dataset.fieldbyname('Cex').Clear;
    end

end;

/////// ввод новой профессии////////////////

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

/////// ввод нового предприятия////////////////

procedure TfmClients.btNewCompClick(Sender: TObject);
begin
fmNewCompany := TfmNewCompany.Create(Self);
fmNewCompany.showmodal;
fmNewCompany.Free;
end;

/////// ввод нового цеха////////////////

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

/////// выход из формы по ОК - проверка на заполнение полей
/////  запись в базу клиентов, тестирование, запись результатов тестирования

procedure TfmClients.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);

var field, fieldrez, fieldball, str_err, sname:string;
 masrez: array[1..9] of double;
 masball: array[1..9] of smallint;
 masform: array[1..9] of string[25];
 maswork: array[1..3] of variant;
 i, j,k,ii: smallint;
 pr_f, pr_err : boolean;
 fc : TFormClass;
 f : TForm;
begin
 
  // проверка на заполнение полей

If ModalResult = mrOK then  begin

   pr_err:=false; str_err:='';
   if TDBEdit1.Text='' then begin pr_err:=true; str_err:='Не введена фамилия'; end;
   if TDBEdit2.Text='' then begin pr_err:=true; str_err:='Не введено имя'; end;
   if TDBEdit3.Text='' then begin pr_err:=true; str_err:='Не введено отчество'; end;
   if not vibor_comp then begin pr_err:=true; str_err:='Не выбрано предприятие'; end;
   if  not vibor_prof then begin pr_err:=true; str_err:='Не выбрана профессия'; end;
   if ((not vibor_cex) and (DBLookupComboBox3.listsource.dataset.RecordCount<>0))
          then begin pr_err:=true; str_err:='Не выбран цех'; end;
   if not vibor_data then begin pr_err:=true; str_err:='Не введена дата рождения'; end;
   if ((Pr_work=1) and (not vibor_work1)) or ((Pr_work=2)and(not vibor_work2))or
      ((Pr_work=3) and (not vibor_work3)) then begin pr_err:=true; str_err:='Не выбрана работа'; end;


  if pr_err then begin
    application.MessageBox(PChar(str_err),'Ошибка',16);
    CanClose:= false;
  end
  else  begin
      // запись в базу данных о клиенте

 {$IFNDEF AllData}  //  вставляется, если урезанный вариант 
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

 // тестирование
 Pr_test:= true;   //  признак, было ли тестирование
 k:=1;
 maswork[1]:= DBLookupComboBox4.KeyValue;
 maswork[2]:= DBLookupComboBox5.KeyValue;
 maswork[3]:= DBLookupComboBox6.KeyValue;
 For j:=1 to Pr_work do begin
    DataModule2.wwork.RecNo:= maswork[j];
    DataModule2.testing.Insert;

    For i:=1 to 9 do begin
     field:= 'fm'+intToStr(i);
     fieldrez:= 'Rez'+intToStr(i);
     fieldball:= 'Ball'+intToStr(i);
     sname :=  DataModule2.wwork.FieldByName(field).asString;
     if (sname='') then break;  //  проверка на наличие теста в работе

     pr_f:=false;
     For ii:=1 to k-1 do begin
        if (sname = masform[ii]) then begin pr_f:=true; break; end;
     end;
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
     end
     else  begin
         DataModule2.testing.FieldByName(fieldrez).AsFloat := masrez[ii];
         DataModule2.testing.FieldByName(fieldball).AsInteger := masball[ii];
     end;
  end;  // конец цикла по i

  DataModule2.testing.FieldByName('Inn').AsString:= IdKod;
  DataModule2.testing.FieldByName('Data').AsDateTime := Now;
  DataModule2.testing.FieldByName('Work1').AsInteger:= maswork[j];
  DataModule2.testing.Post;

end;   // конец цикла по j
CanClose:= true;
end;    // не было ошибок, тестирование

End   // нажата кнопка ОК
Else  begin CanClose:= true; Pr_test:= false;  End;  // нажата кнопка отмена

end;

/// выбор профессии
procedure TfmClients.DBLookupComboBox1Click(Sender: TObject);
begin
 vibor_prof:= true;
end;

/// выбор цеха
procedure TfmClients.DBLookupComboBox3Click(Sender: TObject);
begin
  vibor_cex:= true;
end;

// разворачивание списка цехов - фильтр по выбранному предприятию
procedure TfmClients.DBLookupComboBox3DropDown(Sender: TObject);
begin
  kodcompp := DBLookupComboBox2.listsource.dataset.fieldbyname('Kod').asinteger;
      DataModule2.cex.Filtered:=true;
      DBLookupComboBox3.datasource.dataset.fieldbyname('Cex').Clear;
end;

/// выбор 1 работы
procedure TfmClients.DBLookupComboBox4Click(Sender: TObject);
begin
  vibor_work1:= true;
end;

// выбор 2-х работ
procedure TfmClients.DBLookupComboBox5Click(Sender: TObject);
begin
  vibor_work2:= true;
end;

// выбор 3-х работы
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
end;

end.
