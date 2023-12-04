unit uSobreForm;

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
  uModeloForm,
  StdCtrls,
  ShellAPI;

type
  TSobreForm = class(TModeloForm)
    lbSiteValor: TLabel;
    lbSiteNome: TLabel;
    Label1: TLabel;
    lbGithubNome: TLabel;
    lbGithubValor: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    procedure lbSiteValorClick(Sender: TObject);
    procedure lbGithubValorClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SobreForm: TSobreForm;

implementation

{$R *.dfm}

procedure TSobreForm.lbSiteValorClick(Sender: TObject);
begin
  ShellExecute(0, nil, PChar('https://zrfisaac.github.io'), nil, nil, 1);
end;

procedure TSobreForm.lbGithubValorClick(Sender: TObject);
begin
  ShellExecute(0, nil, PChar('https://github.com/zrfisaac'), nil, nil, 1);
end;

procedure TSobreForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_ESCAPE) then
    Self.Close;
end;

end.
