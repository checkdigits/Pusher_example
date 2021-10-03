object FormPusherPublicListener: TFormPusherPublicListener
  Left = 0
  Top = 0
  Caption = 'FormPusherPublicListener'
  ClientHeight = 299
  ClientWidth = 761
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 212
    Height = 253
    Align = alLeft
    TabOrder = 0
    ExplicitTop = -117
    ExplicitHeight = 416
    object Label1: TLabel
      Left = 8
      Top = 9
      Width = 22
      Height = 13
      Caption = 'Host'
    end
    object Label4: TLabel
      Left = 8
      Top = 67
      Width = 26
      Height = 13
      Caption = 'ApiID'
    end
    object Label3: TLabel
      Left = 8
      Top = 118
      Width = 52
      Height = 13
      Caption = 'User Name'
    end
    object APiID: TLabel
      Left = 10
      Top = 36
      Width = 20
      Height = 13
      Caption = 'Port'
    end
    object Label2: TLabel
      Left = 8
      Top = 95
      Width = 18
      Height = 13
      Caption = 'Key'
    end
    object edtHost: TEdit
      Left = 74
      Top = 6
      Width = 121
      Height = 21
      TabOrder = 0
      Text = 'ws-eu.pusher.com'
    end
    object edtUsername: TEdit
      Left = 74
      Top = 115
      Width = 121
      Height = 21
      TabOrder = 1
      Text = 'Public User'
    end
    object btnConnectDisconnect: TButton
      Left = 74
      Top = 146
      Width = 75
      Height = 25
      Caption = 'Connect'
      TabOrder = 2
      OnClick = btnConnectDisconnectClick
    end
    object spPort: TSpinEdit
      Left = 74
      Top = 33
      Width = 121
      Height = 22
      MaxValue = 0
      MinValue = 0
      TabOrder = 3
      Value = 443
    end
    object edtApiId: TEdit
      Left = 74
      Top = 61
      Width = 121
      Height = 21
      TabOrder = 4
      Text = '1267503'
    end
    object edtKey: TEdit
      Left = 74
      Top = 88
      Width = 121
      Height = 21
      TabOrder = 5
      Text = '69f12f55c75bc82c8235'
    end
  end
  object MemoLog: TMemo
    Left = 456
    Top = 0
    Width = 305
    Height = 253
    Align = alRight
    Lines.Strings = (
      '')
    TabOrder = 1
  end
  object StatusBar: TStatusBar
    Left = 0
    Top = 253
    Width = 761
    Height = 46
    Panels = <
      item
        Text = 'Not Connected'
        Width = 10
      end>
    ExplicitLeft = -228
    ExplicitWidth = 863
  end
  object GroupBox1: TGroupBox
    Left = 212
    Top = 0
    Width = 244
    Height = 253
    Align = alClient
    Caption = 'Channels'
    TabOrder = 3
    ExplicitLeft = -11
    ExplicitTop = -5
    ExplicitWidth = 405
    ExplicitHeight = 115
    object Label7: TLabel
      Left = 16
      Top = 35
      Width = 66
      Height = 13
      Caption = 'Channel Type'
    end
    object Label8: TLabel
      Left = 16
      Top = 63
      Width = 69
      Height = 13
      Caption = 'Channel Name'
    end
    object btnSubscribe: TButton
      Left = 120
      Top = 87
      Width = 75
      Height = 25
      Caption = 'Subscribe'
      TabOrder = 0
    end
    object edtChannelName: TEdit
      Left = 94
      Top = 59
      Width = 105
      Height = 21
      TabOrder = 1
    end
    object cmbChannelType: TComboBox
      Left = 94
      Top = 32
      Width = 106
      Height = 21
      Style = csDropDownList
      TabOrder = 2
      Items.Strings = (
        'Public')
    end
  end
  object sgcPusher: TsgcWSAPI_Pusher
    OnConnect = sgcPusherConnect
    OnDisconnect = sgcPusherDisconnect
    OnMessage = sgcPusherMessage
    OnError = sgcPusherError
    OnException = sgcPusherException
    OnPusherError = sgcPusherPusherError
    OnPusherEvent = sgcPusherPusherEvent
    OnPusherSubscribe = sgcPusherPusherSubscribe
    Pusher.Name = 'DelphiPusherDemo'
    Pusher.TLS = False
    Pusher.Version = '4.5'
    Left = 48
    Top = 192
  end
  object WSClient: TsgcWebSocketClient
    Port = 80
    ConnectTimeout = 0
    ReadTimeout = -1
    WriteTimeout = 0
    TLS = True
    Proxy.Enabled = False
    Proxy.Port = 8080
    Proxy.ProxyType = pxyHTTP
    HeartBeat.Enabled = False
    HeartBeat.Interval = 300
    HeartBeat.Timeout = 0
    IPVersion = Id_IPv4
    Authentication.Enabled = False
    Authentication.URL.Enabled = True
    Authentication.Session.Enabled = False
    Authentication.Basic.Enabled = False
    Authentication.Token.Enabled = False
    Authentication.Token.AuthName = 'Bearer'
    Extensions.DeflateFrame.Enabled = False
    Extensions.DeflateFrame.WindowBits = 15
    Extensions.PerMessage_Deflate.Enabled = False
    Extensions.PerMessage_Deflate.ClientMaxWindowBits = 15
    Extensions.PerMessage_Deflate.ClientNoContextTakeOver = False
    Extensions.PerMessage_Deflate.MemLevel = 9
    Extensions.PerMessage_Deflate.ServerMaxWindowBits = 15
    Extensions.PerMessage_Deflate.ServerNoContextTakeOver = False
    Options.CleanDisconnect = False
    Options.FragmentedMessages = frgOnlyBuffer
    Options.Parameters = '/'
    Options.RaiseDisconnectExceptions = True
    Options.ValidateUTF8 = False
    Specifications.Drafts.Hixie76 = False
    Specifications.RFC6455 = True
    NotifyEvents = neAsynchronous
    LogFile.Enabled = False
    LogFile.FileName = 'D:\temp\gws.log'
    QueueOptions.Binary.Level = qmNone
    QueueOptions.Ping.Level = qmNone
    QueueOptions.Text.Level = qmNone
    WatchDog.Attempts = 0
    WatchDog.Enabled = False
    WatchDog.Interval = 10
    Throttle.BitsPerSec = 0
    Throttle.Enabled = False
    LoadBalancer.Enabled = False
    LoadBalancer.Port = 0
    TLSOptions.VerifyCertificate = False
    TLSOptions.VerifyDepth = 0
    TLSOptions.Version = tlsUndefined
    TLSOptions.IOHandler = iohOpenSSL
    TLSOptions.OpenSSL_Options.APIVersion = oslAPI_1_0
    TLSOptions.OpenSSL_Options.LibPath = oslpNone
    TLSOptions.SChannel_Options.CertStoreName = scsnMY
    TLSOptions.SChannel_Options.CertStorePath = scspStoreCurrentUser
    Left = 104
    Top = 192
  end
end
