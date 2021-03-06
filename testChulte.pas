unit testChulte;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls, DateUtils, ComCtrls, common, DM;

type
  TfmTestChulte = class(TForm)
    StringGrid1: TStringGrid;
    Button1: TButton;
    Button3: TButton;
    Memo1: TMemo;
    ListBox1: TListBox;
    procedure Button1Click(Sender: TObject);
    procedure StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure ListBox1DrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure FormShow(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure  FormMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);

  private
    { Private declarations }

    T0: TDateTime;
    prBlue: boolean;
    Red : array[0..6] of array[0..6] of boolean;


    public
     pr_tip:boolean;   // ��� �����: 0 - ����������, 1 - ����
    { Public declarations }
  end;

var
  fmTestChulte: TfmTestChulte;
  errors: smallint = 0;
  testNo: smallint = 1;
  max: smallint = 1;
  min: smallint = 24;
  resRed, resBlue: Double;
  Mmax, Mmin: smallint;

implementation

{$R *.dfm}

// �������� �����

procedure TfmTestChulte.FormShow(Sender: TObject);
var i,k, ii, jj, nn, res, wid, heig: smallint;
 MA : array[0..48] of  smallint;
 probel: string;
begin
  wid:= ClientWidth;
  heig:= ClientHeight;
  StringGrid1.Width:= StringGrid1.DefaultColWidth*7+StringGrid1.GridLineWidth*6;
  StringGrid1.Height:= StringGrid1.DefaultRowheight*7+StringGrid1.GridLineWidth*6;
  StringGrid1.Top:= (heig-StringGrid1.Height) div 2 +20;
  StringGrid1.Left:=(wid - StringGrid1.Width) div 3;
  Button1.Top:= StringGrid1.Top - 10 - Button1.Height;
  Button1.Left:=(wid - Button1.Width) div 2;
  Memo1.Top:= Button1.Top-10-Memo1.Height;
  Memo1.Left:=(wid - Memo1.Width) div 2;
  ListBox1.Height:= StringGrid1.Height;
  ListBox1.Top:= StringGrid1.Top;
  ListBox1.Left:= StringGrid1.Left+StringGrid1.Width+40;
  Button3.Top:=5;
  Button3.Left:=ClientWidth-Button3.Width-5;

  Memo1.Text:= '� ������� ����� ������� ���� �������� ����� ������ ����� � ������������ �������';
  Memo1.Visible:= true;

  testNo:= 1;
  max:= 1;
  min:= 24;
    
  if(pr_tip) then begin Mmax:= 26; Mmin:=0; Button1.Caption:='������ ����'; end // ������������
  else   begin Mmax:= 5; Mmin:=20; Button1.Caption:='������ ����������';end;  // ����������
  Button1.Visible:=true;

  For i:=0 to 48 do MA[i]:=i;
   Randomize;
   For i:=0 to 48 do begin
       nn:=Random(48-i);
       If (nn <> 48-i) then begin
         res:=MA[nn];
         MA[nn]:=MA[48-i];
         MA[48-i]:=res;
       end;
   end;
   For k:=0 to 48 do  begin
       ii:= MA[k] div 7;
       jj:= MA[k] mod 7;
       if(k<=23) then
          begin
           if (k<9) then probel:='  '
          else  probel:=' ';
             StringGrid1.Cells[ii,jj]:= (probel + IntToStr(k+1));
             Red[ii,jj]:= true;
          end
       else
          begin
          if ((k-23)<=9) then probel:='  '
          else  probel:=' ';
             StringGrid1.Cells[ii,jj]:= (probel +IntToStr(k-23));
             Red[ii,jj]:= false;
          end;
   end;
end;

// ������� ������ ������ ����

procedure TfmTestChulte.Button1Click(Sender: TObject);
begin
  T0:=now;
  StringGrid1.Visible:=true;
  Button1.Visible:=false;
  ListBox1.Visible:=true;

  if ((testNo = 1) and (max = Mmax)) then
     inc(testNo)
  else
    if ((testNo = 2) and (min=Mmin)) then
           begin
             inc(testNo);
             max:=1;
             min:=24;
             prBlue:=false;
           end;
end;

// ��������� ������ � ����� ����

procedure TfmTestChulte.StringGrid1DrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
  var i,j:smallint;
begin
  with stringGrid1.Canvas do
  begin
    For i:=0 to 6 do
        For j:=0 to 6 do  begin
            if ((aCol = i) and (aRow = j)) then
                if Red[i,j] then Font.Color := clRed
                else  Font.Color := clBlue;
             Brush.Color := clWindow;
             FillRect (Rect);
             TextRect(Rect, Rect.Left, Rect.Top, stringGrid1.cells[ACol, ARow]);
         end;
  end;
end;

// ����� ����� � ��������

procedure TfmTestChulte.StringGrid1SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
    var T1: TDateTime;
    resRedBlue: Double;
 begin

 case testNo of
  1: If ((StrToInt(StringGrid1.Cells[ACol,ARow])= max) and (not Red[ACol,ARow])) then begin
        ListBox1.Items.Add(StringGrid1.Cells[ACol,ARow]);
        inc(max);
        if (max = Mmax) then  begin
           T1:=now;
           resBlue:=round(SecondSpan(T1,T0));
           application.MessageBox(PChar('����� ���������� �������: '+FloatToStr(resBlue)+' �'),'',MB_ICONINFORMATION);
           ListBox1.Clear;
           Memo1.Text:= '� ������� ����� ������� ���� �������� ����� �������� ����� � ��������� �������';
           Button1.Visible:= true;
           StringGrid1.Visible:=false;
         end;
     end
     else  showmessage('������ �����������!');
 2:
  If ((StrToInt(StringGrid1.Cells[ACol,ARow])= min) and Red[ACol,ARow]) then begin
      dec(min);
      ListBox1.Items.Add(StringGrid1.Cells[ACol,ARow]);
      if (min = Mmin) then  begin
           T1:=now;
           resRed:=round(SecondSpan(T1,T0));
           application.MessageBox(PChar('����� ���������� �������: '+FloatToStr(resRed)+' �'),'',MB_ICONINFORMATION);
           ListBox1.Clear;
           Memo1.Text:= '� ������� ����� ������� ���� �������� ����������� ����� ������ ����� � ������������ �������, � ����� �������� ����� - � ��������� �������';
           Button1.Visible:= true;
           StringGrid1.Visible:=false;
       end;
   end
  Else showmessage('������ �����������!');

 3:
 If ((StrToInt(StringGrid1.Cells[ACol,ARow])= max) and (not Red[ACol,ARow]) and (not prBlue)) then begin

     ListBox1.Items.Add(StringGrid1.Cells[ACol,ARow]);
     inc(max);
     prBlue:= true;
      if ((max = Mmax) and (min = Mmin)) then  begin
           T1:=now;
           resRedBlue:=round(SecondSpan(T1,T0));
           StringGrid1.Visible:=false;
           ListBox1.Visible:=false;
           ListBox1.Clear;
           Memo1.Visible:= false;
           RezTest := resRedBlue - (resRed+resBlue);
           if RezTest <= 89 then Ball:=5;
           if (RezTest >= 90)AND(RezTest <= 113) then Ball:=4;
           if (RezTest >= 114)AND(RezTest <= 120) then Ball:=3;
           if (RezTest >= 121)AND(RezTest <= 138) then Ball:=2;
           if RezTest >= 90 then Ball:=1;
           application.MessageBox(PChar('���������: '+FloatToStr(RezTest)+
           #10+#13+'�����: '+ IntToStr(Ball)),'���� ��������',MB_ICONINFORMATION);
           Close;
        end;
    end
 Else
  If ((StrToInt(StringGrid1.Cells[ACol,ARow])= min) and (Red[ACol,ARow]) and (prBlue)) then begin

     ListBox1.Items.Add(StringGrid1.Cells[ACol,ARow]);
     dec(min);
     prBlue:= false;
      if ((max = Mmax) and (min = Mmin)) then  begin
           T1:=now;
           resRedBlue:=round(SecondSpan(T1,T0));
           StringGrid1.Visible:=false;
           ListBox1.Visible:=false;
           ListBox1.Clear;
           Memo1.Visible:= false;
           RezTest :=  (resRedBlue - (resRed+resBlue));
           application.MessageBox(PChar('���������� ���������'),'',MB_ICONINFORMATION);
          Close;
        end;
    end
  Else showmessage('������ �����������!');
 
 end;
end;

procedure TfmTestChulte.ListBox1DrawItem(Control: TWinControl; Index: Integer;
  Rect: TRect; State: TOwnerDrawState);
begin
  with (Control as TListBox).Canvas do begin
    if (((Index mod 2 = 0) and (testNo=3)) or (testNo=1)) then
       Font.Color := clBlue
    else
       Font.Color := clRed;
    Brush.Color := clGradientInactiveCaption;;
    FillRect(Rect);
    TextOut(Rect.Left + 2, Rect.Top, (Control as TListBox).Items[Index])
  end;
end;
 
procedure TfmTestChulte.Button3Click(Sender: TObject);
begin
 If MessageDlg('�� �������, ��� ������ �������� ����?',mtConfirmation,[mbOK,mbCancel],0)=mrOK
    Then begin
      RezTest:=0;
      Ball:=0;
      Close;
    end;
end;

procedure TfmTestChulte.FormMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  // �������� ��������� ������ "�������� ����"
  If ((BorderIcons=[]) and (y>=Button3.Top)and(y<Button3.Top+Button3.Height)and
      (x>=Button3.Left)and(x<Button3.Left+Button3.Width))
    Then Button3.Visible:=true
    Else Button3.Visible:=false;
 end;

end.
