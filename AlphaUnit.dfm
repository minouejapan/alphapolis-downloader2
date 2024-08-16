object Alphadl: TAlphadl
  Left = 315
  Top = 31
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #12450#12523#12501#12449#12509#12522#12473#23567#35500#12480#12454#12531#12525#12540#12480#12540'2 [1.3.0.0]'
  ClientHeight = 81
  ClientWidth = 802
  Color = clBtnFace
  Font.Charset = SHIFTJIS_CHARSET
  Font.Color = clBlack
  Font.Height = -12
  Font.Name = 'Yu Gothic UI'
  Font.Pitch = fpVariable
  Font.Style = []
  Font.Quality = fqDraft
  KeyPreview = True
  OldCreateOrder = True
  OnActivate = FormActivate
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 79
    Width = 802
    Height = 2
    Align = alClient
    TabOrder = 0
    object WVWindowParent1: TWVWindowParent
      Left = 1
      Top = 1
      Width = 800
      Height = 0
      Align = alClient
      TabOrder = 0
      Browser = WV2
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 802
    Height = 79
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object NvTitle: TLabel
      Left = 16
      Top = 58
      Width = 595
      Height = 15
      AutoSize = False
      Caption = #20316#21697#12479#12452#12488#12523#65306
      Color = clBtnFace
      ParentColor = False
    end
    object Elapsed: TLabel
      Left = 516
      Top = 12
      Width = 87
      Height = 15
      Caption = #32076#36942#26178#38291#65306'00:00'
      Color = clBtnFace
      ParentColor = False
    end
    object Status: TLabel
      Left = 204
      Top = 11
      Width = 24
      Height = 15
      Caption = #29366#24907
      Color = clBtnFace
      ParentColor = False
    end
    object Label1: TLabel
      Left = 8
      Top = 12
      Width = 95
      Height = 15
      Caption = #23567#35500'TOP'#12506#12540#12472'URL'
      Color = clBtnFace
      ParentColor = False
    end
    object OCBtn: TSpeedButton
      Left = 756
      Top = 56
      Width = 23
      Height = 22
      Caption = #9660
      Flat = True
      OnClick = OCBtnClick
    end
    object CancelBtn: TButton
      Left = 709
      Top = 29
      Width = 70
      Height = 25
      Caption = #20013#27490'(&A)'
      Enabled = False
      TabOrder = 0
      OnClick = CancelBtnClick
    end
    object StartBtn: TButton
      Left = 617
      Top = 29
      Width = 86
      Height = 25
      Caption = #12480#12454#12531#12525#12540#12489'(&D)'
      TabOrder = 1
      OnClick = StartBtnClick
    end
    object URL: TEdit
      Left = 12
      Top = 29
      Width = 599
      Height = 23
      TabOrder = 2
    end
  end
  object WV2: TWVBrowser
    TargetCompatibleBrowserVersion = '104.0.1293.44'
    AllowSingleSignOnUsingOSPrimaryAccount = False
    OnInitializationError = WV2InitializationError
    OnAfterCreated = WV2AfterCreated
    OnExecuteScriptCompleted = WV2ExecuteScriptCompleted
    OnNavigationCompleted = WV2NavigationCompleted
    OnSourceChanged = WV2SourceChanged
    OnLostFocus = WV2LostFocus
    OnRetrieveHTMLCompleted = WV2RetrieveHTMLCompleted
    Left = 448
    Top = 108
  end
  object Timer1: TTimer
    Enabled = False
    OnTimer = Timer1Timer
    Left = 188
    Top = 124
  end
  object Timer2: TTimer
    Enabled = False
    Interval = 300
    OnTimer = Timer1Timer
    Left = 140
    Top = 8
  end
end
