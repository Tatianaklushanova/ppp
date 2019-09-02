unit testing;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DM, Grids, DBGrids, ExtCtrls, DBCtrls, StdCtrls;

type
  TfmTesting = class(TForm)
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    Label1: TLabel;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmTesting: TfmTesting;

implementation

{$R *.dfm}

procedure TfmTesting.FormShow(Sender: TObject);
 var wid, heig, i: smallint;
begin
   wid:= ClientWidth-20;
   heig:= ClientHeight*70 div 100;
   DBGrid1.Width:= wid;
   DBGrid1.Height:= heig;
   DBGrid1.Top:= (ClientHeight - heig) div 2;
   DBGrid1.Left:= 10;
   DBNavigator1.Left:= (wid - DBNavigator1.Width) div 2;
   DBNavigator1.Top:= DBGrid1.Height+DBGrid1.Top + 30;
   Label1.Top:= DBGrid1.Top-50;
   Label1.Left:= (ClientWidth - Label1.Width) div 2;

   DataModule2.testing.Open;
   
   for i := 0 to DBGrid1.Columns.Count - 1 do
       DBGrid1.Columns[i].Width := 20 +
                   DBGrid1.Canvas.TextWidth(DBGrid1.Columns[i].title.caption);
end;

procedure TfmTesting.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   DataModule2.testing.Close;
end;

procedure TfmTesting.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var  w : Integer;
  begin
   w := 20+DBGrid1.Canvas.TextExtent(Column.Field.DisplayText).cx;
   if w>column.Width then Column.Width := w;
end;

end.
