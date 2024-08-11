﻿(*
  アルファポリス小説ダウンローダー[alphadlw]

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
unit alphaunit;

{$IFDEF FPC}
  {$MODE Delphi}
  {$CODETYPE utf8}
{$ENDIF}

interface

uses
{$IFDEF FPC}
  Windows, Messages, SysUtils, Classes, Graphics,
  Controls, Forms, Dialogs, ExtCtrls, StdCtrls, Buttons, LazUTF8,
{$ELSE}
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons,
  Lazutf8wrap,
{$ENDIF}
  WinINet, RegExpr,
  uWVBrowserBase, uWVBrowser,uWVWindowParent, uWVTypes, uWVTypeLibrary, uWVLoader, uWVWinControl;

type

  { TAlphadl }

  TAlphadl = class(TForm)
    Panel1: TPanel;
    WV2: TWVBrowser;
    Timer1: TTimer;
    Panel2: TPanel;
    CancelBtn: TButton;
    StartBtn: TButton;
    NvTitle: TLabel;
    URL: TEdit;
    Elapsed: TLabel;
    Status: TLabel;
    Label1: TLabel;
    OCBtn: TSpeedButton;
    Timer2: TTimer;
    WVWindowParent1: TWVWindowParent;
    procedure CancelBtnClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: char);
    procedure FormShow(Sender: TObject);
    procedure StartBtnClick(Sender: TObject);
    procedure WV2AfterCreated(Sender: TObject);
    procedure WV2ExecuteScriptCompleted(Sender: TObject;
      aErrorCode: HRESULT; const aResultObjectAsJson: wvstring;
      aExecutionID: integer);
    procedure WV2InitializationError(Sender: TObject;
      aErrorCode: HRESULT; const aErrorMessage: wvstring);
    procedure WV2NavigationCompleted(Sender: TObject;
      const aWebView: ICoreWebView2;
      const aArgs: ICoreWebView2NavigationCompletedEventArgs);
    procedure WV2RetrieveHTMLCompleted(Sender: TObject;
      aResult: boolean; const aHTML: wvstring);
    procedure WV2SourceChanged(Sender: TObject;
      const aWebView: ICoreWebView2;
      const aArgs: ICoreWebView2SourceChangedEventArgs);
    procedure Timer1Timer(Sender: TObject);
    procedure OCBtnClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure WV2LostFocus(Sender: TObject);
  private
    Done,
    Cancel,
    Busy,
    WVCreated: boolean;
    TBuff: string;
    StartTime: TTime;
    FmHt: integer;
    IsCalled: Boolean;
    function GetHTMLSrc(aURL: string): string;
  public

  end;

var
  Alphadl: TAlphadl;

implementation

{$IFDEF FPC}
  {$R *.lfm}
{$ELSE}
  {$R *.dfm}
{$ENDIF}
{$R verinfo.res}

{ TAlphadl }

const
  // データ抽出用の識別タグ
  STITLEB  = '<h1 class="title">';     // 小説表題
  STITLEE  = '</h1>';
  SAUTHERB = '<div class="author">';   // 作者
  SAUTHERE = '</a>';
  SHEADERB = '<div class="abstract">'; // 前書き
  SHEADERE = '</div>';
  SSTRURLB = '<div class="episode ">    <a href="';
  SSTRURLE = '" >';
  SSTTLB   = '<span class="title"><span class="bookmark-dummy"></span>';
  SSTTLE   = '</span>';

  SCAPTB   = '<div class=chapter-title>';
  SCAPTE   = '</div>';
  SEPISB   = '<h2 class=episode-title>';
  SEPISE   = '</h2>';
  //SBODYB   = '<div class="text " id="novelBoby">';
  SBODYB   = '<div class=text  id=novelBody.*?>';
  SBODYE   = '</div>';
  SERRSTR  = '<div class=dots-indicator';
  SPICTB   = '<div class=story-image>.*?<img src=';
  //SPICTM   = ' target=_blank><img src=';
  SPICTE   = ' alt=.*?</div>';
  SCOVERB  = '<div class="cover">';
  SCOVERE  = '" alt=""/>';
  SHEAD    = '<span class="content-status complete">';
  SBOMISS  = '<div class=dots-indicator id=LoadingEpisode>';

  // 青空文庫形式
  AO_RBI = '｜';							// ルビのかかり始め(必ずある訳ではない)
  AO_RBL = '《';              // ルビ始め
  AO_RBR = '》';              // ルビ終わり
  AO_TGI = '［＃';            // 青空文庫書式設定開始
  AO_TGO = '］';              //        〃       終了
  AO_CPI = '［＃「';          // 見出しの開始
  AO_CPT = '」は大見出し］';	// 章
  AO_SEC = '」は中見出し］';  // 話
  AO_PRT = '」は小見出し］';

  AO_CPB = '［＃大見出し］';        // 2022/12/28 こちらのタグに変更
  AO_CPE = '［＃大見出し終わり］';
  AO_SEB = '［＃中見出し］';
  AO_SEE = '［＃中見出し終わり］';
  AO_PRB = '［＃小見出し］';
  AO_PRE = '［＃小見出し終わり］';

  AO_DAI = '［＃ここから';		// ブロックの字下げ開始
  AO_DAO = '［＃ここで字下げ終わり］';
  AO_DAN = '字下げ］';
  AO_PGB = '［＃改丁］';			// 改丁と会ページはページ送りなのか見開き分の
  AO_PB2 = '［＃改ページ］';	// 送りかの違いがあるがどちらもページ送りとする
  AO_BED = '［＃本文終わり］';// 本文終わり(Body End)
  AO_SM1 = '」に傍点］';			// ルビ傍点
  AO_SM2 = '」に丸傍点］';		// ルビ傍点 どちらもsesami_dotで扱う
  AO_EMB = '［＃丸傍点］';        // 横転開始
  AO_EME = '［＃丸傍点終わり］';  // 傍点終わり
  AO_KKL = '［＃ここから罫囲み］' ;     // 本来は罫囲み範囲の指定だが、前書きや後書き等を
  AO_KKR = '［＃ここで罫囲み終わり］';  // 一段小さい文字で表記するために使用する
  AO_END = '底本：';          // ページフッダ開始（必ずあるとは限らない）
  AO_PIB = '［＃リンクの図（';          // 画像埋め込み
  AO_PIE = '）入る］';        // 画像埋め込み終わり
  AO_CVB = '［＃表紙の図（';  // 表紙画像指定
  AO_CVE = '）入る］';        // 終わり

  CRLF   = #$0D#$0A;


{ 青空文庫形式

  テキストヘッダ
		作品の表題
		原作の表題（翻訳作品で、底本に記載のある場合）
		副題（副題がある場合）
		原作の副題（副題がある翻訳作品で、底本に記載のある場合）
		著者名
		翻訳者名（翻訳の場合）

	ルビ
  	<ruby><rb>亜米利加</rb><rp>（</rp><rt>アメリカ</rt><rp>）</rp></ruby>
  	亜米利加《アメリカ》
}

// ユーザメッセージID
  WM_DLINFO  = WM_USER + 30;

var
  TextPage,
  PageList,
  TitleList,
  LogFile: TStringList;
  URLadr, Path,
  Chapter,
  NvStat,
  AuthURL,
  FileName,
  StartPage: string;
  hWnd: THandle;
  CDS: TCopyDataStruct;
  StartN: integer;

// WinINetを用いたHTMLファイルのダウンロード
function LoadFromHTML(URLadr: string): string;
var
  hSession    : HINTERNET;
  hService    : HINTERNET;
  dwBytesRead : DWORD;
  dwFlag      : DWORD;
  lpBuffer    : PChar;
  RBuff       : TMemoryStream;
  TBuff       : TStringList;
begin
  Result   := '';
  hSession := InternetOpen('WinINet', INTERNET_OPEN_TYPE_PRECONFIG, nil, nil, 0);

  if Assigned(hSession) then
  begin
    dwFlag   := INTERNET_FLAG_RELOAD;
    hService := InternetOpenUrl(hSession, PChar(URLadr), nil, 0, dwFlag, 0);
    if Assigned(hService ) then
    begin
      RBuff := TMemoryStream.Create;
      try
        lpBuffer := AllocMem(65536);
        try
          dwBytesRead := 65535;
          while True do
          begin
            if InternetReadFile(hService, lpBuffer, 65535,{SizeOf(lpBuffer),}dwBytesRead) then
            begin
              if dwBytesRead = 0 then
                break;
              RBuff.WriteBuffer(lpBuffer^, dwBytesRead);
            end else
              break;
          end;
        finally
          FreeMem(lpBuffer);
        end;
        TBuff := TStringList.Create;
        try
          RBuff.Position := 0;
          TBuff.LoadFromStream(RBuff, TEncoding.UTF8);
          Result := TBuff.Text;
        finally
          TBuff.Free;
        end;
      finally
        RBuff.Free;
      end;
    end;
    InternetCloseHandle(hService);
  end;
end;

// HTMLテキスト内のCR/LF(#$0D#$0A)を除去しTAB文字を半角スペースに変換する
function ElimCRLF(Base: string): string;
var
  tmp: string;
begin
  tmp := UTF8StringReplace(Base, #$0D, '', [rfReplaceAll]);
  tmp := UTF8StringReplace(tmp,  #$0A, '', [rfReplaceAll]);
  tmp := UTF8StringReplace(tmp,  #$09, ' ', [rfReplaceAll]);
  Result := tmp;
end;

// 指定された文字列の前と後のスペース(' '/'　'/#$20/#$09/#$0D/#$0A)を除去する
// '　　文字　列　　' → '文字　列'
function TrimSpace(Base: string): string;
var
  p: integer;
  c: char;
begin
  while True do
  begin
    if UTF8Length(Base) = 0 then
      Break;
    c := Base[1];
    if UTF8Pos(c, ' 　'#$09#$0D#$0A) > 0 then
      UTF8Delete(Base, 1, 1)
    else
      Break;
  end;
  while True do
  begin
    p := UTF8Length(Base);
    if p = 0 then
      Break;
    c := Base[p];
    if UTF8Pos(c, ' 　'#$09#$0D#$0A) > 0 then
      UTF8Delete(Base, p, 1)
    else
      Break;
  end;
  Result := Base;
end;

// 本文の改行タグを削除する
function ChangeBRK(Base: string): string;
begin
  Result := UTF8StringReplace(Base, '<br />', '', [rfReplaceAll]);
  Result := UTF8StringReplace(Result, '<br>', '', [rfReplaceAll]);
end;

// 本文の青空文庫ルビ指定に用いられる文字があった場合誤作動しないように青空文庫代替表記に変換する(2022/3/25)
function ChangeAozoraTag(Base: string): string;
var
  tmp: string;
begin
  tmp := UTF8StringReplace(Base, '《', '※［＃始め二重山括弧、1-1-52］',  [rfReplaceAll]);
  tmp := UTF8StringReplace(tmp,  '》', '※［＃終わり二重山括弧、1-1-53］',  [rfReplaceAll]);
  tmp := UTF8StringReplace(tmp,  '｜', '※［＃縦線、1-1-35］',   [rfReplaceAll]);
  Result := tmp;
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

// Delphi XE2ではUTF8Pos関数に検索開始位置を指定出来ないための代替え
function PosN(SubStr, Str: string; StartPos: integer): integer;
var
  tmp: string;
  p: integer;
begin
  tmp := UTF8Copy(Str, StartPos, UTF8Length(Str));
  p := UTF8Pos(SubStr, tmp);
  if p > 0 then
    Result := p + StartPos - 1  // 1ベーススタートのため1を引く
  else
    Result := 0;
end;

// HTML特殊文字の処理
// 1)エスケープ文字列 → 実際の文字
// 2)&#x????; → 通常の文字
function Restore2RealChar(Base: string): string;
var
  tmp, cd: string;
  w: integer;
  ch: Char;
  r: TRegExpr;
begin
  // エスケープされた文字
  tmp := UTF8StringReplace(Base, '&lt;',      '<',  [rfReplaceAll]);
  tmp := UTF8StringReplace(tmp,  '&gt;',      '>',  [rfReplaceAll]);
  tmp := UTF8StringReplace(tmp,  '&quot;',    '"',  [rfReplaceAll]);
  tmp := UTF8StringReplace(tmp,  '&nbsp;',    ' ',  [rfReplaceAll]);
  tmp := UTF8StringReplace(tmp,  '&yen;',     '\',  [rfReplaceAll]);
  tmp := UTF8StringReplace(tmp,  '&brvbar;',  '|',  [rfReplaceAll]);
  tmp := UTF8StringReplace(tmp,  '&copy;',    '©',  [rfReplaceAll]);
  tmp := UTF8StringReplace(tmp,  '&amp;',     '&',  [rfReplaceAll]);
  // &#????;にエンコードされた文字をデコードする(2023/3/19)
  // 正規表現による処理に変更した(2024/3/9)
  r := TRegExpr.Create;
  try
    r.Expression  := '&#.*?;';
    r.InputString := tmp;
    if r.Exec then
    begin
      repeat
        UTF8Delete(tmp, r.MatchPos[0], r.MatchLen[0]);
        cd := r.Match[0];
        UTF8Delete(cd, 1, 2);           // &#を削除する
        UTF8Delete(cd, UTF8Length(cd), 1);  // 最後の;を削除する
        if cd[1] = 'x' then         // 先頭が16進数を表すxであればDelphiの16進数接頭文字$に変更する
          cd[1] := '$';
        try
          w := StrToInt(cd);
          ch := Char(w);
        except
          ch := '?';
        end;
        UTF8Insert(ch, tmp, r.MatchPos[0]);
      until not r.ExecNext;
    end;
  finally
    r.Free;
  end;
  Result := tmp;
end;

// 埋め込まれた画像リンクを青空文庫形式に変換する
// 但し、画像ファイルはダウンロードせずにリンク先をそのまま埋め込む
function ChangeImage(Base: string): string;
var
  p, p2: integer;
  lnk: string;
  r: TRegExpr;
begin
  r := TRegExpr.Create;
  try
    r.Expression  := SPICTB;
    while r.Exec(Base) do
    begin
      p := r.MatchPos[0];
      UTF8Delete(Base, p, r.MatchLen[0]);
      r.Expression  := SPICTE;
      if r.Exec(Base) then
      begin
        p2 := r.MatchPos[0];
        lnk := UTF8Copy(Base, p, p2 - p);
        UTF8Delete(Base, p, p2 - p + r.MatchLen[0]);
        UTF8Insert(AO_PIE, Base, p);
        UTF8Insert(lnk, Base, p);
        UTF8Insert(AO_PIB, Base, p);
        r.Expression  := SPICTB;
      end else
        Break;
    end;
  finally
    r.Free;
  end;
  Result := Base;
end;

// タイトル名をファイル名として使用出来るかどうかチェックし、使用不可文字が
// あれば修正する('-'に置き換える)
// フォルダ名の最後が'.'の場合、フォルダ作成時に"."が無視されてフォルダ名が
// 見つからないことになるため'.'も'-'で置き換える
// LazarusではUTF8文字列をインデックス(string[])でアクセス出来ないため、
// UTF8Copy, UTF8Delete, UTF8Insert処理で置き換える
{$IFDEF FPC}
function PathFilter(PassName: string): string;
var
  i, l: integer;
  path: string;
  tmp: AnsiString;
  ch: string;     // LazarusではCharにUTF-8の文字を代入できないためstringで定義する
begin
  // ファイル名を一旦ShiftJISに変換して再度Unicode化することでShiftJISで使用
  // 出来ない文字を除去する
  tmp := UTF8ToWinCP(PassName);
  path := WinCPToUTF8(tmp);      // これでUTF-8依存文字は??に置き換わる
  l :=  UTF8Length(path);
  for i := 1 to l do
  begin
    ch := UTF8Copy(path, i, 1); // i番目の文字を取り出す
    if UTF8Pos(ch, '\/;:*?"<>|. '+#$09) > 0 then // 文字種が使用不可であれば
    begin
      UTF8Delete(path, i, 1);                // 該当文字を削除して
      UTF8Insert('-', path, i);              // 代わりに'-'を挿入する
    end;
  end;
  Result := path;
end;
{$ELSE} // Delphiの場合
function PathFilter(PassName: string): string;
var
	i, l: integer;
  path: string;
  tmp: AnsiString;
  ch: char;
begin
  // ファイル名を一旦ShiftJISに変換して再度Unicode化することでShiftJISで使用
  // 出来ない文字を除去する
  tmp := AnsiString(PassName);
	path := string(tmp);
  l :=  UTF8Length(path);
  for i := 1 to l do
  begin
  	ch := Char(path[i]);
    if UTF8Pos(ch, '\/;:*?"<>|. '+#$09) > 0 then
      path[i] := '-';
  end;
  Result := path;
end;
{$ENDIF}

// 小説本文をHTMLから抜き出して整形する
function ParsePage(Page: string): Boolean;
var
  sp, ep: integer;
  capt, subt, body: string;
  r: TRegExpr;
begin
  Result := True;

  sp := UTF8Pos(SERRSTR, body);
  if sp > 0 then
  begin
    Result := False;
  end;

  Page := ChangeAozoraTag(Page);  // 最初に青空文庫のルビタグ文字｜《》を変換する

  sp := UTF8Pos(SCAPTB, Page);
  if sp > 1 then
  begin
    UTF8Delete(Page, 1, UTF8Length(SCAPTB) + sp - 1);
    ep := UTF8Pos(SCAPTE, Page);
    if ep > 1 then
    begin
      capt := UTF8Copy(Page, 1, ep - 1);
      capt := TrimSpace(capt);
      capt := Restore2RealChar(capt);
      if Chapter = capt then
        capt := ''
      else
        Chapter := capt;
      UTF8Delete(Page, 1, UTF8Length(SCAPTE) + ep - 1);
    end;
  end else
    capt := '';
  // 本文の終わりを</div>で検出するため、同様に</div>で終了する埋め込み画像を
  // 最初に処理しておく(2022/2/2)
  Page := ChangeImage(Page);

  sp := UTF8Pos(SEPISB, Page);
  if sp > 1 then
  begin
    UTF8Delete(Page, 1, UTF8Length(SEPISB) + sp - 1);
    ep := UTF8Pos(SEPISE, Page);
    if ep > 1 then
    begin
      subt := UTF8Copy(Page, 1, ep - 1);
      subt := TrimSpace(subt);
      subt := Restore2RealChar(subt);
      UTF8Delete(Page, 1, UTF8Length(SEPISB) + ep - 1);

      r := TRegExpr.Create;
      try
        r.Expression  := SBODYB;
        r.InputString := Page;
        if r.Exec then
        begin
          UTF8Delete(Page, 1, r.MatchPos[0] + r.MatchLen[0] - 1);
          ep := UTF8Pos(SBODYE, Page);
          if ep > 1 then
          begin
            body := UTF8Copy(Page, 1, ep - 1);
            body := ChangeBRK(body);        // </ br>をCRLFに変換する
            body := ChangeRuby(body);       // ルビのタグを変換する
            body := ChangeEm(body);         // 強調（傍点）タグを変換する
            body := Restore2RealChar(body); // エスケースされた特殊文字を本来の文字に変換する

            if UTF8Length(capt) > 0 then
              TextPage.Add(AO_CPB + capt + AO_CPE);
            TextPage.Add(AO_SEB + subt + AO_SEE);
            TextPage.Add(body);
            TextPage.Add('');
            TextPage.Add(AO_PB2);
            TextPage.Add('');
          end;
        end;
      finally
        r.Free;
      end;
    end;
    Result := True;
  end else begin
    TextPage.Add('本文を取得出来ませんでした.');
    TextPage.Add(AO_PB2);
  end;
end;

// 小説の連載状況をチェックする
function GetNovelStatus(MainPage: string): string;
var
  str: string;
  p: integer;
begin
  Result := '';
  p := UTF8Pos(SHEAD, MainPage);
  if p > 0 then
  begin
    str := UTF8Copy(MainPage, p + UTF8Length(SHEAD), 12);
    if UTF8Pos('連載中', str) > 0 then
      Result := '【連載中】'
    else if UTF8Pos('完結', str) > 0 then
      Result := '【完結】';
  end;
end;


// トップページからタイトル、作者、前書き、各話情報を取り出す
procedure ParseChapter(MainPage: string);
var
  sp, ep: integer;
  ss, ts, title, auther, fn, sendstr, cv: string;
  conhdl: THandle;
begin

  // タイトル名
  sp := UTF8Pos(STITLEB, MainPage);
  if sp > 0 then
  begin
    UTF8Delete(MainPage, 1, sp + UTF8Length(STITLEB) - 1);
    sp := UTF8Pos(STITLEE, MainPage);
    if sp > 1 then
    begin
      ss := UTF8Copy(MainPage, 1, sp - 1);
      while (ss[1] <= ' ') do
        UTF8Delete(ss, 1, 1);
      // タイトル名からファイル名に使用できない文字を除去する
      title := PathFilter(Restore2RealChar(ss));
      // 引数に保存するファイル名を指定していなかった場合、タイトル名からファイル名を作成する
      if UTF8Length(Filename) = 0 then
      begin
        fn := title;
        if UTF8Length(fn) > 26 then
          UTF8Delete(fn, 27, UTF8Length(fn) - 26);
        if StartPage <> '' then
          fn := fn + '(' + StartPage + ')';

        Filename := Path + fn + '.txt';
      end;
      // タイトル名に"完結"が含まれていなければ先頭に小説の連載状況を追加する
      if UTF8Pos('完結', title) = 0 then
        title := NvStat + title;
      Alphadl.NvTitle.Caption := '作品タイトル：' + title;
      // タイトル名を保存
      TextPage.Add(title);
      LogFile.Add('タイトル：' + title);
      UTF8Delete(MainPage, 1, sp + UTF8Length(STITLEE));
      // 作者名
      AuthURL := '';
      sp := UTF8Pos(SAUTHERB, MainPage);
      if sp > 1  then
      begin
        UTF8Delete(MainPage, 1, sp + UTF8Length(SAUTHERB) - 1);
        ep := UTF8Pos(SAUTHERE, MainPage);
        if ep > 1 then
        begin
          ts := UTF8Copy(MainPage, 1, ep - 1);
          sp := UTF8Pos('<a href="', ts);
          UTF8Delete(ts, 1, sp + UTF8Length('<a href="') - 1);
          sp := UTF8Pos('">', ts);
          AuthURL := UTF8Copy(ts, 1, sp - 1);
          UTF8Delete(ts, 1, sp + 1);
          auther := ts;
          // 作者名を保存
          TextPage.Add(auther);
          TextPage.Add('');
          TextPage.Add(AO_PB2);
          TextPage.Add('');
          LogFile.Add('作者　　：' + auther);
          if AuthURL <> '' then
            LogFile.Add('作者URL : ' + AuthURL);
          UTF8Delete(MainPage, 1, ep + UTF8Length(SAUTHERE));
          // 前書き（あらすじ）
          sp := UTF8Pos(SHEADERB, MainPage);
          if sp > 1 then
          begin
            UTF8Delete(MainPage, 1, sp + UTF8Length(SHEADERB) - 1);
            ep := UTF8Pos(SHEADERE, MainPage);
            if ep > 1 then
            begin
              ts := UTF8Copy(MainPage, 1, ep - 1);
              ts := ChangeBRK(ts);
              TextPage.Add(AO_KKL);
              TextPage.Add(ts);
              TextPage.Add(AO_KKR);
              TextPage.Add(AO_PB2);
              LogFile.Add('あらすじ：');
              LogFile.Add(ts);
            end;
          end;
          // 各ページ情報を取得
          // #$0D#$0Aを削除する
          MainPage := ElimCRLF(MainPage);
          sp := UTF8Pos(SSTRURLB, MainPage);
          while sp > 1 do
          begin
            UTF8Delete(MainPage, 1, sp + UTF8Length(SSTRURLB) - 1);
            ep := UTF8Pos(SSTRURLE, MainPage);
            if ep > 1 then
            begin
              ts := UTF8Copy(MainPage, 1, ep - 1);
              UTF8Delete(MainPage, 1, ep + UTF8Length(SSTRURLE) - 1);
              sp := UTF8Pos(SSTTLB, MainPage);
              if sp > 1 then
              begin
                UTF8Delete(MainPage, 1, UTF8Length(SSTTLB) + sp - 1);
                ep := UTF8Pos(SSTTLE, MainPage);
                if ep > 1 then
                begin
                  ss := UTF8Copy(MainPage, 1, ep - 1);
                  UTF8Delete(MainPage, 1, UTF8Length(SSTTLE) + ep - 1);
                  PageList.Add(ts);
                  TitleList.Add(ss);
                  sp := UTF8Pos(SSTRURLB, MainPage);
                end else
                  Break;
              end else
                Break;
            end else
              Break;
          end;
          // 表紙画像をチェック
          sp := UTF8Pos(SCOVERB, MainPage);
          if sp > 1 then
          begin
            UTF8Delete(MainPage, 1, sp + UTF8Length(SCOVERB));
            sp := UTF8Pos('<img src="', MainPage);
            if sp > 0 then
            begin
              UTF8Delete(MainPage, 1, sp + UTF8Length('<img src="') - 1);
              ep := UTF8Pos('">', MainPage);
              cv := UTF8Copy(MainPage, 1, ep - 1);
              if UTF8Pos('alphapolis.co.jp/img/books/no_image/', cv) = 0 then
                TextPage.Insert(2, AO_CVB + cv + AO_CVE);
            end;
          end;
          // Naro2mobiから呼び出された場合は進捗状況をSendする
          if hWnd <> 0 then
          begin
            conhdl := GetStdHandle(STD_OUTPUT_HANDLE);
            sendstr := title + ',' + auther;
            Cds.dwData := PageList.Count - StartN;
            Cds.cbData := (UTF8Length(sendstr) + 1) * SizeOf(Char);
            Cds.lpData := Pointer(sendstr);
            SendMessage(hWnd, WM_COPYDATA, conhdl, LPARAM(Addr(Cds)));
          end;
        end;
      end;
    end;
  end;
end;

function TAlphadl.GetHTMLSrc(aURL:string): string;
var
  cnt: integer;
  tout: boolean;
begin
  Result := '';
  Done := False;
  tout := False;

  SetActiveWindow(Handle);
  // 各話本文を表示させるためにWebページにフォーカスを当てる
  //WVWindowParent1.SetFocus;
  WV2.SetFocus;
  WV2.Navigate(aURL);
  while WV2.IsNavigating do
  begin
    Sleep(10);
    Application.ProcessMessages;
    if Cancel then
    Break;
  end;
  cnt := 0;
  while not Done do
  begin
    Application.ProcessMessages;
    Sleep(100);
    Inc(cnt);
    if cnt > 50 then
    begin
      tout := True;
      Break;
    end;
  end;
  if not tout then
    Result := TBuff;
end;

procedure TAlphadl.WV2AfterCreated(Sender: TObject);
begin
  WVWindowParent1.UpdateSize;
end;

procedure TAlphadl.FormCreate(Sender: TObject);
var
  cfg, opt, op: string;
  f: TextFile;
  i: integer;
begin
  WVCreated := False;
  Done      := False;
  TextPage  := TStringList.Create;
  LogFile   := TStringList.Create;
  PageList  := TStringList.Create;
  TitleList := TStringList.Create;
  FmHt      := Height;
  IsCalled  := False;
  FileName := '';

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
    end;
  end;
end;

procedure TAlphadl.FormKeyPress(Sender: TObject; var Key: char);
begin
  if Key = #27 then
    Cancel := True;
end;

procedure TAlphadl.FormShow(Sender: TObject);
begin
  inherited;
  if (URLadr <> '') and (FileName  <> '') then
  begin
    Left   := -1000;
    Top    := 0;
    Height := 1000;
  end;
  if GlobalWebView2Loader.InitializationError then
    showmessage(GlobalWebView2Loader.ErrorMessage)
  else if GlobalWebView2Loader.Initialized then
    WV2.CreateBrowser(WVWindowParent1.Handle)
  else
    Timer1.Enabled := True;
end;

procedure TAlphadl.OCBtnClick(Sender: TObject);
begin
  // 閉じた状態であればブラウザを開く
  if Height = FmHt then
  begin
    Height := 1000;
    if URL.Text = '' then
      WV2.Navigate('https://www.alphapolis.co.jp/novel')
    else
      WV2.Navigate(URL.Text);

    OCBtn.Caption := '▲';
  // ブラウザを閉じる
  end else begin
    Height := FmHt;
    OCBtn.Caption := '▼';
    Sleep(100);
  end;
end;

procedure TAlphadl.StartBtnClick(Sender: TObject);
var
  i, cnt, j, sc, ct, n: integer;
  sttl: string;
label
  Quit;
begin
  if UTF8Pos('https://www.alphapolis.co.jp/novel/', URL.Text) = 0 then
  begin
    Status.Caption := '状態：URLをセットしてください.';
    Exit;
  end;
  Cancel := False;
  StartBtn.Enabled := False;
  CancelBtn.Enabled := True;
  URL.Enabled := False;
  TextPage.Clear;
  LogFile.Clear;
  PageList.Clear;
  TitleList.Clear;
  NvTitle.Caption := '作品タイトル：';
  StartTime := Now;
  Busy := True;

  // トップページ情報を取得する
  TBuff := LoadFromHTML(URL.Text);
  if TBuff <> '' then
  begin
    NvStat := GetNovelStatus(TBuff);
    ParseChapter(TBuff)
  end;
  if (TBuff = '') or (PageList.Count = 0) then
  begin
    LogFile.Add('エラー：トップページ情報を取得出来ませんでした.');
    Cancel := True;
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
    Status.Caption := '各話を取得中 [' + Format('%3d', [i]) + '/' + Format('%3d', [cnt]) + '(' + Format('%d', [(ct * 100) div sc]) + '%)]';

    Done := False;
    URL.Text := PageList[i - 1];
    sttl := TitleList[i - 1];

    n := 1;
    TBuff := GetHTMLSrc(URL.Text);
    While UTF8Pos(sttl, TBuff) = 0 do
    begin
      Status.Caption := '情報を取得出来ないためリロード中(' + IntToStr(n) + ')';
      Sleep(10);
      TBuff := GetHTMLSrc(URL.Text);
      Inc(n);
      if n = 20 then
      begin
        TextPage.Add('★エラー：ページDLタイムアウト');
        Break;
      end;
      if Cancel then
        Break;
    end;
    n := 1;
    // 各話ページにフォーカスがないと本文が消えて取得出来なくなるため
    // その場合は再度取得を試みる
    while UTF8Pos(SBOMISS, TBuff) > 0 do
    begin
      Status.Caption := '情報を取得出来ないためリロード中(' + IntToStr(n) + ')';
      Sleep(10);
      TBuff := GetHTMLSrc(URL.Text);
      Inc(n);
      // 再取得を30回試みても取得出来ない場合はエラーとする
      if n = 30 then
      begin
        TextPage.Add('★エラー：ページDLタイムアウト');
        Break;
      end;
      if Cancel then
        Break;
    end;
    if not ParsePage(TBuff) then
    begin
      TextPage.Add('★エラー：ページ情報を取得出来ない');
      Break;
    end;
    if hWnd <> 0 then
      SendMessage(hWnd, WM_DLINFO, i, 1);
    if Cancel then
      Break;
    Status.Caption := '各話を取得中 [' + Format('%3d', [i]) + '/' + Format('%3d', [cnt]) + '(' + Format('%d', [(ct * 100) div sc]) + '%)]';
    Elapsed.Caption := '経過時間：' + FormatDateTime('nn:ss', Now - StartTime);
    Inc(ct);
  end;
  if not Cancel then
  begin
    Status.Caption := Status.Caption + '・・完了';
    if FileName <> '' then
    begin
      //MessageDlg(FileName, mtWarning, [mbOK], 0);
      TextPage.WriteBOM := True;
      LogFile.WriteBOM  := True;
      TextPage.SaveToFile(FileName, TEncoding.UTF8);
      LogFile.SaveToFile(ChangeFileExt(Filename, '.log'), TEncoding.UTF8);
    end;
  end else begin
    if FileName = '' then
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

procedure TAlphadl.FormActivate(Sender: TObject);
begin
  if (URLadr <> '') and (FileName  <> '') then
  begin
    StartBtnClick(nil);
    Close;
  end;
end;

procedure TAlphadl.FormClose(Sender: TObject; var Action: TCloseAction);
var
  cfg, opt: string;
  f: TextFile;
begin
  // パラメータを保存する(IniFilesを用いるほどではないので原始的な方法で)
  cfg := ChangeFileExt(Application.ExeName, '.cfg');
  try
    AssignFile(f, cfg);
    Rewrite(f);
    Writeln(f, opt);
    if not isCalled then
    begin
      if Left > 0 then
        opt := IntToStr(Left)
      else
        opt := '300';
      Writeln(f, opt);
      if Top > 0 then
        opt := IntToStr(Top)
      else
        opt := '200';
      Writeln(f, opt);
    end else begin
      opt := '300';
      Writeln(f, opt);
      opt := '200';
      Writeln(f, opt);
    end;
  finally
    CloseFile(f);
  end;
end;

procedure TAlphadl.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if Busy then
    CanClose := False
  else begin
    TitleList.Free;
    PageList.Free;
    TextPage.Free;
    LogFile.Free;
  end;
end;

procedure TAlphadl.CancelBtnClick(Sender: TObject);
begin
  Cancel := True;
end;

procedure TAlphadl.WV2ExecuteScriptCompleted(Sender: TObject;
  aErrorCode: HRESULT; const aResultObjectAsJson: wvstring;
  aExecutionID: integer);
begin
  if aResultObjectAsJson <> '' then
  begin
    WV2.RetrieveHTML;
  end else begin
    WV2.ExecuteScript('encodeURI(document.documentElement.outerHTML)');
  end;
end;

procedure TAlphadl.WV2InitializationError(Sender: TObject;
  aErrorCode: HRESULT; const aErrorMessage: wvstring);
begin
  showmessage(string(aErrorMessage));
end;

procedure TAlphadl.WV2LostFocus(Sender: TObject);
begin
  //WV2.SetFocus;
end;

procedure TAlphadl.WV2NavigationCompleted(Sender: TObject;
  const aWebView: ICoreWebView2;
  const aArgs: ICoreWebView2NavigationCompletedEventArgs);
begin
  if not Done then
    WV2.ExecuteScript('encodeURI(document.documentElement.outerHTML)');
end;

// JavaScriptの実行が終わるとコールされる
procedure TAlphadl.WV2RetrieveHTMLCompleted(Sender: TObject;
  aResult: boolean; const aHTML: wvstring);
var
  src: string;
begin
  if aHTML <> '' then
  begin
    src := aHTML;
    src := UTF8StringReplace(src, '"', '', [rfReplaceAll]);
    TBuff := src;

    if not Done then
    begin
      // 取得したHTMLソースで本文を取得出来たかどうかを確認する
      // 以下のコードがあれば本文を取得出来たと見なす
      if UTF8Pos('<div class=text  id=novelBody', TBuff) > 1 then
      begin
        Done := True;
      // 以下のコードがあればWebページからフォーカスが外れて本文が
      // 非表示になっている状態なのでwebページにフォーカスを当てて
      // 再度HTMLソース取得を試みる
      end else if ExecRegExpr('<div class=text  id=novelBody.*?></div>', TBuff) then
      begin
        SetActiveWindow(Handle);
        WV2.SetFocus;
        WV2.ExecuteScript('encodeURI(document.documentElement.outerHTML)');
      end;
    end;
  end else begin
    SetActiveWindow(Handle);
    WV2.SetFocus;
    WV2.ExecuteScript('encodeURI(document.documentElement.outerHTML)');
  end;
end;

procedure TAlphadl.WV2SourceChanged(Sender: TObject;
  const aWebView: ICoreWebView2;
  const aArgs: ICoreWebView2SourceChangedEventArgs);
begin
  WV2.ExecuteScript('encodeURI(document.documentElement.outerHTML)');
end;

procedure TAlphadl.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled := False;

  if GlobalWebView2Loader.Initialized then
    WV2.CreateBrowser(WVWindowParent1.Handle)
  else
    Timer1.Enabled := True;
end;

initialization
  GlobalWebView2Loader := TWVLoader.Create(nil);
  GlobalWebView2Loader.UserDataFolder := wvstring(ExtractFileDir(Application.ExeName));
  GlobalWebView2Loader.StartWebView2;


end.
