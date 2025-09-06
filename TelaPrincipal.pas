unit TelaPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.WinXCtrls, Vcl.Themes,
  Vcl.ExtCtrls;

type
  TTForm3 = class(TForm)
    lbAluno: TLabel;
    edtAluno: TEdit;
    lbNota1: TLabel;
    edtNota1: TEdit;
    lbNota2: TLabel;
    edtNota2: TEdit;
    lbNota3: TLabel;
    edtNota3: TEdit;
    Switch1: TToggleSwitch;
    btnCalcular: TButton;
    lblResultado: TLabel;
    lblMedia: TLabel;
    lblSituacao: TLabel;
    btnNovo: TButton;
    lblAlunoName: TLabel;
  procedure btnCalcularClick(Sender: TObject);
    procedure Switch1Click(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure edtAlunoKeyPress(Sender: TObject; var Key: Char);
    procedure edtNota1KeyPress(Sender: TObject; var Key: Char);
    procedure edtNota2KeyPress(Sender: TObject; var Key: Char);
    procedure edtNota3KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TForm3: TTForm3;
  Situacao, Aluno: String;
  Nota1, Nota2, Nota3, Media: Double;
implementation

{$R *.dfm}




procedure TTForm3.btnCalcularClick(Sender: TObject);
begin
  if not TryStrToFloat(edtNota1.Text, Nota1) or (Nota1 < 0.00) or (Nota1 > 10.00) then
  begin
    ShowMessage('Por favor, insira um valor numérico válido entre 0 e 10 para a Primeira Nota do aluno ' + edtAluno.Text + '.' );
    edtNota1.SetFocus;
    Exit;
end;
if not TryStrToFloat(edtNota2.Text, Nota2) or (Nota2 < 0.00) or (Nota2 > 10.00) then
  begin
    ShowMessage('Por favor, insira um valor numérico válido entre 0 e 10 para a Segunda Nota do aluno ' + edtAluno.Text + '.');
    edtNota2.SetFocus;
    Exit;
  end;

if not TryStrToFloat(edtNota3.Text, Nota3) or (Nota3 < 0.00) or (Nota3 > 10.00) then
  begin
    ShowMessage('Por favor, insira um valor numérico válido entre 0 e 10 para a Terceira Nota do aluno ' + edtAluno.Text + '.');
    edtNota3.SetFocus;
    Exit;
  end;

  Media:= (Nota1 + Nota2 + Nota3) /3;

  if media >=7.0 then
  begin
    Situacao:= 'Aprovado!!';
    lblSituacao.Font.Color:= clGreen;
    end

    else if
    (Media>= 5.0) and (Media < 7.0) then
    begin
      Situacao:= 'Recuperação!';
      lblSituacao.Font.Color:= clWebDarkOrange;
    end
    else
    begin
      Situacao:= 'Reprovado.';
      lblSituacao.Font.Color := clRed;
    end;

    lblMedia.Visible:= True;
    lblSituacao.Visible:= True;
     lblAlunoName.Visible:= True;
  lblResultado.Visible:= True;

     lblMedia.Caption := 'Média: ' + FormatFloat('0.00', Media);
     lblSituacao.Caption := 'Situação: ' + Situacao;
     lblAlunoName.Caption:=  'Aluno: '+edtAluno.Text;
end;





procedure TTForm3.btnNovoClick(Sender: TObject);
begin
  edtAluno.Clear();
  edtNota1.Clear();
  edtNota2.Clear();
  edtNota3.Clear();

  lblMedia.Visible:= False;
  lblSituacao.Visible:= False;
  lblAlunoName.Visible:= False;
  lblResultado.Visible:= False;

  edtAluno.SetFocus;
end;

procedure TTForm3.edtAlunoKeyPress(Sender: TObject; var Key: Char);
begin
    if Key = #13 then
    SelectNext(Sender as TWinControl, True, True);
end;

procedure TTForm3.edtNota1KeyPress(Sender: TObject; var Key: Char);
begin
    if Key = #13 then
    SelectNext(Sender as TWinControl, True, True);
end;

procedure TTForm3.edtNota2KeyPress(Sender: TObject; var Key: Char);
begin
    if Key = #13 then
    SelectNext(Sender as TWinControl, True, True);
end;

procedure TTForm3.edtNota3KeyPress(Sender: TObject; var Key: Char);
begin
if Key = #13 then
    SelectNext(Sender as TWinControl, True, True);
end;

procedure TTForm3.Switch1Click(Sender: TObject);
begin
  if Switch1.IsOn then

     TStyleManager.SetStyle('Windows10 Dark')
  else
     TStyleManager.SetStyle('Windows10');

end;
end.
