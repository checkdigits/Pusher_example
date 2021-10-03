unit UPusherChatManager;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, sgcWebSocket_Classes,
  sgcWebSocket_Classes_Indy, sgcWebSocket_Client, sgcWebSocket, sgcBase_Classes,
  sgcSocket_Classes, sgcTCP_Classes, sgcWebSocket_API_Pusher, sgcWebSocket_APIs,
  Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.Samples.Spin;

type
  TFormPusherChatManager = class(TForm)
    Panel2: TPanel;
    sgcPusher: TsgcWSAPI_Pusher;
    WSClient: TsgcWebSocketClient;
    edtHost: TEdit;
    edtKey: TEdit;
    Label1: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    edtSecret: TEdit;
    Label2: TLabel;
    edtUsername: TEdit;
    Label3: TLabel;
    btnConnectDisconnect: TButton;
    StatusBar: TStatusBar;
    Label6: TLabel;
    spPort: TSpinEdit;
    edtApiId: TEdit;
    APiID: TLabel;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    btnSubscribe: TButton;
    edtChannelName: TEdit;
    btnGetChannels: TButton;
    MemoLog: TMemo;
    cmbChannelType: TComboBox;
    GroupBox2: TGroupBox;
    cmbChannels: TComboBox;
    memData: TMemo;
    btnPublish: TButton;
    edtEventName: TEdit;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure btnConnectDisconnectClick(Sender: TObject);
    procedure sgcPusherConnect(Connection: TsgcWSConnection);
    procedure sgcPusherDisconnect(Connection: TsgcWSConnection; Code: Integer);
    procedure sgcPusherPusherError(Sender: TObject; Code: Integer; Msg: string);
    procedure sgcPusherPusherEvent(Sender: TObject; Event, Channel,
      Data: string);
    procedure sgcPusherMessage(Connection: TsgcWSConnection;
      const Text: string);
    procedure btnSubscribeClick(Sender: TObject);
    procedure btnGetChannelsClick(Sender: TObject);
    procedure sgcPusherPusherSubscribe(Sender: TObject; Channel, Data: string);
    procedure btnPublishClick(Sender: TObject);
  private
    { Déclarations privées }
    FConnected : boolean;
    procedure GetChannelNameAndType(var aChannelName:string; var achannelType: TsgcWSpusherChannels);
    procedure DoConnectionChange(isConnected:boolean);
  public
    { Déclarations publiques }
  end;

var
  FormPusherChatManager: TFormPusherChatManager;

implementation

uses JSon;

{$R *.dfm}

procedure TFormPusherChatManager.btnConnectDisconnectClick(Sender: TObject);
begin
  WSClient.Active := not FConnected;
end;

procedure TFormPusherChatManager.btnPublishClick(Sender: TObject);
var aChannelName:string;
    achannelType: TsgcWSpusherChannels;
begin
  GetChannelNameAndType(aChannelName,achannelType);
  if (aChannelName<>'') and (edtEventName.Text<>'') then
  begin
    if achannelType = pscPublicChannel then
    begin
      sgcPusher.TriggerEvent(edtEventName.Text,aChannelName,memData.text);
    end
    else
      sgcPusher.Publish(edtEventName.Text,aChannelName,achannelType);
  end
  else
  begin
    ShowMessage('Please choose a valid channel name and a not empty event name.');
  end;
end;

procedure TFormPusherChatManager.btnSubscribeClick(Sender: TObject);
var achannelType: TsgcWSpusherChannels;
    data:string;
begin
  achannelType := pscPublicChannel;
  if Trim(edtChannelName.Text)='' then
  begin
    ShowMessage('please set a non empty event name');
    Exit;
  end;
  if cmbChannelType.ItemIndex<=2 then
     achannelType := TsgcWSpusherChannels(cmbChannelType.ItemIndex);

  if cmbChannelType.ItemIndex=2 then
   data := '{"user_id":"'+edtUsername.Text+'_'+FloatToStr(Now)+'","user_info":{"name":"'+edtUsername.Text+'"}}';
  sgcPusher.Subscribe(edtChannelName.Text,achannelType,data);
end;

procedure TFormPusherChatManager.btnGetChannelsClick(Sender: TObject);
var aJson:TJsonObject;
    aJsonChannels:TJsonObject;
    anEnumerator:TJsonObject.TEnumerator;
    aJsonPair:TJsonPair;
    channelstring:string;
begin
 channelstring := sgcPusher.GetChannels;
 cmbChannels.clear;
 cmbChannels.Items.Clear;
 aJson := TJSONObject.ParseJSONValue(channelstring) as TJSONObject;;
 aJsonChannels := aJson.GetValue('channels') as TJSONObject;
 anEnumerator := aJsonChannels.GetEnumerator;
 while anEnumerator.MoveNext do
 begin
   aJsonPair := anEnumerator.GetCurrent;
   cmbChannels.Items.Add(aJsonPair.JsonString.Value);
 end;
 cmbChannels.ItemIndex := 0;
end;

procedure TFormPusherChatManager.DoConnectionChange(isConnected: boolean);
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
  Panel1.Enabled := isConnected;
  btnSubscribe.Enabled := isConnected;
  btnPublish.Enabled := isConnected;
  btnGetChannels.Enabled := isConnected;
end;

procedure TFormPusherChatManager.FormCreate(Sender: TObject);
begin
  FConnected := False;
  sgcPusher.Pusher.Cluster := 'eu';
  sgcPusher.Pusher.AppId := edtApiId.Text;
  sgcPusher.Pusher.Key := edtKey.Text;
  sgcPusher.Pusher.Secret := edtSecret.Text;
  sgcPusher.Pusher.TLS := True;

  WSClient.Host := edtHost.Text;
  WSClient.Port := spPort.Value;

  sgcPusher.Client := WSClient;
  DoConnectionChange(False);
end;

procedure TFormPusherChatManager.GetChannelNameAndType(var aChannelName: string;
  var achannelType: TsgcWSpusherChannels);
var itemIndex:integer;
begin
  aChannelName := '';
  achannelType := pscPublicChannel;
  if cmbChannels.Items.Count>0 then
  begin
   aChannelName := cmbChannels.Text;
   //is it private
   itemIndex := AnsiPos('private-',aChannelName);
   if itemIndex>0 then
   begin
     aChannelName := copy(cmbChannels.Text,9,Length(aChannelName));
     achannelType := pscPrivateChannel;
   end
   else if AnsiPos('presence-',aChannelName)>0 then
   begin
     //is it presence
     aChannelName := copy(cmbChannels.Text,10,Length(aChannelName));
     achannelType := pscPresenceChannel;
   end;
  end;
end;

procedure TFormPusherChatManager.sgcPusherConnect(Connection: TsgcWSConnection);
begin
  DoConnectionChange(True);
end;

procedure TFormPusherChatManager.sgcPusherDisconnect(Connection: TsgcWSConnection;
  Code: Integer);
begin
  DoConnectionChange(False);
end;

procedure TFormPusherChatManager.sgcPusherMessage(Connection: TsgcWSConnection;
  const Text: string);
begin
  MemoLog.Lines.Add('Text :'+Text);
end;

procedure TFormPusherChatManager.sgcPusherPusherError(Sender: TObject; Code: Integer;
  Msg: string);
begin
  MemoLog.Lines.Add('Error :'+Msg+'  Code:'+IntToStr(Code));
end;

procedure TFormPusherChatManager.sgcPusherPusherEvent(Sender: TObject; Event, Channel,
  Data: string);
begin
  MemoLog.Lines.Add('Event :'+Event+' Channel:'+Channel+' Data:'+data);
end;

procedure TFormPusherChatManager.sgcPusherPusherSubscribe(Sender: TObject; Channel,
  Data: string);
begin
  MemoLog.Lines.Add('Subscribe Channel:'+Channel+' Data:'+data);
end;


end.
