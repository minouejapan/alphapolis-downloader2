(*
  アルファポリス小説ダウンローダー[alphadlw]

  3.24 2026/07/20 指定したURLが存在しない場合処理が停止する不具合を修正した
                  nvdllib内の数値文字参照コード&#????;のデコード処理を修正した
  3.23 2026/06/20 【R18】マークがつかない場合があった不具合を修正した
  3.22 2026/06/18 R-18作品の場合タイトル名にR-18マークを付与するようにした
  3.21 2026/06/06 HTML構造変更への対応で挿絵処理の修正を忘れていた不具合を修正した
  3.2 2026/06/03  アルファポリス作品ページのHTML構造が変更されたことに対応した
  3.11 2026/04/26 ExitCode(38): The browser process exited because it was re-launched without elevation.
                  エラーが発生する場合の対応として[GlobalCEFApp.DoNotDeElevate:=True]を追加した
                  (https://github.com/salvadordf/CEF4Delphi/issues/578)
  3.1 2026/04/25  ページ情報取得リトライ時にCEF4にフォーカスを当てるようにした
                  ページ情報から本文を取得できない場合のリトライ処理を追加した
                  リトライに失敗しても最後までダウンロードし、ログファイルにエラー履歴を残すようにした
                  CEF4のバージョンを146.0.10から146.0.12に更新した
  3.0 2026/04/15  [CEF4Delphi版(https://github.com/salvadordf/CEF4Delphi)]
                  WebページアクセスをWebView4Delphi(WebView2)からCEF4Delphi(Chromium Embedded Framework)
                  に切り替えた
                  ページ切り替え時に情報をうまく取得できない場合にリトライを繰り返していた処理については
                  信頼性が向上したため簡易的なチェックに変更した

===================================================================================================
  以下はWebView4Delphi(WebView2)版の更新履歴

  2.6 2026/04/09  目次の途中にレンタル部分があるとそれ以降をダウンロード出来なかった不具合を修正した
                  ログファイルの見出しをna6dlと統一した
  2.52 2026/03/25 ログファイルへの作品URL追加忘れを修正した
                  トップページを習得出来たかどうかの判定値を追加した
  2.51 2026/03/24 各話ページの取得に失敗する場合があるためブラウザコントロールへの強制フォーカスの
                  当て方を変更した
                  また各話ページの取得に失敗した場合のリトライを強化した
  2.5 2026/03/22  トップページ・各話ページの構成が変更されたため処理を変更した。またこれに合わせて
                  HMTL解析処理をSHParserに変更した
                  開発環境をLazarusのみに限定した
  2.4 2025/11/29  ダウンロード出来なくなったため修正した(各話ページの前の話と次の話の構成が変更されたため
                  取得したページが正しいものか判定出来なくなっていたことに対応した)
  2.3 2025/11/20  表紙画像取得処理の不具合を修正した
  2.21     07/02  WebView4Delphiを最新版に更新した
  2.2 2025/05/06  タイトル名・作者名、あらすじ、見出しタイトルのHTMLエンコード文字を処理していなかっ
                  た不具合を修正した
                  処理の都合上本文内の"も削除していたためHTMLソース処理方法を変更した
  2.1 2025/03/13  保存ファイル名にも連載状況を付加するようにした
                  最初のファイル名が次のダウンロード時に初期化されない不具合を修正した
                  各話本文の先頭に半角スペースが入る場合があった不具合を修正した
  2.0 2025/03/08  作者名の後ろにゴミが入る場合があった不具合を修正した
  1.9 2025/02/20  １話しかない作品をダウンロード出来なくなっていた不具合を修正した
  1.8 2025/02/20  Naro2mobiから呼び出すと正常にダウンロード出来ない場合がある不具合を修正した
  1.71     01/23  SendMessageで送信する文字列の文字コードをUTF-16に変換するようにした
                  バージョン情報をプロジェクトオプション設定に切り替えた
  1.7 2025/01/11  ページが正しく取得出来たかどうかをページ内の前ページ/次ページURLリンクで判定するようにした
  1.6 2025/01/10  本文中の挿絵処理がおかしかった不具合を修正した
                  ページ取得間違いが出ないように各話タイトル名でチェックしていたのを各話ページURLによる
                  チェックに変更した(各話タイトルが1,2,3等の場合誤判定する場合があるため)
  1.5 2024/08/22  ページ情報取得のタフネスを上げるため、リトライする際のインターバルを0.1→0.5秒に延長し、
                  10回リトライしても駄目な場合は5秒間のインターバルを入れて再度リトライを繰り返すようにした
  1.4 2024/08/21  各ページ情報取得が不完全だったため取得ミスが発生する場合があった不具合を修正した
                  ページ取得失敗時のリロード表示が目障りなため修正した
                  DL処理の共通処理部分を別ユニットとすることでバグ発生時の修正作業が一回で済むようにした
                  キャプションバーへのバージョン情報表示を自動化した
  1.3 2024/08/17  Lazarus共有化に変更漏れがあり各話タイトルの見出しタグ付加処理が不完全だった不具合を修正した
  1.2 2024/08/11  EdgeブラウザコンポーネントWebView4Delphiのバージョンを1.0.2045.28から
                  現時点の最新版1.0.2592.51に変更した
                  ソースコードをDelphi/Lazarus共用化した
                  開発環境をDelphi XE2からLazarus3.2に変更した
                  ・Delphiでビルドする場合はalphadlw.dprojを開く
                  ・Lazarusでビルドする場合はalphadlw.lpiを開く
                  DL進捗%の計算がおかしかった不具合を修正した
  1.1 2023/10/01  挿し絵のURL抽出処理がおかしかったのを修正した
  1.0 2023/09/23  TEdgeBrowserベースでの処理があまりにも遅いためWebView4Delphiで作り直した

===================================================================================================
  以下は旧コンソール版の更新履歴

  アルファポリス小説ダウンローダー[Alphadl]

  アルファポリスはWinINetではページを全てダウンロードすることが出来ないため、IndyHTTP(TIdHTTP)を
  使用してダウンロードする

  3.1 2023/09/17  トップページの各話URLタグおよび各ページURLその他情報の構造が変更されたことと
                  Indyライブラリを使用したダウンロードにもDLページ数制限がかけられたため正常に
                  ダウンロード出来なくなったことから大幅修正してダウンロード出来るようにした
                  ・IndyライブラリからWinINetによるHTMLダウンロードに変更した。またこのことに
                    よってOpenSSLライブラリは不要となった
                  ・確実にダウンロードを完了させるため、ダウンロード制限がかかった場合は制限が
                    解除されるまで待機するようにした
  3.0 2023/07/30  DL開始ページを指定した場合のNaro2mobiに送るDLページ数が1少なかった不具合を修正した
  2.9 2023/07/24  オプション引数確認処理を変更し、DL開始ページ指定オプション-sを追加し
  2.8 2023/05/30  作者URL情報取得処理を追加した
  2.7 2023/04/28  表紙画像URLの先頭1文字に余分な文字が入る場合がある不具合を修正した
  2.6 2023/03/28  &#????;の処理を16進数2byte決め打ちから10進数でも変換できるように変更した
                  表紙画像URLの先頭1文字が欠落する不具合を修正した
  2.5 2023/02/27  &#x????;にエンコードされている‼等のUnicode文字をデコードする処理を追加した
                  識別タグの文字列長さを定数からLength(識別文字定数)に変更した
  2.4 2022/12/28  見出しの青空文庫タグを変更した
  2.3 2022/12/09  有料コンテンツ等本文が取得できなかった場合は代わりに本文に取得出来ませんでした
                  メッセージを挿入するようにした
  2.2 2022/10/29  トップページの作品タイトル装飾タグがh2からh1に変わったため検出文字列を修正した
  2.1 2022/08/07  タイトル名の先頭に連載状況（連載中・完結）を追加するようにした
  2.0 2022/05/25  起動時にOpenSSLライブラリがあるかどうかチェックするようにした
  1.9 2022/02/02  本文中に挿絵がある場合、挿絵以降の本文を取得出来なかった不具合を修正
      2021/12/15  GitHubに上げるためソースコードを整理した
  1.8 2021/10/07  エピソードが1話の場合にダウンロード出来なかった不具合を修正した
                  前書きがない場合ダウンロードに失敗する不具合を修正した
                  本文中に入ることがある&#x202A;&#x202C;コードを削除する処理を追加した
  1.7 2021/09/29  表示画像がno_imageの場合は挿入しないようにした
  1.6 2021/09/17  強調（丸傍点）タグ<em><span></span></em>の処理を追加
                  表紙画像があれば表紙タグを挿入するようにした
  1.51 2021/07/09 ログファイルへの出力順序が他と異なっていた不具合を修正した
  1.5 2021/07/03  Naro2mobiから起動した際に進捗状況をNaro2mobi側に知らせるようにした
  1.4 2021/06/30  小説本文内の特殊文字（例："<"を&lt;で表記るしているやつ）の処理を追加した
  1.3 2021/06/22  小説本文をより確実に取得するために識別するタグの処理を変更した
                  ダウンロードした小説のログファイルを作成するようにした
  1.2 2021/06/13  保存するテキストの文字コードがShift-JISだったのををUTF-8に変更した
                  進捗状況がわかるようにコンソールへの表示を変更した
  1.1 2021/05/30  各話ページを取得中に途中で終了する不具合を修正（識別タグの文字数を間違えていた）
                  埋め込み画像リンクを青空文庫風のタグに変換するようにした
  1.0 2021/05/27  Windows用のアルファポリス小説ダウンローダーがなかったためNaro2mobiのソースコードを
                  テンプレートとして作成した
*)
unit MainUnit;

{$mode delphi}
{$codepage utf8}

interface

uses
  Windows, Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls, LMessages,
  Buttons, LazUTF8, uCEFChromium, uCEFWindowParent, uCEFInterfaces, uCEFConstants, uCEFTypes,
  uCEFChromiumEvents, uCEFStringVisitor;

type

	{ TadlForm }
  TadlForm = class(TForm)
		CancelBtn: TButton;
		CEFWindowParent1: TCEFWindowParent;
		Chromium1: TChromium;
		Elapsed: TLabel;
		Label1: TLabel;
		MainPanel: TPanel;
		NvTitle: TLabel;
		OCBtn: TSpeedButton;
		StartBtn: TButton;
		Status: TLabel;
		Timer1: TTimer;
		URL: TEdit;
		WebPanel: TPanel;
		procedure CancelBtnClick(Sender: TObject);
    procedure Chromium1AfterCreated(Sender: TObject; const browser: ICefBrowser);
    procedure Chromium1BeforeClose(Sender: TObject; const browser: ICefBrowser);
		procedure Chromium1LoadEnd(Sender: TObject; const browser: ICefBrowser;
					const frame: ICefFrame; httpStatusCode: Integer);
		procedure Chromium1TextResultAvailable(Sender: TObject; const aText: ustring
					);
		procedure FormActivate(Sender: TObject);
		procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
		procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
		procedure FormKeyPress(Sender: TObject; var Key: char);
		procedure FormShow(Sender: TObject);
		procedure OCBtnClick(Sender: TObject);
		procedure StartBtnClick(Sender: TObject);
		procedure Timer1Timer(Sender: TObject);
  private
    fTopPage,
    fCancel,
    Busy,
    IsCalled: boolean;
    PrevURL,
    NextURL,
    fHTMLSrc: string;
    StartTime: TTime;
    FmHt: integer;
    TextPage,
    PageList,
    LogFile: TStringList;
    URLadr, Path,
    NvStat,
    AuthURL,
    Chapter,
    FileName,
    StartPage: string;
    hWnd: THandle;
    CDS: TCopyDataStruct;
    StartN: integer;
    IsErr: Boolean;
    procedure ExecuteJS;
    function GetHTMLSrc(URLadr: string): string;
    function ParsePage(Page: string): Boolean;
    function GetNovelStatus(MainPage: string): string;
    procedure ParseChapter(MainPage: string);
  protected
    FCanClose  : boolean;  // Set to True in TChromium.OnBeforeClose
    FClosing   : boolean;  // Set to True in the CloseQuery event.

    // You have to handle this two messages to call NotifyMoveOrResizeStarted or some page elements will be misaligned.
    procedure WMMove(var aMessage : TWMMove); message WM_MOVE;
    procedure WMMoving(var aMessage : TMessage); message WM_MOVING;
    // You also have to handle these two messages to set GlobalCEFApp.OsmodalLoop
    procedure WMEnterMenuLoop(var aMessage: TMessage); message WM_ENTERMENULOOP;
    procedure WMExitMenuLoop(var aMessage: TMessage); message WM_EXITMENULOOP;

    procedure BrowserCreatedMsg(var aMessage : TMessage); message CEF_AFTERCREATED;

  public

  end;

var
  adlForm: TadlForm;

implementation

{$R *.lfm}
{$R verinfo.res}

uses
  uCEFApplication,
  RegExpr, SHParser, nvdllib;

const
  // データ抽出用の識別タグ
  SERRSTR  = '<div class="dots-indicator';//'<div class=dots-indicator';
  SPICTIN  = '<div class="story-image"><a href=".*?"><img src=".*?" .*?></a></div>';
  SPICTB   = '<div class="story-image"><a href=".*?"><img src="';
  SPICTE   = '" .*?></a></div>';
  SHEAD    = '<span class="content-status complete">';
  SBOMISS  = '<div class="dots-indicator" id="LoadingEpisode">';

  CRLF     = #$0D#$0A;

  // ログファイル表題
  NVURL  = '小説URL   :';
  NVTITL = 'タイトル  :';
  NVAUTH = '作者      :';
  NVAURL = '作者URL   :';
  NVBIGN = '掲載日    :';
  NVFINI = '最終掲載日:';
  NVLUPD = '最新掲載日:';
  NVLRNW = '最終更新日:';
  NVSYNP = 'あらすじ  :';

  R18MARK = '【R-18】';


// ユーザメッセージID
  WM_DLINFO  = WM_USER + 30;


{ TadlForm }

// 正規表現による検索・切り出し
function FindRegex(Source, PatternL, PatternR: string): string;
var
  r: TRegExpr;
  s: string;
begin
  Result := '';
  r := TRegExpr.Create;
  try
    r.InputString := Source;
    r.Expression  := PatternL + '[\s\S]*?' + PatternR;
    if r.Exec then
    begin
      s := r.Match[0];
      s := ReplaceRegExpr(PatternR, ReplaceRegExpr(PatternL, s, ''), '');
      Result := s;
		end;
	finally
    r.Free;
	end;
end;

// 本文のルビタグを青空文庫形式に変換する
function ChangeRuby(Base: string): string;
var
  tmp: string;
begin
  tmp := UTF8StringReplace(Base, '<ruby>',        AO_RBI, [rfReplaceAll]);
  tmp := UTF8StringReplace(tmp,  '<rt>',          AO_RBL, [rfReplaceAll]);
  tmp := UTF8StringReplace(tmp,  '</rt></ruby>',  AO_RBR, [rfReplaceAll]);
  Result := tmp;
end;

// 本文の改行タグをCR/LFに置換する
function ChangeBRK(Base: string): string;
begin
  Result := UTF8StringReplace(Base, '<br />', #13#10, [rfReplaceAll]);
  Result := UTF8StringReplace(Result, '<br>', #13#10, [rfReplaceAll]);
end;

// 本文の強調タグ(<em><span></span></em>)を青空文庫形式に変換する
function ChangeEm(Base: string): string;
var
  tmp: string;
begin
  tmp := UTF8StringReplace(Base, '<em>',          AO_EMB, [rfReplaceAll]);
  tmp := UTF8StringReplace(tmp,  '</em>',         AO_EME, [rfReplaceAll]);
  tmp := UTF8StringReplace(tmp,  '<span>',        '',     [rfReplaceAll]);
  tmp := UTF8StringReplace(tmp,  '</span>',       '',     [rfReplaceAll]);
  Result := tmp;
end;

// 埋め込まれた画像リンクを青空文庫形式に変換する
// 但し、画像ファイルはダウンロードせずにリンク先をそのまま埋め込む
function ChangeImage(Base: string): string;
var
  tmp: string;
begin
  tmp := Base;
  tmp := ReplaceRegExpr('<div class=.*?<img src="', tmp, AO_PIB);
  tmp := ReplaceRegExpr('" alt=""></a></div>', tmp, AO_PIE);
  Result := tmp;
end;

// 本文先頭の半角スペースを除去する
function TrimHead(Str: string): string;
var
  ch: string;
begin
  while True do
  begin
    if UTF8Length(Str) = 0 then
      Break
    else begin
      ch := UTF8Copy(Str, 1, 1);
      if UTF8Pos(ch, #$0A#$0D' ') > 0 then
        UTF8Delete(Str, 1, 1)
      else
        Break;
    end;
  end;
  Result := Str;
end;

// HTMLタグの処理
function GetText(Source: string): string;
var
  tmp: string;
begin
  tmp := ChangeBRK(Source);     // </ br>をCRLFに変換する
  tmp := ChangeImage(tmp);      // 挿絵HTMLタグを青空文庫タグに変換する
  tmp := ChangeRuby(tmp);       // ルビのタグを変換する
  tmp := ChangeEm(tmp);         // 強調（傍点）タグを変換する
  tmp := Restore2RealChar(tmp); // エスケースされた特殊文字を本来の文字に変換する
  tmp := TrimHead(tmp);         // 本文先頭の余分なスペースを除去する
  tmp := UTF8StringReplace(tmp, ' ', '', [rfReplaceAll]);  // 本文中の半角スペースを削除
  Result := tmp;
end;

function GetSourceCEF4: string;
begin
  adlForm.Chromium1.RetrieveHTML;
end;

procedure TadlForm.FormCreate(Sender: TObject);
var
  cfg, opt, op, ver: string;
  f: TextFile;
  i: integer;
begin
  FCanClose := False;
  FClosing  := False;
  FmHt      := Height;
  IsCalled  := False;
  FileName  := '';

  TextPage  := TStringList.Create;
  LogFile   := TStringList.Create;
  PageList  := TStringList.Create;
  // 保存されたパラメータを読み込む(IniFilesを用いるほどではないので原始的な方法で)
  // Turbo PASCAL時代に戻った感じ
  cfg := ChangeFileExt(Application.ExeName, '.cfg');
  if FileExists(cfg) then
  begin
    try
      AssignFile(f, cfg);
      Reset(f);
      Readln(f, opt);
      if opt = '' then
        opt := '1';
      if ParamCount = 0 then
      begin
        Readln(f, Opt);
        if Opt = '' then
          Opt := '300';
        Left := StrToInt(Opt);
        Readln(f, Opt);
        if Opt = '' then
          Opt := '200';
        Top := StrToInt(Opt);
      end;
    finally
      CloseFile(f);
    end;
  end;

  // ファイルバージョンをキャプションに表示する
  ver := GetVersionInfo(Application.ExeName);
  Caption := 'アルファポリス小説ダウンローダー2 [' + ver + ']';

  if ParamCount = 0 then
  begin
    Exit;
  end;
  // オプション引数取得
  for i := 0 to ParamCount - 1 do
  begin
    op := ParamStr(i + 1);
    // Naro2mobiのWindowsハンドル
    if UTF8Pos('-h', op) = 1 then
    begin
      UTF8Delete(op, 1, 2);
      try
        hWnd := StrToInt(op);
      except
        ExitCode := -1;
        Exit;
      end;
    // DL開始ページ番号
    end else if UTF8Pos('-s', op) = 1 then
    begin
      UTF8Delete(op, 1, 2);
      StartPage := op;
      try
        StartN := StrToInt(op);
      except
        ExitCode := -1;
        Exit;
      end;
    // 作品URL
    end else if UTF8Pos('https:', op) = 1 then
    begin
      URLadr := op;
      if UTF8Pos('https://www.alphapolis.co.jp/novel/', URLadr) = 0 then
      begin
        MessageDlg('URLが違います.', mtWarning, [mbOK], 0);
      end else begin
        URL.Text := URLadr;
        IsCalled := True;
      end;
    // それ以外であれば保存ファイル名
    end else begin
      FileName := TrimSpace(op);
      if UTF8UpperCase(ExtractFileExt(op)) <> '.TXT' then
        FileName := FileName + '.txt';
      LogFile.Add(NVURL + URL.Text);
    end;
  end;
end;

procedure TadlForm.FormKeyPress(Sender: TObject; var Key: char);
begin
  if Key = #27 then
    fCancel := True;
end;

procedure TadlForm.ExecuteJS;
begin
  Chromium1.ExecuteJavaScript('encodeURI(document.documentElement.outerHTML)', 'about:blank');
end;

procedure TadlForm.Chromium1BeforeClose(Sender: TObject;
			const browser: ICefBrowser);
begin
  FCanClose := True;
  PostMessage(Handle, WM_CLOSE, 0, 0);
end;

procedure StringVisitor(const str: ustring);
begin
  with adlForm do
  begin
    if fTopPage then
    begin
      if (Pos('ページが見つかりません', str) > 1) or
         (Pos('{"content":{"id"', str) > 1) and (Pos('<div id="app-cover-episode-v2"'{'<div class="episodes">'}, str) > 1) then
      begin
        fHTMLSrc := str;
        fTopPage := False;
		  end else
        GetSourceCEF4;
	  end else begin
      if Pos('<div class="p-novel-episode__text"'{'<div class="text " id="novelBody"'}, str) > 1 then
      begin
        fHTMLSrc := str;
		  end else
        GetSourceCEF4;
    end;
  end;
end;

function GetSourceHTML: string;
var
  CefStringVisitor:ICefStringVisitor;
begin
  CefStringVisitor := TCefFastStringVisitor.Create(StringVisitor);
  adlForm.Chromium1.Browser.MainFrame.GetSource(CefStringVisitor);
end;

procedure TadlForm.Chromium1LoadEnd(Sender: TObject;
			const browser: ICefBrowser; const frame: ICefFrame; httpStatusCode: Integer);
begin
  if frame.IsMain then
    GetSourceHTML;
end;

procedure TadlForm.Chromium1TextResultAvailable(Sender: TObject;
			const aText: ustring);
begin
  ;
end;

procedure TadlForm.FormActivate(Sender: TObject);
begin
  if URLadr <> '' then
  begin
    Sleep(500);
    Height := 200;
    Application.ProcessMessages;
    StartBtnClick(nil);
    Height := 81;
    Close;
  end;
end;

procedure TadlForm.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  PageList.Free;
  TextPage.Free;
  LogFile.Free;
end;

procedure TadlForm.Chromium1AfterCreated(Sender: TObject;
			const browser: ICefBrowser);
begin
  PostMessage(Handle, CEF_AFTERCREATED, 0, 0);
end;

procedure TadlForm.CancelBtnClick(Sender: TObject);
begin
  fCancel := True;
end;

procedure TadlForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if Busy then
     CanClose := False
  else begin
    CanClose := FCanClose;

    if not(FClosing) then
    begin
      FClosing := True;
      Visible  := False;
      Chromium1.CloseBrowser(True);
      CEFWindowParent1.Free;
    end;
	end;
end;

procedure TadlForm.FormShow(Sender: TObject);
begin
  inherited;

  if (URLadr <> '') and (FileName  <> '') then
  begin
    Left   := -1000;
    Top    := 0;
    Height := 1000;
  end;
  if not(Chromium1.CreateBrowser(CEFWindowParent1)) then
    Timer1.Enabled := True;
end;

procedure TadlForm.OCBtnClick(Sender: TObject);
begin
  // 閉じた状態であればブラウザを開く
  if Height = FmHt then
  begin
    Height := 1000;
    if URL.Text = '' then
      Chromium1.LoadURL(UTF8Decode('https://www.alphapolis.co.jp/'))
    else
      Chromium1.LoadURL(UTF8Decode(URL.Text));

    OCBtn.Caption := '▲';
  // ブラウザを閉じる
  end else begin
    Height := FmHt;
    OCBtn.Caption := '▼';
    Sleep(100);
  end;
end;

function TadlForm.GetHTMLSrc(URLadr: string): string;
begin
  fHTMLSrc := '';

  Chromium1.LoadURL(UTF8Decode(URLadr));
  while fHTMLSrc = '' do
  begin
    Application.ProcessMessages;
    Sleep(100);
    if fCancel then
      Break;
	end;
  Result := fHTMLSrc;
end;

// 小説本文をHTMLから抜き出して整形する
function TadlForm.ParsePage(Page: string): Boolean;
var
  sp: integer;
  chapt, subt, body: string;
  shp: TSHParser;
begin
  Result := True;

  sp := UTF8Pos(SERRSTR, body);
  if sp > 0 then
  begin
    Result := False;
    Exit;
  end;
	Page  := ChangeAozoraTag(Page);  // 最初に青空文庫のルビタグ文字｜《》を変換する

  shp := TSHParser.Create(Page);
  try
    chapt := shp.FindRegex('<div class="p-novel-episode__chapter-title">', '</div>', False);
    chapt := Trim(chapt);
    chapt := Restore2RealChar(chapt);
    if Chapter = chapt then
      chapt := ''
    else
      Chapter := chapt;
    subt  := shp.FindRegex('<h2 class="p-novel-episode__episode-title">', '</h2>', False);
    subt  := Trim(subt);
    subt  := Restore2RealChar(subt);
    body  := shp.Find('div', 'class', 'p-novel-episode__text', False);
    body  := GetText(body); // HTMLタグの処理
    if chapt <> '' then
      TextPage.Add(AO_CPB + chapt + AO_CPE);
    if (subt <> '') and (body <> '') and (Pos('<div class="dots-indicator"id="LoadingEpisode">', body) = 0) then
    begin
      TextPage.Add(AO_SEB + subt + AO_SEE);
      TextPage.Add(body);
      TextPage.Add('');
      TextPage.Add(AO_PB2);
      TextPage.Add('');
    end else begin
      Result := False;
      //TextPage.Add('本文を取得出来ませんでした.');
      //TextPage.Add(AO_PB2);
    end;
	finally
    shp.Free;
	end;
end;

// 小説の連載状況をチェックする
function TadlForm.GetNovelStatus(MainPage: string): string;
var
  stat: string;
  shp: TSHParser;
begin
  Result := '';
  shp := TSHParser.Create(MainPage);
  try
    stat := shp.Find('div', 'class', 'p-sidebar-content-info__summary', False);
    if UTF8Pos('連載中', stat) > 0 then
      Result := '【連載中】'
    else if UTF8Pos('完結', stat) > 0 then
      Result := '【完結】';
	finally
    shp.Free;
	end;
end;

// トップページからタイトル、作者、前書き、各話情報を取り出す
procedure TadlForm.ParseChapter(MainPage: string);
var
  i: integer;
  ss, title, author, abstrct, fn, sendstr, cv, r18mk: string;
  ws: WideString;
  conhdl: THandle;
  shp: TSHParser;
  r: TRegExpr;
  epurl: TStringList;
begin
  // ページがなくなっている場合の処理
  if Pos('ページが見つかりません', MainPage) > 0 then
  begin
    Exit;
	end;
	shp := TSHParser.Create(MainPage);
  r   := TRegExpr.Create;
  try
    // 表紙画像
    cv      := shp.Find('div', 'class', 'c-content-cover p-sidebar-content-info__cover', False);
    cv      := FindRegex(cv, '<img src="', '"');
    title   := GetText(shp.Find('h1', 'class', 'p-content-info__title is-novel', False));
    // 作者・作者URL
    ss      := shp.Find('div', 'class', 'p-content-info__author-diary', False);
    author  := GetText(FindRegex(ss, '<a href=.*?>', '</a>'));
    AuthURL := FindRegex(ss, '<a href="', '" class=');
    // R-18かどうか
    r18mk   := shp.Find('div', 'class', 'p-sidebar-panel', False);
    if Pos('R18', r18mk) > 1 then
      r18mk := R18MARK
    else
      r18mk := '';
    // あらすじ
    abstrct := GetText(shp.Find('div', 'class', 'p-content-info__abstract', False));
    // 各話ページURL
    epurl   := shp.FindRegexAll('<a class="p-table-of-contents__episode-link" ', '</div></a>', False);
    for i := 0 to epurl.Count - 1 do
    begin
      ss := FindRegex(epurl[i], 'href="', '">');
      PageList.Add(ss);
		end;
    // 保存ファイル名
    if NvStat = '【完結】' then
    begin
      if UTF8Pos('完結', title) = 0 then
        title := NvStat + title;
		end else
      title := NvStat + title;
    title := r18mk + title;
    if Filename = '' then
    begin
      fn := PathFilter(Restore2RealChar(title));
      if UTF8Length(fn) > 26 then
        UTF8Delete(fn, 27, UTF8Length(fn) - 26);
      if StartPage <> '' then
        fn := fn + '(' + StartPage + ')';
      Filename := Path + fn + '.txt';
    end;
    NvTitle.Caption := '作品タイトル：' + title;
    // タイトル名を保存
    TextPage.Add(title);
    // 作者名を保存
    TextPage.Add(author);
    // 表紙画像
    if not ExecRegExpr('https://www.alphapolis.co.jp/img/books/no_image/', cv) then
      TextPage.Add(AO_CVB + cv + AO_CVE);
    TextPage.Add('');
    TextPage.Add(AO_PB2);
    TextPage.Add('');
    LogFile.Add(NVURL + URL.Text);
    LogFile.Add(NVTITL + title);
    LogFile.Add(NVAUTH + author);
    if AuthURL <> '' then
      LogFile.Add(NVAURL + AuthURL);
    TextPage.Add(AO_KKL);
    TextPage.Add(abstrct);
    TextPage.Add(AO_KKR);
    TextPage.Add(AO_PB2);
    LogFile.Add(NVSYNP);
    LogFile.Add(abstrct);
    if IsErr then
      LogFile.Add(#13#10'エラー：取得出来ないページがありました.');
    // Naro2mobiから呼び出された場合は進捗状況をSendする
    if hWnd <> 0 then
    begin
      sendstr := title + ',' + author;
      // 送信する文字列をUTF-16にする
      ws := UTF8ToUTF16(sendstr);
      Cds.dwData := PageList.Count - StartN;
      Cds.cbData := ByteLength(ws) + 2;
      Cds.lpData := PWideChar(ws);
      SendMessage(hWnd, WM_COPYDATA, Application.Handle, LPARAM(Addr(Cds)));
      Application.ProcessMessages;
    end;
	finally
    shp.Free;
    r.Free;
	end;
end;

// 該当ページを取得できたかチェックする
function IsCorrectPage(page: string; curl: string): Boolean;
begin
  Result := ExecRegExpr('content="' + curl, page);
end;

// ダウンロード処理メイン
procedure TadlForm.StartBtnClick(Sender: TObject);
var
  page, stat: string;
  i, cnt, j, k, sc, ct, n: integer;
  done: boolean;
label
  Retry, Quit;
begin
  if UTF8Pos('https://www.alphapolis.co.jp/novel/', URL.Text) = 0 then
  begin
    Status.Caption := '状態：URLをセットしてください.';
    Exit;
  end;
  fCancel := False;
  StartBtn.Enabled := False;
  CancelBtn.Enabled := True;
  URL.Enabled := False;
  TextPage.Clear;
  LogFile.Clear;
  PageList.Clear;
  NvTitle.Caption := '作品タイトル：';
  StartTime := Now;
  IsErr := False;
  Busy := True;
  PrevURL := '';  // エピソードページを取得出来たか判定するために前後ページのURLを用いる
  NextURL := '';
  if ParamCount = 0 then
    FileName := '';

  fTopPage := True;
  page := GetHTMLSrc(URL.Text);
  if page <> '' then
  begin
    NvStat := GetNovelStatus(page);
    ParseChapter(page);
	end;
  if (page = '') or (PageList.Count = 0) then
  begin
    LogFile.Add('エラー：トップページ情報を取得出来ませんでした.');
    fCancel := True;
    Status.Caption :='エラー：トップページ情報を取得出来ませんでした.';
    Goto Quit;
  end;

  Status.Caption := '各話を取得中 [  0/' + Format('%3d', [PageList.Count]) + ']';

  cnt := PageList.Count;
  if StartN > 0 then
    j := StartN
  else
    j := 1;
  ct := 1;
  sc := cnt - j + 1;

  for i := j to cnt do
  begin
    stat := '各話を取得中 [' + Format('%3d', [i]) + '/' + Format('%3d', [cnt]) + '(' + Format('%d', [(ct * 100) div sc]) + '%)]';
    Status.Caption := stat;
    URL.Text := 'https://www.alphapolis.co.jp' + PageList[i - 1];
Retry:
    n := 1;
    done := False;
    // ページ情報から本文を取得できるまで10回繰り返す
    for k := 1 to 10 do
    begin
      page := GetHTMLSrc(URL.Text);
      // 正しいページ情報を所得出来るまで１０回繰り返す
      while not IsCorrectPage(page, URL.Text) do
      begin
        Status.Caption := stat + 'リトライ中(' + IntToStr(n) + ')';
        // リトライを10回行っても駄目だった場合はエラーとする
        if n = 10 then
        begin
          TextPage.Add(URL.Text + '：リトライに失敗しました.');
          LogFile.Add(URL.Text + '：リトライに失敗しました.');
          page := '';
          Break;
        end;
        CEFWindowParent1.SetFocus;  // CEF4にフォーカスを当てる
        Sleep(500);
        page := GetHTMLSrc(URL.Text);
		  end;
      if ParsePage(page) then
      begin
        done := True;
        Break;
      end;
		end;
    if not done then
    begin
      TextPage.Add(URL.Text + '：ページ情報を取得出来ませんでした.');
      LogFile.Add(URL.Text + '：ページ情報を取得出来ませんでした.');
      IsErr := True;
		end;
		if hWnd <> 0 then
    begin
      Application.ProcessMessages;
      SendMessage(hWnd, WM_DLINFO, i, 1);
    end;
    if fCancel then
      Break;
    Elapsed.Caption := '経過時間：' + FormatDateTime('nn:ss', Now - StartTime);
    Inc(ct);
  end;
  if not fCancel then
  begin
    Status.Caption := stat + '・・完了';
    if FileName <> '' then
    begin
      TextPage.WriteBOM := True;
      LogFile.WriteBOM  := True;
      TextPage.SaveToFile(FileName, TEncoding.UTF8);
      LogFile.SaveToFile(ChangeFileExt(Filename, '.log'), TEncoding.UTF8);
    end;
  end else begin
    if (FileName = '') or IsErr then
      Status.Caption := Status.Caption + '・・失敗'
    else
      Status.Caption := Status.Caption + '・・中止';
    if FileName <> '' then
    begin
      LogFile.Add('');
      LogFile.Add('処理は中止されました.');
      LogFile.SaveToFile(ChangeFileExt(Filename, '.log'), TEncoding.UTF8);
    end;
  end;
  Elapsed.Caption := '経過時間：' + FormatDateTime('nn:ss', Now - StartTime);
Quit:
  URL.Enabled := True;
  StartBtn.Enabled := True;
  CancelBtn.Enabled := False;
  Busy := False;
end;

procedure TadlForm.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled := False;
  if not(Chromium1.CreateBrowser(CEFWindowParent1)) and not(Chromium1.Initialized) then
    Timer1.Enabled := True;
end;

procedure TadlForm.WMMove(var aMessage: TWMMove);
begin
  inherited;

  if (Chromium1 <> nil) then Chromium1.NotifyMoveOrResizeStarted;
end;

procedure TadlForm.WMMoving(var aMessage: TMessage);
begin
  inherited;

  if (Chromium1 <> nil) then Chromium1.NotifyMoveOrResizeStarted;
end;

procedure TadlForm.WMEnterMenuLoop(var aMessage: TMessage);
begin
  inherited;

  if (aMessage.wParam = 0) and (GlobalCEFApp <> nil) then GlobalCEFApp.OsmodalLoop := True;
end;

procedure TadlForm.WMExitMenuLoop(var aMessage: TMessage);
begin
  inherited;

  if (aMessage.wParam = 0) and (GlobalCEFApp <> nil) then GlobalCEFApp.OsmodalLoop := False;
end;

procedure TadlForm.BrowserCreatedMsg(var aMessage: TMessage);
begin
  ;
end;

end.

