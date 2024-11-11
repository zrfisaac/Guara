// # [ zrfisaac ]

// # [ about ]
// # - author : Isaac Caires
// # . - email : zrfisaac@gmail.com
// # . - site : zrfisaac.github.io

// # [ lazarus ]
unit model_base;

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
  ExtCtrls;

type

  { TModelBase }

  TModelBase = class(TForm)
    pnBack: TPanel;
  end;

var
  ModelBase: TModelBase;

implementation

{$R *.lfm}

end.

