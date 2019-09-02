program medicalTest;

uses
  Forms,
  mainForm in 'mainForm.pas' {fmMain},
  DM in 'DM.pas' {DataModule2: TDataModule},
  testChulte in 'testChulte.pas' {fmTestChulte},
  clients in 'clients.pas' {fmClients},
  profesion in 'profesion.pas' {fmprofesion},
  city in 'city.pas' {FmCity},
  vvod in 'vvod.pas' {fmvvod},
  sprav_clients in 'sprav_clients.pas' {fmSpravClients},
  company in 'company.pas' {FmCompany},
  work in 'work.pas' {fmWork},
  cex in 'cex.pas' {fmCex},
  common in 'common.pas',
  newcompany in 'newcompany.pas' {fmNewCompany},
  newprof in 'newprof.pas' {fmNewProf},
  newcex in 'newcex.pas' {fmNewCex},
  testChulteNach in 'testChulteNach.pas' {fmTestChulteNach},
  testMemoryVisionNach in 'testMemoryVisionNach.pas' {fmtestMemoryVisionNach},
  testMemoryVision in 'testMemoryVision.pas' {fmTestMemoryVision},
  testMemoryAudiNach in 'testMemoryAudiNach.pas' {fmTestMemoryAudiNach},
  testMemoryAudi in 'testMemoryAudi.pas' {fmTestMemoryAudi},
  testMemoryVisionTren in 'testMemoryVisionTren.pas' {fmTestMemoryVisionTren},
  testMemoryAudiTren in 'testMemoryAudiTren.pas' {fmTestMemoryAudiTren},
  testEmotionalNach in 'testEmotionalNach.pas' {fmTestEmotionalNach},
  testEmotional in 'testEmotional.pas' {fmTestEmotional},
  testing in 'testing.pas' {fmTesting},
  print in 'print.pas' {fmPrint},
  test_ear in 'test_ear.pas' {fmTest_Ear},
  test_ZMRd in 'test_ZMRd.pas' {fmTest_ZMRd},
  test_ZMRp in 'test_ZMRp.pas' {fmTest_ZMRp},
  testVn in 'testVn.pas' {fmTestVn},
  config in 'config.pas' {fmConfig},
  testR3 in 'testR3.pas' {fmTestR3},
  getComp in 'getComp.pas' {fmGetComp};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfmMain, fmMain);
  Application.CreateForm(TDataModule2, DataModule2);
  Application.CreateForm(TfmTestChulte, fmTestChulte);
  Application.CreateForm(Tfmprofesion, fmprofesion);
  Application.CreateForm(TFmCity, FmCity);
  Application.CreateForm(TfmSpravClients, fmSpravClients);
  Application.CreateForm(TFmCompany, FmCompany);
  Application.CreateForm(TfmWork, fmWork);
  Application.CreateForm(TfmCex, fmCex);
  Application.CreateForm(TfmTestMemoryVision, fmTestMemoryVision);
  Application.CreateForm(TfmTestMemoryAudi, fmTestMemoryAudi);
  Application.CreateForm(TfmTestMemoryVisionTren, fmTestMemoryVisionTren);
  Application.CreateForm(TfmTestMemoryAudiTren, fmTestMemoryAudiTren);
  Application.CreateForm(TfmTesting, fmTesting);
  Application.CreateForm(TfmTestEmotional, fmTestEmotional);
  Application.CreateForm(TfmPrint, fmPrint);
  Application.CreateForm(TfmConfig, fmConfig);
  Application.CreateForm(TfmGetComp, fmGetComp);
  Randomize;
  Application.Run;

  end.
