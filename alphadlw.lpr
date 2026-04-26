program alphadlw;

{$mode delphi}
{$codepage utf8}

uses
{$IFDEF UNIX}
  cthreads,
{$ENDIF}
{$IFDEF HASAMIGA}
  athreads,
{$ENDIF}
  Interfaces, // this includes the LCL widgetset
  uCEFApplication,
  SysUtils,
  Forms, MainUnit
{ you can add units after this };

{$R *.res}

begin
  // CEF4を作成してUserAgentと各種作業フォルダを指定する
  GlobalCEFApp                  := TCefApplication.Create;
  GlobalCEFApp.UserAgent        := 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36';
  GlobalCEFApp.SetCurrentDir    := False;
  GlobalCEFApp.Cache            := ExtractFilePath(ParamStr(0)) + 'Cache';
  GlobalCEFApp.FrameworkDirPath := ExtractFilePath(ParamStr(0)) + 'cef4';
  GlobalCEFApp.ResourcesDirPath := ExtractFilePath(ParamStr(0)) + 'cef4';
  GlobalCEFApp.LocalesDirPath   := ExtractFilePath(ParamStr(0)) + 'cef4\locales';
  GlobalCEFApp.DoNotDeElevate   := True; // ExitCode(38): The browser process exited because it was re-launched without elevation.

  RequireDerivedFormResource    :=True;
	Application.Scaled            :=True;
{$PUSH}{$WARN 5044 OFF}
  Application.MainFormOnTaskbar :=True;
{$POP}
  if GlobalCEFApp.StartMainProcess then
  begin
    Application.Initialize;
	  Application.CreateForm(TadlForm, adlForm);
    Application.Run;
	end;
  // CEF4の後始末
  GlobalCEFApp.Free;
  GlobalCEFApp := nil;
end.

