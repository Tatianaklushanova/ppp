unit profesion;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DM, ExtCtrls, DBCtrls, Grids, DBGrids, StdCtrls;

type
  Tfmprofesion = class(TForm)
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    Label1: TLabel;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmprofesion: Tfmprofesion;

implementation

{$R *.dfm}

procedure Tfmprofesion.FormShow(Sender: TObject);
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
   DBNavigator1.Top:= DBGrid1.Height+DBGrid1.Top + 30;
   Label1.Top:= DBGrid1.Top-50;
   Label1.Left:= (ClientWidth - Label1.Width) div 2;
   DataModule2.profesion.Open;
end;

procedure Tfmprofesion.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 DataModule2.profesion.Close;
end;

end.
