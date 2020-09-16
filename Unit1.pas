unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    Edit1: TEdit;
    Edit2: TEdit;
    Memo2: TMemo;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    LText: TTextReader;
    procedure DoJSONRead(ASourceStr:string; ASource, ADest: TStrings);
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses
  DBXJSON;

procedure TForm1.Button1Click(Sender: TObject);
var
  t1,t2:int64;
  r1:int64;
  LStr: string;
begin
  Memo1.Lines.BeginUpdate;
  Memo2.Lines.BeginUpdate;
  Memo1.Clear; Memo2.Clear;
  LText := TStreamReader.Create('..\..\test.json', TEncoding.UTF8);
  LStr := LText.ReadToEnd;
  Memo1.Lines.Text := LStr;


  t1:=GetTickCount;//獲取開始計數 WINDOWS API
  DoJSONRead(LStr, Memo1.Lines, Memo2.Lines);
  t2:=GetTickCount;//獲取結束計數值
  r1:=t2-t1;//取得計時時間，單位毫秒(ms)
  Edit2.Text := Format('%.2d:%.2d:%.2d.%.3d',[Trunc(r1/60/60/60),Trunc(r1/60/60), Trunc(r1/60), r1]);

  LText.Free;
  Memo1.Lines.EndUpdate;
  Memo2.Lines.EndUpdate;
end;

procedure TForm1.DoJSONRead(ASourceStr: string; ASource, ADest: TStrings);
var
  LJsonRoot: TJSONArray;
  LJsonObj: TJSONObject;
  LJsonPair: TJSONPair;
  LRootPos: Integer;
begin
  LJsonRoot := TJSONObject.ParseJSONValue(ASourceStr) as TJSONArray;
  if Assigned(LJsonRoot) then
  begin
    try
      Edit1.Text := IntToStr(LJsonRoot.Size);
      for LRootPos := 0 to LJsonRoot.Size-1 do
      begin
        LJsonObj := LJsonRoot.Get(LRootPos) as TJSONObject;
        LJsonPair := LJsonObj.Get('latitude');
        if Assigned(LJsonPair) then
        begin
          ADest.Add('ObjectNumber : ' + IntToStr(LRootPos));
          ADest.Add(LJsonPair.JsonString.Value + ' = ' + LJsonPair.JsonValue.Value);
        end;
        LJsonPair := LJsonObj.Get('longitude');
        if Assigned(LJsonPair) then
          ADest.Add(LJsonPair.JsonString.Value + ' = ' + LJsonPair.JsonValue.Value);
      end;
    finally
      LJsonRoot.Free;
    end;
  end;
end;

end.
