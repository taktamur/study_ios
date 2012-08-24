コマンドラインアプリの作成
====

今回のゴール
----
Macのコマンドラインのアプリを作って何かをデバッグログに出力する

---

* XCodeでのプロジェクト作成
	* New → Project → MacOSX Application →Command Line Tool
		* typeは"Foundation"に
		* "User Automatic Reference Counting"は「チェックしない」
* まずは実行してみる
	* XCodeの左上の▶ で実行
* NSLogが何者か調べる。文字列を変えてみる
	* XCodeのヘルプやGoogleで調べる
	* XCodeのヘルプは、"Window"→"Organizer"で開く画面の"Documentation"→"iOS5"の中の虫眼鏡で検索
	* XCodeのソースでカーソルを合わせて、右側のインスペクタでもヘルプが見れる
* NSLogを弄ってコンソールに出る文字が変わる事を確認する
* ステップ実行してみる
	* ソースコードエディタの左側の枠をクリックして、緑のマーカーを付けてから実行すると、ステップ実行が出来る。
	![ステップ実行の操作](https://img.skitch.com/20120823-f42j2ygft8kir2gqnbrss7m9iw.jpg)
	
	
おまけ
----
* Macの使い方
	* command+ZXCV コピペ系
	* command+N    新規作成
	* command+W,Q  ウィンドウやアプリのクローズ 
* XCodeの使い方
	* "XCode" → "Preference" で設定画面が出る。特に"Fonts&Colors"は好みがあると思います。
	

