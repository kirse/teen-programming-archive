program Tenlet;

uses
  Forms,
  UnitMain in 'UnitMain.pas' {Main},
  mythread in 'mythread.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Tenlet v1.3';
  Application.CreateForm(TMain, Main);
  Application.Run;
end.
