program DelphiPortScanner;

uses
  Forms,
  UnitMain in 'UnitMain.pas' {Main};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TMain, Main);
  Application.Run;
end.
