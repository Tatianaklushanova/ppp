unit print;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Word97, OleServer, Printers, CheckLst, Buttons, Menus, ComObj,
  DBCtrls, ComCtrls, FMTBcd, DB, SqlExpr, DBTables, Grids, DBGrids,Math,
  WordXP, ExtCtrls;

type
  TfmPrint = class(TForm)
    Button1: TButton;
    WordDocument1: TWordDocument;
    WordApplication1: TWordApplication;
    WordParagraphFormat1: TWordParagraphFormat;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Edit1: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    DBLookupComboBox2: TDBLookupComboBox;
    DBLookupComboBox3: TDBLookupComboBox;
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DateTimePicker2Change(Sender: TObject);
    procedure DateTimePicker1Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmPrint: TfmPrint;

implementation

uses DM;

{$R *.dfm}

procedure TfmPrint.Button1Click(Sender: TObject);
var
   Rng, Doc, App1, MyRange, table, kodwork, kodcompany,kodprof,ball_value: Variant;
   i, j, ii: smallint;
   numcol:integer;
   sumball: double;
   mas: array[0..3] of string;
   path0,dat1,dat2,fileName,FileNamedoc,k, fieldball : string;
begin
  path0:=ExtractFilePath(ParamStr(0));
  i:=Length(path0)-1;
  while path0[i]<>'\' do Dec(i);
  path0:=Copy(path0,1,i)+'Doc\';

  mas[0]:='';
  mas[1]:='';
  mas[2]:='';
  mas[3]:='';

  kodprof :=DBLookupComboBox3.KeyValue;
  kodwork :=DBLookupComboBox1.KeyValue;
  kodcompany :=DBLookupComboBox2.KeyValue;

  DataModule2.Query1.Close;

 DataModule2.query1.SQL.Text:='select * from testing left outer join wwork on testing.Work1=wwork.Kod '+
      'left outer join clients on testing.INN=clients.INN ' +
 ' left outer join profession on clients.profesion=profession.Kod '+
 ' left outer join company on clients.company=company.Kod';

 DateTimePicker2.Date:= Now;
 dat1:=Datetostr(DateTimePicker1.Date);
 dat2:=Datetostr(DateTimePicker2.Date);

DataModule2.query1.SQL.ADD(' where ');
DataModule2.query1.SQL.ADD('(testing.Data >='+ ''''+ dat1+ ''''+') AND (testing.Data <='+ ''''+ dat2+''''+')');

if (kodwork <> Null) then
    mas[0]:= 'testing.work1='+ VarToStr(kodwork);

if (Edit1.Text <> '') then
    mas[1]:= 'clients.Famil='+ ''''+Edit1.Text+'''';

if (kodprof <> Null) then
    mas[2]:= 'clients.profesion='+ VarToStr(kodprof);

if (kodcompany <> Null) then
    mas[3]:= 'clients.company='+ VarToStr(kodcompany);

 For i:=0 to 3 do begin
   if (mas[i] = '') then continue
   else begin
       DataModule2.query1.SQL.ADD(' AND ');
       DataModule2.query1.SQL.ADD(mas[i]);
   end;
 end;


 DataModule2.Query1.Open;
 numcol:= DataModule2.query1.Recordcount+1;
//   showmessage('количество записей='+inttostr(query1.Recordcount));
 // создание Word

   App1:=CreateOleObject('Word.Application');
   App1.Visible:=true;
   App1.Documents.Add;
   Doc:=App1.Documents.Item(1);
   Doc.PageSetup.Orientation:=poLandscape;

   fileName:= path0+'spisok';
   fileNamedoc:= path0+'spisok1.doc';
   k:='1';
   while FileExists(fileNamedoc) do
   begin
      j:= strtoint(k)+1;
      k:=inttostr(j);
      fileNamedoc:= fileName+k+'.doc';
   end;

  Rng:=Doc.Paragraphs.Item(1).Range;
  Doc.Paragraphs.Alignment:=wdAlignParagraphCenter;
  Rng.Font.Size := 14;
  Rng.InsertAfter('Результаты тестирования сотрудников');
  Doc.Paragraphs.Add;
  Doc.Paragraphs.Add;

  MyRange:=Doc.Range(Doc.Range.End-1, Doc.Range.End-1);
  Doc.Tables.Add(Range:=MyRange, NumRows:=numcol,NumColumns:=8);

  table:= App1.Documents.Item(1).Tables.Item(1);
  table.LeftPadding:=1;

  table.Rows.Height:=20;
  table.Rows.Item(1).Select;
  App1.Selection.Font.Size:=12;

  table.Rows.Item(1).Height:=30;
  table.Columns.Item(1).Width:=36;
  table.Columns.Item(2).Width:=120;
  table.Columns.Item(3).Width:=40;
  table.Columns.Item(4).Width:=120;
  table.Columns.Item(5).Width:=120;
  table.Columns.Item(6).Width:=70;
  table.Columns.Item(7).Width:=60;
  table.Columns.Item(8).Width:=120;

//  table.Columns.Item(1).Borders := wdTableFormatApplyBorders;
  table.Cell(1,1).Range.Text:='№ п/п';
  table.Cell(1,2).Range.Text:='Фамилия, имя, отчество';
  table.Cell(1,3).Range.Text:='Код вида работ';
  table.Cell(1,4).Range.Text:='Вид работы';
  table.Cell(1,5).Range.Text:='Предприятие';
  table.Cell(1,6).Range.Text:='Профессия';
  table.Cell(1,7).Range.Text:='Общая оценка';
  table.Cell(1,8).Range.Text:='Выводы';

  table.Cell(1,1).VerticalAlignment:= 1;
  table.Cell(1,2).VerticalAlignment:= 1;
  table.Cell(1,3).VerticalAlignment:= 1;
  table.Cell(1,4).VerticalAlignment:= 1;
  table.Cell(1,5).VerticalAlignment:= 1;
  table.Cell(1,6).VerticalAlignment:= 1;
  table.Cell(1,7).VerticalAlignment:= 1;
  table.Cell(1,8).VerticalAlignment:= 1;

 //  цикл по массиву тестирования

  DataModule2.Query1.First;
  For i:=1 to numcol-1 do begin

    table.Rows.Item(i+1).Select;
    App1.Selection.Font.Size:=11;

    table.Cell(i+1,1).Range.Text:= i;
    table.Cell(i+1,2).Range.Text:= DataModule2.Query1.FieldByName('Famil').AsString+' '+
    DataModule2.Query1.FieldByName('Name_1').AsString+' '+DataModule2.Query1.FieldByName('Otch').AsString;
    table.Cell(i+1,3).Range.Text:= DataModule2.Query1.FieldByName('Work1').AsString;
    table.Cell(i+1,4).Range.Text:= DataModule2.Query1.FieldByName('Name').AsString;
    table.Cell(i+1,5).Range.Text:= DataModule2.Query1.FieldByName('Name_3').AsString;
    table.Cell(i+1,6).Range.Text:= DataModule2.Query1.FieldByName('Name_2').AsString;

    sumball:=0;
    for ii:=1 to 9 do begin
      fieldball:= 'Ball'+intToStr(ii);
      ball_value:= DataModule2.Query1.FieldByName(fieldball).AsInteger;
       if (DataModule2.Query1.FieldByName(fieldball).IsNull) then break;
       sumball:=sumball+ball_value;
     end;

    sumball:= RoundTo(sumball/(ii-1),-1);
    table.Cell(i+1,7).Range.Text:= FloattoStr(sumball);
    table.Cell(i+1,8).Range.Text:= '';
    DataModule2.Query1.next;

  end;
  Table.Borders.InsideLineStyle:= wdLineStyleSingle;
  Table.Borders.OutsideLineStyle:= wdLineStyleDouble;
  Doc.SaveAs(fileNamedoc);
  
end;

procedure TfmPrint.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 Edit1.Clear;
 DBLookupComboBox3.KeyValue:= Null;
 DBLookupComboBox1.KeyValue:= Null;
 DBLookupComboBox2.KeyValue:= Null;
 DateTimePicker1.Format:= ' ';
 DateTimePicker2.Format:= ' ';
  DataModule2.wwork.Close;
  DataModule2.company.Close;
  DataModule2.profesion.Close;
  DataModule2.clients.Close;
end;


procedure TfmPrint.DateTimePicker2Change(Sender: TObject);
begin
   DateTimePicker2.Format:= 'dd.MM.yyyy';
end;

procedure TfmPrint.DateTimePicker1Change(Sender: TObject);
begin
  DateTimePicker1.Format:= 'dd.MM.yyyy';
end;

procedure TfmPrint.FormShow(Sender: TObject);
begin
   Panel1.Left:= (ClientWidth - Panel1.Width) div 2;
   Panel1.Top:= (ClientHeight - Panel1.Height) div 2;
   Label1.Left:= (ClientWidth - Label1.Width) div 2;
   Label1.Top:= Panel1.Top - 40;
   Button1.Left:= (ClientWidth - 121) div 2;
   Button1.Top:= Panel1.Top+Panel1.Height+40;
   
   DataModule2.wwork.Open;
   DataModule2.company.Open;
   DataModule2.profesion.Open;
   DataModule2.clients.Open;
end;

end.
