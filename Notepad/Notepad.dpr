program Notepad;



uses
  Forms,
  UnitMain in 'UnitMain.pas' {Main},
  UnitAbout in 'UnitAbout.pas' {AboutForm},
  UnitStartApp in 'UnitStartApp.pas' {RunAppForm};

{$R *.res}

begin
  Application.Initialize;
  Application.HelpFile := 'C:\WINNT\Help\notepad.chm';
  Application.Title := 'Notepad';
  Application.CreateForm(TMain, Main);
  Application.CreateForm(TAboutForm, AboutForm);
  Application.CreateForm(TRunAppForm, RunAppForm);
  Application.Run;
end.
