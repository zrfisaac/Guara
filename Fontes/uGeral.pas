unit uGeral;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Variants,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  ExtCtrls,
  ComCtrls,
  StdCtrls,
  IniFiles,
  Spin;

function fnIni: String;
function fnIniR(pSecao: String = ''; pNome: String = ''): String; overload;
function fnIniR(pSecao: String = ''; pNome: String = ''; pValor: String = ''): String; overload;
function fnIniR(pSecao: String = ''; pNome: String = ''; pValor: Boolean = False): Boolean; overload;
function fnIniR(pSecao: String = ''; pNome: String = ''; pValor: Integer = 0): Integer; overload;
function fnIniR(pSecao: String = ''; pNome: String = ''; pValor: TComboBox = Nil): String; overload;
function fnIniR(pSecao: String = ''; pNome: String = ''; pValor: TEdit = Nil): String; overload;
function fnIniR(pSecao: String = ''; pNome: String = ''; pValor: TMemo = Nil): String; overload;
function fnIniR(pSecao: String = ''; pNome: String = ''; pValor: TSpinEdit = Nil): Integer; overload;
function fnIniR(pSecao: String = ''; pNome: String = ''; pValor: TCheckBox = Nil): Boolean; overload;
function fnIniW(pSecao: String = ''; pNome: String = ''): String; overload;
function fnIniW(pSecao: String = ''; pNome: String = ''; pValor: String = ''): String; overload;
function fnIniW(pSecao: String = ''; pNome: String = ''; pValor: Boolean = False): Boolean; overload;
function fnIniW(pSecao: String = ''; pNome: String = ''; pValor: Integer = 0): Integer; overload;
function fnIniW(pSecao: String = ''; pNome: String = ''; pValor: TComboBox = Nil): String; overload;
function fnIniW(pSecao: String = ''; pNome: String = ''; pValor: TEdit = Nil): String; overload;
function fnIniW(pSecao: String = ''; pNome: String = ''; pValor: TMemo = Nil): String; overload;
function fnIniW(pSecao: String = ''; pNome: String = ''; pValor: TSpinEdit = Nil): Integer; overload;
function fnIniW(pSecao: String = ''; pNome: String = ''; pValor: TCheckBox = Nil): Boolean; overload;
function fnListaParaString(pLista:TStrings): String;
function fnObjetoExiste(pForm:TForm; pNome:String): Boolean;
function fnReplace(pString: String; pOld: String; pNew: String): String;
function fnStringParaLista(pLista:String): TStrings;
function fnVersao: String; overload;
function fnVersao(pNome: String): String; overload;

implementation

function fnIni: String;
begin
  Result := ExtractFileDir(ParamStr(0)) + '\CONFIG.ini';
end;

function fnIniR(pSecao, pNome: String): String;
begin
  Result := fnIniR(pSecao, pNome,'');
end;

function fnIniR(pSecao, pNome, pValor: String): String;
var
  vIniFile: TIniFile;
  vRetorno: String;
begin
  vRetorno := '';
  try
    vIniFile := TIniFile.Create(fnIni);
    vRetorno := vIniFile.ReadString(pSecao, pNome, pValor);
    vIniFile.WriteString(pSecao, pNome, vRetorno);
    vIniFile.Free;
  except
  end;
  Result := vRetorno;
end;

function fnIniR(pSecao, pNome: String; pValor: Boolean): Boolean;
begin
  if (pValor) then
    Result := fnIniR(pSecao,pNome,'S') = 'S'
  else
    Result := fnIniR(pSecao,pNome,'N') = 'S';
end;

function fnIniR(pSecao, pNome: String; pValor: Integer): Integer;
begin
  Result := StrToIntDef(fnIniR(pSecao,pNome,IntToStr(pValor)),0);
end;

function fnIniR(pSecao, pNome: String; pValor: TComboBox): String;
var
  I: Integer;
  vRetorno: String;
begin
  vRetorno := '';
  if (Assigned(pValor)) then
  begin
    vRetorno := fnIniR(pSecao,pNome,pValor.Text);
    pValor.ItemIndex := -1;
    for I := 0 to pValor.Items.Count - 1 do
      if (pValor.Items[I] = vRetorno) then
        pValor.ItemIndex := I;
    if (pValor.ItemIndex < 0) then
    begin
      vRetorno := '';
      fnIniW(pSecao,pNome,vRetorno);
    end;
  end;
  Result := vRetorno;
end;

function fnIniR(pSecao, pNome: String; pValor: TEdit): String;
var
  vRetorno: String;
begin
  vRetorno := '';
  if (Assigned(pValor)) then
  begin
    vRetorno := fnIniR(pSecao,pNome,pValor.Text);
    pValor.Text := vRetorno;
  end;
  Result := vRetorno;
end;

function fnIniR(pSecao, pNome: String; pValor: TMemo): String;
var
  vRetorno: String;
begin
  vRetorno := '';
  if (Assigned(pValor)) then
  begin
    vRetorno := fnIniR(pSecao,pNome,pValor.Lines.Text);
    pValor.Lines.Text := vRetorno;
  end;
  Result := vRetorno;
end;

function fnIniR(pSecao, pNome: String; pValor: TSpinEdit): Integer;
var
  vRetorno: Integer;
begin
  vRetorno := 0;
  if (Assigned(pValor)) then
  begin
    vRetorno := fnIniR(pSecao,pNome,pValor.Value);
    pValor.Value := vRetorno;
  end;
  Result := vRetorno;
end;

function fnIniW(pSecao, pNome: String): String;
begin
  Result := fnIniW(pSecao,pNome,'')
end;

function fnIniW(pSecao, pNome, pValor: String): String;
var
  vIniFile: TIniFile;
  vRetorno: String;
begin
  vRetorno := '';
  try
    vIniFile := TIniFile.Create(fnIni);
    vIniFile.WriteString(pSecao, pNome, pValor);
    vRetorno := vIniFile.ReadString(pSecao, pNome, pValor);
    vIniFile.Free;
  except
  end;
  Result := vRetorno;
end;

function fnIniW(pSecao, pNome: String; pValor: Boolean): Boolean;
begin
  if (pValor) then
    Result := fnIniW(pSecao, pNome,'S') = 'S'
  else
    Result := fnIniR(pSecao,pNome,'N') = 'S';

end;

function fnIniW(pSecao, pNome: String; pValor: Integer): Integer;
begin
  Result := StrToIntDef(fnIniW(pSecao, pNome,IntToStr(pValor)),0);
end;

function fnIniW(pSecao, pNome: String; pValor: TComboBox): String;
var
  vRetorno: String;
begin
  vRetorno := '';
  if (Assigned(pValor)) then
    vRetorno := fnIniW(pSecao, pNome,pValor.Text);
  Result := vRetorno;
end;

function fnIniW(pSecao, pNome: String; pValor: TEdit): String;
var
  vRetorno: String;
begin
  vRetorno := '';
  if (Assigned(pValor)) then
    vRetorno := fnIniW(pSecao, pNome,pValor.Text);
  Result := vRetorno;
end;

function fnIniW(pSecao, pNome: String; pValor: TMemo): String;
var
  vRetorno: String;
begin
  vRetorno := '';
  if (Assigned(pValor)) then
    vRetorno := fnIniW(pSecao, pNome,pValor.Lines.Text);
  Result := vRetorno;
end;

function fnIniW(pSecao, pNome: String; pValor: TSpinEdit): Integer;
var
  vRetorno: Integer;
begin
  vRetorno := 0;
  if (Assigned(pValor)) then
    vRetorno := fnIniW(pSecao, pNome,pValor.Value);
  Result := vRetorno;
end;

function fnIniR(pSecao, pNome: String; pValor: TCheckBox): Boolean;
var
  vRetorno: Boolean;
begin
  vRetorno := False;
  if (Assigned(pValor)) then
    vRetorno := fnIniR(pSecao, pNome,pValor.Checked);
  pValor.Checked := vRetorno;
  Result := vRetorno;
end;

function fnIniW(pSecao, pNome: String; pValor: TCheckBox): Boolean;
var
  vRetorno: Boolean;
begin
  vRetorno := False;
  if (Assigned(pValor)) then
    vRetorno := fnIniW(pSecao, pNome,pValor.Checked);
  Result := vRetorno;
end;

function fnObjetoExiste(pForm:TForm;pNome:String): Boolean;
var
  I: Integer;
begin
  Result := False;
  for I := 0 to pForm.ComponentCount - 1 do
  begin
    if (pForm.Components[I].Name = pNome) then
    begin
      Result := True;
      Break;
    end;
  end;
end;

function fnListaParaString(pLista:TStrings): String;
var
  I: Integer;
  vRetorno: String;
begin
  vRetorno := '';
  if (Assigned(pLista)) then
    for I := 0 to pLista.Count - 1 do
      if (I = 0) then
        vRetorno := pLista[I]
      else
        vRetorno := ',' + pLista[I];
  Result := vRetorno;
end;

function fnReplace(pString: String; pOld: String; pNew: String): String;
var
  vRetorno: TStrings;
begin
  Result := StringReplace(pString, pOld, pNew, [rfReplaceAll, rfIgnoreCase]);
end;

function fnStringParaLista(pLista:String): TStrings;
var
  vRetorno: TStrings;
begin
  vRetorno := TStringList.Create;
  Result := vRetorno;
end;

function fnVersao: String;
var
  vDummy: Cardinal;
  vInfo: Pointer;
  vInfoSize: Cardinal;
  vRetorno: String;
  vValue: PVSFixedFileInfo;
  vValueSize: Cardinal;
  vCaminho: String;
begin
  vRetorno := '';
  vCaminho := ParamStr(0);
  if (FileExists(vCaminho)) then
  begin
    vInfoSize := GetFileVersionInfoSize(PChar(vCaminho), vDummy);
    GetMem(vInfo, vInfoSize);
    try
      try
        if GetFileVersionInfo(PChar(ParamStr(0)), 0, vInfoSize, vInfo) then
        begin
          if VerQueryValue(vInfo, '\', Pointer(vValue), vValueSize) then
          begin
            with vValue^ do
            begin
              vRetorno := Format('%d.%d.%d.%d', [
                HiWord(dwFileVersionMS),
                LoWord(dwFileVersionMS),
                HiWord(dwFileVersionLS),
                LoWord(dwFileVersionLS)
              ]);
            end;
          end;
        end;
      finally
        FreeMem(vInfo, vInfoSize);
      end;
    except;
    end;
  end;
  Result := vRetorno
end;

function fnVersao(pNome: String): String;
var
  vBuffer: Pointer;
  vCharset: string;
  vCharsetBuffer: PChar;
  vRetorno: String;
  vSize: DWORD;
  vSubBlock: string;
  vCaminho: String;
begin
  vRetorno := '';
  vCaminho := ParamStr(0);
  if (FileExists(vCaminho)) then
  begin
    vSize := GetFileVersionInfoSize(PChar(vCaminho), vSize);
    if (vSize > 0) then
    begin
      GetMem(vBuffer, vSize);
      try
        try
          if (GetFileVersionInfo(PChar(vCaminho), 0, vSize, vBuffer)) then
          begin
            if (VerQueryValue(vBuffer, '\VarFileInfo\Translation', Pointer(vCharsetBuffer), vSize)) then
            begin
              vCharset := Format('%.4x%.4x', [LoWord(PLongint(vCharsetBuffer)^), HiWord(PLongint(vCharsetBuffer)^)]);
              vSubBlock:= Format('\StringFileInfo\%s\' + pNome, [vCharset]);
              if (VerQueryValue(vBuffer, PChar(vSubBlock), Pointer(vCharsetBuffer), vSize)) then
              begin
                vRetorno := PChar(vCharsetBuffer);
              end;
            end;
          end;
        finally
          FreeMem(vBuffer);
        end;
      except
      end;
    end;
  end;
  Result := vRetorno;
end;


end.
