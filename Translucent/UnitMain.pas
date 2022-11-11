{
  ------------------  Translucent Forms Example -----------------------
  Written In: Delphi 6.0
  Programmer: Eric Kirse
  Email:      kirsenet@hotmail.com

  Other Info: I wrote this 'cause I couldn't find an example in Delphi
              that enables one to create translucent forms.  I wrote it
              based off of an example in Visual Basic I saw.

  Thanks to:  Mason Graham.  Due to my stupidity, i made them functions
              instead of procedures (i know functions return values etc.)
              but it 12:30 am.  Anyhow, I fixed all bugs as a result of
              changing them to functions.

              Please vote if you like it NOW.  Thanks.
 -----------------------------------------------------------------------
}

unit UnitMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Gauges;

type
  TMain = class(TForm)
    Amount: TEdit;
    Label1: TLabel;
    SetTrans: TButton;
    MakeOpaque: TButton;
    FadeIN: TButton;
    FadeOUT: TButton;
    Label2: TLabel;
    TimerFadeIN: TTimer;
    TimerFadeOut: TTimer;
    Label3: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure SetTransClick(Sender: TObject);
    procedure MakeOpaqueClick(Sender: TObject);
    procedure TimerFadeINTimer(Sender: TObject);
    procedure FadeINClick(Sender: TObject);
    procedure FadeOUTClick(Sender: TObject);
    procedure TimerFadeOutTimer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
  
const
// constants needed for translucent forms
  GWL_EXSTYLE = (-20);
  LWA_ALPHA = 2;
  WS_EX_LAYERED = 524288;

var
  Main: TMain;
  x: integer;           // used for fading effects

implementation

{$R *.dfm}

//------ TRANSLUCENT FORM FUNCTION ------//
procedure trans(hwnd: hwnd; amount: integer);
var
  msg: Integer;
begin
  msg := 0;
  if amount > 0 then
        msg := GetWindowLong(hwnd, GWL_EXSTYLE);
        msg := msg or WS_EX_LAYERED;
        SetWindowLong (hwnd, GWL_EXSTYLE , msg);
        SetLayeredWindowAttributes (hwnd, 0, amount, LWA_ALPHA);
end;

//------ OPAQUE FORM FUNCTION ------//
procedure opaque(hwnd: hwnd);
var
  msg: Integer;
begin
  msg := GetWindowLong(hWnd, GWL_EXSTYLE);
  msg := msg And Not WS_EX_LAYERED;
  SetWindowLong (hWnd, GWL_EXSTYLE, msg);
  SetLayeredWindowAttributes (hwnd, 0, 0, LWA_ALPHA);
end;

procedure TMain.FormCreate(Sender: TObject);
begin
        trans(Main.Handle, strtoint(Amount.Text));
        // make form translucent on startup
end;

procedure TMain.SetTransClick(Sender: TObject);
begin
        trans(Main.Handle, strtoint(amount.Text));
        // make form a set translucent value
end;

procedure TMain.MakeOpaqueClick(Sender: TObject);
begin
        opaque(Main.Handle)
        // make form opaque (not translucent)
end;

procedure TMain.TimerFadeINTimer(Sender: TObject);
begin
  if x < 255 then
        trans(main.Handle, x)
        // as long as we arent over 255
        //   keep fading
  else
        timerfadein.Enabled := false;
  x := x + 1;   // add 1 to keep track of fade progress
end;

procedure TMain.FadeINClick(Sender: TObject);
begin
  timerfadein.Enabled := true;
  timerfadeout.Enabled := false;
  x := 0;  // fading in
end;

procedure TMain.FadeOUTClick(Sender: TObject);
begin
  messagebox(0, 'When the form completely fades out, simply press the Left Arrow and then Enter to make it fade back in.', 'Fade Out', mb_ok);
  timerfadeout.Enabled := true;
  timerfadein.Enabled := false;
  x := 255;  // fading out
end;

procedure TMain.TimerFadeOutTimer(Sender: TObject);
begin
  if x >= 0 then
        trans(main.Handle, x)
        // as long as we arent under 0
        //   keep fading
  else
        timerfadeout.Enabled := false;
  x := x - 1;  // subtract 1 to keep track of fade progress
end;
end.
