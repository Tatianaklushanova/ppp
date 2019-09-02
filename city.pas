unit city;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DM, ExtCtrls, DBCtrls, Grids, DBGrids, FMTBcd, DB, SqlExpr,
  DBTables, WebAdapt, WebComp, DBAdapt, StdCtrls;

type
  TFmCity = class(TForm)
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    Label1: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FmCity: TFmCity;

implementation

{$R *.dfm}


procedure TFmCity.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DataModule2.city.Close;
end;

procedure TFmCity.FormShow(Sender: TObject);
var wid, heig: smallint;
begin
   wid:= ClientWidth*70 div 100;
   heig:= ClientHeight*70 div 100;
   DBGrid1.Width:= wid;
   DBGrid1.Height:= heig;
   DBGrid1.Columns[0].Width:= wid;
   DBGrid1.Left:= (ClientWidth - wid) div 2;
   DBGrid1.Top:= (ClientHeight - heig) div 2;
   DBNavigator1.Left:= (ClientWidth - DBNavigator1.Width) div 2;
   DBNavigator1.Top:= DBGrid1.Height+DBGrid1.Top + 30;;
   Label1.Top:= DBGrid1.Top-50;
   Label1.Left:= (ClientWidth - Label1.Width) div 2;
   DataModule2.city.Open;
end;

end.
