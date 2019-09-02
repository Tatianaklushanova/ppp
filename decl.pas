unit decl;

interface

//uses Windows, Classes;

var cfintervalMin, cfintervalMax: smallint; // интервал между вспышками ZMR
  cfIntervalMinA,cfIntervalMaxA,cfCountA,cfWaitingA,
  cfDelta,cfCount,cfWaiting,
  cfEps, cfMaxFireCo, cfD50: smallint;

implementation

begin
  cfintervalMin:=2000; cfintervalMax:=10000;
  cfintervalMinA:=2000; cfintervalMaxA:=10000; cfCountA:=12;
  cfDelta:=200; cfCount:=12; cfWaiting:=2000;
  cfD50:=5; cfMaxFireCo:=5; cfEps:= 2;
  cfWaitingA:=2000;
  cfKirSize:=2;
  
end.
