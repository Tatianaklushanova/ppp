unit testChulteNach;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DM,common;

type
  TfmTestChulteNach = class(TForm)
    Memo1: TMemo;
    Button1: TButton;
    Button2: TButton;
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
  fmTestChulteNach: TfmTestChulteNach;

implementation

uses testChulte;

{$R *.dfm}

procedure TfmTestChulteNach.Button1Click(Sender: TObject);  // тренировка
begin
  fmTestChulte.pr_tip:=false;
  fmTestChulte.show;
end;

procedure TfmTestChulteNach.Button2Click(Sender: TObject);  // собственно тест
begin
   fmTestChulte.pr_tip:=true;
   fmTestChulte.showmodal;
   Close;
 end;

procedure TfmTestChulteNach.FormShow(Sender: TObject);
 var wid, heig: smallint;
begin
 RezTest:=0;
 Ball:=0;
 wid:= ClientWidth;
 heig:= ClientHeight;
 Memo1.Left:= (wid - Memo1.Width) div 2;
 Memo1.Top:= (heig - Memo1.Top) div 2;
 Label1.Left:= (wid - Label1.Width) div 2;
 Label1.Top:= Memo1.Top - 140;
 Button1.Left:= (wid - 480) div 2;      // ширина каждой кнопки 140+расстояние между ними 200
 Button1.Top:= Memo1.Top+Memo1.Height+80 ;
 Button2.Left:= Button1.Left+340;      // ширина каждой кнопки 140+расстояние между ними 200
 Button2.Top:= Button1.Top;
end;

end.
