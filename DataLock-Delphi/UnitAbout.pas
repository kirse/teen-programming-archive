unit UnitAbout;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, ComCtrls;

type
  TAboutForm = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    AboutBox: TRichEdit;
    Agree: TSpeedButton;
    Help: TSpeedButton;
    Label5: TLabel;
    AssocBox: TRichEdit;
    procedure AgreeClick(Sender: TObject);
    procedure HelpClick(Sender: TObject);
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

procedure TAboutForm.AgreeClick(Sender: TObject);
begin
        AboutForm.Hide;
end;

procedure TAboutForm.HelpClick(Sender: TObject);
begin
        if Help.Caption = 'Associating with .DLF Files' then
        begin
          AssocBox.Visible := True;
          Help.Caption := 'Help/About';
        end
        else
        begin
          AssocBox.Visible := False;
          Help.Caption := 'Associating with .DLF Files';
        end;
end;

end.
