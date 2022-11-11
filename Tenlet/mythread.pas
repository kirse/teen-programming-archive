// Multi-Tasking Unit
// --------------------------------------
// DataReader := TMyThread.Create(false);

unit mythread;

interface

uses
  Classes, SysUtils;

type
  TMyThread = class(TThread)
    constructor Create(CreateSuspended: Boolean);
  private
    { Private declarations }
  protected
    procedure Execute; override;
  end;

implementation

uses
  UnitMain;

{ TMyThread }

constructor TMyThread.Create(CreateSuspended: Boolean);
begin
  inherited Create(CreateSuspended);
  Priority := tpLower;
end;

procedure TMyThread.Execute;
begin
  while not Terminated do
    if main.socket.DataAvailable then
      main.data.lines.add(main.socket.ReadLn());
end;

end.
