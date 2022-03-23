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
