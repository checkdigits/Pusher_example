program PusherPublicListener;

uses
  Vcl.Forms,
  UPusherPublicListener in 'UPusherPublicListener.pas' {FormPusherPublicListener};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormPusherPublicListener, FormPusherPublicListener);
  Application.Run;
end.
