unit newprof;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DM, StdCtrls, Mask, DBCtrls, Buttons, ExtCtrls;

type
  TfmNewProf = class(TForm)
    Label1: TLabel;
    DBEdit1: TDBEdit;
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
    NewKod: smallint;
  end;

var
  fmNewProf: TfmNewProf;

implementation

{$R *.dfm}

procedure TfmNewProf.FormShow(Sender: TObject);
begin
DataModule2.profesion.Insert;
end;

procedure TfmNewProf.Button1Click(Sender: TObject);
begin
{  If trim(DBEdit1.Text)<>'' Then begin
   DataModule2.quMaxKodProf.Open;
   NewKod:=DataModule2.quMaxKodProfmaxkod.AsInteger+1;
   DataModule2.profesionKod.AsInteger:=NewKod;
   DataModule2.profesion.Post;
   DataModule2.quMaxKodProf.Close;
   ModalResult:=mrOK;
   Close;
  end
  Else begin
    ShowMessage('¬ведите название профессии');
  end;}
end;

procedure TfmNewProf.Button2Click(Sender: TObject);
begin
{   ModalResult:=mrCancel;
   Close;}
end;

procedure TfmNewProf.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  If (ModalResult=mrOK) Then begin
  If trim(DBEdit1.Text)<>'' Then begin
   DataModule2.quMaxKodProf.Open;
   NewKod:=DataModule2.quMaxKodProfmaxkod.AsInteger+1;
   DataModule2.profesionKod.AsInteger:=NewKod;
   DataModule2.profesion.Post;
   DataModule2.quMaxKodProf.Close;
   CanClose:=true;
  end
  Else begin
    ShowMessage('¬ведите название профессии');
    CanClose:=False;
  end;
  end;
end;

end.
