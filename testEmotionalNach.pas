unit testEmotionalNach;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, common;

type
  TfmTestEmotionalNach = class(TForm)
    Button2: TButton;
    Memo1: TMemo;
    Label1: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmTestEmotionalNach: TfmTestEmotionalNach;

implementation

uses testEmotional;

{$R *.dfm}

procedure TfmTestEmotionalNach.Button1Click(Sender: TObject);
begin
//   fmTestEmotionalTren.show;    //  тренировкка
end;

procedure TfmTestEmotionalNach.Button2Click(Sender: TObject);
begin
   fmTestEmotional.showmodal;    //  тестирование
   Close;
 end;

procedure TfmTestEmotionalNach.FormShow(Sender: TObject);

begin
  RezTest:=0;
  Ball:=0;
  Memo1.Left:= (ClientWidth - Memo1.Width) div 2;
  Memo1.Top:= (ClientHeight - Memo1.Top) div 2;
  Label1.Left:= (ClientWidth - Label1.Width) div 2;
  Label1.Top:= Memo1.Top - 140;
  Button2.Left:= (ClientWidth - 140) div 2;      // ширина кнопки 140
  Button2.Top:= Memo1.Top+Memo1.Height+80 ;

end;

end.
