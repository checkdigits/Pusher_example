object FormPusherChatManager: TFormPusherChatManager
  Left = 0
  Top = 0
  Caption = 'GroupChat'
  ClientHeight = 462
  ClientWidth = 863
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
  object Label6: TLabel
    Left = 240
    Top = 448
    Width = 31
    Height = 13
    Caption = 'Label6'
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 212
    Height = 416
    Align = alLeft
    TabOrder = 0
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
    object Label5: TLabel
      Left = 8
      Top = 90
      Width = 18
      Height = 13
      Caption = 'Key'
    end
    object Label2: TLabel
      Left = 8
      Top = 118
      Width = 31
      Height = 13
      Caption = 'Secret'
    end
    object Label3: TLabel
      Left = 8
      Top = 149
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
    object edtHost: TEdit
      Left = 74
      Top = 6
      Width = 121
      Height = 21
      TabOrder = 0
      Text = 'ws-eu.pusher.com'
    end
    object edtKey: TEdit
      Left = 74
      Top = 88
      Width = 121
      Height = 21
      TabOrder = 1
      Text = '69f12f55c75bc82c8235'
    end
    object edtSecret: TEdit
      Left = 74
      Top = 116
      Width = 121
      Height = 21
      TabOrder = 2
      Text = '858fa90bd3e8574abee7'
    end
    object edtUsername: TEdit
      Left = 74
      Top = 146
      Width = 121
      Height = 21
      TabOrder = 3
      Text = 'John Doe'
    end
    object btnConnectDisconnect: TButton
      Left = 74
      Top = 173
      Width = 75
      Height = 25
      Caption = 'Connect'
      TabOrder = 4
      OnClick = btnConnectDisconnectClick
    end
    object spPort: TSpinEdit
      Left = 74
      Top = 33
      Width = 121
      Height = 22
      MaxValue = 0
      MinValue = 0
      TabOrder = 5
      Value = 443
    end
    object edtApiId: TEdit
      Left = 74
      Top = 61
      Width = 121
      Height = 21
      TabOrder = 6
      Text = '1267503'
    end
  end
  object StatusBar: TStatusBar
    Left = 0
    Top = 416
    Width = 863
    Height = 46
    Panels = <
      item
        Text = 'Not Connected'
        Width = 10
      end>
  end
  object Panel1: TPanel
    Left = 212
    Top = 0
    Width = 364
    Height = 416
    Align = alClient
    Enabled = False
    TabOrder = 2
    ExplicitWidth = 407
    object GroupBox1: TGroupBox
      Left = 1
      Top = 1
      Width = 362
      Height = 115
      Align = alClient
      Caption = 'Channels'
      TabOrder = 0
      ExplicitLeft = -11
      ExplicitTop = -5
      ExplicitWidth = 405
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
        OnClick = btnSubscribeClick
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
          'Public'
          'Private'
          'Presence')
      end
    end
    object GroupBox2: TGroupBox
      Left = 1
      Top = 116
      Width = 362
      Height = 299
      Align = alBottom
      Caption = 'Publish'
      TabOrder = 1
      ExplicitWidth = 344
      object Label9: TLabel
        Left = 19
        Top = 31
        Width = 69
        Height = 24
        Caption = 'Channel Name'
      end
      object Label10: TLabel
        Left = 19
        Top = 65
        Width = 58
        Height = 13
        Caption = 'Event Name'
      end
      object Label11: TLabel
        Left = 18
        Top = 97
        Width = 54
        Height = 13
        Caption = 'Event Data'
      end
      object cmbChannels: TComboBox
        Left = 94
        Top = 32
        Width = 131
        Height = 21
        TabOrder = 0
      end
      object btnPublish: TButton
        Left = 104
        Top = 232
        Width = 121
        Height = 25
        Caption = 'Publish'
        TabOrder = 1
        OnClick = btnPublishClick
      end
      object edtEventName: TEdit
        Left = 94
        Top = 61
        Width = 131
        Height = 21
        TabOrder = 2
      end
      object btnGetChannels: TButton
        Left = 247
        Top = 28
        Width = 82
        Height = 25
        Caption = 'Get Channels'
        TabOrder = 3
        OnClick = btnGetChannelsClick
      end
    end
  end
  object MemoLog: TMemo
    Left = 576
    Top = 0
    Width = 287
    Height = 416
    Align = alRight
    Lines.Strings = (
      '')
    TabOrder = 3
  end
  object memData: TMemo
    Left = 229
    Top = 232
    Width = 209
    Height = 97
    Lines.Strings = (
      '{}')
    TabOrder = 4
  end
  object sgcPusher: TsgcWSAPI_Pusher
    OnConnect = sgcPusherConnect
    OnDisconnect = sgcPusherDisconnect
    OnMessage = sgcPusherMessage
    OnPusherError = sgcPusherPusherError
    OnPusherEvent = sgcPusherPusherEvent
    OnPusherSubscribe = sgcPusherPusherSubscribe
    Pusher.Name = 'DelphiPusherDemo'
    Pusher.TLS = False
    Pusher.Version = '4.5'
    Left = 48
    Top = 216
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
    Top = 216
  end
end
