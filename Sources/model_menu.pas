// # [ zrfisaac ]

// # [ about ]
// # - author : Isaac Caires
// # . - email : zrfisaac@gmail.com
// # . - site : zrfisaac.github.io

// # [ lazarus ]
unit model_menu;

{$mode ObjFPC}
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
  model_base;

type

  { TModelMenu }

  TModelMenu = class(TModelBase)
    pnTitle: TPanel;
  private

  public

  end;

var
  ModelMenu: TModelMenu;

implementation

{$R *.lfm}

end.

