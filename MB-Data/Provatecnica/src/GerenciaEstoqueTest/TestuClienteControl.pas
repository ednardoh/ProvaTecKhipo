unit TestuClienteControl;
{

  Delphi DUnit Test Case
  ----------------------
  This unit contains a skeleton test case class generated by the Test Case Wizard.
  Modify the generated code to correctly setup and call the methods from the unit
  being tested.

}

interface

uses
  TestFramework, FireDAC.Comp.Client, uClienteControl, System.SysUtils,
  uClienteModel, uEnumerado, Vcl.Forms;

type
  // Test methods for class TClienteControl

  TestTClienteControl = class(TTestCase)
  strict private
    FClienteControl: TClienteControl;
    ATipo: TAcao;
    ReturnValue: Boolean;
  public
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure TestObter;
    procedure TestGetId;
    procedure TestIncluir;
    procedure TesteAlterar;
    procedure TesteExcluir;
    procedure TestSalvar;
    procedure TestObterNomeCLI;
  end;

implementation

procedure TestTClienteControl.SetUp;
begin
  FClienteControl := TClienteControl.Create;
end;

procedure TestTClienteControl.TearDown;
begin
  FClienteControl.Free;
  FClienteControl := nil;
end;

procedure TestTClienteControl.TestSalvar;
var
  ReturnValue: Boolean;
begin
  ReturnValue := FClienteControl.Salvar;
end;

procedure TestTClienteControl.TestObter;
var
  ReturnValue: TFDQuery;
  AValorparcial: string;
  AorderBy: Integer;
begin
  AValorparcial :='';
  AorderBy := 1;
  ReturnValue := FClienteControl.Obter(AorderBy, AValorparcial);
end;

procedure TestTClienteControl.TestObterNomeCLI;
var
  ReturnValue: TFDQuery;
  AValorpesquisa: string;
begin
  AValorpesquisa :='1';
  ReturnValue := FClienteControl.ObterNomeCLI(AValorpesquisa);
end;

procedure TestTClienteControl.TestGetId;
var
  ReturnValue: Integer;
begin
  ReturnValue := FClienteControl.GetId;
end;

procedure TestTClienteControl.TestIncluir;
begin
  ATipo := uEnumerado.tacIncluir;
  FClienteControl.ClienteModel.Acao     := ATipo;
  FClienteControl.ClienteModel.Codigo   := FClienteControl.ClienteModel.GetId;
  FClienteControl.ClienteModel.Nome     := 'NOME DE TESTE UNITARIO XUnit -' + IntToStr(FClienteControl.ClienteModel.Codigo);
  FClienteControl.ClienteModel.Endereco := 'ENDERE�O DE TESTE';
  FClienteControl.ClienteModel.Bairro   := 'BAIRRO TESTE';
  FClienteControl.ClienteModel.Cidade   := 'CIDADE TESTE';
  FClienteControl.ClienteModel.Numero   := '999';
  FClienteControl.ClienteModel.Cep      := '9.9999-99';
  FClienteControl.ClienteModel.UF       := 'CE';
  ReturnValue := FClienteControl.Salvar;
end;

procedure TestTClienteControl.TesteAlterar;
begin
  ATipo := uEnumerado.tacAlterar;
  FClienteControl.ClienteModel.Acao     := ATipo;
  FClienteControl.ClienteModel.Codigo   := FClienteControl.ClienteModel.GetId -1;
  FClienteControl.ClienteModel.Nome     := 'NOME DE TESTE ALTERANDO UNITARIO XUnit -' + IntToStr(FClienteControl.ClienteModel.Codigo);
  FClienteControl.ClienteModel.Endereco := 'ENDERE�O DE TESTE ALTERANDO';
  FClienteControl.ClienteModel.Bairro   := 'BAIRRO TESTE ALTERANDO';
  FClienteControl.ClienteModel.Cidade   := 'CIDADE TESTE ALTERANDO';
  FClienteControl.ClienteModel.Numero   := '999';
  FClienteControl.ClienteModel.Cep      := '9.9999-99';
  FClienteControl.ClienteModel.UF       := 'CE';
  ReturnValue := FClienteControl.Salvar;
end;

procedure TestTClienteControl.TesteExcluir;
begin
  ATipo := uEnumerado.tacExcluir;
  FClienteControl.ClienteModel.Acao     := ATipo;
  FClienteControl.ClienteModel.Codigo   := FClienteControl.ClienteModel.GetId -1;
  ReturnValue := FClienteControl.Salvar;
end;

initialization
  // Register any test cases with the test runner
  RegisterTest(TestTClienteControl.Suite);
end.
