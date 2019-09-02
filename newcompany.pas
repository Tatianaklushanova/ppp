unit newcompany;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DM, StdCtrls, Mask, DBCtrls;

type
  TfmNewCompany = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    Button1: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmNewCompany: TfmNewCompany;

implementation

{$R *.dfm}

procedure TfmNewCompany.FormShow(Sender: TObject);
begin
  DataModule2.company.Insert;
end;

procedure TfmNewCompany.Button1Click(Sender: TObject);
begin
    DataModule2.company.Post;
    fmNewCompany.Close;
end;

procedure TfmNewCompany.Button2Click(Sender: TObject);
begin
   fmNewCompany.Close;
end;

end.


