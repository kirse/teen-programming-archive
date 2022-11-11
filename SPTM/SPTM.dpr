program SPTM;

uses
  Forms,
  Main in 'Main.pas' {UnitMain};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Student Password Teller Machine';
  Application.CreateForm(TUnitMain, UnitMain);
  Application.Run;
end.
