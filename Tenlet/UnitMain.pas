unit UnitMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Psock, mythread;

type
  TMain = class(TForm)
    Data: TMemo;
    SendData: TEdit;
    Label1: TLabel;
    Host: TEdit;
    Label2: TLabel;
    Port: TEdit;
    Socket: TPowersock;
    chkReturn: TCheckBox;
    procedure SocketConnect(Sender: TObject);
    procedure SocketConnectionFailed(Sender: TObject);
    procedure SocketDisconnect(Sender: TObject);
    procedure SocketStatus(Sender: TComponent; Status: String);
    procedure FormCreate(Sender: TObject);
    procedure SendDataKeyPress(Sender: TObject; var Key: Char);
    procedure SendDataChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Main: TMain;

implementation

uses UnitData;

var
  DataReader: TMyThread;

{$R *.dfm}


procedure TMain.SocketConnect(Sender: TObject);
begin
        data.Lines.Add('// Connected: ' + host.Text);
end;

procedure TMain.SocketConnectionFailed(Sender: TObject);
begin
        data.Lines.Add('// Connection Failed: ' + host.Text);
end;

procedure TMain.SocketDisconnect(Sender: TObject);
begin
        data.Lines.Add('// Disconnected: ' + host.Text);
end;

procedure TMain.SocketStatus(Sender: TComponent; Status: String);
begin
        data.Lines.Add('// ' + Status);
end;

procedure TMain.FormCreate(Sender: TObject);
begin
        Data.Text := '// Tenlet v1.3'
end;

procedure TMain.SendDataKeyPress(Sender: TObject; var Key: Char);
begin
        if Key = Char(13) then
        begin
                if chkreturn.Checked = true then
                  socket.Writeln(senddata.Text)
                else
                  socket.Write(senddata.text);
        senddata.Text := '';
        Key := Char(0);
        end;
end;

procedure TMain.SendDataChange(Sender: TObject);
begin
     if (sendData.Text = 'connect') then
     begin
        socket.Host := host.Text;
        socket.Port := StrToInt(port.Text);

        data.Lines.Add('// Attempting Connection: ' + host.Text);

        socket.Connect();
        DataReader := TMyThread.Create(False);
        sendData.Text := '';
     end;

     if (sendData.Text = 'disconnect') then
     begin
       Socket.Disconnect();
       DataReader.Terminate();
       sendData.Text := '';
     end;
end;

end.
