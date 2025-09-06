program ProjetoCalculaMedia;

uses
  Vcl.Forms,
  TelaPrincipal in '..\..\Documents\Embarcadero\Studio\Projects\Prova Calculadora Media\TelaPrincipal.pas' {TForm3},
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Windows10');
  Application.CreateForm(TTForm3, TForm3);
  Application.Run;
end.
