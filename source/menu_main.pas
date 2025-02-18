unit menu_main;

{$mode objfpc}
{$H+}

interface

uses
  Classes,
  SysUtils,
  Forms,
  Controls,
  Graphics,
  Dialogs,
  ExtCtrls,
  Menus;

type

  { TMenuMain }

  TMenuMain = class(TForm)
    miAbout: TMenuItem;
    miConfig: TMenuItem;
    miHelp: TMenuItem;
    miMenu: TMainMenu;
    pnBack: TPanel;
  end;

var
  MenuMain: TMenuMain;

implementation

{$R *.lfm}

end.

