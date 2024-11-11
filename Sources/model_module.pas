// # [ zrfisaac ]

// # [ about ]
// # - author : Isaac Caires
// # . - email : zrfisaac@gmail.com
// # . - site : zrfisaac.github.io

// # [ lazarus ]
unit model_module;

{$mode ObjFPC}
{$H+}

interface

uses
  Classes,
  SysUtils;

type
  TModelModule = class(TDataModule)
  end;

var
  ModelModule: TModelModule;

implementation

{$R *.lfm}

end.

