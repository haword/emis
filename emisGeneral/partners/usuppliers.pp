unit uSuppliers;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, ZDataset, ZSequence, ZSqlUpdate, Forms, Controls,
  Graphics, Dialogs, StdCtrls, ActnList, Menus, ExtCtrls, Buttons, DbCtrls,
  DBGrids, uBaseDbForm, db;

type

  { TfrmSuppliers }

  TfrmSuppliers = class(TbaseDbForm)
    actFind: TActionList;
    actFindLocationByCode: TAction;
    actFindLocationByName: TAction;
    actFindLocationHelp: TAction;
    btnCharFilter: TSpeedButton;
    btnFindLocation: TSpeedButton;
    btnLocationCancel: TButton;
    btnLocationOk: TButton;
    btnShowAll: TSpeedButton;
    cmbCharFilter: TComboBox;
    cmbFieldArg: TComboBox;
    dbCode: TDBEdit;
    dbAddress: TDBEdit;
    dbgLocation: TDBGrid;
    dbgSuppliers: TDBGrid;
    dbMobile: TDBEdit;
    dbMail: TDBEdit;
    dbFax: TDBEdit;
    dbPhone: TDBEdit;
    dbLocation: TDBEdit;
    dbName: TDBEdit;
    dbReg: TDBEdit;
    dsFindLocation: TDataSource;
    dsSuppliers: TDataSource;
    edtLocate: TEdit;
    groupBoxEdit: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    panelFindLocation: TPanel;
    panelParams: TPanel;
    pupFindLocation: TPopupMenu;
    zqSuppliers: TZQuery;
    zqSuppliersL_CODE: TStringField;
    zqSuppliersL_NAME: TStringField;
    zqSuppliersS_ADDRESS: TStringField;
    zqSuppliersS_CODE: TStringField;
    zqSuppliersS_FAX: TStringField;
    zqSuppliersS_ID: TLongintField;
    zqSuppliersS_LOCATION: TLongintField;
    zqSuppliersS_MAIL: TStringField;
    zqSuppliersS_MOBILE: TStringField;
    zqSuppliersS_NAME: TStringField;
    zqSuppliersS_PHONE: TStringField;
    zqSuppliersS_REG: TStringField;
    zroFindLocation: TZReadOnlyQuery;
    zroFindLocationL_CODE: TStringField;
    zroFindLocationL_ID: TLongintField;
    zroFindLocationL_NAME: TStringField;
    zseqSuppliers: TZSequence;
    zupdSuppliers: TZUpdateSQL;
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  frmSuppliers: TfrmSuppliers;

implementation

{$R *.lfm}

end.
