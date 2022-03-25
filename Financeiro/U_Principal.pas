unit U_Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.ExtCtrls, ShellApi, Vcl.StdCtrls,
  Vcl.Buttons, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  dxRibbonSkins, dxSkinsCore, dxSkinsDefaultPainters, dxRibbonCustomizationForm,
  cxClasses, dxRibbon, dxBar, Vcl.ComCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids,
  dxStatusBar, dxRibbonStatusBar;

type
  TdxMyBarControl = class (TdxBarControl);

  TFrm_Principal = class(TForm)
    navBarRibbon: TdxBarManager;
    NavBarCadastro: TdxRibbonTab;
    NavBar: TdxRibbon;
    itensRibbon: TdxRibbonPopupMenu;
    NavBarEditar: TdxRibbonTab;
    NavBarLogin: TdxRibbonTab;
    NavBarContas: TdxRibbonTab;
    navCpagar: TdxBar;
    navFluxoCaixa: TdxBar;
    btnCPagar: TdxBarLargeButton;
    btnContasReceber: TdxBarLargeButton;
    navNovaCategoria: TdxBar;
    navEditar: TdxBar;
    navUsuário: TdxBar;
    btnNovaCategoria: TdxBarLargeButton;
    btnAlterarConta: TdxBarLargeButton;
    btnSairConta: TdxBarLargeButton;
    btnContaFixa: TdxBarLargeButton;
    btnFluxoCaixa: TdxBarLargeButton;
    navContas: TdxBar;
    btnListarContas: TdxBarLargeButton;
    btnCalendario: TdxBarLargeButton;
    btnContasFixas: TdxBarLargeButton;
    dxBarLargeButton1: TdxBarLargeButton;
    dxBarLargeButton2: TdxBarLargeButton;
    dxBarLargeButton3: TdxBarLargeButton;
    dxBarLargeButton4: TdxBarLargeButton;
    dxRibbonStatusBar1: TdxRibbonStatusBar;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnAlterarContaClick(Sender: TObject);
    procedure btnSairContaClick(Sender: TObject);
    procedure dxBarLargeButton3Click(Sender: TObject);
    procedure btnCPagarClick(Sender: TObject);
    procedure btnContasReceberClick(Sender: TObject);
    procedure btnNovaCategoriaClick(Sender: TObject);
    procedure btnContaFixaClick(Sender: TObject);
    procedure dxBarLargeButton4Click(Sender: TObject);
    procedure dxBarLargeButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);

  private
    procedure DoMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure SetarCursor;
    { Private declarations }
  public
  end;

var
  Frm_Principal: TFrm_Principal;

implementation

{$R *.dfm}

uses U_Login, U_CadastroUsuario, U_CadastroContas, U_CadastroCategorias, U_CadastroContasFixas;

procedure TFrm_Principal.btnAlterarContaClick(Sender: TObject);
  begin
    ShellExecute(Handle, 'open', PWideChar(Application.ExeName), nil, nil, SW_SHOWNORMAL) ;
    Application.Terminate;
  end;

procedure TFrm_Principal.btnContaFixaClick(Sender: TObject);
begin
 Application.CreateForm(TFrm_ContasFixas, Frm_ContasFixas);
 Frm_ContasFixas.ShowModal;
end;

procedure TFrm_Principal.btnContasReceberClick(Sender: TObject);
begin
 Application.CreateForm(TFrm_CadastroContas, Frm_CadastroContas);
 Frm_CadastroContas.ShowModal;
end;

procedure TFrm_Principal.btnCPagarClick(Sender: TObject);
begin
 Application.CreateForm(TFrm_CadastroContas, Frm_CadastroContas);
 Frm_CadastroContas.ShowModal;
end;

procedure TFrm_Principal.btnNovaCategoriaClick(Sender: TObject);
begin
 Application.CreateForm(TFrm_CadastroCategoria, Frm_CadastroCategoria);
 Frm_CadastroCategoria.ShowModal;
end;

procedure TFrm_Principal.btnSairContaClick(Sender: TObject);
begin
  Close;
end;

procedure TFrm_Principal.dxBarLargeButton1Click(Sender: TObject);
begin
 Application.CreateForm(TFrm_CadastroCategoria, Frm_CadastroCategoria);
 Frm_CadastroCategoria.ShowModal;
end;

procedure TFrm_Principal.dxBarLargeButton3Click(Sender: TObject);
begin
 Application.CreateForm(TFrm_CadastroUsuarios, Frm_CadastroUsuarios);
 Frm_CadastroUsuarios.ShowModal;
end;

procedure TFrm_Principal.dxBarLargeButton4Click(Sender: TObject);
begin
 Application.CreateForm(TFrm_ContasFixas, Frm_ContasFixas);
 Frm_ContasFixas.ShowModal;
end;

procedure TFrm_Principal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Application.Terminate;
end;

procedure TFrm_Principal.FormShow(Sender: TObject);
begin
 Self.WindowState := wsMaximized;
end;

procedure TFrm_Principal.SetarCursor;
var
  iCont: Integer;
begin
  for iCont := 0 to Self.ComponentCount - 1 do
  begin
    if Self.Components[iCont] is TdxBar then
      TdxMyBarControl(TdxBar(Self.Components[iCont]).Control).OnMouseMove := DoMouseMove;
  end;
end;

procedure TFrm_Principal.DoMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
  if TdxMyBarControl(Sender).ItemAtPos(Point(X, Y)) <> nil then
  begin
    if TdxMyBarControl(Sender).ItemAtPos(Point(X, Y)).Enabled then
    begin
      if (TdxMyBarControl(Sender).ItemAtPos(Point(X, Y)) is TdxBarLargeButtonControl) or (TdxMyBarControl(Sender).ItemAtPos(Point(X, Y)) is TdxBarItemControl) then
        SetCursor(Screen.Cursors[crHandPoint]);
    end;
  end;
end;

end.
