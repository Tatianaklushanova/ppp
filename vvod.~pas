unit vvod;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, common;

type
  Tfmvvod = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    MaskEdit1: TMaskEdit;
    Label2: TLabel;
    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure MaskEdit1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmvvod: Tfmvvod;

implementation

uses clients;

{$R *.dfm}

procedure Tfmvvod.FormShow(Sender: TObject);
begin
MaskEdit1.SetFocus;
MaskEdit1.Selstart:=0;
end;

procedure Tfmvvod.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
 If ModalResult=mrOK then
 
if Length(MaskEdit1.Text) <> 10   then
 begin
   application.MessageBox(PChar('Код должен содержать 10 цифр'),'Ошибка ввода!',16);
   MaskEdit1.SetFocus;
   MaskEdit1.Selstart := Length(MaskEdit1.Text);
   CanClose:= false;
 end
else
   CanClose:= true;
   IdKod :=  MaskEdit1.Text;
end;

procedure Tfmvvod.MaskEdit1Click(Sender: TObject);
begin
MaskEdit1.SetFocus;
MaskEdit1.Selstart:=0;
end;

end.
