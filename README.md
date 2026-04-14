## alphapolis-downloader2

aplhadlwはアルファポリスで公開されている小説を青空文庫形式のテキストファイルでダウンロードするためのツールです。<br>
**※レンタル作品等の有料作品はダウンロード出来ません。**<br>

### 動作環境
Windows10/11上で動作します。

### 実行ファイルの作り方
Lazarus3.2以降でプロジェクトファイルalphadlw.lpiを開いてビルドして下さい。

~~または、Delphi (XE2以降)でalphadlw.dprojを開いてビルドしてください。~~ ver2.5からはLazarusのみの対応としました

尚、ビルドするためには、~~WebView4Delphi~~ CEF4DelphiとTRegExprが必要です。<br>
~~https://github.com/salvadordf/WebView4Delphi~~<br>
https://github.com/salvadordf/CEF4Delphi<br>
https://github.com/andgineer/TRegExpr

### 使い方
Windows10/11上でalphadlw.exeを起動して、ダウンロードしたいアルファポリス小説トップページのURL (保存したいテキストファイル名)を入力して「ダウンロード」ボタンをクリックします。正常に実行されればalphadlw.exeがあるフォルダにダウンロードした青空文庫形式のテキストファイルが補zんされます。<br>
尚、保存したファイル名の指定は省略できます。省略した場合はダウンロードした小説のタイトル名からファイル名を作成して保存します。


### 禁止事項
1. alphadlwを用いてWeb小 説サイトからダウンロードしたテキストファイルの第三者への販売や不特定多数への配信。 
2. ダウンロードしたオリジナル作品を著作者の了解なく加工（文章の流用や作品の翻訳等）しての再公開。 
3. その他、著作者の権利を踏みにじるような行為。 


### ライセンス
MIT

### CEF4ランタイムライブラリの導入方法
初めにWindows 64bit用のCEF4ランタイムライブラリを以下のURLからダウンロードします。<br>
https://cef-builds.spotifycdn.com/cef_binary_146.0.10%2Bg8219561%2Bchromium-146.0.7680.179_windows64.tar.bz2<br>
<br>
ダウンロード後にこのアーカイブファイルを任意のフォルダに展開してください(Windwos 11であればファイルエクスプローラで直接展開できます。Windows 10の場合は7-Zip等のアーカイバを利用して展開してください)。<br>
<br>
次に以下のファイル(cef4lib.zip)をダウンロードして展開して、取り出したcef4lib.batをCEF4アーカイブファイルを展開したフォルダ内にコピーします。<br>
[cef4lib.zip](https://github.com/user-attachments/files/26692036/cef4lib.zip)
<br>
CEF4アーカイブファイルを展開したフォルダ内が以下のようになると思いますので、ファイルエクスプローラでdef4lib.batをダブルクリックして実行してください。
<img width="416" height="363" alt="cef4folder" src="https://github.com/user-attachments/assets/679ec8d0-76e2-40a8-8446-032ca38a6c77" /><br>
実行中・・・
<img width="597" height="352" alt="cef4bat" src="https://github.com/user-attachments/assets/0c98e0a2-7a35-4a0b-ab95-78809a1cadc3" /><br>
<br>
するとcef4というフォルダが作成されていると思います。このフォルダ内には必要な全てのランタイムライブラリとCEF4のドキュメントが収められています。<br>
<img width="394" height="238" alt="cef4lib" src="https://github.com/user-attachments/assets/1da9fa09-3850-4667-ab29-ee4ad3dbfe71" />
<br>
このcef4フォルダを丸ごとalphadlw.exeがあるフォルダ内にコピーします。以上でaplhadlw 3.0を実行できるようになりました。
<br>
