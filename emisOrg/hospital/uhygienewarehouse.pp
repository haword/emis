unit uHygieneWarehouse;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ActnList, Menus, DbCtrls, Buttons, DBGrids, ExtCtrls, uBaseDbForm, db,
  ZDataset, ZSequence, ZSqlUpdate, ZAbstractDataset, ZAbstractRODataset;

type

  { TfrmHygieneWarehouse }

  TfrmHygieneWarehouse = class(TbaseDbForm)
    actFind: TActionList;
    actFindLocationByCode: TAction;
    actFindLocationByName: TAction;
    actFindLocationHelp: TAction;
    btnFindLocation: TSpeedButton;
    btnLocationCancel: TButton;
    btnLocationOk: TButton;
    dbAddress: TDBEdit;
    dbCode: TDBEdit;
    dbFax: TDBEdit;
    dbgLocation: TDBGrid;
    dbgWarehouse: TDBGrid;
    dblDepartment: TDBLookupComboBox;
    dbLocation: TDBEdit;
    dbMail: TDBEdit;
    dbName: TDBEdit;
    dbPhone: TDBEdit;
    dsDepartment: TDataSource;
    dsFindLocation: TDataSource;
    dsWarehouse: TDataSource;
    groupBoxEdit: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    panelFindLocation: TPanel;
    pupFindLocation: TPopupMenu;
    zqWarehouse: TZQuery;
    zqWarehouseDEPARTMENT_CODE: TStringField;
    zqWarehouseDEPARTMENT_NAME: TStringField;
    zqWarehouseHW_ADDRESS: TStringField;
    zqWarehouseHW_CODE: TStringField;
    zqWarehouseHW_DEPARTMENT: TLongintField;
    zqWarehouseHW_FAX: TStringField;
    zqWarehouseHW_ID: TLongintField;
    zqWarehouseHW_LOCATION: TLongintField;
    zqWarehouseHW_MAIL: TStringField;
    zqWarehouseHW_NAME: TStringField;
    zqWarehouseHW_PHONE: TStringField;
    zqWarehouseLOCATION_NAME: TStringField;
    zqWarehouseZIP_CODE: TStringField;
    zroDepartment: TZReadOnlyQuery;
    zroDepartmentD_ID: TLongintField;
    zroDepartmentD_NAME: TStringField;
    zroFindLocation: TZReadOnlyQuery;
    zroFindLocationL_CODE: TStringField;
    zroFindLocationL_ID: TLongintField;
    zroFindLocationL_NAME: TStringField;
    zseqWarehouse: TZSequence;
    zupdWarehouse: TZUpdateSQL;
    procedure actFindLocationByCodeExecute(Sender: TObject);
    procedure actFindLocationByNameExecute(Sender: TObject);
    procedure btnFindLocationClick(Sender: TObject);
    procedure btnLocationCancelClick(Sender: TObject);
    procedure btnLocationOkClick(Sender: TObject);
    procedure dbgLocationKeyPress(Sender: TObject; var Key: char);
    procedure dbgLocationMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure dbgLocationTitleClick(Column: TColumn);
    procedure dbgWarehouseMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure dbgWarehouseTitleClick(Column: TColumn);
    procedure dbLocationKeyPress(Sender: TObject; var Key: char);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure zqWarehouseAfterDelete(DataSet: TDataSet);
    procedure zqWarehouseAfterOpen(DataSet: TDataSet);
    procedure zqWarehouseAfterPost(DataSet: TDataSet);
    procedure zqWarehouseAfterScroll(DataSet: TDataSet);
  private
    { private declarations }
    locationArg : String;
    procedure saveBeforeClose;
    procedure findLocation(textArg : String);
    procedure useThisLocation;
  public
    { public declarations }
    procedure onActFirst; override;
    procedure onActPrior; override;
    procedure onActNext; override;
    procedure onActLast; override;
    procedure onActInsert; override;
    procedure onActDelete; override;
    procedure onActEdit; override;
    procedure onActSave; override;
    procedure onActCancel; override;
    // open data-set
    procedure openDataSet;
  end;

var
  frmHygieneWarehouse: TfrmHygieneWarehouse;
const
  EMPTY_SET : String = 'Prazan skup podataka.';
  {fields of tbl HygieneWarehouse(FW -> fields Warehouse) and view(hygiene_warehouse_v)}
  FW_ID : String = 'HW_ID';
  FW_CODE : String = 'HW_CODE';
  FW_NAME : String = 'HW_NAME';
  FW_LOCATION : String = 'HW_LOCATION';
  FW_ADDRESS : String = 'HW_ADDRESS';
  FW_PHONE : String = 'HW_PHONE';
  FW_FAX : String = 'HW_FAX';
  FW_MAIL : String = 'HW_MAIL';
  //VIEW  HYGIENE_WAREHOUSE_V
  FW_ZIP_CODE : String = 'ZIP_CODE';
  FW_LOCATION_NAME :String = 'LOCATION_NAME';
  FW_DEPARTMENT_CODE : String = 'DEPARTMENT_CODE';
  FW_DEPARTMENT_NAME : String = 'DEPARTMENT_NAME';
implementation
uses
  uDModule, uConfirm;
{$R *.lfm}

{ TfrmHygieneWarehouse }

procedure TfrmHygieneWarehouse.FormCreate(Sender: TObject);
begin
  {default arg - location(NAME)}
  locationArg:= FW_LOCATION_NAME;
end;

procedure TfrmHygieneWarehouse.dbgWarehouseMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  dbgWarehouse.Cursor:= crHandPoint;
end;

procedure TfrmHygieneWarehouse.actFindLocationByCodeExecute(Sender: TObject);
begin
  locationArg:= FW_ZIP_CODE; //set search arg
  findLocation(dbLocation.Text); //set text arg
end;

procedure TfrmHygieneWarehouse.actFindLocationByNameExecute(Sender: TObject);
begin
  locationArg:= FW_LOCATION_NAME; //set search arg
  findLocation(dbLocation.Text); //set text arg
end;

procedure TfrmHygieneWarehouse.btnFindLocationClick(Sender: TObject);
begin
  {show popUpMnu}
  pupFindLocation.PopUp(Mouse.CursorPos.x, Mouse.CursorPos.y);
end;

procedure TfrmHygieneWarehouse.btnLocationCancelClick(Sender: TObject);
begin
  {hide panel and set focus}
  panelFindLocation.Visible:= False;
  //set focus
  dbLocation.SetFocus;
  dbLocation.SelectAll;
  Application.ProcessMessages;
end;

procedure TfrmHygieneWarehouse.btnLocationOkClick(Sender: TObject);
begin
  {use current location}
  useThisLocation;
end;

procedure TfrmHygieneWarehouse.dbgLocationKeyPress(Sender: TObject;
  var Key: char);
begin
  {space}
  if(Key = #32) then
    btnLocationOk.Click;
end;

procedure TfrmHygieneWarehouse.dbgLocationMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  dbgLocation.Cursor:= crHandPoint;
end;

procedure TfrmHygieneWarehouse.dbgLocationTitleClick(Column: TColumn);
begin
  doSortDbGrid(TZAbstractDataset(TZAbstractRODataset(zroFindLocation)), Column);
end;

procedure TfrmHygieneWarehouse.dbgWarehouseTitleClick(Column: TColumn);
var
  recCount, recNo : String;
  recMsg : String = '0 od 0'; {find again recNo}
begin
  {sort}
  doSortDbGrid(TZAbstractDataset(zqWarehouse), Column);
  {refresh after sort}
  dbgWarehouse.Refresh;
  { find recNo}
  recCount:= IntToStr(TZAbstractDataset(zqWarehouse).RecordCount);
  recNo:= IntToStr(TZAbstractDataset(zqWarehouse).RecNo);
  {create recMsg}
  recMsg:= recNo + ' od ' + recCount;
  edtRecNo.Text:= recMsg;
end;

procedure TfrmHygieneWarehouse.dbLocationKeyPress(Sender: TObject; var Key: char
  );
begin
  {on pres Return}
  if(Key = #13) then
    begin
      locationArg:= FW_LOCATION_NAME;
      findLocation(dbLocation.Text);
    end;
end;

procedure TfrmHygieneWarehouse.FormClose(Sender: TObject;
  var CloseAction: TCloseAction);
begin
  saveBeforeClose;
  inherited;
end;

procedure TfrmHygieneWarehouse.zqWarehouseAfterDelete(DataSet: TDataSet);
var
  recCount, recNo : String;
  recMsg : String = '0 od 0';
begin
  {upply updates}
  TZAbstractDataset(DataSet).ApplyUpdates;
  {show recNo and countRec}
  if(TZAbstractDataset(DataSet).IsEmpty) then
    begin
      edtRecNo.Text:= recMsg;
      Exit;
    end;
  {find vars}
  recCount:= IntToStr(TZAbstractDataset(DataSet).RecordCount);
  recNo:= IntToStr(TZAbstractDataset(DataSet).RecNo);
  {create recMsg}
  recMsg:= recNo + ' od ' + recCount;
  edtRecNo.Text:= recMsg;
end;

procedure TfrmHygieneWarehouse.zqWarehouseAfterOpen(DataSet: TDataSet);
var
  recCount, recNo : String;
  recMsg : String = '0 od 0';
begin
  {set btns cheking recCount}
  doAfterOpenDataSet(TZAbstractDataset(DataSet));
  {show recNo and countRec}
  if(TZAbstractDataset(DataSet).IsEmpty) then
    begin
      edtRecNo.Text:= recMsg;
      Exit;
    end;
  {find vars}
  recCount:= IntToStr(TZAbstractDataset(DataSet).RecordCount);
  recNo:= IntToStr(TZAbstractDataset(DataSet).RecNo);
  {create recMsg}
  recMsg:= recNo + ' od ' + recCount;
  edtRecNo.Text:= recMsg;
end;

procedure TfrmHygieneWarehouse.zqWarehouseAfterPost(DataSet: TDataSet);
var
  {calc records(recNo and countRec)}
  recCount, recNo : String;
  recMsg : String = '0 od 0';
begin
  {upply updates}
  TZAbstractDataset(DataSet).ApplyUpdates;
  {rtefresh current row}
  TZAbstractDataset(DataSet).DisableControls;
  TZAbstractDataset(DataSet).Refresh;
  TZAbstractDataset(DataSet).EnableControls;
  {show recNo and countRec}
  if(TZAbstractDataset(DataSet).IsEmpty) then {*** never ***}
    begin
      edtRecNo.Text:= recMsg;
      Exit;
    end;
  {find vars}
  recCount:= IntToStr(TZAbstractDataset(DataSet).RecordCount);
  recNo:= IntToStr(TZAbstractDataset(DataSet).RecNo);
  {create recMsg}
  recMsg:= recNo + ' od ' + recCount;
  edtRecNo.Text:= recMsg;
end;

procedure TfrmHygieneWarehouse.zqWarehouseAfterScroll(DataSet: TDataSet);
var
  recCount, recNo : String;
  recMsg : String = '0 od 0';
begin
  {set btns cheking recCount}
  if(TZAbstractDataset(DataSet).State in [dsEdit, dsInsert]) then
    Exit;
  {show recNo and countRec}
  if(TZAbstractDataset(DataSet).IsEmpty) then
    begin
      edtRecNo.Text:= recMsg;
      Exit;
    end;
  {find vars}
  recCount:= IntToStr(TZAbstractDataset(DataSet).RecordCount);
  recNo:= IntToStr(TZAbstractDataset(DataSet).RecNo);
  {create recMsg}
  recMsg:= recNo + ' od ' + recCount;
  edtRecNo.Text:= recMsg;
end;

procedure TfrmHygieneWarehouse.saveBeforeClose;
var
  newDlg : TdlgConfirm;
  confirmMsg : String = 'Postoje izmene koje nisu sačuvane!';
  saveAll : Boolean = False;
begin
  {set confirm msg}
  confirmMsg:= confirmMsg + #13#10;
  confirmMsg:= confirmMsg + 'Želite da sačuvamo izmene?';
  if(TZAbstractDataset(zqWarehouse).State in [dsEdit, dsInsert]) then
    begin
      {ask user to confirm}
      newDlg:= TdlgConfirm.Create(nil);
      newDlg.memoMsg.Lines.Text:= confirmMsg;
      if(newDlg.ShowModal = mrOK) then
        saveAll:= True;
      {free dialog}
      newDlg.Free;
    end;
  {check all}
  if saveAll then
    doSaveRec(TZAbstractDataset(zqWarehouse)); {in this case just one dataSet}
end;

procedure TfrmHygieneWarehouse.findLocation(textArg: String);
var
  argCode, argName : String;
begin
  {find argument}
  if(locationArg = FW_LOCATION_NAME) then
    begin
      argCode:= '%';
      argName:= '%' + textArg + '%';
    end
  else
    begin
      argCode:= '%' + textArg + '%';
      argName:= '%';
    end;
  {set params}
  zroFindLocation.DisableControls;
  zroFindLocation.Params[0].AsString:= argCode;
  zroFindLocation.Params[1].AsString:= argName;
  try
    zroFindLocation.Open;
    zroFindLocation.EnableControls;
  except
    on e : Exception do
    begin
      ShowMessage(e.Message);
      zroFindLocation.EnableControls;
      //focus(back)
      dbLocation.SetFocus;
      dbLocation.SelectAll;
      Exit;
    end;
  end;
  {again if dataSet is empty}
  if(zroFindLocation.IsEmpty) then
    begin
      ShowMessage(EMPTY_SET);
      //set focus
      dbLocation.SetFocus;
      dbLocation.SelectAll;
      Exit;
    end;
  {else show panel(results)}
  panelFindLocation.Visible:= True;
  dbgLocation.SetFocus;
  Application.ProcessMessages;
end;

procedure TfrmHygieneWarehouse.useThisLocation;
begin
  TZAbstractDataset(zqWarehouse).FieldByName(FW_LOCATION).AsInteger:= zroFindLocation.Fields[0].AsInteger;
  TZAbstractDataset(zqWarehouse).FieldByName(FW_LOCATION_NAME).AsString:= zroFindLocation.Fields[2].AsString;
  //hide panel
  panelFindLocation.Visible:= False;
  //set focus
  dbAddress.SetFocus;
  Application.ProcessMessages;
end;

procedure TfrmHygieneWarehouse.onActFirst;
begin
  {jump to first rec}
  doFirstRec(TZAbstractDataset(zqWarehouse));
end;

procedure TfrmHygieneWarehouse.onActPrior;
begin
  {jump to prior rec}
  doPriorRec(TZAbstractDataset(zqWarehouse));
end;

procedure TfrmHygieneWarehouse.onActNext;
begin
  {jump to next rec}
  doNextRec(TZAbstractDataset(zqWarehouse));
end;

procedure TfrmHygieneWarehouse.onActLast;
begin
  {jump to last rec}
  doLastRec(TZAbstractDataset(zqWarehouse));
end;

procedure TfrmHygieneWarehouse.onActInsert;
begin
  {set focus and insert new rec}
  dbCode.SetFocus;
  doInsertRec(TZAbstractDataset(zqWarehouse));
end;

procedure TfrmHygieneWarehouse.onActDelete;
begin
  {delete rec}
  doDeleteRec(TZAbstractDataset(zqWarehouse));
end;

procedure TfrmHygieneWarehouse.onActEdit;
begin
  {set focus and edit rec}
  dbCode.SetFocus;
  doEditRec(TZAbstractDataset(zqWarehouse));
end;

procedure TfrmHygieneWarehouse.onActSave;
begin
  {save rec}
  doSaveRec(TZAbstractDataset(zqWarehouse));
end;

procedure TfrmHygieneWarehouse.onActCancel;
begin
  {cancel rec}
  doCancelRec(TZAbstractDataset(zqWarehouse));
end;

procedure TfrmHygieneWarehouse.openDataSet;
begin
  {department(read only)}
  TZAbstractDataset(TZAbstractRODataset(zroDepartment)).DisableControls;
  TZAbstractDataset(TZAbstractRODataset(zroDepartment)).Close;
  {department}
  TZAbstractDataset(zqWarehouse).DisableControls;
  TZAbstractDataset(zqWarehouse).Close;
  try
    TZAbstractDataset(TZAbstractRODataset(zroDepartment)).Open;
    TZAbstractDataset(TZAbstractRODataset(zroDepartment)).EnableControls;
    TZAbstractDataset(zqWarehouse).Open;
    TZAbstractDataset(zqWarehouse).EnableControls;
  except
    on e : Exception do
    begin
      dModule.zdbh.Rollback;
      TZAbstractDataset(TZAbstractRODataset(zroDepartment)).EnableControls;
      TZAbstractDataset(zqWarehouse).EnableControls;
      ShowMessage(e.Message);
    end;
  end;
end;

end.
