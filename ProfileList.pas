unit ProfileList;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids, DBAccess, MyAccess;

type
  TProfile = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    ButtonCreate: TButton;
    ButtonUpdate: TButton;
    ButtonDelete: TButton;
    Panel3: TPanel;
    ButtonClose: TButton;
    MyDataSource: TMyDataSource;
    DBGrid: TDBGrid;
    procedure FormShow(Sender: TObject);
    procedure ButtonCreateClick(Sender: TObject);
    procedure ButtonCloseClick(Sender: TObject);
    procedure ButtonDeleteClick(Sender: TObject);
    procedure ButtonUpdateClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
//   procedure RefreshGrid;
  end;

var
  Profile: TProfile;

implementation

{$R *.dfm}

uses DataModule,ProfileDetails;
//delete records
procedure TProfile.ButtonDeleteClick(Sender: TObject);
begin
if DBGrid.Fields[0].Text = '' then
    begin
      MessageDlg('No records selected!', mtInformation, [mbOk], 0);
      exit;
    end;

  if MessageDlg('Are you sure you want to delete this record?',   mtConfirmation, [mbYes, mbNo], 0) = mrYes then
     begin
        with DM.QryDelete do   //used a different dataset here
           begin
             active := false;
             sql.Clear;
             sql.Add('Delete from profile where ID = ' + DBGrid.Fields[0].Text);
             execsql;
           end;
         MessageDlg('Record successfully deleted!', mtInformation, [mbOk], 0);
//        RefreshGrid;
     end;
end;

procedure TProfile.ButtonUpdateClick(Sender: TObject);
begin
  frmProfileDetails.Caption := 'Profile Details - Update';
  frmProfileDetails.Hint := DBGrid.Fields[0].Text; //to store the selected ID, use the Hint property of the form
  frmProfileDetails.showmodal;
end;

procedure TProfile.ButtonCloseClick(Sender: TObject);
begin
 close;   //close the profile list
end;

procedure TProfile.ButtonCreateClick(Sender: TObject);
begin
          frmProfileDetails.Caption := 'Profile Details - Add';
          frmProfileDetails.ShowModal; //show profile form to create new user

end;

procedure TProfile.FormShow(Sender: TObject);
begin
    with DM.QrySelect do
    begin
      active := false;
      sql.clear;
      sql.Text := 'SELECT * FROM profile';
      active := true;

    end;
end;

end.
