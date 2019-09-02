unit testEmotional;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, ExtCtrls, StdCtrls, common;

type
  TfmTestEmotional = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Button1: TButton;
    StringGrid1: TStringGrid;
    Button3: TButton;
    procedure FormShow(Sender: TObject);
    procedure StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmTestEmotional: TfmTestEmotional;
  Vibor : array[0..1] of array[0..39] of boolean;
  Cnen, Count, Povtor : smallint;

implementation

{$R *.dfm}

 // �������� �����

procedure TfmTestEmotional.FormShow(Sender: TObject);
const question: array[0..39] of string[80] =(
'����� ���, ��� ����� � ������� �����, ����������� ����, ��� ����� ������',
'��� ��������� ���������� ������ � �������',
'������� ����� � ������',
'������ ����� ������ �� ����������',
'������� � ����� ������ �� �������',
'����� ����',
'����� ������ �����, ��� ���������� �� ������',
'������� ����� �������, ��������� ������� ����������',
'��� � �����, ��������, ��� �� ��� ������',
'��� ������� �� ��������������, ��� � ���-������ �� ������� ��������� ���������',
'��������, ����� �� ����, �� ����� ������� �������� ���� ���������',
'�������, ������ ������� ��������',
'�� ����� ���������� ���� �� �������� �����',
'� ������ ���������� � ����� ������ ��� �����������',
'������� �� ���������� � �������',
'�������� ������, ����� ��������� �� ����',
'����� ������ �� �������, ����� ������ ��������� �����',
'����� �������� � ������ �����, ��� � ���� �������� ��� �������� ������',
'������ ���� ����� �������, ��� ����������� �����',
'���� ���������, ��� ������ ��� ��� ������',
'�� ���� ����� ����������������� �� ����� ����',
'���������� � ������� � � ����� ������',
'����� �������, ��� � ���� ������ ����, ����� � ����� �������� ���-������ �������',
'����, ��� ������, ������� �� ��������',
'� ������� �� ����� �������� ����������',
'� ����� �����, ��� ������� ��������',
'� ���� ����� ���������� �������� ���� � ���������� ���',
'��������, ���������� ���������, ��� ��� ����� ���������',
'� ���� ������ �������, ����� � ����� ��� ��-�� ��������',
'��� ������� �� �������� � ������ ����� � ���������������',
'� ����� ����� � ������� ����������',
'����� ������ ��������� � ���-������ ��� � ���-������',
'�������� � ����������� ���� ���������',
'� ����, ��� ������, ��������� ������������',
'������ � �������� ������������� ����������� ����������',
'������ � ���������� �� �������������� �������',
'������ � ����� ����� � �����, ������� �� ����� ���� �� ����� ��� ���������',
'��� �� ������� ����������� � ����' ,
'� �� ����� ������������ � ����������� � ��������� ������ �������',
'������ � �������� ���� ����������� ���������');
probel: string =' ';
var i,j: smallint;
 begin
  StringGrid1.Height:= ClientHeight*60 div 100;
  StringGrid1.Width:= ClientWidth*90 div 100;
  StringGrid1.Left:=(ClientWidth - StringGrid1.Width) div 2;
  StringGrid1.Top:= (ClientHeight - StringGrid1.Height) div 2;

  Panel1.Top:= StringGrid1.Top-65;   //  ������ ������-��������� 50
  Panel2.Top:= StringGrid1.Top-65;
  Panel3.Top:= StringGrid1.Top-66;
  Panel4.Top:= StringGrid1.Top-40;
  Panel5.Top:= StringGrid1.Top-40;

  StringGrid1.ColWidths[0] := StringGrid1.Width*6 div 100;
  StringGrid1.ColWidths[1] := StringGrid1.Width*80 div 100;
  StringGrid1.ColWidths[2] := StringGrid1.Width*6 div 100;
  StringGrid1.ColWidths[3] := StringGrid1.Width*6 div 100;

  Panel1.Width:= StringGrid1.ColWidths[0]+1;
  Panel2.Width:= StringGrid1.ColWidths[1]+1;
  Panel4.Width:= StringGrid1.ColWidths[2]+1;
  Panel5.Width:= StringGrid1.ColWidths[3]+1;
  Panel3.Width:= Panel4.Width+Panel5.Width;
  Panel1.Left:=StringGrid1.Left;
  Panel2.Left:=StringGrid1.Left+Panel1.Width;
  Panel4.Left:= Panel2.Left+Panel2.Width;
  Panel3.Left:= Panel4.Left;
  Panel5.Left:= Panel4.Left+Panel4.Width;
  Button1.Left:= (ClientWidth - 140) div 2;           // ������ ������ 140
  Button1.Top:= StringGrid1.Top+StringGrid1.Height+30 ;
  Button3.Top:=5;
  Button3.Left:=ClientWidth-Button3.Width-5;

 Cnen:=0; Count:=0;  Povtor:=0;  
 For i:=0 to 39 do  begin
    StringGrid1.Cells[0,i]:= probel+IntToStr(i+1);
    StringGrid1.Cells[1,i]:= question[i];
 end;

 For i:=0 to 1 do
    For j:=0 to 39 do
       Vibor[i][j]:=false;

end;

 //  ��������� ���� �������

procedure TfmTestEmotional.StringGrid1DrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
var i,j:smallint;
  begin
   with stringGrid1.Canvas do
  begin
     For i:=0 to 1 do
        For j:=0 to 39 do  begin
           if ((aRow = j) and ((aCol-2) = i)) then
              if Vibor[aCol-2][aRow] then Brush.Color := clRed
              else  Brush.Color := clWindow;
           Font.Color := clBlack;
           FillRect (Rect);
           TextRect(Rect, Rect.Left, Rect.Top, stringGrid1.cells[ACol, ARow]);
      end;
  end;
end;

 // ����� ������ � �������

procedure TfmTestEmotional.StringGrid1SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
var i,j: smallint;

begin
case ACol of
2:                    // ������� ��
  If not Vibor[ACol-2][ARow] then  begin //  ������� �� �����
     if  not Vibor[ACol-1][ARow]  then  begin
         if ((ARow=4)or(ARow=9)or(ARow=14)or(ARow=19)or(ARow=24)or(ARow=29)) then inc(Cnen);
         Vibor[ACol-2][ARow]:= true;
         inc(Count);
     end
  end
  Else  begin            //  ������� �����
      Vibor[ACol-2][ARow]:= false;
      dec(Count);
      if ((ARow=4)or(ARow=9)or(ARow=14)or(ARow=19)or(ARow=24)or(ARow=29)) then dec(Cnen);
  end;

 3:    // ������� ���
  If not Vibor[ACol-2][ARow] then   begin//  ������� �� �����
     if  not Vibor[ACol-3][ARow]  then
         Vibor[ACol-2][ARow]:= true;
     end
  Else              //  ������� �����
       Vibor[ACol-2][ARow]:= false;

 end;

 if Cnen = 4 then  begin
      StringGrid1.Repaint;
      application.MessageBox(PChar('�������� ������������ ����� �������!'+
       #10+#13+'������� �������� ������'),'������',16);
      Cnen:=0;
      For i:=0 to 1 do
        For j:=0 to 39 do  Vibor[i][j]:=false;
        StringGrid1.Repaint;
        inc(Povtor);
        if Povtor=3 then begin
           application.MessageBox(PChar('���� �� �������!'),'',MB_ICONINFORMATION);
           Close;
        end;
   Exit;
   end;

end;

procedure TfmTestEmotional.Button1Click(Sender: TObject);
var i, pr_kon : smallint;

begin
  pr_kon:= 0;
  For i:=0 to 39 do
    if Vibor[0][i] or Vibor[1][i] then inc(pr_kon);

  if pr_kon <> 40  then begin
     application.MessageBox(PChar('�� �������� �� �� ��� �������!'),'������',16);
     Exit;
  end
  else begin
    RezTest:= Count-Cnen;
    if RezTest <= 6 then Ball:=5;
    if (RezTest >= 7)AND(RezTest <= 11) then Ball:=4;
    if (RezTest >= 12)AND(RezTest <= 16) then Ball:=3;
    if (RezTest >= 17)AND(RezTest <= 22) then Ball:=2;
    if RezTest >= 23 then Ball:=1;

    application.MessageBox(PChar('���������� ������������� �������: '+IntToStr(Count)
   +#10+#13+'���������: '+ FloatToStr(RezTest)
   +#10+#13+'�����: '+ IntToStr(Ball)),'���� �������', MB_ICONINFORMATION);
     Close;
 end;

end;

procedure TfmTestEmotional.Button3Click(Sender: TObject);
begin
  If MessageDlg('�� �������, ��� ������ �������� ����?',mtConfirmation,[mbOK,mbCancel],0)=mrOK
    Then begin RezTest:=0; Ball:=0; Close; end;
end;

procedure TfmTestEmotional.FormMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  // �������� ��������� ������ "�������� ����"
  If ((BorderIcons=[]) and (y>=Button3.Top)and(y<Button3.Top+Button3.Height)and
      (x>=Button3.Left)and(x<Button3.Left+Button3.Width))
    Then Button3.Visible:=true
    Else Button3.Visible:=false;

end;

end.
