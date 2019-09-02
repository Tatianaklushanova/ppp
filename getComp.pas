unit getComp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, dbcgrids,
  DM, CheckLst, ExtCtrls, Buttons, DB, DBTables, Grids, DBGrids;

type
  PArrInt=^TArrInt;
  TArrInt=array[1..1000]of integer;
  MArrInt=Class
    constructor Create(len: smallint);
    destructor Free;
    procedure AddIfNew(NA: integer);  // добавить элемент, если его еще нет в массиве
    procedure Append(NA: integer); // добавить элемент в конец массива
    function GetElement(ind: smallint): integer; // получить содержимое ячейки с индексом
    function FindElement(ele: integer): smallint; // поиск элемента в массиве, результат - индекс или -1, если нет
  private
    Arr: PArrInt;
    count: smallint;
    Alen: smallint;
  end;
  
  TfmGetComp = class(TForm)
    chComp: TCheckListBox;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Bevel1: TBevel;
    tbCompany: TTable;
    tbCompanyName: TStringField;
    tbCompanyEdrpoy: TStringField;
    tbCompanyCity: TSmallintField;
    tbCompanyKod: TSmallintField;
    quCity: TQuery;
    tbCity: TTable;
    tbCityName: TStringField;
    quCityName: TStringField;
    quCityKod: TIntegerField;
    tbCityKod: TSmallintField;
    quCex: TQuery;
    quCexKod: TIntegerField;
    quCexName: TStringField;
    quCexKodcompany: TSmallintField;
    tbCex: TTable;
    tbCexKod: TSmallintField;
    tbCexName: TStringField;
    tbCexKodcompany: TSmallintField;
    tbProfession: TTable;
    tbProfessionKod: TSmallintField;
    tbProfessionName: TStringField;
    quClients: TQuery;
    quClientsKod: TIntegerField;
    quClientsINN: TStringField;
    quClientsFamil: TStringField;
    quClientsName: TStringField;
    quClientsOtch: TStringField;
    quClientsPol: TStringField;
    quClientsData_r: TDateField;
    quClientsProfesion: TSmallintField;
    quClientsCompany: TSmallintField;
    quClientsCex: TSmallintField;
    tbWork: TTable;
    tbWorkKod: TIntegerField;
    tbWorkName: TStringField;
    tbWorkFm1: TStringField;
    tbWorkFm2: TStringField;
    tbWorkFm3: TStringField;
    tbWorkFm4: TStringField;
    tbWorkFm5: TStringField;
    tbWorkFm6: TStringField;
    tbWorkFm7: TStringField;
    tbWorkFm8: TStringField;
    tbWorkFm9: TStringField;
    quTesting: TQuery;
    quTestingKod: TIntegerField;
    quTestingData: TDateField;
    quTestingINN: TStringField;
    quTestingWork1: TSmallintField;
    quTestingRez1: TFloatField;
    quTestingBall1: TSmallintField;
    quTestingRez2: TFloatField;
    quTestingBall2: TSmallintField;
    quTestingRez3: TFloatField;
    quTestingBall3: TSmallintField;
    quTestingRez4: TFloatField;
    quTestingBall4: TSmallintField;
    quTestingRez5: TFloatField;
    quTestingBall5: TSmallintField;
    quTestingRez6: TFloatField;
    quTestingBall6: TSmallintField;
    quTestingRez7: TFloatField;
    quTestingBall7: TSmallintField;
    quTestingRez8: TFloatField;
    quTestingBall8: TSmallintField;
    quTestingRez9: TFloatField;
    quTestingBall9: TSmallintField;
    quTestingKod_1: TIntegerField;
    quTestingINN_1: TStringField;
    quTestingFamil: TStringField;
    quTestingName: TStringField;
    quTestingOtch: TStringField;
    quTestingPol: TStringField;
    quTestingData_r: TDateField;
    quTestingProfesion: TSmallintField;
    quTestingCompany: TSmallintField;
    quTestingCex: TSmallintField;
    tbClients: TTable;
    tbClientsINN: TStringField;
    tbClientsFamil: TStringField;
    tbClientsName: TStringField;
    tbClientsOtch: TStringField;
    tbClientsPol: TStringField;
    tbClientsData_r: TDateField;
    tbClientsProfesion: TSmallintField;
    tbClientsCompany: TSmallintField;
    tbClientsCex: TSmallintField;
    tbClientsNew: TStringField;
    tbTesting: TTable;
    tbTestingData: TDateField;
    tbTestingINN: TStringField;
    tbTestingWork1: TSmallintField;
    tbTestingRez1: TFloatField;
    tbTestingBall1: TSmallintField;
    tbTestingRez2: TFloatField;
    tbTestingBall2: TSmallintField;
    tbTestingRez3: TFloatField;
    tbTestingBall3: TSmallintField;
    tbTestingRez4: TFloatField;
    tbTestingBall4: TSmallintField;
    tbTestingRez5: TFloatField;
    tbTestingBall5: TSmallintField;
    tbTestingRez6: TFloatField;
    tbTestingBall6: TSmallintField;
    tbTestingRez7: TFloatField;
    tbTestingBall7: TSmallintField;
    tbTestingRez8: TFloatField;
    tbTestingBall8: TSmallintField;
    tbTestingRez9: TFloatField;
    tbTestingBall9: TSmallintField;
    tbTestingNew: TStringField;
    tbClientsKod: TIntegerField;
    tbTestingKod: TIntegerField;
    quFindCex: TQuery;
    quFindProf: TQuery;
    quFindCexKod: TSmallintField;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ImportBase;
  end;

var
  fmGetComp: TfmGetComp;

implementation

{$R *.dfm}

///////////////////////////////////////////////////////////

  constructor MArrInt.Create(len: smallint);
  Begin
    GetMem(Arr,len*SizeOf(integer));
    count:=0; Alen:=len;
  End;
  
  destructor MArrInt.Free;
  Begin
    FreeMem(Arr,Alen*SizeOf(integer));
  end;

  procedure MArrInt.Append(NA: integer); // добавить элемент в конец массива
  begin
    Inc(count); Arr^[count]:=NA;
  end;

  procedure MArrInt.AddIfNew(NA: integer);
  var i: smallint;
  Begin
    For i:=1 to count do begin
      If Arr^[i]=NA Then exit;
    end;
    Inc(count); Arr^[count]:=NA;
  End;

  function MArrInt.GetElement(ind: smallint): integer;
  Begin
    Result:=Arr^[ind];
  end;

  function MArrInt.FindElement(ele: integer): smallint;
  var i: smallint;
  Begin
    For i:=1 to count do begin
      If Arr^[i]=ele Then begin
        Result:=i;
        exit;
      end;
    end;
    Result:=-1;
  End;


///////////////////////////////////////////////////////////

  procedure TfmGetComp.ImportBase;
  Var Cexs, CexsN,profs, profsN: MArrInt;
      found: boolean;
      newC,fe,i: smallint;
  Begin
    Cexs:=MArrInt.Create(50);
    CexsN:=MArrInt.Create(50);
    profs:=MArrInt.Create(50);
    profsN:=MArrInt.Create(50);
  {*************  по цехам  ***************}
    tbCex.Open;
    DataModule2.cex.Open;
    While not tbCex.Eof do begin
      quFindCex.SQL.Clear;
      quFindCex.SQL.Add('Select * from cex');
      quFindCex.SQL.Add(Format('where name=''%s'' and kodCompany=%d;',
      [tbCexName.AsString,tbCexKodCompany.AsInteger]));
      quFindCex.Open; found:=(quFindCex.RecordCount>0);
      quFindCex.Close;
      If (not found) Then begin
        DataModule2.cex.Append;
        ShowMessage('Добавляется запись (цех): '+tbCexName.AsString);
        DataModule2.quMaxKodCex.Open;
        newC:=DataModule2.quMaxKodcexmaxkod.AsInteger+1;
        DataModule2.cexKod.AsInteger:=newC;
        DataModule2.quMaxKodCex.Close;
        DataModule2.cexName.AsString:=tbCexName.AsString;
        DataModule2.cexKodcompany.AsInteger:=tbCexKodCompany.AsInteger;
        DataModule2.cex.Post;
        Cexs.Append(tbCexKod.AsInteger);
        CexsN.Append(newC);
      end;
      tbCex.Next;
    end;
    tbCex.Close;
{    showmessage('cexs.count='+inttostr(cexs.count));
    showmessage('cexsN.count='+inttostr(cexsN.count));
    For i:=1 to Cexs.count do begin
      ShowMessage(Format('i=%d, cex=%d, cexn=%d',[i,Cexs.GetElement(i),CexsN.GetElement(i)]));
    end;}
    DataModule2.cex.Close;

  {*************  по профессиям  ***************}
    tbProfession.Open;
    DataModule2.Profesion.Open;
    While not tbProfession.Eof do begin
{      quFindProf.Prepare;
      quFindProf.ParamByName('Name').AsString:=tbProfessionName.AsString;
      quFindProf.Open;}
      quFindProf.SQL.Clear;
      quFindProf.SQL.Add('Select * from profession');
      quFindProf.SQL.Add(Format('where name=''%s''',[tbProfessionName.AsString]));
      quFindProf.Open; found:=(quFindProf.RecordCount>0);
      quFindProf.Close;
      If (not found) Then begin
        DataModule2.Profesion.Append;
        ShowMessage('Добавляется запись (профессия): '+tbProfessionName.AsString);
        DataModule2.quMaxKodProf.Open;
        newC:=DataModule2.quMaxKodProfmaxkod.AsInteger+1;
        DataModule2.ProfesionKod.AsInteger:=newC;
        DataModule2.quMaxKodProf.Close;
        DataModule2.profesionName.AsString:=tbProfessionName.AsString;
        DataModule2.profesion.Post;
        profs.Append(tbProfessionKod.AsInteger);
        profsN.Append(newC);
      end;
      quFindProf.Close;
      tbProfession.Next;
    end;
    tbProfession.Close;
    DataModule2.profesion.Close;

  {*************  по клиентам  ***************}
    tbClients.Open;
    DataModule2.clients.Open;
    While not tbClients.Eof do begin
      If tbClientsNew.AsString='I' Then begin
        DataModule2.clients.Append;
        ShowMessage('Добавление клиента: '+tbClientsFamil.AsString+' '+tbClientsName.AsString);
        DataModule2.clientsINN.AsString:=tbClientsINN.AsString;
        DataModule2.clientsFamil.AsString:=tbClientsFamil.AsString;
        DataModule2.clientsName.AsString:=tbClientsName.AsString;
        DataModule2.clientsOtch.AsString:=tbClientsOtch.AsString;
        DataModule2.clientsPol.AsString:=tbClientsPol.AsString;
        DataModule2.clientsData_r.AsString:=tbClientsData_r.AsString;
        fe:=Cexs.FindElement(tbClientsCex.AsInteger);
        If fe<>-1 Then DataModule2.clientsCex.AsInteger:=CexsN.GetElement(fe)
          Else DataModule2.clientsCex.AsInteger:=tbClientsCex.AsInteger;
        DataModule2.clientsCompany.AsInteger:=tbClientsCompany.AsInteger;
        DataModule2.clientsProfesion.AsInteger:=tbClientsProfesion.AsInteger;
        DataModule2.clients.Post;
      end
      Else If tbClientsNew.AsString='U' Then begin
        DataModule2.clients.IndexName:='INNIndex';
        DataModule2.clients.SetKey;
        DataModule2.clients.FieldByName('Inn').AsString := tbClientsINN.AsString;

       If (DataModule2.clients.GotoKey) Then begin
        DataModule2.clients.Edit;
//        DataModule2.clientsINN.AsString:=tbClientsINN.AsString;
        DataModule2.clientsFamil.AsString:=tbClientsFamil.AsString;
        DataModule2.clientsName.AsString:=tbClientsName.AsString;
        DataModule2.clientsOtch.AsString:=tbClientsOtch.AsString;
        DataModule2.clientsPol.AsString:=tbClientsPol.AsString;
        DataModule2.clientsData_r.AsString:=tbClientsData_r.AsString;
        DataModule2.clientsProfesion.AsInteger:=tbClientsProfesion.AsInteger;
        DataModule2.clientsCompany.AsInteger:=tbClientsCompany.AsInteger;
//        DataModule2.clientsCex.AsInteger:=tbClientsCex.AsInteger;
        fe:=Cexs.FindElement(tbClientsCex.AsInteger);
        If fe<>-1 Then DataModule2.clientsCex.AsInteger:=CexsN.GetElement(fe)
          Else DataModule2.clientsCex.AsInteger:=tbClientsCex.AsInteger;
        DataModule2.clients.Post;
       end;
      end;
      tbClients.Next;
    end;

  {*************  по тестам  ***************}
    tbTesting.Open;
    DataModule2.testing.Open;
    While not tbTesting.Eof do begin
      If tbTestingNew.AsString='N' Then begin
        DataModule2.testing.Append;
        DataModule2.testingINN.AsString:=tbtestingINN.AsString;
        DataModule2.testingData.AsString:=tbtestingData.AsString;
        DataModule2.testingWork1.AsInteger:=tbtestingWork1.AsInteger;
        DataModule2.testingRez1.AsFloat:=tbtestingRez1.AsFloat;
        DataModule2.testingBall1.AsInteger:=tbtestingBall1.AsInteger;
        DataModule2.testingRez2.AsFloat:=tbtestingRez2.AsFloat;
        DataModule2.testingBall1.AsInteger:=tbtestingBall2.AsInteger;
        DataModule2.testingRez3.AsFloat:=tbtestingRez3.AsFloat;
        DataModule2.testingBall1.AsInteger:=tbtestingBall3.AsInteger;
        DataModule2.testingRez4.AsFloat:=tbtestingRez4.AsFloat;
        DataModule2.testingBall1.AsInteger:=tbtestingBall4.AsInteger;
        DataModule2.testingRez5.AsFloat:=tbtestingRez5.AsFloat;
        DataModule2.testingBall1.AsInteger:=tbtestingBall5.AsInteger;
        DataModule2.testingRez6.AsFloat:=tbtestingRez6.AsFloat;
        DataModule2.testingBall1.AsInteger:=tbtestingBall6.AsInteger;
        DataModule2.testingRez7.AsFloat:=tbtestingRez7.AsFloat;
        DataModule2.testingBall1.AsInteger:=tbtestingBall7.AsInteger;
        DataModule2.testingRez8.AsFloat:=tbtestingRez8.AsFloat;
        DataModule2.testingBall1.AsInteger:=tbtestingBall8.AsInteger;
        DataModule2.testingRez9.AsFloat:=tbtestingRez9.AsFloat;
        DataModule2.testingBall1.AsInteger:=tbtestingBall9.AsInteger;
        DataModule2.testing.Post;
      end;
      tbTesting.Next;
    end;
    tbTesting.Close;
    DataModule2.testing.Close;
    tbClients.Close;
    cexs.Free;
    cexsN.Free;
    profs.Free;
    profsN.Free;

//    tbClients.EmptyTable;
//    tbTesting.EmptyTable;

  end;



procedure TfmGetComp.FormShow(Sender: TObject);
begin
  With DataModule2.company do begin
    Open;
    First;
    While not EOF do begin
      chComp.Items.Add(DataModule2.companyName.AsString+
      ' ('+DataModule2.companyLooCity.AsString+')');
      Next;
    end;
  end;
{  query1.Open;
  showmessage('cou='+inttostr(query1.RecordCount));
 }
end;

procedure TfmGetComp.FormClose(Sender: TObject; var Action: TCloseAction);
var i: integer;
  cit1: byte;
//  Cities: set of byte;
//  Cities: array[1..100] of integer;
  CitiesA: MArrInt;
  CompA:   MArrInt;
  CitiesCo: smallint;
  SSCompa,SS: string;
  cKod: integer;
  cName: string;
{    eKod,eCity: integer;
    eName,eEDRPOY: string;}
begin
  If ModalResult=mrOK Then begin
     tbCompany.EmptyTable;
     tbCity.EmptyTable;

   {************  создание таблицы profession  *************}
   {Создать поля}
     with tbProfession.FieldDefs do begin
       Add('Kod', ftSmallint, 0, true);
       Add('Name', ftString, 50, true);
     end;
   {Сгенерировать индексы}
     with tbProfession.IndexDefs do begin
       Add('I_Kod', 'Kod',[ixPrimary, ixUnique]);
     end;
     tbProfession.CreateTable;

   {************  создание таблицы CEX  *************}
   {Создать поля}
     with tbCex.FieldDefs do begin
       Add('Kod', ftSmallint, 0, true);
       Add('Name', ftString, 50, true);
       Add('Kodcompany', ftSmallint, 0, true);
     end;
   {Сгенерировать индексы}
     with tbCex.IndexDefs do begin
       Add('I_Kod', 'Kod',[ixPrimary, ixUnique]);
     end;
     tbCex.CreateTable;

     tbClients.EmptyTable;
     tbWork.EmptyTable;
     tbTesting.EmptyTable;
     tbCompany.Open;
     DataModule2.company.First;
//     Cities:=[];
     CitiesA:=MArrInt.Create(100);
     CompA:=MArrInt.Create(100);
     {********* переписать отмеченные предприятия ********8}
     For i:=0 to chComp.Items.Count-1 do begin
       If chComp.Checked[i] Then begin
{          eKod:=DataModule2.companyKod.AsInteger;
          eName:=DataModule2.companyName.AsString;
          eEDRPOY:=DataModule2.companyEdrpoy.AsString;
          eCity:=DataModule2.companyCity.AsInteger;}
          tbCompany.Append;
          tbCompanyKod.AsInteger:=DataModule2.companyKod.AsInteger;
          tbCompanyName.AsString:=DataModule2.companyName.AsString;
          tbCompanyEDRPOY.AsString:=DataModule2.companyEdrpoy.AsString;
          tbCompanyCity.AsInteger:=DataModule2.companyCity.AsInteger;
          tbCompany.Post;
          CompA.AddIfNew(tbCompanyKod.AsInteger);
          cit1:=tbCompanyCity.AsInteger;
//          If not (cit1 in Cities) Then Cities:=Cities+[cit1];
          CitiesA.AddIfNew(cit1);
{          tbCompany.AppendRecord([
            eKod,
            eName,
            eCity,
            eEDRPOY]);}
       end; {chComp.Checked[i]}
       DataModule2.company.Next;
     end; {For i:=0 to chComp.Items.Count}
  DataModule2.company.Close;

 {********* переписать соответствующие города ********8}
  tbCity.Open;
  SS:='Select * from city where kod in (';
  For i:=1 to CitiesA.count do
    SS:=SS+IntToStr(CitiesA.GetElement(i))+',';
  SS[Length(SS)]:=')'; SS:=SS+';';
//  Showmessage(SS);
  quCity.SQL.Clear;
  quCity.SQL.Add(SS);
  quCity.Open;
  For i:=0 to quCity.RecordCount-1 do begin
    tbCity.Append;
    cKod:=quCityKod.AsInteger;
    cName:=quCityName.AsString;
    tbCityKod.AsInteger:=cKod;
    tbCityName.AsString:=cName;
    tbCity.Post;
    quCity.Next;
  end;

 {********* переписать соответствующие цеха ********8}
  tbCex.Open;
  SS:='Select * from cex where kodcompany in ';
  SSCompa:='(';
  For i:=1 to CompA.count do
    SSCompa:=SSCompa+IntToStr(CompA.GetElement(i))+',';
  SSCompa[Length(SSCompa)]:=')'; SS:=SS+SSCompa+';';
//  Showmessage(SS);
  quCex.SQL.Clear;
  quCex.SQL.Add(SS);
  quCex.Open;
  For i:=0 to quCex.RecordCount-1 do begin
    tbCex.Append;
    tbCexKod.AsInteger:=quCexKod.AsInteger;
    tbCexName.AsString:=quCexName.AsString;
    tbCexKodcompany.AsInteger:=quCexKodcompany.AsInteger;
    tbCex.Post;
    quCex.Next;
  end;

 {********* переписать профессии ********}
  tbProfession.Open;
  DataModule2.profesion.Open;
  DataModule2.profesion.Prior;
  While not DataModule2.profesion.EOF do begin
    tbProfession.Append;
//    cKod:=DataModule2.profesionKod.AsInteger;
    tbProfessionKod.AsInteger:=DataModule2.profesionKod.AsInteger;
    tbProfessionName.AsString:=DataModule2.profesionName.AsString;
    tbProfession.Post;
    DataModule2.profesion.Next;
  end;
  tbProfession.Close;
  DataModule2.profesion.Close;

 {********* переписать сотрудников выбранных предприятий ********}
  tbClients.Open;
  SS:='Select * from clients where company in ';
  {For i:=1 to CompA.count do
    SS:=SS+IntToStr(CompA.GetElement(i))+',';
  SS[Length(SS)]:=')';}
SS:=SS+SSCompa+';';//  Showmessage(SS);
  quClients.SQL.Clear;
  quClients.SQL.Add(SS);
  quClients.Open;
  For i:=0 to quClients.RecordCount-1 do begin
    tbClients.Append;
//    tbClientsKod.AsInteger:=quClientsKod.AsInteger;
    tbClientsINN.AsString:=quClientsINN.AsString;
    tbClientsFamil.AsString:=quClientsFamil.AsString;
    tbClientsName.AsString:=quClientsName.AsString;
    tbClientsOtch.AsString:=quClientsOtch.AsString;
    tbClientsPol.AsString:=quClientsPol.AsString;
    tbClientsData_r.AsString:=quClientsData_r.AsString;
    tbClientsProfesion.AsInteger:=quClientsProfesion.AsInteger;
    tbClientsCompany.AsInteger:=quClientsCompany.AsInteger;
    tbClientsCex.AsInteger:=quClientsCex.AsInteger;
    tbClientsNew.AsString:='O';
    tbClients.Post;
    quClients.Next;
  end;
  tbClients.Close;

 {********* переписать WORK - виды работ ********}
  tbWork.Open;
  DataModule2.wWork.Open;
  DataModule2.wWork.Prior;
  While not DataModule2.wWork.EOF do begin
    tbWork.Append;
    tbWorkKod.AsInteger:=DataModule2.wWorkKod.AsInteger;
    tbWorkName.AsString:=DataModule2.wWorkName.AsString;
    tbWorkFm1.AsString:=DataModule2.wWorkFm1.AsString;
    tbWorkFm2.AsString:=DataModule2.wWorkFm2.AsString;
    tbWorkFm3.AsString:=DataModule2.wWorkFm3.AsString;
    tbWorkFm4.AsString:=DataModule2.wWorkFm4.AsString;
    tbWorkFm5.AsString:=DataModule2.wWorkFm5.AsString;
    tbWorkFm6.AsString:=DataModule2.wWorkFm6.AsString;
    tbWorkFm7.AsString:=DataModule2.wWorkFm7.AsString;
    tbWorkFm8.AsString:=DataModule2.wWorkFm8.AsString;
    tbWorkFm9.AsString:=DataModule2.wWorkFm9.AsString;
    tbWork.Post;
    DataModule2.wWork.Next;
  end;
  tbWork.Close;
  DataModule2.wWork.Close;

 {********* переписать TESTING ********}
  SS:='select * from testing t inner join clients c on t.INN=c.INN where c.Company in '+
    SSCompa+';';
  quTesting.SQL.Clear;
  quTesting.SQL.Add(SS);
  quTesting.Open;
  tbTesting.Open;
  While not quTesting.EOF do begin
    tbTesting.Append;
    tbTestingKod.AsInteger:=quTestingKod.AsInteger;
    tbTestingData.AsString:=quTestingData.AsString;
    tbTestingINN.AsString:=quTestingINN.AsString;
    tbTestingWork1.AsInteger:=quTestingWork1.AsInteger;
    tbTestingRez1.AsFloat:=quTestingRez1.AsFloat;
    tbTestingBall1.AsInteger:=quTestingBall1.AsInteger;
    tbTestingRez2.AsFloat:=quTestingRez2.AsFloat;
    tbTestingBall2.AsInteger:=quTestingBall2.AsInteger;
    tbTestingRez3.AsFloat:=quTestingRez3.AsFloat;
    tbTestingBall3.AsInteger:=quTestingBall3.AsInteger;
    tbTestingRez4.AsFloat:=quTestingRez4.AsFloat;
    tbTestingBall4.AsInteger:=quTestingBall4.AsInteger;
    tbTestingRez5.AsFloat:=quTestingRez5.AsFloat;
    tbTestingBall5.AsInteger:=quTestingBall5.AsInteger;
    tbTestingRez6.AsFloat:=quTestingRez6.AsFloat;
    tbTestingBall6.AsInteger:=quTestingBall6.AsInteger;
    tbTestingRez7.AsFloat:=quTestingRez7.AsFloat;
    tbTestingBall7.AsInteger:=quTestingBall7.AsInteger;
    tbTestingRez8.AsFloat:=quTestingRez8.AsFloat;
    tbTestingBall8.AsInteger:=quTestingBall8.AsInteger;
    tbTestingRez9.AsFloat:=quTestingRez9.AsFloat;
    tbTestingBall9.AsInteger:=quTestingBall9.AsInteger;
    tbTestingNew.AsString:='O';
    tbTesting.Post;
    quTesting.Next;
  end;


  CitiesA.Free;
  CompA.Free;
  quCity.Close;
  quCex.Close;
  quClients.Close;
  tbCompany.Close;
  tbCity.Close;
  tbCex.Close;
 end;

end;

procedure TfmGetComp.FormCreate(Sender: TObject);
begin
{    quclients.DataBaseName:='MedicExport';
    city.DataBaseName:='MedicExport';
    company.DataBaseName:='MedicExport';
    cex.DataBaseName:='MedicExport';
    profesion.DataBaseName:='MedicExport';
    wwork.DataBaseName:='MedicExport';
    testing.DataBaseName:='MedicExport';
 }
end;

end.
