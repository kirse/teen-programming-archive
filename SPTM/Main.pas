unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TUnitMain = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    FirstName: TEdit;
    LastName: TEdit;
    Label4: TLabel;
    idNum: TEdit;
    Label5: TLabel;
    password: TEdit;
    Label6: TLabel;
    Figure: TSpeedButton;
    procedure Label6Click(Sender: TObject);
    procedure FigureClick(Sender: TObject);
    procedure idNumKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  UnitMain: TUnitMain;

implementation

{$R *.dfm}

procedure TUnitMain.Label6Click(Sender: TObject);
begin
        messagebox(0, 'A KirseNET Prodeducation', 'a.H.p.', mb_ok)
end;

function mid(const sData: string; nStart: integer; nLength: integer): string; overload;
begin
  Result := copy(sData, nStart, nLength);
end;

procedure TUnitMain.FigureClick(Sender: TObject);
begin
  password.text := mid(firstname.Text, 1, 1) + mid(lastname.text, 1, 2) +
                mid(idnum.Text, 1, 2) + mid(idnum.Text, 5, 2);
end;

procedure TUnitMain.idNumKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
        if length(idnum.Text) > 5 Then
        begin
                messagebox(0, 'An ID Number cannot be longer than 6 digits.', 'ID Length', mb_ok);
                idnum.Text := '';
        end;
end;

end.
