program alphadlw;

{$IFDEF FPC}
  {$MODE Delphi}
{$ENDIF}

{$TYPEINFO OFF}

uses
{$IFnDEF FPC}
  Vcl.Forms,
{$ELSE}
  Forms, Interfaces,
{$ENDIF}
  AlphaUnit in 'AlphaUnit.pas' {Mahodl};

{$R *.res}

begin
{$IFDEF FPC}
  Application.Scaled:=True;
{$ENDIF}
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TAlphadl, Alphadl);
  Application.Run;
end.

