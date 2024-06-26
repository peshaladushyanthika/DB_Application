object Profile: TProfile
  Left = 0
  Top = 0
  Caption = 'Profile List'
  ClientHeight = 537
  ClientWidth = 1015
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesigned
  OnShow = FormShow
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1015
    Height = 49
    Align = alTop
    Color = 8421440
    ParentBackground = False
    TabOrder = 0
    ExplicitWidth = 1009
  end
  object Panel2: TPanel
    Left = 0
    Top = 469
    Width = 1015
    Height = 68
    Align = alBottom
    Color = 8421440
    ParentBackground = False
    TabOrder = 1
    ExplicitTop = 460
    ExplicitWidth = 1009
    object ButtonCreate: TButton
      Left = 424
      Top = 16
      Width = 75
      Height = 33
      Caption = 'Create'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = ButtonCreateClick
    end
    object ButtonUpdate: TButton
      Left = 528
      Top = 16
      Width = 75
      Height = 33
      Caption = 'Update'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = ButtonUpdateClick
    end
    object ButtonDelete: TButton
      Left = 632
      Top = 16
      Width = 75
      Height = 33
      Caption = 'Delete'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = ButtonDeleteClick
    end
    object ButtonClose: TButton
      Left = 736
      Top = 16
      Width = 75
      Height = 33
      Caption = 'Cancel'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnClick = ButtonCloseClick
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 49
    Width = 1015
    Height = 420
    Align = alClient
    Color = clWhite
    ParentBackground = False
    TabOrder = 2
    ExplicitWidth = 1009
    ExplicitHeight = 411
    object DBGrid: TDBGrid
      Left = 1
      Top = 1
      Width = 1013
      Height = 418
      Align = alClient
      DataSource = MyDataSource
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
    end
  end
  object MyDataSource: TMyDataSource
    DataSet = DM.QrySelect
    Left = 40
    Top = 480
  end
end
