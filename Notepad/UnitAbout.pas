unit UnitAbout;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls;

type
  TAboutForm = class(TForm)
    NotepadIcon: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Panel1: TPanel;
    Label7: TLabel;
    Label8: TLabel;
    cmdOk: TButton;
    lblExtra: TLabel;
    procedure cmdOkClick(Sender: TObject);
    procedure NotepadIconDblClick(Sender: TObject);
    procedure lblExtraDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AboutForm: TAboutForm;

implementation

uses UnitMain;

{$R *.dfm}

procedure TAboutForm.cmdOkClick(Sender: TObject);
begin
        AboutForm.Close();
end;

procedure TAboutForm.NotepadIconDblClick(Sender: TObject);
begin
        lblExtra.Visible := True;
end;

procedure TAboutForm.lblExtraDblClick(Sender: TObject);
begin
        Main.ExtraMenu.Visible := True;
end;

end.
