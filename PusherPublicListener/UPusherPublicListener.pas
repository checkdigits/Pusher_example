unit UPusherPublicListener;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Samples.Spin, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.ComCtrls, sgcWebSocket_Classes, sgcWebSocket_Classes_Indy,
  sgcWebSocket_Client, sgcWebSocket, sgcBase_Classes, sgcSocket_Classes,
  sgcTCP_Classes, sgcWebSocket_API_Pusher, sgcWebSocket_APIs;

type
  TFormPusherPublicListener = class(TForm)
    Panel2: TPanel;
    Label1: TLabel;
    Label4: TLabel;
    Label3: TLabel;
    APiID: TLabel;
    edtHost: TEdit;
    edtUsername: TEdit;
    btnConnectDisconnect: TButton;
    spPort: TSpinEdit;
    edtApiId: TEdit;
    MemoLog: TMemo;
    sgcPusher: TsgcWSAPI_Pusher;
    WSClient: TsgcWebSocketClient;
    StatusBar: TStatusBar;
    edtKey: TEdit;
    Label2: TLabel;
    GroupBox1: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    btnSubscribe: TButton;
    edtChannelName: TEdit;
    cmbChannelType: TComboBox;
    procedure sgcPusherConnect(Connection: TsgcWSConnection);
    procedure FormCreate(Sender: TObject);
    procedure btnConnectDisconnectClick(Sender: TObject);
    procedure sgcPusherDisconnect(Connection: TsgcWSConnection; Code: Integer);
    procedure sgcPusherError(Connection: TsgcWSConnection; const Error: string);
    procedure sgcPusherMessage(Connection: TsgcWSConnection;
      const Text: string);
    procedure sgcPusherPusherError(Sender: TObject; Code: Integer; Msg: string);
    procedure sgcPusherPusherEvent(Sender: TObject; Event, Channel,
      Data: string);
    procedure sgcPusherPusherSubscribe(Sender: TObject; Channel, Data: string);
    procedure sgcPusherException(Connection: TsgcWSConnection; E: Exception);
  private
    { Déclarations privées }
    FConnected : boolean;
    procedure DoConnectionChange(isConnected: boolean);
  public
    { Déclarations publiques }
  end;

var
  FormPusherPublicListener: TFormPusherPublicListener;

implementation

{$R *.dfm}

procedure TFormPusherPublicListener.btnConnectDisconnectClick(Sender: TObject);
begin
  WSClient.Active := not FConnected;
end;

procedure TFormPusherPublicListener.FormCreate(Sender: TObject);
begin
  FConnected := False;
  sgcPusher.Pusher.Cluster := 'eu';
  sgcPusher.Pusher.AppId := edtApiId.Text;
  sgcPusher.Pusher.Key := edtKey.Text;
  sgcPusher.Pusher.Secret := '';
  sgcPusher.Pusher.TLS := True;

  WSClient.Host := edtHost.Text;
  WSClient.Port := spPort.Value;

  sgcPusher.Client := WSClient;
  DoConnectionChange(False);
end;

procedure TFormPusherPublicListener.sgcPusherConnect(Connection: TsgcWSConnection);
begin
  DoConnectionChange(True);
end;

procedure TFormPusherPublicListener.sgcPusherDisconnect(Connection: TsgcWSConnection;
  Code: Integer);
begin
   DoConnectionChange(False);
end;

procedure TFormPusherPublicListener.sgcPusherError(Connection: TsgcWSConnection;
  const Error: string);
begin
  MemoLog.Lines.add('Error :'+Error);
end;

procedure TFormPusherPublicListener.sgcPusherException(Connection: TsgcWSConnection; E: Exception);
begin
  MemoLog.Lines.add('PusherException :'+E.Message);
end;

procedure TFormPusherPublicListener.sgcPusherMessage(Connection: TsgcWSConnection;
  const Text: string);
begin
  MemoLog.Lines.add('Message :'+Text);
end;

procedure TFormPusherPublicListener.sgcPusherPusherError(Sender: TObject; Code: Integer;
  Msg: string);
begin
  MemoLog.Lines.add('PusherError :'+Msg+' Error Code :'+Code.ToString);
end;

procedure TFormPusherPublicListener.sgcPusherPusherEvent(Sender: TObject; Event, Channel,
  Data: string);
begin
  MemoLog.Lines.add('Event :'+Event+' in Channel :'+Channel+' with data :'+data);
end;

procedure TFormPusherPublicListener.sgcPusherPusherSubscribe(Sender: TObject; Channel,
  Data: string);
begin
  MemoLog.Lines.add('Subscribe Channel :'+Channel+' with data :'+data);
end;

procedure TFormPusherPublicListener.DoConnectionChange(isConnected: boolean);
begin
  if isConnected then
  begin
    StatusBar.Panels[0].Text := 'Connected';
    btnConnectDisconnect.Caption := 'Disconnect';
  end
  else
  begin
    StatusBar.Panels[0].Text := 'Not Connected';
    btnConnectDisconnect.Caption := 'Connect';
  end;
  FConnected := isConnected;
end;

end.
