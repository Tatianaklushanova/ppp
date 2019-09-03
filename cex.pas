unit cex;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DM, ExtCtrls, DBCtrls, Grids, DBGrids, StdCtrls;

type
  TfmCex = class(TForm)
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    DBLookupComboBox1: TDBLookupComboBox;
    Label1: TLabel;
    procedure DBGrid1ColExit(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmCex: TfmCex;

implementation

{$R *.dfm}
// изменение
procedure TfmCex.DBGrid1ColExit(Sender: TObject);
begin
 if DBGrid1.SelectedField.FieldName = DBLookupComboBox1.DataField then
    DBLookupComboBox1.Visible := false;
end;

procedure TfmCex.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
if (gdFocused in State) then
    if (Column.Field.FieldName = DBLookupComboBox1.DataField) then begin
      DBLookupComboBox1.Left := Rect.Left + DBGrid1.Left;
      DBLookupComboBox1.Top := Rect.Top + DBGrid1.top;
      DBLookupComboBox1.Width := Rect.Right - Rect.Left + 2;
      DBLookupComboBox1.Visible := True;
    end;
end;

procedure TfmCex.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DataModule2.cex.Close;
  DataModule2.company.Close;
end;

procedure TfmCex.FormShow(Sender: TObject);
var wid, heig: smallint;
begin
   wid:= ClientWidth*80 div 100;
   heig:= ClientHeight*70 div 100;
   DBGrid1.Width:= wid;
   DBGrid1.Height:= heig;
   DBGrid1.Columns[0].Width:= wid*38 div 100;
   DBGrid1.Columns[1].Width:= wid*20 div 100;
   DBGrid1.Columns[2].Width:= wid*38 div 100;
   DBGrid1.Left:= (ClientWidth - wid) div 2;
   DBGrid1.Top:= (ClientHeight - heig) div 2;
   DBNavigator1.Left:= (ClientWidth - DBNavigator1.Width) div 2;
   DBNavigator1.Top:= DBGrid1.Height+DBGrid1.Top + 30;
   Label1.Top:= DBGrid1.Top-50;
   Label1.Left:= (ClientWidth - Label1.Width) div 2;

   DataModule2.cex.Open;
   DataModule2.company.Open;
end;

end.
