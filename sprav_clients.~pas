unit sprav_clients;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, DM, ExtCtrls, DBCtrls, common, StdCtrls;

type
  TfmSpravClients = class(TForm)
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    DBLookupComboBox1: TDBLookupComboBox;
    DBLookupComboBox2: TDBLookupComboBox;
    DBLookupComboBox3: TDBLookupComboBox;
    Label1: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid1ColExit(Sender: TObject);
    procedure DBLookupComboBox3Exit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmSpravClients: TfmSpravClients;

implementation

{$R *.dfm}

procedure TfmSpravClients.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 DataModule2.clients.Close;
 DataModule2.profesion.Close;
 DataModule2.company.Close;
//DataModule2.cex.Filtered:= false;
 DataModule2.cex.Close;
end;

procedure TfmSpravClients.FormShow(Sender: TObject);
 var wid, heig, i: smallint;
begin

   DataModule2.profesion.Open;
   DataModule2.company.Open;
   DataModule2.cex.Open;
   DataModule2.clients.Open;
   
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

   for i := 0 to DBGrid1.Columns.Count - 1 do
       DBGrid1.Columns[i].Width := 20 +
                   DBGrid1.Canvas.TextWidth(DBGrid1.Columns[i].title.caption);
   
end;

procedure TfmSpravClients.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
    State: TGridDrawState);
var  w : Integer;
begin
   w := 20+DBGrid1.Canvas.TextExtent(Column.Field.DisplayText).cx;
   if w>column.Width then Column.Width := w;

  if (gdFocused in State) then begin
    if (Column.Field.FieldName = DBLookupComboBox1.DataField) then begin
      DBLookupComboBox1.Left := Rect.Left + DBGrid1.Left;
      DBLookupComboBox1.Top := Rect.Top + DBGrid1.top;
      DBLookupComboBox1.Width := Rect.Right - Rect.Left + 2;
      DBLookupComboBox1.Visible := True;
    end
    else if(Column.Field.FieldName = DBLookupComboBox2.DataField) then begin
      DBLookupComboBox2.Left := Rect.Left + DBGrid1.Left;
      DBLookupComboBox2.Top := Rect.Top + DBGrid1.top;
      DBLookupComboBox2.Width := Rect.Right - Rect.Left + 2;
      DBLookupComboBox2.Visible := True;
    end
    else if(Column.Field.FieldName = DBLookupComboBox3.DataField) then begin
      DBLookupComboBox3.Left := Rect.Left + DBGrid1.Left;
      DBLookupComboBox3.Top := Rect.Top + DBGrid1.top;
      DBLookupComboBox3.Width := Rect.Right - Rect.Left + 2;
      DBLookupComboBox3.Visible := True;
    //  kodcompp:=DBLookupComboBox3.datasource.dataset.fieldbyname('Company').asinteger;
    //  DataModule2.cex.Filtered:= true;
    end;
  end;
end;

procedure TfmSpravClients.DBGrid1ColExit(Sender: TObject);
begin
  if DBGrid1.SelectedField.FieldName = DBLookupComboBox1.DataField then
     DBLookupComboBox1.Visible := false;
  if DBGrid1.SelectedField.FieldName = DBLookupComboBox2.DataField then
     DBLookupComboBox2.Visible := false;
  if DBGrid1.SelectedField.FieldName = DBLookupComboBox3.DataField then begin
       DBLookupComboBox3.Visible := false;
    //   DataModule2.cex.Filtered:= false;
     end;
end;

procedure TfmSpravClients.DBLookupComboBox3Exit(Sender: TObject);
begin
 //  DataModule2.cex.Filtered:= false;
end;

end.
