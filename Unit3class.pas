unit Unit3class;
// смотрим какие классы в файле html
interface

uses
  math,
  strutils, types,
  RegularExpressions,
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    Memo2: TMemo;
    Timer2: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure f2(x: string);
    function ko(x: string): TStringDynArray;
  end;

var
  Form1: TForm1;
  a1,a2,a3,a4,a5,a6,a7,a8: tstringlist;
implementation

{$R *.dfm}

function NameNoExt(x: string): string;
begin // имя файла без расширения
 result:=Copy(x,1,length(x)-length(ExtractFileExt(x)));
end;

function tform1.ko(x: string): TStringDynArray;
const Pattern = 'class="([^"]+)"';
var
  RegEx: TRegEx;
  s: UTF8String;
  a: TStringDynArray;
  mc: tmatchcollection;
  i,j,k: integer;
begin
  result:=[];
  RegEx:=TRegEx.Create(Pattern);
  mc:=RegEx.Matches(trim(x));
  for i:=0 to mc.Count-1 do begin
    s:= trim(mc[i].Groups[1].Value);
    repeat s:=StringReplace(s,'  ',' ',[rfReplaceAll,rfIgnoreCase]) until pos('  ',s)=0;
    a:=SplitString(s, ' ');
    j:=length(result);
    setlength(result,length(result)+length(a));
    for k := 0 to High(a) do  result[j+k]:=a[k];
  end;
end;


procedure TForm1.Timer2Timer(Sender: TObject);
var i,k: integer;
begin  // синхронный скролл
  k:=SendMessage(memo1.Handle,EM_GETFIRSTVISIBLELINE ,0,0);
  i:=SendMessage(memo2.Handle,EM_GETFIRSTVISIBLELINE ,0,0);
  SendMessage(memo2.Handle,EM_LINESCROLL,0,k-i);
end;

procedure tform1.f2(x: string);
var
  i,j,k: integer;
  s,d: UTF8String;
  m: TStringDynArray;
  b: boolean;
  n1,n2,n3: string;
begin
  n1:=ExtractFilePath(x);
  n2:=ExtractFileName(x);
  n3:=NameNoExt(n2);
  form1.Caption:=n2;
  a3.Clear;
  a5.Clear;
  a1.LoadFromFile(x,TEncoding.UTF8);
  for i :=0 to a1.Count-1 do
    begin
      s:=trim(a1[i]);
      m:=ko(s);
      for j := 0 to High(m) do a3.Add(m[j]);
    end;
  a3.Sort;
  a2.Clear;
  s:='';
  k:=1;
  for i :=0 to a3.Count-1 do
    begin
      if s=a3[i] then continue;
      s:=a3[i];
      a2.Add(s);
      a5.Add(inttostr(k));
      inc(k);
    end;
  memo2.scrollby(0,100);
  memo1.lines.Assign(a2);
  memo2.lines.Assign(a5);
end;


procedure TForm1.FormCreate(Sender: TObject);
begin
  if paramstr(1)>'' then
     f2(paramstr(1));
end;

initialization
a1:=tstringlist.Create();
a2:=tstringlist.Create();
a3:=tstringlist.Create();
a4:=tstringlist.Create();
a5:=tstringlist.Create();
a6:=tstringlist.Create();
a7:=tstringlist.Create();
a8:=tstringlist.Create();

finalization
a1.free; a2.free; a3.free; a4.free;
a5.free; a6.free; a7.free; a8.free;

end.
