unit common;

interface
   var kodcompp : Integer;
   IdKod : String;
   RezTest: Double;
   Ball: smallint;
   Pr_test: boolean;

var cfintervalMin, cfintervalMax: smallint; // �������� ����� ��������� ZMR
  cfIntervalMinA,cfIntervalMaxA,cfCountA,cfWaitingA,
  cfDelta,cfCount,cfWaiting,
  cfEps, cfMaxFireCo, cfD50, cfmaxFire,
  cfKirSize: smallint;
  
implementation

begin
  cfintervalMin:=2000; cfintervalMax:=10000;
  cfintervalMinA:=2000; cfintervalMaxA:=10000;
  cfDelta:=200; cfCount:=12; cfWaiting:=2000; cfWaitingA:=2000;
  cfCountA:=12;
  cfD50:=5; cfMaxFireCo:=5; cfEps:= 2; cfKirSize:=2;
  cfmaxFire:=10;

end.
