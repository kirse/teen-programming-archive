program prjDataLock_v1;

uses
  Forms,
  UnitMain in 'UnitMain.pas' {Main},
  UnitWait in 'UnitWait.pas' {WaitForm},
  UnitAbout in 'UnitAbout.pas' {AboutForm};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Data Lock 2.0';
  Application.CreateForm(TMain, Main);
  Application.CreateForm(TWaitForm, WaitForm);
  Application.CreateForm(TAboutForm, AboutForm);
  Application.Run;
end.
