// # [ zrfisaac ]

// # [ about ]
// # - author : Isaac Caires
// # . - email : zrfisaac@gmail.com
// # . - site : zrfisaac.github.io

// # [ lazarus ]
unit menu_main;

{$mode ObjFPC}
{$H+}

interface

uses
  Classes,
  SysUtils,
  Forms,
  Controls,
  Graphics,
  Dialogs, ComCtrls, Menus,
  model_base;

type

  { TMenuMain }

  TMenuMain = class(TModelBase)
    miAbout: TMenuItem;
    miConfig: TMenuItem;
    miHelp: TMenuItem;
    miMenu: TMainMenu;
    sbStatus: TStatusBar;
    procedure FormCreate(Sender: TObject);
  end;

var
  MenuMain: TMenuMain;

implementation

{$R *.lfm}

{ TMenuMain }

procedure TMenuMain.FormCreate(Sender: TObject);
begin
  // # : - title
  Self.Caption := Application.Title;
end;

end.

