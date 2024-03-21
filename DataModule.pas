unit DataModule;

interface

uses
  System.SysUtils, System.Classes, Data.DB, MemDS, DBAccess, MyAccess;

type
  TDM = class(TDataModule)
    Connection: TMyConnection;
    QrySelect: TMyQuery;
    QryInsert: TMyQuery;
    QryDelete: TMyQuery;
    QryUpdate: TMyQuery;
    QrySelectDetails: TMyQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
