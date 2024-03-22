unit ProfileDetails;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfrmProfileDetails = class(TForm)
    Panel2: TPanel;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    ID: TEdit;
    ProfileName: TEdit;
    Address: TEdit;
    Telephone: TEdit;
    DOB: TEdit;
    SaveButton: TButton;
    CancelButton: TButton;
    procedure FormShow(Sender: TObject);
    procedure SaveButtonClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmProfileDetails: TfrmProfileDetails;

implementation

{$R *.dfm}

uses DataModule;

procedure TfrmProfileDetails.CancelButtonClick(Sender: TObject);
begin
close;
end;

procedure TfrmProfileDetails.FormShow(Sender: TObject);
//var SelectedID: Integer;
begin
  if(self.Caption = 'Profile Details - Add') then
  begin
    Id.Clear;
    ProfileName.Clear;
    Address.Clear;
    Telephone.Clear;
    DOB.Clear;
  end
  else if (self.Caption = 'Profile Details - Update') then
  begin
       //Display details of the selected ID
//var SelectedID: Integer;
//SelectedID := StrToInt(ID.Text);
//SelectedID := StrToInt(Hint);

       with DM.QrySelectDetails do  //used a different dataset here to retain the data
          begin
            active := false;
            sql.Clear;
            sql.Text := 'SELECT * FROM profile WHERE id = ' + self.Hint;
            active := true;
          end;

       //populate to the editboxes all the details
       ID.Text := dm.QrySelectDetails.FieldByName('id').AsString;
       ProfileName.Text := dm.QrySelectDetails.FieldByName('name').AsString;
       Address.Text := dm.QrySelectDetails.FieldByName('address').AsString;
       Telephone.Text := dm.QrySelectDetails.FieldByName('tel').AsString;
       DOB.Text := dm.QrySelectDetails.FieldByName('dob').AsString;
    end;

end;


procedure TfrmProfileDetails.SaveButtonClick(Sender: TObject);
  var TelephoneNumber: string;
  var DOBValue:TDateTime;
  FormatSettings: TFormatSettings;
  i: Integer;

begin
  FormatSettings.ShortDateFormat := 'yyyy-mm-dd'; //declare the date format
  if (ProfileName.Text = '') or (Address.Text = '') then
  begin
    ShowMessage('Please fill in all required fields.');
    Exit; // Stop
  end;
  TelephoneNumber := Telephone.Text;
  for i := 1 to Length(TelephoneNumber) do  //ensure to add only digits
  begin
    if not (TelephoneNumber[i] in ['0'..'9']) then
    begin
      ShowMessage('Telephone number should only contain digits.');
      Exit; // Stop
    end;
  end;
//  TelephoneNumber := StringReplace(TelephoneNumber, ' ', '', [rfReplaceAll]);
//  TelephoneNumber := StringReplace(TelephoneNumber, '-', '', [rfReplaceAll]);
//  TelephoneNumber := StringReplace(TelephoneNumber, '(', '', [rfReplaceAll]);
//  TelephoneNumber := StringReplace(TelephoneNumber, ')', '', [rfReplaceAll]);

  if (Length(TelephoneNumber) <> 10) then  //check length of telephone
  begin
    ShowMessage('Please enter a valid 10-digit telephone number.');
    Exit; // Stop further processing
  end;

  if not TryStrToDate(DOB.Text, DOBValue,FormatSettings) then
  begin
    ShowMessage('Please enter a valid date of birth.');
    Exit; // Stop further processing
  end;

  if(self.Caption = 'Profile Details - Add') then
  begin
    if (ProfileName.Text <> '') and (Address.Text <> '') then
    begin
      with DM.QryInsert do   //insert data into db
            begin
               active := false;
               sql.Clear;
               Sql.Text := 'INSERT INTO profile (id, name, address, tel, dob) ' +
            ' VALUES('+ QuotedStr(ID.Text) + ',' +
                        QuotedStr(ProfileName.Text) + ',' +
                        QuotedStr(Address.Text) + ',' +
                        QuotedStr(Telephone.Text) + ',' +
                        QuotedStr(DOB.Text) + ')';
            ExecSQL;
            end;
            Showmessage('New record successfully added');
            Close;
    end;
  end
  else if (self.Caption = 'Profile Details - Update') then
  begin
    if (ProfileName.Text <> '') and (Address.Text <> '') then
    begin
      with DM.QryUpdate do         //to update data into db
      begin
        active := false;
        sql.Clear;
        sql.Text := 'UPDATE profile SET id = ' + quotedstr(ID.Text) +
                                               ', name = ' + quotedstr(ProfileName.Text) +
                                               ', address = ' + quotedstr(Address.Text) +
                                               ', tel = ' + quotedstr(Telephone.Text) +
                                               ', dob = ' + quotedstr(DOB.Text) +
                            ' WHERE id = ' + ID.Text;  //filter here to make sure we only update the selected ID
               Showmessage(sql.Text); //to see the SQL Statement that will be sent to DB
               ExecSQL;
      end;
      Showmessage('Record successfully updated!');
      Close;
    end;
  end;
end;

end.
