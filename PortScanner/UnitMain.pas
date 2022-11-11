unit UnitMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Psock, ComCtrls, OleCtrls, MSWinsockLib_TLB,
  ScktComp, Sockets;

type
  TMain = class(TForm)
    GroupBox1: TGroupBox;
    txtHost: TEdit;
    GroupBox2: TGroupBox;
    txtFrom: TEdit;
    Label1: TLabel;
    txtTo: TEdit;
    GroupBox3: TGroupBox;
    txtInterval: TEdit;
    beginScan: TButton;
    endScan: TButton;
    resetList: TButton;
    progress: TProgressBar;
    Panel1: TPanel;
    lstPorts: TListBox;
    status: TStatusBar;
    tmrScan: TTimer;
    tcpScan1: TTcpClient;
    tcpScan2: TTcpClient;
    tcpScan3: TTcpClient;
    procedure beginScanClick(Sender: TObject);
    procedure tmrScanTimer(Sender: TObject);
    procedure tcpScan1Connect(Sender: TObject);
    procedure tcpScan2Connect(Sender: TObject);
    procedure tcpScan3Connect(Sender: TObject);
    procedure tcpScan1Error(Sender: TObject; SocketError: Integer);
    procedure tcpScan2Error(Sender: TObject; SocketError: Integer);
    procedure tcpScan3Error(Sender: TObject; SocketError: Integer);
    procedure resetListClick(Sender: TObject);
  private
  public
  end;

var
  Main: TMain;
 // tcpPort1: Integer;     // the beginning, and also the port being
 // tcpPort2: Integer;     //  currently scanned
 // tcpPort3: Integer;
  curPort: Integer;

  maxPort: Integer;     // last port to scan
  procedure testNewPort();

implementation

{$R *.dfm}

procedure TMain.beginScanClick(Sender: TObject);
begin
        // set our remote host
        tcpScan1.RemoteHost := txtHost.Text;
        tcpScan2.RemoteHost := txtHost.Text;
        tcpScan3.RemoteHost := txtHost.Text;

        // set the beginning ports we will try to connect to
        tcpScan1.RemotePort := txtFrom.Text;

                // We must first convert the string (txtFrom.Text)
                //  to an integer, so we can add to it.  Then, we
                //  must convert back to a string, since the RemotePort
                //  property takes a string.
        tcpScan2.RemotePort := txtFrom.Text;
        tcpScan3.RemotePort := txtFrom.Text;

        // needed for proper display in our progressbar
        progress.Min := StrToInt(txtFrom.Text);
        progress.Max := StrToInt(txtTo.Text);

        // set the chosen interval
        tmrScan.Interval := StrToInt(txtInterval.Text);

        // set our variables
     {   tcpPort1 := StrToInt(txtFrom.Text);
        tcpPort2 := StrToInt(txtFrom.Text) + 1;
        tcpPort3 := StrToInt(txtFrom.Text) + 2;}
        curPort := StrToInt(txtFrom.Text);
        maxPort := StrToInt(txtTo.Text);
        
        // here we go!
        tmrScan.Enabled := True;
        progress.Visible := True;
end;

procedure TMain.tmrScanTimer(Sender: TObject);
begin
        // basically, this first "chunk" explains the 2 others
        if not(tcpScan1.Connected) then
                // if the socket isn't connected then...
          begin
            tcpScan1.RemotePort := IntToStr(curPort);
                // set our new port to try
            status.SimpleText := 'Attempting connection to port: ' + IntToStr(curPort);
                // update our status bar
            tcpScan1.Connect;
                // attempt a connection
            testNewPort;
                // add one - next port to try
          end;

        if not(tcpScan2.Connected) then
          begin
            tcpScan2.RemotePort := IntToStr(curPort + 1);
            status.SimpleText := 'Attempting connection to port: ' + IntToStr(curPort + 1);
            tcpScan2.Connect;
            testNewPort;
          end;

        if not(tcpScan3.Connected) then
          begin
            tcpScan3.RemotePort := IntToStr(curPort + 2);
            status.SimpleText := 'Attempting connection to port: ' + IntToStr(curPort + 2);
            tcpScan3.Connect;
            testNewPort;
          end;

        // are we done scanning yet (the port we are on is higher than
        //   the highest port to scan)
       { if (tcpPort1 > maxPort) or (tcpPort2 > maxPort) or (tcpPort3 > maxPort) then}
       if (curPort + 2 > maxPort) then
          begin
            tmrScan.Enabled := False;
              // disable our scan timer
            status.SimpleText := 'Scan Complete!';
              // update our program status
            progress.Position := 0;
              // reset our progress
            progress.Visible := false;
              // hide our progress bar
          end
        // else - we aren't done scanning yet
        else
          begin
                // update our progress based on highest port
                //  currently being scanned...
         {   if (tcpPort1 > tcpPort2) and (tcpPort1 > tcpPort3) then
              begin
                progress.Position := tcpPort1;
              end;

            if (tcpPort2 > tcpPort1) and (tcpPort2 > tcpPort3) then
              begin
                progress.Position := tcpPort2;
              end
            else
              begin
                progress.Position := tcpPort3;
              end;}
          end;

end;

// ----------------------------------------------------------------//
// BEGIN CONNECTION CODE
// THIS FIRST MODULE EXPLAINS THE OTHER 2....
procedure TMain.tcpScan1Connect(Sender: TObject);
begin
        // we got a connection - bingo!
        lstPorts.Items.Add('Connected to port: ' + tcpScan1.RemotePort);
        // disconnect, since we want this socket to try another connection
        tcpScan1.Disconnect;
end;

procedure TMain.tcpScan2Connect(Sender: TObject);
begin
        lstPorts.Items.Add('Connected to port: ' + tcpScan2.RemotePort);
        tcpScan2.Disconnect;
end;

procedure TMain.tcpScan3Connect(Sender: TObject);
begin
        lstPorts.Items.Add('Connected to port: ' + tcpScan3.RemotePort);
        tcpScan3.Disconnect;
end;
//  END CONNECTION CODE
// ----------------------------------------------------------//

// ---------------------------------------------------------//
// BEGIN ERROR CODE
// THIS MODULE EXPLAINS THE OTHER 5...
procedure TMain.tcpScan1Error(Sender: TObject; SocketError: Integer);
begin
        // we encountered an error of some sort, so just disconnect...
        tcpScan1.Disconnect;
end;

procedure TMain.tcpScan2Error(Sender: TObject; SocketError: Integer);
begin
        tcpScan2.Disconnect;
end;

procedure TMain.tcpScan3Error(Sender: TObject; SocketError: Integer);
begin
        tcpScan3.Disconnect;
end;
//  END ERROR CODE
// --------------------------------------------------------//

procedure TMain.resetListClick(Sender: TObject);
begin
        // user wants to reset list, so do so!
        lstPorts.Clear;
end;

procedure testNewPort();
begin
        curPort := curPort + 1;
end;

end.
