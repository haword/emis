unit uhospital;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ActnList, DbCtrls, Buttons, DBGrids, ExtCtrls, Menus, uBaseDbForm, db,
  ZDataset, ZSequence, ZSqlUpdate, ZAbstractDataset, ZAbstractRODataset, LCLIntf,
  LCLType;

type

  { TfrmHospital }

  TfrmHospital = class(TbaseDbForm)
    actFind: TActionList;
    actFindLocationByCode: TAction;
    actFindLocationByName: TAction;
    actFindLocationHelpPdf: TAction;
    actFindLocationHelpDoc: TAction;
    btnLocationOk: TButton;
    btnLocationCancel: TButton;
    dbgLocation: TDBGrid;
    dsFindLocation: TDataSource;
    dbCode: TDBEdit;
    dbAddress: TDBEdit;
    dbFax: TDBEdit;
    dbgHospital: TDBGrid;
    dbPhone: TDBEdit;
    dbMail: TDBEdit;
    dbSite: TDBEdit;
    dbREgNumber: TDBEdit;
    dbTaxNumber: TDBEdit;
    dbLocation: TDBEdit;
    dbName: TDBEdit;
    dsHospital: TDataSource;
    edtGridSearch: TEdit;
    groupBoxEdit: TGroupBox;
    Label1: TLabel;
    Label10: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    btnFindLocation: TSpeedButton;
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
    MenuItem5: TMenuItem;
    panelFindLocation: TPanel;
    pupFindLocation: TPopupMenu;
    zqHospital: TZQuery;
    zqHospitalH_ADDRESS: TStringField;
    zqHospitalH_CODE: TStringField;
    zqHospitalH_FAX: TStringField;
    zqHospitalH_ID: TLongintField;
    zqHospitalH_LOCATION: TLongintField;
    zqHospitalH_MAIL: TStringField;
    zqHospitalH_NAME: TStringField;
    zqHospitalH_PHONE: TStringField;
    zqHospitalH_REG_NUMBER: TStringField;
    zqHospitalH_SITE: TStringField;
    zqHospitalH_TAX_NUMBER: TStringField;
    zqHospitalLOCATION_NAME: TStringField;
    zqHospitalZIP_CODE: TStringField;
    zroFindLocation: TZReadOnlyQuery;
    zroFindLocationL_CODE: TStringField;
    zroFindLocationL_ID: TLongintField;
    zroFindLocationL_NAME: TStringField;
    zseqHospital: TZSequence;
    zupdHospital: TZUpdateSQL;
    procedure actFindLocationByCodeExecute(Sender: TObject);
    procedure actFindLocationByNameExecute(Sender: TObject);
    procedure actFindLocationHelpDocExecute(Sender: TObject);
    procedure actFindLocationHelpPdfExecute(Sender: TObject);
    procedure btnFindLocationClick(Sender: TObject);
    procedure btnLocationCancelClick(Sender: TObject);
    procedure btnLocationOkClick(Sender: TObject);
    procedure dbgHospitalMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure dbgHospitalTitleClick(Column: TColumn);
    procedure dbgLocationKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgLocationMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure dbgLocationTitleClick(Column: TColumn);
    procedure dbLocationKeyPress(Sender: TObject; var Key: char);
    procedure edtGridSearchKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtGridSearchKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure zqHospitalAfterDelete(DataSet: TDataSet);
    procedure zqHospitalAfterOpen(DataSet: TDataSet);
    procedure zqHospitalAfterPost(DataSet: TDataSet);
    procedure zqHospitalAfterScroll(DataSet: TDataSet);
  private
    { private declarations }
    locationArg : String;
    procedure saveBeforeClose;
    procedure findLocation(textArg : String);
    procedure useThisLocation;
  public
    { public declarations }
    HELP_PATH : String;
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
  frmHospital: TfrmHospital;
const
  EMPTY_SET : String = 'Prazan skup podataka.';
  {fields of tbl hospital(FH -> fields hospital) and view(hospital_v)}
  FH_ID : String = 'H_ID';
  FH_CODE : String = 'H_CODE';
  FH_NAME : String = 'H_NAME';
  FH_LOCATION : String = 'H_LOCATION';
  FH_ADDRESS : String = 'H_ADDRESS';
  FH_TAX_NUMBER : String = 'H_TAX_NUMBER';
  FH_REG_NUMBER : String = 'H_REG_NUMBER';
  FH_PHONE : String = 'H_PHONE';
  FH_FAX : String = 'H_FAX';
  FH_MAIL : String = 'H_MAIL';
  FH_SITE : String = 'H_SITE';
  //VIEW  HOSPITAL_V
  FH_ZIP_CODE : String = 'ZIP_CODE';
  FH_LOCATION_NAME : String = 'LOCATION_NAME';
implementation
uses
  uDModule, uConfirm;
{$R *.lfm}

{ TfrmHospital }

procedure TfrmHospital.FormCreate(Sender: TObject);
begin
  {default arg - location(NAME)}
  locationArg:= FH_LOCATION_NAME;
end;

procedure TfrmHospital.zqHospitalAfterDelete(DataSet: TDataSet);
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

procedure TfrmHospital.zqHospitalAfterOpen(DataSet: TDataSet);
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

procedure TfrmHospital.zqHospitalAfterPost(DataSet: TDataSet);
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

procedure TfrmHospital.zqHospitalAfterScroll(DataSet: TDataSet);
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

procedure TfrmHospital.actFindLocationByCodeExecute(Sender: TObject);
begin
  locationArg:= FH_ZIP_CODE; //set search arg
  findLocation(dbLocation.Text); //set text arg
end;

procedure TfrmHospital.actFindLocationByNameExecute(Sender: TObject);
begin
  locationArg:= FH_LOCATION_NAME; //set search arg
  findLocation(dbLocation.Text); //set text arg
end;

procedure TfrmHospital.actFindLocationHelpDocExecute(Sender: TObject);
var
  full_path : String;
begin
  {help file path(pdf file)}
  full_path:= HELP_PATH + 'FindLocation.doc';
  {open doc}
  Screen.Cursor:= crHourGlass;
  try
    OpenDocument(full_path);
  finally
    Screen.Cursor:= crDefault;
  end;
end;

procedure TfrmHospital.actFindLocationHelpPdfExecute(Sender: TObject);
var
  full_path : String;
begin
  {help file path(pdf file)}
  full_path:= HELP_PATH + 'FindLocation.pdf';
  {open doc}
  Screen.Cursor:= crHourGlass;
  try
    OpenDocument(full_path);
  finally
    Screen.Cursor:= crDefault;
  end;
end;

procedure TfrmHospital.btnFindLocationClick(Sender: TObject);
begin
  {show popUpMnu}
  pupFindLocation.PopUp(Mouse.CursorPos.x, Mouse.CursorPos.y);
end;

procedure TfrmHospital.btnLocationCancelClick(Sender: TObject);
begin
  {hide panel and set focus}
  if(edtGridSearch.Visible) then
    edtGridSearch.Visible:= False;
  panelFindLocation.Visible:= False;
  //set ficus
  dbLocation.SetFocus;
  dbLocation.SelectAll;
  Application.ProcessMessages;
end;

procedure TfrmHospital.btnLocationOkClick(Sender: TObject);
begin
  {use current location}
  useThisLocation;
end;

procedure TfrmHospital.dbgHospitalMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  dbgHospital.Cursor:= crHandPoint;
end;

procedure TfrmHospital.dbgHospitalTitleClick(Column: TColumn);
var
  recCount, recNo : String;
  recMsg : String = '0 od 0'; {find again recNo}
begin
  {sort}
  doSortDbGrid(TZAbstractDataset(zqHospital), Column);
  {refresh after sort}
  dbgHospital.Refresh;
  { find recNo}
  recCount:= IntToStr(TZAbstractDataset(zqHospital).RecordCount);
  recNo:= IntToStr(TZAbstractDataset(zqHospital).RecNo);
  {create recMsg}
  recMsg:= recNo + ' od ' + recCount;
  edtRecNo.Text:= recMsg;
end;

procedure TfrmHospital.dbgLocationKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  {Ctrl+space to use this result}
  if (ssCtrl in Shift)and (Key = VK_SPACE) then
    btnLocationOk.Click;
  {Advanced search}
  if (ssCtrl in Shift)and (Key = VK_F) then
    begin
      edtGridSearch.Visible:= True;
      edtGridSearch.SetFocus;
      Application.ProcessMessages;
    end;
end;

procedure TfrmHospital.dbgLocationMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  dbgLocation.Cursor:= crHandPoint;
end;

procedure TfrmHospital.dbgLocationTitleClick(Column: TColumn);
begin
  doSortDbGrid(TZAbstractDataset(TZAbstractRODataset(zroFindLocation)), Column);
end;

procedure TfrmHospital.dbLocationKeyPress(Sender: TObject; var Key: char);
begin
  {on pres Return}
  if(Key = #13) then
    begin
      locationArg:= FH_LOCATION_NAME;
      findLocation(dbLocation.Text);
    end;
end;

procedure TfrmHospital.edtGridSearchKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  {Escape to exit}
  if (Key = VK_ESCAPE) then
    begin
      edtGridSearch.Visible:= False;
      dbgLocation.SetFocus;
      Application.ProcessMessages;
      Exit;
    end;
  {Ctrl+space to use this result}
  if (ssCtrl in Shift)and (Key = VK_SPACE) then
    btnLocationOk.Click;
end;

procedure TfrmHospital.edtGridSearchKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  {try to locate}
  if(not TZAbstractRODataset(zroFindLocation).Locate('L_NAME', edtGridSearch.Text, [loCaseInsensitive, loPartialKey])) then
    begin
      Beep;
      edtGridSearch.SelectAll;
    end;
end;

procedure TfrmHospital.FormClose(Sender: TObject; var CloseAction: TCloseAction
  );
begin
  saveBeforeClose;
  inherited;
end;

procedure TfrmHospital.saveBeforeClose;
var
  newDlg : TdlgConfirm;
  confirmMsg : String = 'Postoje izmene koje nisu sačuvane!';
  saveAll : Boolean = False;
begin
  {set confirm msg}
  confirmMsg:= confirmMsg + #13#10;
  confirmMsg:= confirmMsg + 'Želite da sačuvamo izmene?';
  if(TZAbstractDataset(zqHospital).State in [dsEdit, dsInsert]) then
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
    doSaveRec(TZAbstractDataset(zqHospital)); {in this case just one dataSet}
end;

procedure TfrmHospital.findLocation(textArg: String);
var
  argCode, argName : String;
begin
  {find argument}
  if(locationArg = FH_LOCATION_NAME) then
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

procedure TfrmHospital.useThisLocation;
begin
  TZAbstractDataset(zqHospital).FieldByName(FH_LOCATION).AsInteger:= zroFindLocation.Fields[0].AsInteger;
  TZAbstractDataset(zqHospital).FieldByName(FH_LOCATION_NAME).AsString:= zroFindLocation.Fields[2].AsString;
  //hide panel
  if(edtGridSearch.Visible) then
    edtGridSearch.Visible:= False;
  panelFindLocation.Visible:= False;
  //set focus
  dbAddress.SetFocus;
  Application.ProcessMessages;
end;

procedure TfrmHospital.onActFirst;
begin
  {jump to first rec}
  doFirstRec(TZAbstractDataset(zqHospital));
end;

procedure TfrmHospital.onActPrior;
begin
  {jump to prior rec}
  doPriorRec(TZAbstractDataset(zqHospital));
end;

procedure TfrmHospital.onActNext;
begin
  {jump to next rec}
  doNextRec(TZAbstractDataset(zqHospital));
end;

procedure TfrmHospital.onActLast;
begin
  {jump to last rec}
  doLastRec(TZAbstractDataset(zqHospital));
end;

procedure TfrmHospital.onActInsert;
begin
  {set focus and insert new rec}
  dbCode.SetFocus;
  doInsertRec(TZAbstractDataset(zqHospital));
end;

procedure TfrmHospital.onActDelete;
begin
  {delete rec}
  doDeleteRec(TZAbstractDataset(zqHospital));
end;

procedure TfrmHospital.onActEdit;
begin
  {set focus and edit rec}
  dbCode.SetFocus;
  doEditRec(TZAbstractDataset(zqHospital));
end;

procedure TfrmHospital.onActSave;
begin
  {save rec}
  doSaveRec(TZAbstractDataset(zqHospital));
end;

procedure TfrmHospital.onActCancel;
begin
  {hide panel}
  if(edtGridSearch.Visible) then
    edtGridSearch.Visible:= False;
  if(panelFindLocation.Visible) then
    panelFindLocation.Visible:= False;
  {cancel rec}
  doCancelRec(TZAbstractDataset(zqHospital));
end;

procedure TfrmHospital.openDataSet;
begin
  TZAbstractDataset(zqHospital).DisableControls;
  TZAbstractDataset(zqHospital).Close;
  try
    TZAbstractDataset(zqHospital).Open;
    TZAbstractDataset(zqHospital).EnableControls;
  except
    on e : Exception do
    begin
      dModule.zdbh.Rollback;
      TZAbstractDataset(zqHospital).EnableControls;
      ShowMessage(e.Message);
    end;
  end;
end;

end.

