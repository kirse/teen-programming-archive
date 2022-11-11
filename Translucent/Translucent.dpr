program Translucent;

uses
  Forms,
  UnitMain in 'UnitMain.pas' {Main};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Translucent Forms';
  Application.CreateForm(TMain, Main);
  Application.Run;
end.
