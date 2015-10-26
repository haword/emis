unit uGeneral;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, BCPanel, DTAnalogClock, BGRASpriteAnimation,
  Forms, Controls, Graphics, DividerBevel,
  Dialogs, ActnList, Menus, ComCtrls, ExtCtrls, LCLIntf, StdCtrls, Buttons,
  process;

type

  { TfrmGeneral }

  TfrmGeneral = class(TForm)
    actGeneral: TActionList;
    actDocWIn: TAction;
    actDocWOut: TAction;
    actDocSOInput: TAction;
    actDocSOOutput: TAction;
    actDocBuying: TAction;
    actDocSell: TAction;
    actDocContract: TAction;
    actDrugForms: TAction;
    actDocMedicalInput: TAction;
    actDocMedicalOutput: TAction;
    actDocMedicalOrders: TAction;
    actDocLab: TAction;
    actDocPayment: TAction;
    actDocOutgoings: TAction;
    actDocFinance: TAction;
    actDocRequisition: TAction;
    actDocReservation: TAction;
    actHlpAboutModulePdf: TAction;
    actHlpAboutModuleDoc: TAction;
    actHlpAboutFormsPdf: TAction;
    actHlpAboutFormsDoc: TAction;
    actBcpDb: TAction;
    actHlpEditDataDoc: TAction;
    actEditDataPdf: TAction;
    actFrmSuppliers: TAction;
    actDonorsFrm: TAction;
    actDrugNomenclatures: TAction;
    actGenerics: TAction;
    actDrugGroups: TAction;
    actDrugs: TAction;
    actAppliancesGroup: TAction;
    actHEquipmentGroup: TAction;
    actHospitalEquipment: TAction;
    actFoodGroups: TAction;
    actFood: TAction;
    actHygieneProperties: TAction;
    actHygieneGroups: TAction;
    actHygieneMaterial: TAction;
    actSupplyServices: TAction;
    actSServicesGroups: TAction;
    actMaterialAccessories: TAction;
    actMaterialGroups: TAction;
    actPropertiesOfMaterials: TAction;
    actOfficeMaterial: TAction;
    actOfficeMGroups: TAction;
    actPropertiesOfOfficeM: TAction;
    actPropertiesOfFood: TAction;
    actPropertiesOfHEquipment: TAction;
    actMedicineAppliances: TAction;
    actPropertiesOfAppliences: TAction;
    actPharmacyMaterial: TAction;
    actPropertiesOfPHMaterial: TAction;
    actPMaterialGroup: TAction;
    actPropertiesOfDrug: TAction;
    actTaxes: TAction;
    actMeasure: TAction;
    actLocationFrm: TAction;
    actQuitApp: TAction;
    bgrSpriteLogo: TBGRASpriteAnimation;
    divExDatis: TDividerBevel;
    DTAnalogClock1: TDTAnalogClock;
    Image1: TImage;
    Image2: TImage;
    Label1: TLabel;
    Label2: TLabel;
    lblDate: TLabel;
    lblEditDataDoc: TLabel;
    lblEditDataPdf: TLabel;
    lblBackup: TLabel;
    lblAboutFormsPdf: TLabel;
    lblAboutFormsDoc: TLabel;
    lblAboutModule: TLabel;
    lblAboutModuleDoc: TLabel;
    lblModuleTitle: TLabel;
    MenuItem10: TMenuItem;
    MenuItem100: TMenuItem;
    MenuItem101: TMenuItem;
    MenuItem102: TMenuItem;
    MenuItem103: TMenuItem;
    MenuItem11: TMenuItem;
    MenuItem12: TMenuItem;
    MenuItem13: TMenuItem;
    MenuItem14: TMenuItem;
    MenuItem15: TMenuItem;
    MenuItem16: TMenuItem;
    MenuItem17: TMenuItem;
    MenuItem18: TMenuItem;
    MenuItem19: TMenuItem;
    MenuItem20: TMenuItem;
    MenuItem21: TMenuItem;
    MenuItem22: TMenuItem;
    MenuItem23: TMenuItem;
    MenuItem24: TMenuItem;
    MenuItem25: TMenuItem;
    MenuItem26: TMenuItem;
    MenuItem27: TMenuItem;
    MenuItem28: TMenuItem;
    MenuItem29: TMenuItem;
    MenuItem30: TMenuItem;
    MenuItem31: TMenuItem;
    MenuItem32: TMenuItem;
    MenuItem33: TMenuItem;
    MenuItem34: TMenuItem;
    MenuItem35: TMenuItem;
    MenuItem36: TMenuItem;
    MenuItem37: TMenuItem;
    MenuItem38: TMenuItem;
    MenuItem39: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem40: TMenuItem;
    MenuItem41: TMenuItem;
    MenuItem42: TMenuItem;
    MenuItem43: TMenuItem;
    MenuItem44: TMenuItem;
    MenuItem45: TMenuItem;
    MenuItem46: TMenuItem;
    MenuItem47: TMenuItem;
    MenuItem48: TMenuItem;
    MenuItem49: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem50: TMenuItem;
    MenuItem51: TMenuItem;
    MenuItem52: TMenuItem;
    MenuItem53: TMenuItem;
    MenuItem54: TMenuItem;
    MenuItem55: TMenuItem;
    MenuItem56: TMenuItem;
    MenuItem57: TMenuItem;
    MenuItem58: TMenuItem;
    MenuItem59: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem60: TMenuItem;
    MenuItem61: TMenuItem;
    MenuItem62: TMenuItem;
    MenuItem63: TMenuItem;
    MenuItem64: TMenuItem;
    MenuItem65: TMenuItem;
    MenuItem66: TMenuItem;
    MenuItem67: TMenuItem;
    MenuItem68: TMenuItem;
    MenuItem69: TMenuItem;
    MenuItem7: TMenuItem;
    MenuItem70: TMenuItem;
    MenuItem71: TMenuItem;
    MenuItem72: TMenuItem;
    MenuItem73: TMenuItem;
    MenuItem74: TMenuItem;
    MenuItem75: TMenuItem;
    MenuItem76: TMenuItem;
    MenuItem77: TMenuItem;
    MenuItem78: TMenuItem;
    MenuItem79: TMenuItem;
    MenuItem8: TMenuItem;
    MenuItem80: TMenuItem;
    MenuItem81: TMenuItem;
    MenuItem82: TMenuItem;
    MenuItem83: TMenuItem;
    MenuItem84: TMenuItem;
    MenuItem85: TMenuItem;
    MenuItem86: TMenuItem;
    MenuItem87: TMenuItem;
    MenuItem88: TMenuItem;
    MenuItem89: TMenuItem;
    MenuItem9: TMenuItem;
    MenuItem90: TMenuItem;
    MenuItem91: TMenuItem;
    MenuItem92: TMenuItem;
    MenuItem93: TMenuItem;
    MenuItem94: TMenuItem;
    MenuItem95: TMenuItem;
    MenuItem96: TMenuItem;
    MenuItem97: TMenuItem;
    MenuItem98: TMenuItem;
    MenuItem99: TMenuItem;
    panelForms: TBCPanel;
    imgGeneral: TImageList;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    mnuGeneral: TMainMenu;
    panelLogo: TPanel;
    panelMnu: TPanel;
    saveFbk: TSaveDialog;
    shapeLogo: TShape;
    statusBarGeneral: TStatusBar;
    toolBarGeneral: TToolBar;
    ToolButton1: TToolButton;
    ToolButton10: TToolButton;
    ToolButton11: TToolButton;
    ToolButton12: TToolButton;
    ToolButton13: TToolButton;
    ToolButton14: TToolButton;
    ToolButton15: TToolButton;
    ToolButton16: TToolButton;
    ToolButton17: TToolButton;
    ToolButton18: TToolButton;
    ToolButton19: TToolButton;
    ToolButton2: TToolButton;
    ToolButton20: TToolButton;
    ToolButton21: TToolButton;
    ToolButton22: TToolButton;
    ToolButton23: TToolButton;
    ToolButton24: TToolButton;
    ToolButton25: TToolButton;
    ToolButton26: TToolButton;
    ToolButton27: TToolButton;
    ToolButton28: TToolButton;
    ToolButton29: TToolButton;
    ToolButton3: TToolButton;
    ToolButton30: TToolButton;
    ToolButton31: TToolButton;
    ToolButton32: TToolButton;
    ToolButton33: TToolButton;
    ToolButton34: TToolButton;
    ToolButton35: TToolButton;
    ToolButton36: TToolButton;
    ToolButton37: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    procedure actAppliancesGroupExecute(Sender: TObject);
    procedure actBcpDbExecute(Sender: TObject);
    procedure actDocBuyingExecute(Sender: TObject);
    procedure actDocContractExecute(Sender: TObject);
    procedure actDocFinanceExecute(Sender: TObject);
    procedure actDocLabExecute(Sender: TObject);
    procedure actDocMedicalInputExecute(Sender: TObject);
    procedure actDocMedicalOrdersExecute(Sender: TObject);
    procedure actDocMedicalOutputExecute(Sender: TObject);
    procedure actDocOutgoingsExecute(Sender: TObject);
    procedure actDocPaymentExecute(Sender: TObject);
    procedure actDocRequisitionExecute(Sender: TObject);
    procedure actDocReservationExecute(Sender: TObject);
    procedure actDocSellExecute(Sender: TObject);
    procedure actDocSOInputExecute(Sender: TObject);
    procedure actDocSOOutputExecute(Sender: TObject);
    procedure actDocWInExecute(Sender: TObject);
    procedure actDocWOutExecute(Sender: TObject);
    procedure actDonorsFrmExecute(Sender: TObject);
    procedure actDrugFormsExecute(Sender: TObject);
    procedure actDrugGroupsExecute(Sender: TObject);
    procedure actDrugNomenclaturesExecute(Sender: TObject);
    procedure actDrugsExecute(Sender: TObject);
    procedure actEditDataPdfExecute(Sender: TObject);
    procedure actFoodExecute(Sender: TObject);
    procedure actFoodGroupsExecute(Sender: TObject);
    procedure actFrmSuppliersExecute(Sender: TObject);
    procedure actGenericsExecute(Sender: TObject);
    procedure actHEquipmentGroupExecute(Sender: TObject);
    procedure actHlpAboutFormsDocExecute(Sender: TObject);
    procedure actHlpAboutFormsPdfExecute(Sender: TObject);
    procedure actHlpAboutModuleDocExecute(Sender: TObject);
    procedure actHlpAboutModulePdfExecute(Sender: TObject);
    procedure actHlpEditDataDocExecute(Sender: TObject);
    procedure actHospitalEquipmentExecute(Sender: TObject);
    procedure actHygieneGroupsExecute(Sender: TObject);
    procedure actHygieneMaterialExecute(Sender: TObject);
    procedure actHygienePropertiesExecute(Sender: TObject);
    procedure actLocationFrmExecute(Sender: TObject);
    procedure actMaterialAccessoriesExecute(Sender: TObject);
    procedure actMaterialGroupsExecute(Sender: TObject);
    procedure actMeasureExecute(Sender: TObject);
    procedure actMedicineAppliancesExecute(Sender: TObject);
    procedure actOfficeMaterialExecute(Sender: TObject);
    procedure actOfficeMGroupsExecute(Sender: TObject);
    procedure actPharmacyMaterialExecute(Sender: TObject);
    procedure actPMaterialGroupExecute(Sender: TObject);
    procedure actPropertiesOfAppliencesExecute(Sender: TObject);
    procedure actPropertiesOfDrugExecute(Sender: TObject);
    procedure actPropertiesOfFoodExecute(Sender: TObject);
    procedure actPropertiesOfHEquipmentExecute(Sender: TObject);
    procedure actPropertiesOfMaterialsExecute(Sender: TObject);
    procedure actPropertiesOfOfficeMExecute(Sender: TObject);
    procedure actPropertiesOfPHMaterialExecute(Sender: TObject);
    procedure actQuitAppExecute(Sender: TObject);
    procedure actSServicesGroupsExecute(Sender: TObject);
    procedure actSupplyServicesExecute(Sender: TObject);
    procedure actTaxesExecute(Sender: TObject);
    procedure bgrSpriteLogoClick(Sender: TObject);
    procedure divExDatisClick(Sender: TObject);
    procedure divExDatisMouseEnter(Sender: TObject);
    procedure divExDatisMouseLeave(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure lblAboutFormsDocClick(Sender: TObject);
    procedure lblAboutFormsDocMouseEnter(Sender: TObject);
    procedure lblAboutFormsDocMouseLeave(Sender: TObject);
    procedure lblAboutFormsPdfClick(Sender: TObject);
    procedure lblAboutFormsPdfMouseEnter(Sender: TObject);
    procedure lblAboutFormsPdfMouseLeave(Sender: TObject);
    procedure lblAboutModuleClick(Sender: TObject);
    procedure lblAboutModuleDocClick(Sender: TObject);
    procedure lblAboutModuleDocMouseEnter(Sender: TObject);
    procedure lblAboutModuleDocMouseLeave(Sender: TObject);
    procedure lblAboutModuleMouseEnter(Sender: TObject);
    procedure lblAboutModuleMouseLeave(Sender: TObject);
    procedure lblBackupClick(Sender: TObject);
    procedure lblBackupMouseEnter(Sender: TObject);
    procedure lblBackupMouseLeave(Sender: TObject);
    procedure lblEditDataDocClick(Sender: TObject);
    procedure lblEditDataDocMouseEnter(Sender: TObject);
    procedure lblEditDataDocMouseLeave(Sender: TObject);
    procedure lblEditDataPdfClick(Sender: TObject);
    procedure lblEditDataPdfMouseEnter(Sender: TObject);
    procedure lblEditDataPdfMouseLeave(Sender: TObject);
    procedure lblModuleTitleClick(Sender: TObject);
    procedure lblModuleTitleMouseEnter(Sender: TObject);
    procedure lblModuleTitleMouseLeave(Sender: TObject);
  private
    { private declarations }
    procedure closePriorForm;
    procedure backupDb(const fbkPath : String);
    procedure showHomePage;
  public
    { public declarations }
    HELP_PATH : String;
  end;

var
  frmGeneral: TfrmGeneral;
const
  PRJ_HOME : String = 'http://sourceforge.net/projects/emissoftware/';
  MAX_CTRLS : ShortInt = 5;

implementation
uses
  uDModule, uLocation, uDocWarehouseIn, uDocWarehouseOut, uDocSOInput, uDocSOOutput,
  uDocBuying, uDocSell, uDocContract, uMeasure, uDrugForms, uDocMedicalInput,
  uDocMedicalOutput, uDocMedicalOrders, uDocLab, uDocPayment, uDocOutgoings,
  uDocFinance, uDocRequisition, uDocReservation, uTaxes, uSuppliers, uDonors,
  uDrugNomenclatures, uGenerics, uPropertiesOfDrug, uDrugGroups, uDrugs,
  uPharmacyMaterialGroup, uPropertiesOfPHMaterial, uPharmacyMaterial,
  uPropertiesOfAppliances, uAppliancesGroup, uMedicineAppliances, uHEquipmentGroup,
  uPropertiesOfHEquipment, uHospitalEquipment, uPropertiesOfFood, uFoodGroups, uFood,
  upropertiesOfOfficeM, uOfficeMGroups, uOfficeMaterial, uPropertiesOfMaterials,
  uMaterialsGroup, uMaterialsAccessories, uHygieneProperties, uHygieneGroups,
  uHygieneMaterial, uSServicesGroups, uSupplyServices;
{$R *.lfm}

{ TfrmGeneral }

procedure TfrmGeneral.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  { free and nil }
  DTAnalogClock1.Enabled:= False;
  CloseAction:= caFree;
  self:= nil;
end;

procedure TfrmGeneral.FormShow(Sender: TObject);
var
  userHome : String;
  gifAnimate : String;
  currDate : TDate;
  dayName : String;
begin
  HELP_PATH:= '-';
  {$IfDef WINDOWS}
    HELP_PATH:= 'c:\exdatis\hlp\';
    gifAnimate:= 'c:\exdatis\icons\exdatis.gif'
  {$EndIf}
  {$IfDef Linux}
    userHome:= GetUserDir;
    HELP_PATH:=  userHome + 'exdatis/hlp/';
    gifAnimate:= userHome + 'exdatis/icons/exdatis.gif';
  {$EndIf}
  //ShowMessage(HELP_PATH);
  {enable the clock}
  DTAnalogClock1.Enabled:= True;
  {set date}
  currDate:= Now;
  case DayOfWeek(currDate) of
    1: dayName:= 'Nedelja';
    2: dayName:= 'Ponedeljak';
    3: dayName:= 'Utorak';
    4: dayName:= 'Sreda';
    5: dayName:= 'Četvrtak';
    6: dayName:= 'Petak';
    7: dayName:= 'Subota';
  end;
  lblDate.Caption:= ' ' + dayName + ': ' + FormatDateTime('dd.MM.yyyy', currDate) + ' god.';
  {animated gif}
  bgrSpriteLogo.AnimatedGifToSprite(gifAnimate);
  bgrSpriteLogo.AnimRepeat:= 0;
  bgrSpriteLogo.AnimSpeed:= 100;
  bgrSpriteLogo.ShowHint:= True;
  Application.ProcessMessages;
end;

procedure TfrmGeneral.lblAboutFormsDocClick(Sender: TObject);
begin
  actHlpAboutFormsDoc.Execute;
end;

procedure TfrmGeneral.lblAboutFormsDocMouseEnter(Sender: TObject);
begin
  {pseudo-link, underline}
  lblAboutFormsDoc.Font.Underline:= True;
  {set color}
  lblAboutFormsDoc.Color:= clMaroon;
end;

procedure TfrmGeneral.lblAboutFormsDocMouseLeave(Sender: TObject);
begin
  {reset pseudo-link, underline = False}
  lblAboutFormsDoc.Font.Underline:= False;
  {set color}
  lblAboutFormsDoc.Color:= clGray;
end;

procedure TfrmGeneral.lblAboutFormsPdfClick(Sender: TObject);
begin
  actHlpAboutFormsPdf.Execute;
end;

procedure TfrmGeneral.lblAboutFormsPdfMouseEnter(Sender: TObject);
begin
  {pseudo-link, underline}
  lblAboutFormsPdf.Font.Underline:= True;
  {set color}
  lblAboutFormsPdf.Color:= clMaroon;
end;

procedure TfrmGeneral.lblAboutFormsPdfMouseLeave(Sender: TObject);
begin
  {reset pseudo-link, underline = False}
  lblAboutFormsPdf.Font.Underline:= False;
  {set color}
  lblAboutFormsPdf.Color:= clGray;
end;

procedure TfrmGeneral.lblAboutModuleClick(Sender: TObject);
begin
  {open doc}
  actHlpAboutModulePdf.Execute;
end;

procedure TfrmGeneral.lblAboutModuleDocClick(Sender: TObject);
begin
  {open help_doc}
  actHlpAboutModuleDoc.Execute;
end;

procedure TfrmGeneral.lblAboutModuleDocMouseEnter(Sender: TObject);
begin
  {pseudo-link, underline}
  lblAboutModuleDoc.Font.Underline:= True;
  {set color}
  lblAboutModuleDoc.Color:= clMaroon;
end;

procedure TfrmGeneral.lblAboutModuleDocMouseLeave(Sender: TObject);
begin
  {reset pseudo-link, underline = False}
  lblAboutModuleDoc.Font.Underline:= False;
  {set color}
  lblAboutModuleDoc.Color:= clGray;
end;

procedure TfrmGeneral.lblAboutModuleMouseEnter(Sender: TObject);
begin
  {pseudo-link, underline}
  lblAboutModule.Font.Underline:= True;
  {set color}
  lblAboutModule.Color:= clMaroon;
end;

procedure TfrmGeneral.lblAboutModuleMouseLeave(Sender: TObject);
begin
  {reset pseud-link}
  lblAboutModule.Font.Underline:= False;
  {set color}
  lblAboutModule.Color:= clGray;
end;

procedure TfrmGeneral.lblBackupClick(Sender: TObject);
begin
  {backup db}
  actBcpDb.Execute;
end;

procedure TfrmGeneral.lblBackupMouseEnter(Sender: TObject);
begin
  {pseudo-link, underline}
  lblBackup.Font.Underline:= True;
  {set color}
  lblBackup.Color:= clMaroon;
end;

procedure TfrmGeneral.lblBackupMouseLeave(Sender: TObject);
begin
  {reset pseud-link}
  lblBackup.Font.Underline:= False;
  {set color}
  lblBackup.Color:= clGray;
end;

procedure TfrmGeneral.lblEditDataDocClick(Sender: TObject);
begin
  {open doc}
  actHlpEditDataDoc.Execute;
end;

procedure TfrmGeneral.lblEditDataDocMouseEnter(Sender: TObject);
begin
  {pseudo-link, underline}
  lblEditDataDoc.Font.Underline:= True;
  {set color}
  lblEditDataDoc.Color:= clMaroon;
end;

procedure TfrmGeneral.lblEditDataDocMouseLeave(Sender: TObject);
begin
  {reset pseudo-link, underline = False}
  lblEditDataDoc.Font.Underline:= False;
  {set color}
  lblEditDataDoc.Color:= clGray;
end;

procedure TfrmGeneral.lblEditDataPdfClick(Sender: TObject);
begin
  {open doc}
  actEditDataPdf.Execute;
end;

procedure TfrmGeneral.lblEditDataPdfMouseEnter(Sender: TObject);
begin
  {pseudo-link, underline}
  lblEditDataPdf.Font.Underline:= True;
  {set color}
  lblEditDataPdf.Color:= clMaroon;
end;

procedure TfrmGeneral.lblEditDataPdfMouseLeave(Sender: TObject);
begin
  {reset pseudo-link, underline = False}
  lblEditDataPdf.Font.Underline:= False;
  {set color}
  lblEditDataPdf.Color:= clGray;
end;

procedure TfrmGeneral.lblModuleTitleClick(Sender: TObject);
begin
  {open project home-page}
  Screen.Cursor:= crHourGlass;
  try
    OpenURL(PRJ_HOME);
  finally
    Screen.Cursor:= crDefault;
  end;
end;

procedure TfrmGeneral.lblModuleTitleMouseEnter(Sender: TObject);
begin
  {underline}
  lblModuleTitle.Font.Underline:= True;
end;

procedure TfrmGeneral.lblModuleTitleMouseLeave(Sender: TObject);
begin
  {reset - underline = False}
  lblModuleTitle.Font.Underline:= False;
end;

procedure TfrmGeneral.closePriorForm;
begin
  if(panelForms.ControlCount > MAX_CTRLS) then
    TForm(panelForms.Controls[MAX_CTRLS]).Close;
end;

procedure TfrmGeneral.backupDb(const fbkPath: String);
const
  winHeader : String = '@echo off ' ;
  linHeader : String = '#!/bin/sh ';
  successMsg : String = 'Arhiviranje je uspešno završeno. ';
var
  bcpProc : TProcess;
  thisDb : String;
  withUser, withPassword : String;
  cmdStrings : TStringList;
  fullCmd : String;
  cmdFile : String; {path of sh or bat}
  s : ansistring;
begin
  {show cursor sqlwait}
  Screen.Cursor:= crSQLWait;

  {find db for backup}
  thisDb:= ' ' + dModule.zdbh.HostName + ':';
  thisDb:= thisDb + dModule.zdbh.Database + '  ';
  {user and password}
  withUser:= ' -user ' + dModule.zdbh.User;
  withPassword:= ' -password ' + dModule.zdbh.Password;

  {concat full cmd}
  fullCmd:= 'gbak' + ' -b -g -v ';
  {add database(source) and destination}

  fullCmd:= fullCmd + thisDb + ' ';
  fullCmd:= fullCmd + fbkPath + ' ';

  {add user and password}
  fullCmd:= fullCmd + withUser + ' ';
  fullCmd:= fullCmd + withPassword  + ' ';
  {debug msg}
  //ShowMessage(fullCmd);

  cmdStrings:= TStringList.Create;
  {$IfDef windows}
    cmdStrings.Append(winHeader);
  {$EndIf}
  {$IfDef linux}
    cmdStrings.Append(linHeader);
  {$EndIf}

  //cmdStrings.Append('echo --ExDatis database backup --');
  {debug test}
  //cmdStrings.Append('sleep 1');
  {add cmd}
  cmdStrings.Append(fullCmd);

  {$IfDef windows}
    cmdStrings.Append('PAUSE');
  {$EndIf}
  {$IfDef linux}
    cmdStrings.Append(' sleep 3');
  {$EndIf}

  {save file}
  {$IfDef windows}
    cmdFile:= 'C:\exdatis\bcp.bat';
    cmdStrings.SaveToFile(cmdFile);
  {$EndIf}
  {$IfDef linux}
    cmdFile:= GetUserDir + 'exdatis/bcp.sh';
    cmdStrings.SaveToFile(cmdFile);
  {$EndIf}

  {process}
  {$IfDef WINDOWS}
    {creeate process}
    bcpProc:= TProcess.Create(nil);
    bcpProc.CommandLine:= cmdFile;
    {execute options}
    bcpProc.Options:= bcpProc.Options + [poWaitOnExit, poNewConsole];
    {execute}
    bcpProc.Execute;
    {free}
    bcpProc.Free;
  {$EndIf}
  {just run}
  {$IfDef Linux}
   RunCommand('sh', [cmdFile], s);
  {$EndIf}

  {clear shell cmd}
  cmdStrings.Clear;
  cmdStrings.Append(' -- END --');
  cmdStrings.Append(FormatDateTime('dd.MM.yyyy hh:nn', Now));
  cmdStrings.SaveToFile(cmdFile);
  {reset cursor}
  Screen.Cursor:= crDefault;
  Application.ProcessMessages;
  {free string_list}
  cmdStrings.Free;
  {success msg}
  ShowMessage(successMsg);
end;

procedure TfrmGeneral.showHomePage;
begin
  {open project home-page}
  Screen.Cursor:= crHourGlass;
  try
    OpenURL(PRJ_HOME);
  finally
    Screen.Cursor:= crDefault;
  end;
end;

procedure TfrmGeneral.actQuitAppExecute(Sender: TObject);
begin
  {close main form and terminate app}
  Close;
  Application.Terminate;
end;

procedure TfrmGeneral.actSServicesGroupsExecute(Sender: TObject);
var
  newForm : TfrmSServicesGroups;
begin
  {set cursor(wait)}
  Screen.Cursor:= crHourGlass;
  {clear old forms}
  closePriorForm;
  try
    newForm:= TfrmSServicesGroups.Create(nil);
    {set parent ctrl}
    newForm.Parent:= panelForms;
    {set position}
    newForm.Left:= 0;
    newForm.Top:= 0;
    {open dataSets}
    newForm.openDataSet;
    {show form}
    newForm.Show;
    {set focus to enable shortcuts}
    newForm.SetFocus;
  finally
    Screen.Cursor:= crDefault;
  end;
end;

procedure TfrmGeneral.actSupplyServicesExecute(Sender: TObject);
var
  newForm : TfrmSupplyServices;
begin
  {set cursor(wait)}
  Screen.Cursor:= crHourGlass;
  {clear old forms}
  closePriorForm;
  try
    newForm:= TfrmSupplyServices.Create(nil);
    {set parent ctrl}
    newForm.Parent:= panelForms;
    {set position}
    newForm.Left:= 0;
    newForm.Top:= 0;
    {open dataSets}
    newForm.openRODataSets;
    Application.ProcessMessages;
    newForm.applyCharFilter; {with default char}
    {show form}
    newForm.Show;
    {set focus to enable shortcuts}
    newForm.SetFocus;
  finally
    Screen.Cursor:= crDefault;
  end;
end;

procedure TfrmGeneral.actTaxesExecute(Sender: TObject);
var
  newForm : TfrmTaxes;
begin
  {set cursor(wait)}
  Screen.Cursor:= crHourGlass;
  {clear old forms}
  closePriorForm;
  try
    newForm:= TfrmTaxes.Create(nil);
    {set parent ctrl}
    newForm.Parent:= panelForms;
    {set position}
    newForm.Left:= 0;
    newForm.Top:= 0;
    {open dataSets}
    newForm.openDataSet;
    {show form}
    newForm.Show;
    {set focus to enable shortcuts}
    newForm.SetFocus;
  finally
    Screen.Cursor:= crDefault;
  end;
end;

procedure TfrmGeneral.bgrSpriteLogoClick(Sender: TObject);
begin
  showHomePage;
end;

procedure TfrmGeneral.actLocationFrmExecute(Sender: TObject);
var
  newForm : TfrmLocation;
begin
  {set cursor(wait)}
  Screen.Cursor:= crHourGlass;
  {clear old forms}
  closePriorForm;
  try
    newForm:= TfrmLocation.Create(nil);
    {set parent ctrl}
    newForm.Parent:= panelForms;
    {set position}
    newForm.Left:= 0;
    newForm.Top:= 0;
    {open dataSets}
    newForm.applyCharFilter; {with default char}
    {show form}
    newForm.Show;
    {set focus to enable shortcuts}
    newForm.SetFocus;
  finally
    Screen.Cursor:= crDefault;
  end;
end;

procedure TfrmGeneral.actMaterialAccessoriesExecute(Sender: TObject);
var
  newForm : TfrmMaterialsAccessories;
begin
  {set cursor(wait)}
  Screen.Cursor:= crHourGlass;
  {clear old forms}
  closePriorForm;
  try
    newForm:= TfrmMaterialsAccessories.Create(nil);
    {set parent ctrl}
    newForm.Parent:= panelForms;
    {set position}
    newForm.Left:= 0;
    newForm.Top:= 0;
    {open dataSets}
    newForm.openRODataSets;
    Application.ProcessMessages;
    newForm.applyCharFilter; {with default char}
    {show form}
    newForm.Show;
    {set focus to enable shortcuts}
    newForm.SetFocus;
  finally
    Screen.Cursor:= crDefault;
  end;
end;

procedure TfrmGeneral.actMaterialGroupsExecute(Sender: TObject);
var
  newForm : TfrmMaterialsGroup;
begin
  {set cursor(wait)}
  Screen.Cursor:= crHourGlass;
  {clear old forms}
  closePriorForm;
  try
    newForm:= TfrmMaterialsGroup.Create(nil);
    {set parent ctrl}
    newForm.Parent:= panelForms;
    {set position}
    newForm.Left:= 0;
    newForm.Top:= 0;
    {open dataSets}
    newForm.openDataSet;
    {show form}
    newForm.Show;
    {set focus to enable shortcuts}
    newForm.SetFocus;
  finally
    Screen.Cursor:= crDefault;
  end;
end;

procedure TfrmGeneral.actMeasureExecute(Sender: TObject);
var
  newForm : TfrmMeasure;
begin
  {set cursor(wait)}
  Screen.Cursor:= crHourGlass;
  {clear old forms}
  closePriorForm;
  try
    newForm:= TfrmMeasure.Create(nil);
    {set parent ctrl}
    newForm.Parent:= panelForms;
    {set position}
    newForm.Left:= 0;
    newForm.Top:= 0;
    {open dataSets}
    newForm.openDataSet;
    {show form}
    newForm.Show;
    {set focus to enable shortcuts}
    newForm.SetFocus;
  finally
    Screen.Cursor:= crDefault;
  end;
end;

procedure TfrmGeneral.actMedicineAppliancesExecute(Sender: TObject);
var
  newForm : TfrmMedicineAppliances;
begin
  {set cursor(wait)}
  Screen.Cursor:= crHourGlass;
  {clear old forms}
  closePriorForm;
  try
    newForm:= TfrmMedicineAppliances.Create(nil);
    {set parent ctrl}
    newForm.Parent:= panelForms;
    {set position}
    newForm.Left:= 0;
    newForm.Top:= 0;
    {open dataSets}
    newForm.openRODataSets;
    Application.ProcessMessages;
    newForm.applyCharFilter; {with default char}
    {show form}
    newForm.Show;
    {set focus to enable shortcuts}
    newForm.SetFocus;
  finally
    Screen.Cursor:= crDefault;
  end;
end;

procedure TfrmGeneral.actOfficeMaterialExecute(Sender: TObject);
var
  newForm : TfrmOfficeMaterial;
begin
  {set cursor(wait)}
  Screen.Cursor:= crHourGlass;
  {clear old forms}
  closePriorForm;
  try
    newForm:= TfrmOfficeMaterial.Create(nil);
    {set parent ctrl}
    newForm.Parent:= panelForms;
    {set position}
    newForm.Left:= 0;
    newForm.Top:= 0;
    {open dataSets}
    newForm.openRODataSets;
    Application.ProcessMessages;
    newForm.applyCharFilter; {with default char}
    {show form}
    newForm.Show;
    {set focus to enable shortcuts}
    newForm.SetFocus;
  finally
    Screen.Cursor:= crDefault;
  end;
end;

procedure TfrmGeneral.actOfficeMGroupsExecute(Sender: TObject);
var
  newForm : TfrmOfficeMGroups;
begin
  {set cursor(wait)}
  Screen.Cursor:= crHourGlass;
  {clear old forms}
  closePriorForm;
  try
    newForm:= TfrmOfficeMGroups.Create(nil);
    {set parent ctrl}
    newForm.Parent:= panelForms;
    {set position}
    newForm.Left:= 0;
    newForm.Top:= 0;
    {open dataSets}
    newForm.openDataSet;
    {show form}
    newForm.Show;
    {set focus to enable shortcuts}
    newForm.SetFocus;
  finally
    Screen.Cursor:= crDefault;
  end;
end;

procedure TfrmGeneral.actPharmacyMaterialExecute(Sender: TObject);
var
  newForm : TfrmPharmacyMaterial;
begin
  {set cursor(wait)}
  Screen.Cursor:= crHourGlass;
  {clear old forms}
  closePriorForm;
  try
    newForm:= TfrmPharmacyMaterial.Create(nil);
    {set parent ctrl}
    newForm.Parent:= panelForms;
    {set position}
    newForm.Left:= 0;
    newForm.Top:= 0;
    {open dataSets}
    newForm.openRODataSets;
    Application.ProcessMessages;
    newForm.applyCharFilter; {with default char}
    {show form}
    newForm.Show;
    {set focus to enable shortcuts}
    newForm.SetFocus;
  finally
    Screen.Cursor:= crDefault;
  end;
end;

procedure TfrmGeneral.actPMaterialGroupExecute(Sender: TObject);
var
  newForm : TfrmPharmacyMaterialGroup;
begin
  {set cursor(wait)}
  Screen.Cursor:= crHourGlass;
  {clear old forms}
  closePriorForm;
  try
    newForm:= TfrmPharmacyMaterialGroup.Create(nil);
    {set parent ctrl}
    newForm.Parent:= panelForms;
    {set position}
    newForm.Left:= 0;
    newForm.Top:= 0;
    {open dataSets}
    newForm.openDataSet;
    {show form}
    newForm.Show;
    {set focus to enable shortcuts}
    newForm.SetFocus;
  finally
    Screen.Cursor:= crDefault;
  end;
end;

procedure TfrmGeneral.actPropertiesOfAppliencesExecute(Sender: TObject);
var
  newForm : TfrmPropertiesOfAppliances;
begin
  {set cursor(wait)}
  Screen.Cursor:= crHourGlass;
  {clear old forms}
  closePriorForm;
  try
    newForm:= TfrmPropertiesOfAppliances.Create(nil);
    {set parent ctrl}
    newForm.Parent:= panelForms;
    {set position}
    newForm.Left:= 0;
    newForm.Top:= 0;
    {open dataSets}
    newForm.openDataSet;
    {show form}
    newForm.Show;
    {set focus to enable shortcuts}
    newForm.SetFocus;
  finally
    Screen.Cursor:= crDefault;
  end;
end;

procedure TfrmGeneral.actPropertiesOfDrugExecute(Sender: TObject);
var
  newForm : TfrmPropertiesOfDrug;
begin
  {set cursor(wait)}
  Screen.Cursor:= crHourGlass;
  {clear old forms}
  closePriorForm;
  try
    newForm:= TfrmPropertiesOfDrug.Create(nil);
    {set parent ctrl}
    newForm.Parent:= panelForms;
    {set position}
    newForm.Left:= 0;
    newForm.Top:= 0;
    {open dataSets}
    newForm.openDataSet;
    {show form}
    newForm.Show;
    {set focus to enable shortcuts}
    newForm.SetFocus;
  finally
    Screen.Cursor:= crDefault;
  end;
end;

procedure TfrmGeneral.actPropertiesOfFoodExecute(Sender: TObject);
var
  newForm : TfrmPropertiesOfFood;
begin
  {set cursor(wait)}
  Screen.Cursor:= crHourGlass;
  {clear old forms}
  closePriorForm;
  try
    newForm:= TfrmPropertiesOfFood.Create(nil);
    {set parent ctrl}
    newForm.Parent:= panelForms;
    {set position}
    newForm.Left:= 0;
    newForm.Top:= 0;
    {open dataSets}
    newForm.openDataSet;
    {show form}
    newForm.Show;
    {set focus to enable shortcuts}
    newForm.SetFocus;
  finally
    Screen.Cursor:= crDefault;
  end;
end;

procedure TfrmGeneral.actPropertiesOfHEquipmentExecute(Sender: TObject);
var
  newForm : TfrmPropertiesOfHEquipment;
begin
  {set cursor(wait)}
  Screen.Cursor:= crHourGlass;
  {clear old forms}
  closePriorForm;
  try
    newForm:= TfrmPropertiesOfHEquipment.Create(nil);
    {set parent ctrl}
    newForm.Parent:= panelForms;
    {set position}
    newForm.Left:= 0;
    newForm.Top:= 0;
    {open dataSets}
    newForm.openDataSet;
    {show form}
    newForm.Show;
    {set focus to enable shortcuts}
    newForm.SetFocus;
  finally
    Screen.Cursor:= crDefault;
  end;
end;

procedure TfrmGeneral.actPropertiesOfMaterialsExecute(Sender: TObject);
var
  newForm : TfrmPropertiesOfMaterials;
begin
  {set cursor(wait)}
  Screen.Cursor:= crHourGlass;
  {clear old forms}
  closePriorForm;
  try
    newForm:= TfrmPropertiesOfMaterials.Create(nil);
    {set parent ctrl}
    newForm.Parent:= panelForms;
    {set position}
    newForm.Left:= 0;
    newForm.Top:= 0;
    {open dataSets}
    newForm.openDataSet;
    {show form}
    newForm.Show;
    {set focus to enable shortcuts}
    newForm.SetFocus;
  finally
    Screen.Cursor:= crDefault;
  end;
end;

procedure TfrmGeneral.actPropertiesOfOfficeMExecute(Sender: TObject);
var
  newForm : TfrmPropertiesOfOfficeM;
begin
  {set cursor(wait)}
  Screen.Cursor:= crHourGlass;
  {clear old forms}
  closePriorForm;
  try
    newForm:= TfrmPropertiesOfOfficeM.Create(nil);
    {set parent ctrl}
    newForm.Parent:= panelForms;
    {set position}
    newForm.Left:= 0;
    newForm.Top:= 0;
    {open dataSets}
    newForm.openDataSet;
    {show form}
    newForm.Show;
    {set focus to enable shortcuts}
    newForm.SetFocus;
  finally
    Screen.Cursor:= crDefault;
  end;
end;

procedure TfrmGeneral.actPropertiesOfPHMaterialExecute(Sender: TObject);
var
  newForm : TfrmPropertiesOfPHMaterial;
begin
  {set cursor(wait)}
  Screen.Cursor:= crHourGlass;
  {clear old forms}
  closePriorForm;
  try
    newForm:= TfrmPropertiesOfPHMaterial.Create(nil);
    {set parent ctrl}
    newForm.Parent:= panelForms;
    {set position}
    newForm.Left:= 0;
    newForm.Top:= 0;
    {open dataSets}
    newForm.openDataSet;
    {show form}
    newForm.Show;
    {set focus to enable shortcuts}
    newForm.SetFocus;
  finally
    Screen.Cursor:= crDefault;
  end;
end;

procedure TfrmGeneral.actDocWInExecute(Sender: TObject);
var
  newForm : TfrmDocWarehouseIn;
begin
  {set cursor(wait)}
  Screen.Cursor:= crHourGlass;
  {clear old forms}
  closePriorForm;
  try
    newForm:= TfrmDocWarehouseIn.Create(nil);
    {set parent ctrl}
    newForm.Parent:= panelForms;
    {set position}
    newForm.Left:= 0;
    newForm.Top:= 0;
    {open dataSets}
    newForm.openDataSet;
    {show form}
    newForm.Show;
    {set focus to enable shortcuts}
    newForm.SetFocus;
  finally
    Screen.Cursor:= crDefault;
  end;
end;

procedure TfrmGeneral.actDocSOInputExecute(Sender: TObject);
var
  newForm : TfrmDocSOInput;
begin
  {set cursor(wait)}
  Screen.Cursor:= crHourGlass;
  {clear old forms}
  closePriorForm;
  try
    newForm:= TfrmDocSOInput.Create(nil);
    {set parent ctrl}
    newForm.Parent:= panelForms;
    {set position}
    newForm.Left:= 0;
    newForm.Top:= 0;
    {open dataSets}
    newForm.openDataSet;
    {show form}
    newForm.Show;
    {set focus to enable shortcuts}
    newForm.SetFocus;
  finally
    Screen.Cursor:= crDefault;
  end;
end;

procedure TfrmGeneral.actDocBuyingExecute(Sender: TObject);
var
  newForm : TfrmDocBuying;
begin
  {set cursor(wait)}
  Screen.Cursor:= crHourGlass;
  {clear old forms}
  closePriorForm;
  try
    newForm:= TfrmDocBuying.Create(nil);
    {set parent ctrl}
    newForm.Parent:= panelForms;
    {set position}
    newForm.Left:= 0;
    newForm.Top:= 0;
    {open dataSets}
    newForm.openDataSet;
    {show form}
    newForm.Show;
    {set focus to enable shortcuts}
    newForm.SetFocus;
  finally
    Screen.Cursor:= crDefault;
  end;
end;

procedure TfrmGeneral.actBcpDbExecute(Sender: TObject);
var
  defaultPath : String;
  fbkFile : String;
  currDate : String;
  fbkName : String;
  currMonth : String;
begin
  {find initial folder}
  {$IfDef windows}
    defaultPath:= 'C:\exdatis\bcp\';
  {$EndIf}
  {$IfDef linux}
    defaultPath:= GetUserDir + 'exdatis/bcp/';
  {$EndIf}
  saveFbk.InitialDir:= defaultPath;
  {set default name of fbk}
  currDate:= FormatDateTime('dd.MM.yyyy', Now);
  fbkName:= ExtractFileNameOnly(dModule.zdbh.Database);

  fbkName:= fbkName + LeftStr(currDate, 2);
  currMonth:= Copy(currDate, 4, 2);
  fbkName:= fbkName + currMonth;
  fbkName:= fbkName + RightStr(currDate, 4);
  {add extension}
  fbkName:= fbkName + '.fbk';
  saveFbk.FileName:= fbkName;
  {run dialog}
  if saveFbk.Execute then
    if(Length(saveFbk.FileName) > 5) then
      begin
        fbkFile:= saveFbk.FileName;
        backupDb(fbkFile);
      end;
end;

procedure TfrmGeneral.actAppliancesGroupExecute(Sender: TObject);
var
  newForm : TfrmAppliancesGroup;
begin
  {set cursor(wait)}
  Screen.Cursor:= crHourGlass;
  {clear old forms}
  closePriorForm;
  try
    newForm:= TfrmAppliancesGroup.Create(nil);
    {set parent ctrl}
    newForm.Parent:= panelForms;
    {set position}
    newForm.Left:= 0;
    newForm.Top:= 0;
    {open dataSets}
    newForm.openDataSet;
    {show form}
    newForm.Show;
    {set focus to enable shortcuts}
    newForm.SetFocus;
  finally
    Screen.Cursor:= crDefault;
  end;
end;

procedure TfrmGeneral.actDocContractExecute(Sender: TObject);
var
  newForm : TfrmDocContract;
begin
  {set cursor(wait)}
  Screen.Cursor:= crHourGlass;
  {clear old forms}
  closePriorForm;
  try
    newForm:= TfrmDocContract.Create(nil);
    {set parent ctrl}
    newForm.Parent:= panelForms;
    {set position}
    newForm.Left:= 0;
    newForm.Top:= 0;
    {open dataSets}
    newForm.openDataSet;
    {show form}
    newForm.Show;
    {set focus to enable shortcuts}
    newForm.SetFocus;
  finally
    Screen.Cursor:= crDefault;
  end;
end;

procedure TfrmGeneral.actDocFinanceExecute(Sender: TObject);
var
  newForm : TfrmDocFinance;
begin
  {set cursor(wait)}
  Screen.Cursor:= crHourGlass;
  {clear old forms}
  closePriorForm;
  try
    newForm:= TfrmDocFinance.Create(nil);
    {set parent ctrl}
    newForm.Parent:= panelForms;
    {set position}
    newForm.Left:= 0;
    newForm.Top:= 0;
    {open dataSets}
    newForm.openDataSet;
    {show form}
    newForm.Show;
    {set focus to enable shortcuts}
    newForm.SetFocus;
  finally
    Screen.Cursor:= crDefault;
  end;
end;

procedure TfrmGeneral.actDocLabExecute(Sender: TObject);
var
  newForm : TfrmDocLab;
begin
  {set cursor(wait)}
  Screen.Cursor:= crHourGlass;
  {clear old forms}
  closePriorForm;
  try
    newForm:= TfrmDocLab.Create(nil);
    {set parent ctrl}
    newForm.Parent:= panelForms;
    {set position}
    newForm.Left:= 0;
    newForm.Top:= 0;
    {open dataSets}
    newForm.openDataSet;
    {show form}
    newForm.Show;
    {set focus to enable shortcuts}
    newForm.SetFocus;
  finally
    Screen.Cursor:= crDefault;
  end;
end;

procedure TfrmGeneral.actDocMedicalInputExecute(Sender: TObject);
var
  newForm : TfrmDocMedicalInput;
begin
  {set cursor(wait)}
  Screen.Cursor:= crHourGlass;
  {clear old forms}
  closePriorForm;
  try
    newForm:= TfrmDocMedicalInput.Create(nil);
    {set parent ctrl}
    newForm.Parent:= panelForms;
    {set position}
    newForm.Left:= 0;
    newForm.Top:= 0;
    {open dataSets}
    newForm.openDataSet;
    {show form}
    newForm.Show;
    {set focus to enable shortcuts}
    newForm.SetFocus;
  finally
    Screen.Cursor:= crDefault;
  end;
end;

procedure TfrmGeneral.actDocMedicalOrdersExecute(Sender: TObject);
var
  newForm : TfrmDocMedicalOrders;
begin
  {set cursor(wait)}
  Screen.Cursor:= crHourGlass;
  {clear old forms}
  closePriorForm;
  try
    newForm:= TfrmDocMedicalOrders.Create(nil);
    {set parent ctrl}
    newForm.Parent:= panelForms;
    {set position}
    newForm.Left:= 0;
    newForm.Top:= 0;
    {open dataSets}
    newForm.openDataSet;
    {show form}
    newForm.Show;
    {set focus to enable shortcuts}
    newForm.SetFocus;
  finally
    Screen.Cursor:= crDefault;
  end;
end;

procedure TfrmGeneral.actDocMedicalOutputExecute(Sender: TObject);
var
  newForm : TfrmDocMedicalOutput;
begin
  {set cursor(wait)}
  Screen.Cursor:= crHourGlass;
  {clear old forms}
  closePriorForm;
  try
    newForm:= TfrmDocMedicalOutput.Create(nil);
    {set parent ctrl}
    newForm.Parent:= panelForms;
    {set position}
    newForm.Left:= 0;
    newForm.Top:= 0;
    {open dataSets}
    newForm.openDataSet;
    {show form}
    newForm.Show;
    {set focus to enable shortcuts}
    newForm.SetFocus;
  finally
    Screen.Cursor:= crDefault;
  end;
end;

procedure TfrmGeneral.actDocOutgoingsExecute(Sender: TObject);
var
  newForm : TfrmDocOutgoings;
begin
  {set cursor(wait)}
  Screen.Cursor:= crHourGlass;
  {clear old forms}
  closePriorForm;
  try
    newForm:= TfrmDocOutgoings.Create(nil);
    {set parent ctrl}
    newForm.Parent:= panelForms;
    {set position}
    newForm.Left:= 0;
    newForm.Top:= 0;
    {open dataSets}
    newForm.openDataSet;
    {show form}
    newForm.Show;
    {set focus to enable shortcuts}
    newForm.SetFocus;
  finally
    Screen.Cursor:= crDefault;
  end;
end;

procedure TfrmGeneral.actDocPaymentExecute(Sender: TObject);
var
  newForm : TfrmDocPayment;
begin
  {set cursor(wait)}
  Screen.Cursor:= crHourGlass;
  {clear old forms}
  closePriorForm;
  try
    newForm:= TfrmDocPayment.Create(nil);
    {set parent ctrl}
    newForm.Parent:= panelForms;
    {set position}
    newForm.Left:= 0;
    newForm.Top:= 0;
    {open dataSets}
    newForm.openDataSet;
    {show form}
    newForm.Show;
    {set focus to enable shortcuts}
    newForm.SetFocus;
  finally
    Screen.Cursor:= crDefault;
  end;
end;

procedure TfrmGeneral.actDocRequisitionExecute(Sender: TObject);
var
  newForm : TfrmDocRequisition;
begin
  {set cursor(wait)}
  Screen.Cursor:= crHourGlass;
  {clear old forms}
  closePriorForm;
  try
    newForm:= TfrmDocRequisition.Create(nil);
    {set parent ctrl}
    newForm.Parent:= panelForms;
    {set position}
    newForm.Left:= 0;
    newForm.Top:= 0;
    {open dataSets}
    newForm.openDataSet;
    {show form}
    newForm.Show;
    {set focus to enable shortcuts}
    newForm.SetFocus;
  finally
    Screen.Cursor:= crDefault;
  end;
end;

procedure TfrmGeneral.actDocReservationExecute(Sender: TObject);
var
  newForm : TfrmDocReservation;
begin
  {set cursor(wait)}
  Screen.Cursor:= crHourGlass;
  {clear old forms}
  closePriorForm;
  try
    newForm:= TfrmDocReservation.Create(nil);
    {set parent ctrl}
    newForm.Parent:= panelForms;
    {set position}
    newForm.Left:= 0;
    newForm.Top:= 0;
    {open dataSets}
    newForm.openDataSet;
    {show form}
    newForm.Show;
    {set focus to enable shortcuts}
    newForm.SetFocus;
  finally
    Screen.Cursor:= crDefault;
  end;
end;

procedure TfrmGeneral.actDocSellExecute(Sender: TObject);
var
  newForm : TfrmDocSell;
begin
  {set cursor(wait)}
  Screen.Cursor:= crHourGlass;
  {clear old forms}
  closePriorForm;
  try
    newForm:= TfrmDocSell.Create(nil);
    {set parent ctrl}
    newForm.Parent:= panelForms;
    {set position}
    newForm.Left:= 0;
    newForm.Top:= 0;
    {open dataSets}
    newForm.openDataSet;
    {show form}
    newForm.Show;
    {set focus to enable shortcuts}
    newForm.SetFocus;
  finally
    Screen.Cursor:= crDefault;
  end;
end;

procedure TfrmGeneral.actDocSOOutputExecute(Sender: TObject);
var
  newForm : TfrmDocSOOutput;
begin
  {set cursor(wait)}
  Screen.Cursor:= crHourGlass;
  {clear old forms}
  closePriorForm;
  try
    newForm:= TfrmDocSOOutput.Create(nil);
    {set parent ctrl}
    newForm.Parent:= panelForms;
    {set position}
    newForm.Left:= 0;
    newForm.Top:= 0;
    {open dataSets}
    newForm.openDataSet;
    {show form}
    newForm.Show;
    {set focus to enable shortcuts}
    newForm.SetFocus;
  finally
    Screen.Cursor:= crDefault;
  end;
end;

procedure TfrmGeneral.actDocWOutExecute(Sender: TObject);
var
  newForm : TfrmDocWarehouseOut;
begin
  {set cursor(wait)}
  Screen.Cursor:= crHourGlass;
  {clear old forms}
  closePriorForm;
  try
    newForm:= TfrmDocWarehouseOut.Create(nil);
    {set parent ctrl}
    newForm.Parent:= panelForms;
    {set position}
    newForm.Left:= 0;
    newForm.Top:= 0;
    {open dataSets}
    newForm.openDataSet;
    {show form}
    newForm.Show;
    {set focus to enable shortcuts}
    newForm.SetFocus;
  finally
    Screen.Cursor:= crDefault;
  end;
end;

procedure TfrmGeneral.actDonorsFrmExecute(Sender: TObject);
var
  newForm : TfrmDonors;
begin
  {set cursor(wait)}
  Screen.Cursor:= crHourGlass;
  {clear old forms}
  closePriorForm;
  try
    newForm:= TfrmDonors.Create(nil);
    {set parent ctrl}
    newForm.Parent:= panelForms;
    {set position}
    newForm.Left:= 0;
    newForm.Top:= 0;
    {open dataSets}
    newForm.openDataSet;
    {show form}
    newForm.Show;
    {set focus to enable shortcuts}
    newForm.SetFocus;
  finally
    Screen.Cursor:= crDefault;
  end;
end;

procedure TfrmGeneral.actDrugFormsExecute(Sender: TObject);
var
  newForm : TfrmDrugForms;
begin
  {set cursor(wait)}
  Screen.Cursor:= crHourGlass;
  {clear old forms}
  closePriorForm;
  try
    newForm:= TfrmDrugForms.Create(nil);
    {set parent ctrl}
    newForm.Parent:= panelForms;
    {set position}
    newForm.Left:= 0;
    newForm.Top:= 0;
    {open dataSets}
    newForm.openDataSet;
    {show form}
    newForm.Show;
    {set focus to enable shortcuts}
    newForm.SetFocus;
  finally
    Screen.Cursor:= crDefault;
  end;
end;

procedure TfrmGeneral.actDrugGroupsExecute(Sender: TObject);
var
  newForm : TfrmDrugGroups;
begin
  {set cursor(wait)}
  Screen.Cursor:= crHourGlass;
  {clear old forms}
  closePriorForm;
  try
    newForm:= TfrmDrugGroups.Create(nil);
    {set parent ctrl}
    newForm.Parent:= panelForms;
    {set position}
    newForm.Left:= 0;
    newForm.Top:= 0;
    {open dataSets}
    newForm.openDataSet;
    {show form}
    newForm.Show;
    {set focus to enable shortcuts}
    newForm.SetFocus;
  finally
    Screen.Cursor:= crDefault;
  end;
end;

procedure TfrmGeneral.actDrugNomenclaturesExecute(Sender: TObject);
var
  newForm : TfrmDrugNomenclatures;
begin
  {set cursor(wait)}
  Screen.Cursor:= crHourGlass;
  {clear old forms}
  closePriorForm;
  try
    newForm:= TfrmDrugNomenclatures.Create(nil);
    {set parent ctrl}
    newForm.Parent:= panelForms;
    {set position}
    newForm.Left:= 0;
    newForm.Top:= 0;
    {open dataSets}
    newForm.openDataSet;
    {show form}
    newForm.Show;
    {set focus to enable shortcuts}
    newForm.SetFocus;
  finally
    Screen.Cursor:= crDefault;
  end;
end;

procedure TfrmGeneral.actDrugsExecute(Sender: TObject);
var
  newForm : TfrmDrugs;
begin
  {set cursor(wait)}
  Screen.Cursor:= crHourGlass;
  {clear old forms}
  closePriorForm;
  try
    newForm:= TfrmDrugs.Create(nil);
    {set parent ctrl}
    newForm.Parent:= panelForms;
    {set position}
    newForm.Left:= 0;
    newForm.Top:= 0;
    {open dataSets}
    newForm.openRODataSets;
    Application.ProcessMessages;
    newForm.applyCharFilter; {with default char}
    {show form}
    newForm.Show;
    {set focus to enable shortcuts}
    newForm.SetFocus;
  finally
    Screen.Cursor:= crDefault;
  end;
end;

procedure TfrmGeneral.actEditDataPdfExecute(Sender: TObject);
var
  full_path : String;
begin
  {help file path(pdf file)}
  full_path:= HELP_PATH + 'editData.pdf';
  {open doc}
  Screen.Cursor:= crHourGlass;
  try
    OpenDocument(full_path);
  finally
    Screen.Cursor:= crDefault;
  end;
end;

procedure TfrmGeneral.actFoodExecute(Sender: TObject);
var
  newForm : TfrmFood;
begin
  {set cursor(wait)}
  Screen.Cursor:= crHourGlass;
  {clear old forms}
  closePriorForm;
  try
    newForm:= TfrmFood.Create(nil);
    {set parent ctrl}
    newForm.Parent:= panelForms;
    {set position}
    newForm.Left:= 0;
    newForm.Top:= 0;
    {open dataSets}
    newForm.openRODataSets;
    Application.ProcessMessages;
    newForm.applyCharFilter; {with default char}
    {show form}
    newForm.Show;
    {set focus to enable shortcuts}
    newForm.SetFocus;
  finally
    Screen.Cursor:= crDefault;
  end;
end;

procedure TfrmGeneral.actFoodGroupsExecute(Sender: TObject);
var
  newForm : TfrmFoodGroups;
begin
  {set cursor(wait)}
  Screen.Cursor:= crHourGlass;
  {clear old forms}
  closePriorForm;
  try
    newForm:= TfrmFoodGroups.Create(nil);
    {set parent ctrl}
    newForm.Parent:= panelForms;
    {set position}
    newForm.Left:= 0;
    newForm.Top:= 0;
    {open dataSets}
    newForm.openDataSet;
    {show form}
    newForm.Show;
    {set focus to enable shortcuts}
    newForm.SetFocus;
  finally
    Screen.Cursor:= crDefault;
  end;
end;

procedure TfrmGeneral.actFrmSuppliersExecute(Sender: TObject);
var
  newForm : TfrmSuppliers;
begin
  {set cursor(wait)}
  Screen.Cursor:= crHourGlass;
  {clear old forms}
  closePriorForm;
  try
    newForm:= TfrmSuppliers.Create(nil);
    {set parent ctrl}
    newForm.Parent:= panelForms;
    {set position}
    newForm.Left:= 0;
    newForm.Top:= 0;
    {open dataSets}
    newForm.applyCharFilter; {with default char}
    {set help-path}
    newForm.HELP_PATH:= HELP_PATH;
    {show form}
    newForm.Show;
    {set focus to enable shortcuts}
    newForm.SetFocus;
  finally
    Screen.Cursor:= crDefault;
  end;
end;

procedure TfrmGeneral.actGenericsExecute(Sender: TObject);
var
  newForm : TfrmGenerics;
begin
  {set cursor(wait)}
  Screen.Cursor:= crHourGlass;
  {clear old forms}
  closePriorForm;
  try
    newForm:= TfrmGenerics.Create(nil);
    {set parent ctrl}
    newForm.Parent:= panelForms;
    {set position}
    newForm.Left:= 0;
    newForm.Top:= 0;
    {open dataSets}
    newForm.openDataSet;
    {show form}
    newForm.Show;
    {set focus to enable shortcuts}
    newForm.SetFocus;
  finally
    Screen.Cursor:= crDefault;
  end;
end;

procedure TfrmGeneral.actHEquipmentGroupExecute(Sender: TObject);
var
  newForm : TfrmHEquipmentGroup;
begin
  {set cursor(wait)}
  Screen.Cursor:= crHourGlass;
  {clear old forms}
  closePriorForm;
  try
    newForm:= TfrmHEquipmentGroup.Create(nil);
    {set parent ctrl}
    newForm.Parent:= panelForms;
    {set position}
    newForm.Left:= 0;
    newForm.Top:= 0;
    {open dataSets}
    newForm.openDataSet;
    {show form}
    newForm.Show;
    {set focus to enable shortcuts}
    newForm.SetFocus;
  finally
    Screen.Cursor:= crDefault;
  end;
end;

procedure TfrmGeneral.actHlpAboutFormsDocExecute(Sender: TObject);
var
  full_path : String;
begin
  {help file path(pdf file)}
  full_path:= HELP_PATH + 'forms.doc';
  {open doc}
  Screen.Cursor:= crHourGlass;
  try
    OpenDocument(full_path);
  finally
    Screen.Cursor:= crDefault;
  end;
end;

procedure TfrmGeneral.actHlpAboutFormsPdfExecute(Sender: TObject);
var
  full_path : String;
begin
  {help file path(pdf file)}
  full_path:= HELP_PATH + 'forms.pdf';
  {open doc}
  Screen.Cursor:= crHourGlass;
  try
    OpenDocument(full_path);
  finally
    Screen.Cursor:= crDefault;
  end;
end;

procedure TfrmGeneral.actHlpAboutModuleDocExecute(Sender: TObject);
var
  full_path : String;
begin
  {help file path(pdf file)}
  full_path:= HELP_PATH + 'generalTbls.doc';
  {open doc}
  Screen.Cursor:= crHourGlass;
  try
    OpenDocument(full_path);
  finally
    Screen.Cursor:= crDefault;
  end;
end;

procedure TfrmGeneral.actHlpAboutModulePdfExecute(Sender: TObject);
var
  full_path : String;
begin
  {help file path(pdf file)}
  full_path:= HELP_PATH + 'generalTbls.pdf';
  {open doc}
  Screen.Cursor:= crHourGlass;
  try
    OpenDocument(full_path);
  finally
    Screen.Cursor:= crDefault;
  end;
end;

procedure TfrmGeneral.actHlpEditDataDocExecute(Sender: TObject);
var
  full_path : String;
begin
  {help file path(pdf file)}
  full_path:= HELP_PATH + 'editData.doc';
  {open doc}
  Screen.Cursor:= crHourGlass;
  try
    OpenDocument(full_path);
  finally
    Screen.Cursor:= crDefault;
  end;
end;

procedure TfrmGeneral.actHospitalEquipmentExecute(Sender: TObject);
var
  newForm : TfrmHospitalEquipment;
begin
  {set cursor(wait)}
  Screen.Cursor:= crHourGlass;
  {clear old forms}
  closePriorForm;
  try
    newForm:= TfrmHospitalEquipment.Create(nil);
    {set parent ctrl}
    newForm.Parent:= panelForms;
    {set position}
    newForm.Left:= 0;
    newForm.Top:= 0;
    {open dataSets}
    newForm.openRODataSets;
    Application.ProcessMessages;
    newForm.applyCharFilter; {with default char}
    {show form}
    newForm.Show;
    {set focus to enable shortcuts}
    newForm.SetFocus;
  finally
    Screen.Cursor:= crDefault;
  end;
end;

procedure TfrmGeneral.actHygieneGroupsExecute(Sender: TObject);
var
  newForm : TfrmHygieneGroups;
begin
  {set cursor(wait)}
  Screen.Cursor:= crHourGlass;
  {clear old forms}
  closePriorForm;
  try
    newForm:= TfrmHygieneGroups.Create(nil);
    {set parent ctrl}
    newForm.Parent:= panelForms;
    {set position}
    newForm.Left:= 0;
    newForm.Top:= 0;
    {open dataSets}
    newForm.openDataSet;
    {show form}
    newForm.Show;
    {set focus to enable shortcuts}
    newForm.SetFocus;
  finally
    Screen.Cursor:= crDefault;
  end;
end;

procedure TfrmGeneral.actHygieneMaterialExecute(Sender: TObject);
var
  newForm : TfrmHygieneMaterial;
begin
  {set cursor(wait)}
  Screen.Cursor:= crHourGlass;
  {clear old forms}
  closePriorForm;
  try
    newForm:= TfrmHygieneMaterial.Create(nil);
    {set parent ctrl}
    newForm.Parent:= panelForms;
    {set position}
    newForm.Left:= 0;
    newForm.Top:= 0;
    {open dataSets}
    newForm.openRODataSets;
    Application.ProcessMessages;
    newForm.applyCharFilter; {with default char}
    {show form}
    newForm.Show;
    {set focus to enable shortcuts}
    newForm.SetFocus;
  finally
    Screen.Cursor:= crDefault;
  end;
end;

procedure TfrmGeneral.actHygienePropertiesExecute(Sender: TObject);
var
  newForm : TfrmHygieneProperties;
begin
  {set cursor(wait)}
  Screen.Cursor:= crHourGlass;
  {clear old forms}
  closePriorForm;
  try
    newForm:= TfrmHygieneProperties.Create(nil);
    {set parent ctrl}
    newForm.Parent:= panelForms;
    {set position}
    newForm.Left:= 0;
    newForm.Top:= 0;
    {open dataSets}
    newForm.openDataSet;
    {show form}
    newForm.Show;
    {set focus to enable shortcuts}
    newForm.SetFocus;
  finally
    Screen.Cursor:= crDefault;
  end;
end;

procedure TfrmGeneral.divExDatisClick(Sender: TObject);
begin
  showHomePage;
end;

procedure TfrmGeneral.divExDatisMouseEnter(Sender: TObject);
begin
  {underline}
  divExDatis.Font.Underline:= True;
end;

procedure TfrmGeneral.divExDatisMouseLeave(Sender: TObject);
begin
  {underline}
  divExDatis.Font.Underline:= False;
end;

end.

