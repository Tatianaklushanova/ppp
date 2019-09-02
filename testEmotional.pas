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

 // открытие формы

procedure TfmTestEmotional.FormShow(Sender: TObject);
const question: array[0..39] of string[80] =(
'Перед тем, как пойти к зубному врачу, представляю себе, что будет больно',
'Мне неприятно оставаться одному в темноте',
'Пугаюсь грозы и молнии',
'Обычно легко выхожу из равновесия',
'Никогда в жизни ничего не пугался',
'Боюсь змей',
'Часто снится такое, что просыпаюсь от страха',
'Отвечая перед группой, испытываю большую неловкость',
'Идя к врачу, волнуюсь, что он мне скажет',
'Мне никогда не представляется, что с кем-нибудь из близких случилось несчастье',
'Волнуюсь, когда не знаю, по какой причине вызывает меня начальник',
'Пугаюсь, увидев мертвое животное',
'Не люблю оставаться один на открытом месте',
'С трудом осваиваюсь с новым местом или коллективом',
'Никогда не беспокоюсь о будущем',
'Допустив ошибку, долго вспоминаю об этом',
'Когда сажусь за занятия, часто мешают тревожные мысли',
'Часто приходит в голову мысль, что я могу заболеть или получить травму',
'Считаю себя более нервным, чем большинство людей',
'Меня беспокоит, что думают обо мне другие',
'Не могу долго сосредотачиваться на одном деле',
'Беспокоюсь о деньгах и о своей работе',
'Часто замечаю, что у меня дрожат руки, когда я очень стараюсь что-нибудь сделать',
'Чаще, чем другие, краснею от смущения',
'Я никогда не видел страшных сновидений',
'Я часто боюсь, что начинаю краснеть',
'У меня легко появляется испарина даже в прохладные дни',
'Смущаясь, покрываясь испариной, что мне очень неприятно',
'У меня бывают периоды, когда я теряю сон из-за волнения',
'Мне никогда не приходит в голову мысль о неполноценности',
'Я редко бываю в хорошем настроении',
'Почти всегда тревожусь о ком-нибудь или о чем-нибудь',
'Свидание с начальником меня нервирует',
'Я чаще, чем другие, занимаюсь самоанализом',
'Иногда я чувствую невозможность преодоления трудностей',
'Иногда я беспокоюсь по несуществующей причине',
'Иногда я боюсь вещей и людей, которые на самом деле не могут мне повредить',
'Мне не хватает уверенности в себе' ,
'Я не люблю сталкиваться с трудностями и принимать важные решения',
'Иногда я чувствую себя беспомощным человеком');
probel: string =' ';
var i,j: smallint;
 begin
  StringGrid1.Height:= ClientHeight*60 div 100;
  StringGrid1.Width:= ClientWidth*90 div 100;
  StringGrid1.Left:=(ClientWidth - StringGrid1.Width) div 2;
  StringGrid1.Top:= (ClientHeight - StringGrid1.Height) div 2;

  Panel1.Top:= StringGrid1.Top-65;   //  высота панели-заголовка 50
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
  Button1.Left:= (ClientWidth - 140) div 2;           // ширина кнопки 140
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

 //  отрисовка фона таблицы

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

 // выбор ответа в таблице

procedure TfmTestEmotional.StringGrid1SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
var i,j: smallint;

begin
case ACol of
2:                    // столбец Да
  If not Vibor[ACol-2][ARow] then  begin //  квадрат не нажат
     if  not Vibor[ACol-1][ARow]  then  begin
         if ((ARow=4)or(ARow=9)or(ARow=14)or(ARow=19)or(ARow=24)or(ARow=29)) then inc(Cnen);
         Vibor[ACol-2][ARow]:= true;
         inc(Count);
     end
  end
  Else  begin            //  квадрат нажат
      Vibor[ACol-2][ARow]:= false;
      dec(Count);
      if ((ARow=4)or(ARow=9)or(ARow=14)or(ARow=19)or(ARow=24)or(ARow=29)) then dec(Cnen);
  end;

 3:    // столбец Нет
  If not Vibor[ACol-2][ARow] then   begin//  квадрат не нажат
     if  not Vibor[ACol-3][ARow]  then
         Vibor[ACol-2][ARow]:= true;
     end
  Else              //  квадрат нажат
       Vibor[ACol-2][ARow]:= false;

 end;

 if Cnen = 4 then  begin
      StringGrid1.Repaint;
      application.MessageBox(PChar('Выявлена ненадежность Ваших ответов!'+
       #10+#13+'Начните отвечать заново'),'Ошибка',16);
      Cnen:=0;
      For i:=0 to 1 do
        For j:=0 to 39 do  Vibor[i][j]:=false;
        StringGrid1.Repaint;
        inc(Povtor);
        if Povtor=3 then begin
           application.MessageBox(PChar('Тест не пройден!'),'',MB_ICONINFORMATION);
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
     application.MessageBox(PChar('Вы ответили не на все вопросы!'),'Ошибка',16);
     Exit;
  end
  else begin
    RezTest:= Count-Cnen;
    if RezTest <= 6 then Ball:=5;
    if (RezTest >= 7)AND(RezTest <= 11) then Ball:=4;
    if (RezTest >= 12)AND(RezTest <= 16) then Ball:=3;
    if (RezTest >= 17)AND(RezTest <= 22) then Ball:=2;
    if RezTest >= 23 then Ball:=1;

    application.MessageBox(PChar('Количество положительных ответов: '+IntToStr(Count)
   +#10+#13+'Результат: '+ FloatToStr(RezTest)
   +#10+#13+'Баллы: '+ IntToStr(Ball)),'Тест окончен', MB_ICONINFORMATION);
     Close;
 end;

end;

procedure TfmTestEmotional.Button3Click(Sender: TObject);
begin
  If MessageDlg('Вы уверены, что хотите прервать тест?',mtConfirmation,[mbOK,mbCancel],0)=mrOK
    Then begin RezTest:=0; Ball:=0; Close; end;
end;

procedure TfmTestEmotional.FormMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  // проверка видимости кнопки "прервать тест"
  If ((BorderIcons=[]) and (y>=Button3.Top)and(y<Button3.Top+Button3.Height)and
      (x>=Button3.Left)and(x<Button3.Left+Button3.Width))
    Then Button3.Visible:=true
    Else Button3.Visible:=false;

end;

end.
