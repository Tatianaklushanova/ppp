unit newcex;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DM, DBCtrls, StdCtrls, Mask, DB, DBTables, Buttons, ExtCtrls;

type
  TfmNewCex = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Bevel1: TBevel;
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    Compa: integer;
    NewKod: smallint;
  end;

var
  fmNewCex: TfmNewCex;

implementation

{$R *.dfm}

procedure TfmNewCex.FormShow(Sender: TObject);
begin
   DataModule2.cex.Insert;
   DataModule2.cexKodcompany.AsInteger:=Compa;
end;

procedure TfmNewCex.Button1Click(Sender: TObject);
begin
{    DataModule2.cex.Post;
    fmNewCex.Close;}
end;

procedure TfmNewCex.Button2Click(Sender: TObject);
begin
//    fmNewCex.Close;
end;

procedure TfmNewCex.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  If (ModalResult=mrOK) Then begin
  If trim(DBEdit1.Text)<>'' Then begin
   DataModule2.quMaxKodCex.Open;
   NewKod:=DataModule2.quMaxKodcexmaxkod.AsInteger+1;
   DataModule2.CexKod.AsInteger:=NewKod;
   DataModule2.Cex.Post;
   DataModule2.quMaxKodCex.Close;
   CanClose:=true;
  end
  Else begin
    ShowMessage('¬ведите название цеха');
    CanClose:=False;
  end;
  end;

end;

end.
