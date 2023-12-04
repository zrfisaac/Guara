// # [ zrfisaac ]

// # [ sobre ]
// # - autor : Isaac Santana
// # . - email : zrfisaac@gmail.com
// # . - site : zrfisaac.github.io
// # - base : nenhum
// # - descricao : nenhum
// # - versao : zrfisaac.project.ZRFI.Pascal : 0.0.1

// # [ pascal ]
unit uZRFIFile;

interface

uses
  Classes,
  SysUtils,
  Windows;

var
  vZRFIFile_Path: String;

procedure fnZRFIFile_Add(_p01: String = ''; _p02: String = ''; _p03: String = ''; _p04: String = ''; _p05: String = ''; _p06: String = ''; _p07: String = ''; _p08: String = ''; _p09: String = ''; _p10: String = ''; _p11: String = ''; _p12: String = '');
procedure fnZRFIFile_AddLine;
procedure fnZRFIFile_AddWord(_p01: String = ''; _p02: String = ''; _p03: String = ''; _p04: String = ''; _p05: String = ''; _p06: String = ''; _p07: String = ''; _p08: String = ''; _p09: String = ''; _p10: String = ''; _p11: String = ''; _p12: String = '');
procedure fnZRFIFile_Clear;

implementation

procedure fnZRFIFile_Add(_p01: String = ''; _p02: String = ''; _p03: String = ''; _p04: String = ''; _p05: String = ''; _p06: String = ''; _p07: String = ''; _p08: String = ''; _p09: String = ''; _p10: String = ''; _p11: String = ''; _p12: String = '');
var
  _vFileStream: TFileStream;
begin
  try
    if (FileExists(vZRFIFile_Path)) then
      _vFileStream := TFileStream.Create(vZRFIFile_Path, fmOpenWrite)
    else
      _vFileStream := TFileStream.Create(vZRFIFile_Path, fmCreate);
    _vFileStream.Seek(0, soFromEnd);
    if (Length(_p01) > 0) then
    begin
      _vFileStream.WriteBuffer(Pointer(_p01)^, Length(_p01));
      _vFileStream.WriteBuffer(#13#10, 2);
    end;
    if (Length(_p02) > 0) then
    begin
      _vFileStream.WriteBuffer(Pointer(_p02)^, Length(_p02));
      _vFileStream.WriteBuffer(#13#10, 2);
    end;
    if (Length(_p03) > 0) then
    begin
      _vFileStream.WriteBuffer(Pointer(_p03)^, Length(_p03));
      _vFileStream.WriteBuffer(#13#10, 2);
    end;
    if (Length(_p04) > 0) then
    begin
      _vFileStream.WriteBuffer(Pointer(_p04)^, Length(_p04));
      _vFileStream.WriteBuffer(#13#10, 2);
    end;
    if (Length(_p05) > 0) then
    begin
      _vFileStream.WriteBuffer(Pointer(_p05)^, Length(_p05));
      _vFileStream.WriteBuffer(#13#10, 2);
    end;
    if (Length(_p06) > 0) then
    begin
      _vFileStream.WriteBuffer(Pointer(_p06)^, Length(_p06));
      _vFileStream.WriteBuffer(#13#10, 2);
    end;
    if (Length(_p07) > 0) then
    begin
      _vFileStream.WriteBuffer(Pointer(_p07)^, Length(_p07));
      _vFileStream.WriteBuffer(#13#10, 2);
    end;
    if (Length(_p08) > 0) then
    begin
      _vFileStream.WriteBuffer(Pointer(_p08)^, Length(_p08));
      _vFileStream.WriteBuffer(#13#10, 2);
    end;
    if (Length(_p09) > 0) then
    begin
      _vFileStream.WriteBuffer(Pointer(_p09)^, Length(_p09));
      _vFileStream.WriteBuffer(#13#10, 2);
    end;
    if (Length(_p10) > 0) then
    begin
      _vFileStream.WriteBuffer(Pointer(_p10)^, Length(_p10));
      _vFileStream.WriteBuffer(#13#10, 2);
    end;
    if (Length(_p11) > 0) then
    begin
      _vFileStream.WriteBuffer(Pointer(_p11)^, Length(_p11));
      _vFileStream.WriteBuffer(#13#10, 2);
    end;
    if (Length(_p12) > 0) then
    begin
      _vFileStream.WriteBuffer(Pointer(_p12)^, Length(_p12));
      _vFileStream.WriteBuffer(#13#10, 2);
    end;
    _vFileStream.Free;
  except
  end;
end;

procedure fnZRFIFile_AddLine;
var
  _vFileStream: TFileStream;
begin
  try
    if (FileExists(vZRFIFile_Path)) then
      _vFileStream := TFileStream.Create(vZRFIFile_Path, fmOpenWrite)
    else
      _vFileStream := TFileStream.Create(vZRFIFile_Path, fmCreate);
    _vFileStream.Seek(0, soFromEnd);
    _vFileStream.WriteBuffer(#13#10, 2);
    _vFileStream.Free;
  except
  end;
end;

procedure fnZRFIFile_AddWord(_p01: String = ''; _p02: String = ''; _p03: String = ''; _p04: String = ''; _p05: String = ''; _p06: String = ''; _p07: String = ''; _p08: String = ''; _p09: String = ''; _p10: String = ''; _p11: String = ''; _p12: String = '');
var
  _vFileStream: TFileStream;
begin
  try
    if (FileExists(vZRFIFile_Path)) then
      _vFileStream := TFileStream.Create(vZRFIFile_Path, fmOpenWrite)
    else
      _vFileStream := TFileStream.Create(vZRFIFile_Path, fmCreate);
    _vFileStream.Seek(0, soFromEnd);
    if (Length(_p01) > 0) then
      _vFileStream.WriteBuffer(Pointer(_p01)^, Length(_p01));
    if (Length(_p02) > 0) then
      _vFileStream.WriteBuffer(Pointer(_p02)^, Length(_p02));
    if (Length(_p03) > 0) then
      _vFileStream.WriteBuffer(Pointer(_p03)^, Length(_p03));
    if (Length(_p04) > 0) then
      _vFileStream.WriteBuffer(Pointer(_p04)^, Length(_p04));
    if (Length(_p05) > 0) then
      _vFileStream.WriteBuffer(Pointer(_p05)^, Length(_p05));
    if (Length(_p06) > 0) then
      _vFileStream.WriteBuffer(Pointer(_p06)^, Length(_p06));
    if (Length(_p07) > 0) then
      _vFileStream.WriteBuffer(Pointer(_p07)^, Length(_p07));
    if (Length(_p08) > 0) then
      _vFileStream.WriteBuffer(Pointer(_p08)^, Length(_p08));
    if (Length(_p09) > 0) then
      _vFileStream.WriteBuffer(Pointer(_p09)^, Length(_p09));
    if (Length(_p10) > 0) then
      _vFileStream.WriteBuffer(Pointer(_p10)^, Length(_p10));
    if (Length(_p11) > 0) then
      _vFileStream.WriteBuffer(Pointer(_p11)^, Length(_p11));
    if (Length(_p12) > 0) then
      _vFileStream.WriteBuffer(Pointer(_p12)^, Length(_p12));
    _vFileStream.Free;
  except
  end;
end;

procedure fnZRFIFile_Clear;
var
  _vFileStream: TFileStream;
begin
  try
    if (FileExists(vZRFIFile_Path)) then
      _vFileStream := TFileStream.Create(vZRFIFile_Path, fmOpenWrite)
    else
      _vFileStream := TFileStream.Create(vZRFIFile_Path, fmCreate);
    _vFileStream.Size := 0;
    _vFileStream.Free;
  except
  end;
end;

initialization
  vZRFIFile_Path := ExtractFileDir(ParamStr(0)) + '\_.txt'
finalization
end.
