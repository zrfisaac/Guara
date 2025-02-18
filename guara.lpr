program guara;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  {$IFDEF HASAMIGA}
  athreads,
  {$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, menu_main
  { you can add units after this };

{$R *.res}

begin
  RequireDerivedFormResource:=True;
  Application.Title:='Guara';
  Application.Scaled:=True;
  Application.Initialize;
  Application.CreateForm(TMenuMain, MenuMain);
  Application.Run;
end.

