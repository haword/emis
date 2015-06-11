unit uDocWarehouseOut;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ActnList, DbCtrls, DBGrids, uBaseDbForm, db, ZDataset, ZSequence,
  ZAbstractRODataset,  ZAbstractDataset;

type

  { TfrmDocWarehouseOut }

  TfrmDocWarehouseOut = class(TbaseDbForm)
    dbCode: TDBEdit;
    dbgDocWOut: TDBGrid;
    dbName: TDBEdit;
    dsDocWOut: TDataSource;
    groupBoxEdit: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    zseqDocWOut: TZSequence;
    ztDocWOut: TZTable;
    ztDocWOutDWO_CODE: TStringField;
    ztDocWOutDWO_ID: TLongintField;
    ztDocWOutDWO_NAME: TStringField;
    procedure dbgDocWOutMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure dbgDocWOutTitleClick(Column: TColumn);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure ztDocWOutAfterDelete(DataSet: TDataSet);
    procedure ztDocWOutAfterOpen(DataSet: TDataSet);
    procedure ztDocWOutAfterPost(DataSet: TDataSet);
    procedure ztDocWOutAfterScroll(DataSet: TDataSet);
  private
    { private declarations }
    procedure saveBeforeClose;
    procedure sortDbGrid(var dataSet : TZAbstractDataset; Column : TColumn);
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
    {open dataSet}
    procedure openDataSet;
  end;

var
  frmDocWarehouseOut: TfrmDocWarehouseOut;
const
  {fields of tbl location}
  FIELD_ID : String = 'DWO_ID';
  FIELD_CODE : String = 'DWO_CODE';
  FIELD_NAME : String = 'DWO_NAME';
implementation
uses
  uDModule, uConfirm;

{$R *.lfm}

{ TfrmDocWarehouseOut }

procedure TfrmDocWarehouseOut.dbgDocWOutMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  {set cursor again}
  dbgDocWOut.Cursor:= crHandPoint;
end;

procedure TfrmDocWarehouseOut.dbgDocWOutTitleClick(Column: TColumn);
var
  recCount, recNo : String;
  recMsg : String = '0 od 0'; {find again recNo}
begin
  {sort}
  sortDbGrid(TZAbstractDataset(ztDocWOut), Column);
  {refresh after sort}
  dbgDocWOut.Refresh;
  { find recNo}
  recCount:= IntToStr(TZAbstractDataset(ztDocWOut).RecordCount);
  recNo:= IntToStr(TZAbstractDataset(ztDocWOut).RecNo);
  {create recMsg}
  recMsg:= recNo + ' od ' + recCount;
  edtRecNo.Text:= recMsg;
end;

procedure TfrmDocWarehouseOut.FormClose(Sender: TObject;
  var CloseAction: TCloseAction);
begin
  {check for unsaved changes}
  saveBeforeClose;
  inherited;
end;

procedure TfrmDocWarehouseOut.ztDocWOutAfterDelete(DataSet: TDataSet);
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

procedure TfrmDocWarehouseOut.ztDocWOutAfterOpen(DataSet: TDataSet);
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

procedure TfrmDocWarehouseOut.ztDocWOutAfterPost(DataSet: TDataSet);
var
  {calc records(recNo and countRec)}
  recCount, recNo : String;
  recMsg : String = '0 od 0';
  currId : Longint = 0; {to find after refresh}
begin
  {upply updates}
  TZAbstractDataset(DataSet).ApplyUpdates;
  {rtefresh current row}
  currId:= TZAbstractDataset(DataSet).FieldByName(FIELD_ID).AsInteger;
  TZAbstractDataset(DataSet).DisableControls;
  TZAbstractDataset(DataSet).Refresh;
  TZAbstractDataset(DataSet).Locate(FIELD_ID, currId, []);
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

procedure TfrmDocWarehouseOut.ztDocWOutAfterScroll(DataSet: TDataSet);
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

procedure TfrmDocWarehouseOut.saveBeforeClose;
var
  newDlg : TdlgConfirm;
  confirmMsg : String = 'Postoje izmene koje nisu sačuvane!';
  saveAll : Boolean = False;
begin
  {set confirm msg}
  confirmMsg:= confirmMsg + #13#10;
  confirmMsg:= confirmMsg + 'Želite da sačuvamo izmene?';
  if(TZAbstractDataset(ztDocWOut).State in [dsEdit, dsInsert]) then
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
    doSaveRec(TZAbstractDataset(ztDocWOut)); {in this case just one dataSet}
end;

procedure TfrmDocWarehouseOut.sortDbGrid(var dataSet: TZAbstractDataset;
  Column: TColumn);
var
  currField : String;
  currSortType : TSortType;
begin
  {check current sortField and type}
  if( not dataSet.IsEmpty) then
    begin
      currField:= dataSet.SortedFields;
      currSortType:= dataSet.SortType;
      if(currField = Column.FieldName) then
        begin
          if currSortType = stAscending then
            dataSet.SortType:= stDescending
          else
            dataSet.SortType:= stAscending;
        end
      else
        begin
          dataSet.SortedFields:= Column.FieldName;
          dataSet.SortType:= stAscending;
        end;
    end;
    {just refresh}
end;

procedure TfrmDocWarehouseOut.onActFirst;
begin
  {jump to first rec}
  doFirstRec(TZAbstractDataset(ztDocWOut));
end;

procedure TfrmDocWarehouseOut.onActPrior;
begin
  {jump to prior rec}
  doPriorRec(TZAbstractDataset(ztDocWOut));
end;

procedure TfrmDocWarehouseOut.onActNext;
begin
  {jump to next rec}
  doNextRec(TZAbstractDataset(ztDocWOut));
end;

procedure TfrmDocWarehouseOut.onActLast;
begin
  {jump to last rec}
  doLastRec(TZAbstractDataset(ztDocWOut));
end;

procedure TfrmDocWarehouseOut.onActInsert;
begin
  {set focus and insert new rec}
  dbCode.SetFocus;
  doInsertRec(TZAbstractDataset(ztDocWOut));
end;

procedure TfrmDocWarehouseOut.onActDelete;
begin
  {delete rec}
  doDeleteRec(TZAbstractDataset(ztDocWOut));
end;

procedure TfrmDocWarehouseOut.onActEdit;
begin
  {set focus and edit rec}
  dbCode.SetFocus;
  doEditRec(TZAbstractDataset(ztDocWOut));
end;

procedure TfrmDocWarehouseOut.onActSave;
begin
  {save rec}
  doSaveRec(TZAbstractDataset(ztDocWOut));
end;

procedure TfrmDocWarehouseOut.onActCancel;
begin
  {cancel rec}
  doCancelRec(TZAbstractDataset(ztDocWOut));
end;

procedure TfrmDocWarehouseOut.openDataSet;
begin
  TZAbstractDataset(ztDocWOut).DisableControls;
  TZAbstractDataset(ztDocWOut).Close;
  try
    TZAbstractDataset(ztDocWOut).Open;
    TZAbstractDataset(ztDocWOut).EnableControls;
  except
    on e : Exception do
    begin
      dModule.zdbh.Rollback;
      TZAbstractDataset(ztDocWOut).EnableControls;
      ShowMessage(e.Message);
    end;
  end;
end;

end.

