program Project2;

uses
  Vcl.Forms,
  ProfileList in 'ProfileList.pas' {Profile},
  ProfileDetails in 'ProfileDetails.pas' {frmProfileDetails},
  DataModule in 'DataModule.pas' {DM: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TProfile, Profile);
  Application.CreateForm(TfrmProfileDetails, frmProfileDetails);
  Application.CreateForm(TDM, DM);
  Application.Run;
end.
