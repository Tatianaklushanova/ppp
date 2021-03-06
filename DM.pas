unit DM;
{$DEFINE AllData} // ��� MainForm, clients

interface

uses
  SysUtils, Classes, DB, DBTables, common;

type
  TDataModule2 = class(TDataModule)
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    profesion: TTable;
    profesionName: TStringField;
    DataSource3: TDataSource;
    city: TTable;
    clients: TTable;
    DataSource4: TDataSource;
    DataSource5: TDataSource;
    wwork: TTable;
    company: TTable;
    clientsINN: TStringField;
    clientsFamil: TStringField;
    clientsName: TStringField;
    clientsOtch: TStringField;
    clientsPol: TStringField;
    clientsData_r: TDateField;
    clientsProfesion: TSmallintField;
    clientsCompany: TSmallintField;
    clientsLooPfof: TStringField;
    clientsLooComp: TStringField;
    companyKod: TAutoIncField;
    companyName: TStringField;
    companyEdrpoy: TStringField;
    companyCity: TSmallintField;
    companyLooCity: TStringField;
    DataSource6: TDataSource;
    cex: TTable;
    cexName: TStringField;
    cexKodcompany: TSmallintField;
    cexLooCompany: TStringField;
    clientsCex: TSmallintField;
    DataSource7: TDataSource;
    testing: TTable;
    wworkKod: TAutoIncField;
    wworkName: TStringField;
    wworkFm1: TStringField;
    wworkFm2: TStringField;
    wworkFm3: TStringField;
    wworkFm4: TStringField;
    wworkFm5: TStringField;
    wworkFm6: TStringField;
    wworkFm7: TStringField;
    wworkFm8: TStringField;
    wworkFm9: TStringField;
    testingKod: TAutoIncField;
    testingData: TDateField;
    testingINN: TStringField;
    testingRez1: TFloatField;
    testingBall1: TSmallintField;
    testingRez2: TFloatField;
    testingBall2: TSmallintField;
    testingRez3: TFloatField;
    testingBall3: TSmallintField;
    testingRez4: TFloatField;
    testingBall4: TSmallintField;
    testingRez5: TFloatField;
    testingBall5: TSmallintField;
    testingRez6: TFloatField;
    testingBall6: TSmallintField;
    testingRez7: TFloatField;
    testingBall7: TSmallintField;
    testingRez8: TFloatField;
    testingBall8: TSmallintField;
    testingRez9: TFloatField;
    testingBall9: TSmallintField;
    testingWork1: TSmallintField;
    cityKod: TAutoIncField;
    cityName: TStringField;
    clientsLooCex: TStringField;
    clientsNew: TStringField;
    testingNew: TStringField;
    clientsKod: TAutoIncField;
    profesionKod: TSmallintField;
    quMaxKodProf: TQuery;
    quMaxKodProfmaxkod: TSmallintField;
    quMaxKodCex: TQuery;
    quMaxKodCexmaxkod: TSmallintField;
    cexKod: TSmallintField;
    Query1: TQuery;
    DataSource8: TDataSource;
    procedure cexFilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure DataModuleCreate(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModule2: TDataModule2;

implementation

{$R *.dfm}

procedure TDataModule2.cexFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  Accept:= (DataSet['Kodcompany'] = kodcompp);
end;


procedure TDataModule2.DataModuleCreate(Sender: TObject);
begin
  {$IFNDEF AllData}
    clients.DataBaseName:='MedicExport';
    city.DataBaseName:='MedicExport';
    company.DataBaseName:='MedicExport';
    cex.DataBaseName:='MedicExport';
    profesion.DataBaseName:='MedicExport';
    wwork.DataBaseName:='MedicExport';
    testing.DataBaseName:='MedicExport';
    quMaxKodProf.DataBaseName:='MedicExport';
    quMaxKodCex.DataBaseName:='MedicExport';
    Query1.DataBaseName:='MedicExport';
   
  {$ENDIF}

end;

end.
