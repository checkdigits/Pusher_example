program PusherChatManager;

uses
  Vcl.Forms,
  UPusherChatManager in 'UPusherChatManager.pas' {FormPusherChatManager};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormPusherChatManager, FormPusherChatManager);
  Application.Run;
end.
