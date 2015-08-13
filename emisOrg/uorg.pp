unit uorg;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, BCPanel, DividerBevel, Forms, Controls, Graphics,
  Dialogs, ExtCtrls, StdCtrls, Menus, ActnList, LCLIntf, ComCtrls;

type

  { TfrmOrg }

  TfrmOrg = class(TForm)
    actGeneral: TActionList;
    actHospitalFrm: TAction;
    actQuitApp: TAction;
    divExDatis: TDividerBevel;
    Image1: TImage;
    imgGeneral: TImageList;
    lblModuleTitle: TLabel;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    mnuGeneral: TMainMenu;
    panelForms: TBCPanel;
    panelMnu: TPanel;
    shapeLogo: TShape;
    statusBarGeneral: TStatusBar;
    toolBarGeneral: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    procedure actHospitalFrmExecute(Sender: TObject);
    procedure actQuitAppExecute(Sender: TObject);
    procedure divExDatisClick(Sender: TObject);
    procedure divExDatisMouseEnter(Sender: TObject);
    procedure divExDatisMouseLeave(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure lblModuleTitleClick(Sender: TObject);
    procedure lblModuleTitleMouseEnter(Sender: TObject);
    procedure lblModuleTitleMouseLeave(Sender: TObject);
  private
    { private declarations }
    procedure closePriorForm;
  public
    { public declarations }
  end;

var
  frmOrg: TfrmOrg;
const
  PRJ_HOME : String = 'http://sourceforge.net/projects/emissoftware/';
  MAX_CTRLS : ShortInt = 4;
implementation
uses
  uhospital, uDModule;
{$R *.lfm}

{ TfrmOrg }

procedure TfrmOrg.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  { free and nil }
  CloseAction:= caFree;
  self:= nil;
end;

procedure TfrmOrg.divExDatisClick(Sender: TObject);
begin
  {open project home-page}
  Screen.Cursor:= crHourGlass;
  try
    OpenURL(PRJ_HOME);
  finally
    Screen.Cursor:= crDefault;
  end;
end;

procedure TfrmOrg.actQuitAppExecute(Sender: TObject);
begin
  {close main form and terminate app}
  self.Close;
  Application.Terminate;
end;

procedure TfrmOrg.actHospitalFrmExecute(Sender: TObject);
var
  newForm : TfrmHospital;
begin
  {set cursor(wait)}
  Screen.Cursor:= crHourGlass;
  {clear old forms}
  closePriorForm;
  try
    newForm:= TfrmHospital.Create(nil);
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

procedure TfrmOrg.divExDatisMouseEnter(Sender: TObject);
begin
  {underline}
  divExDatis.Font.Underline:= True;
end;

procedure TfrmOrg.divExDatisMouseLeave(Sender: TObject);
begin
  {reset underline}
  divExDatis.Font.Underline:= False;
end;

procedure TfrmOrg.lblModuleTitleClick(Sender: TObject);
begin
  {open project home-page}
  Screen.Cursor:= crHourGlass;
  try
    OpenURL(PRJ_HOME);
  finally
    Screen.Cursor:= crDefault;
  end;
end;

procedure TfrmOrg.lblModuleTitleMouseEnter(Sender: TObject);
begin
  {underline}
  lblModuleTitle.Font.Underline:= True;
end;

procedure TfrmOrg.lblModuleTitleMouseLeave(Sender: TObject);
begin
  {reset - underline = False}
  lblModuleTitle.Font.Underline:= False;
end;

procedure TfrmOrg.closePriorForm;
begin
  if(panelForms.ControlCount > MAX_CTRLS) then
    TForm(panelForms.Controls[MAX_CTRLS]).Close;
end;

end.
