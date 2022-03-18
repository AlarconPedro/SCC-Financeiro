unit U_Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.ExtCtrls, JvExExtCtrls,
  JvExtComponent, JvPanel, JvOfficeColorPanel, ShellApi, Vcl.StdCtrls,
  Vcl.Buttons, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  dxRibbonSkins, dxSkinsCore, dxSkinsDefaultPainters, dxRibbonCustomizationForm,
  cxClasses, dxRibbon, dxBar;

type
  TFrm_Principal = class(TForm)
    navBarRibbon: TdxBarManager;
    navBarNovo: TdxRibbonTab;
    NavBar: TdxRibbon;
    itensRibbon: TdxRibbonPopupMenu;
    navBarAbrir: TdxRibbonTab;
    NavBarTab3: TdxRibbonTab;
    NavBarTab4: TdxRibbonTab;
    NavBarTab5: TdxRibbonTab;
    CPagarNav: TdxBar;
    AbrirNavBar: TdxBar;
    navBarRibbonBar3: TdxBar;
    navBarRibbonBar4: TdxBar;
    btnCPagar: TdxBarLargeButton;
    dxBarLargeButton4: TdxBarLargeButton;
    btnCalendario: TdxBarLargeButton;
    btnContas: TdxBarLargeButton;
    navBarRibbonBar1: TdxBar;
    navBarRibbonBar2: TdxBar;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Sair1Click(Sender: TObject);
    procedure btnAlterarContaClick(Sender: TObject);

  private
    { Private declarations }
  public
  end;

var
  Frm_Principal: TFrm_Principal;

implementation

{$R *.dfm}

uses U_Login;

procedure TFrm_Principal.btnAlterarContaClick(Sender: TObject);
  begin
    ShellExecute(Handle, 'open', PWideChar(Application.ExeName), nil, nil, SW_SHOWNORMAL) ;
    Application.Terminate;
  end;

procedure TFrm_Principal.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    Application.Terminate;
  end;

procedure TFrm_Principal.Sair1Click(Sender: TObject);
  begin
        Close;
  end;

end.
