// # [ zrfisaac ]

// # [ about ]
// # - author : Isaac Caires
// # . - email : zrfisaac@gmail.com
// # . - site : zrfisaac.github.io

// # [ lazarus ]
unit module_main;

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
  model_module;

type
  TModuleMain = class(TModelModule)
  end;

var
  ModuleMain: TModuleMain;

implementation

{$R *.lfm}

end.

