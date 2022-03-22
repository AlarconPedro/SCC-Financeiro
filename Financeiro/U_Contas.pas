unit U_Contas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinsDefaultPainters,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator,
  dxDateRanges, Data.DB, cxDBData, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  IBX.IBCustomDataSet, IBX.IBQuery, Vcl.Buttons, Vcl.ExtCtrls;

type
  TFrm_Contas = class(TForm)
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    Panel1: TPanel;
    SpeedButton1: TSpeedButton;
    DataSource1: TDataSource;
    cxGrid1DBTableView1LOGIN: TcxGridDBColumn;
    cxGrid1DBTableView1SENHA: TcxGridDBColumn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_Contas: TFrm_Contas;

implementation

uses U_DM;

begin

{$R *.dfm}

end.
