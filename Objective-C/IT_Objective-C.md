「Cocoaの素、Objective-Cを知ろう」補助資料
====

この資料は、@ITで連載していた、[Cocoaの素、Objective-Cを知ろう](http://www.atmarkit.co.jp/fcoding/index/objc.html) の補助資料となります。

* @IT連載ではコマンドラインでのコンパイルを行っています。また多少記述が古かったりします。これをXCodeで実行するように補足していきます。
* サンプルコードはできるだけ「実際に動かして」みてください。

第1回 Objective-Cは特殊な言語？
----
[http://www.atmarkit.co.jp/fcoding/articles/objc/objc01/objc01a.html](http://www.atmarkit.co.jp/fcoding/articles/objc/objc01/objc01a.html)

* この回に出てくるobjc.mは、[XCodeでコンソールアプリを作成して](https://github.com/taktamur/study_ios/blob/master/Objective-C/00_createProject.md)、main.mに貼り付けても動作します。
	* ``printf("myTestString is %s \n", [myTestString UTF8String]);`` この部分は、C言語のスタイルで記述されています。``printf``がC言語の関数なので、``[myTestString UTF8String]``でC言語の文字列（ゼロ終端なchar配列）に変換して、``%s``部分に置き換えています。
	* printfのフォーマット演算子(%sとか%dとか） [フォーマット指定子一覧](http://www.k-cube.co.jp/wakaba/server/format.html)
	* NSLog等のObjective-Cのフォーマット演算子は、``%@``等が追加されています。[Objective-cのフォーマット指定子まとめ](http://d.hatena.ne.jp/tanaponchikidun/20120612/1339509661)

* コードの「見た目」から入る
* C言語を「拡張」するということ

[http://www.atmarkit.co.jp/fcoding/articles/objc/objc01/objc01b.html](http://www.atmarkit.co.jp/fcoding/articles/objc/objc01/objc01b.html)

* Smalltalkの影響
	* Smalltalkは「オブジェクト指向言語」の元祖です。[Wikipedia:Smalltalk](http://ja.wikipedia.org/wiki/Smalltalk)
* Objective-Cはマニアックか
* Objective-Cとアプリケーション開発
	* Coccoa Touch と UIKit というキーワードはiOS開発でよく出てきます。

第2回 一番初めのObjective-Cプログラム
----
[http://www.atmarkit.co.jp/fcoding/articles/objc/02/objc02a.html](http://www.atmarkit.co.jp/fcoding/articles/objc/02/objc02a.html)

* 少しだけ複雑なHello World
* クラスの宣言と実装でファイルを2つ作る
	* PHPやJavaと違い、１つのクラスは「宣言部」と「実装部」に分かれます。
		* C言語と同じ
	* 「宣言部」はクラスを使う際に必要な情報が書かれます（クラスの定義など）。 拡張子"*.h"となります。C言語と同じです。
	* 「実装部」はクラスの中身、メソッドの中身が書かれます。拡張子"*.m"となります。
	* 通常は宣言部と実装部は別々のファイルに書きます。この連載では１つに纏まっている事が多いのですが、実際の開発ではまず別々に書きます。
	
	
	
[http://www.atmarkit.co.jp/fcoding/articles/objc/02/objc02b.html](http://www.atmarkit.co.jp/fcoding/articles/objc/02/objc02b.html)

* クラスを宣言するヘッダファイル
* クラスを実装するファイル
	* XXX.hとXXX.mは、XCodeの"File">"New File"で生成できます。
		* Objective-C classを選択して、クラス名と「親クラス」を指定すると、テンプレートに従ったファイルが作成されます。
![](https://img.skitch.com/20120917-8q1tgj3g5xxybth42yyajh4uu8.jpg)
![](https://img.skitch.com/20120917-g3pjdcqpxa7b1rbyf2324sybg.jpg)

	* ``#import <Foundation/XXX.h>`` は、``#import <Foundation/Foundation.h>``でも代用できます。

* 正しくメッセージを伝えよう
	* main.mにtypeがあります。さてどこでしょう？


[http://www.atmarkit.co.jp/fcoding/articles/objc/02/objc02c.html](http://www.atmarkit.co.jp/fcoding/articles/objc/02/objc02c.html)

* プログラムのコンパイルと実行
	* この回では、コマンドラインでのコンパイル``gcc ..``が紹介されていますが、XCode上では単に"Run"すれば、コンパイルと実行が行われます。
		* 最近のXCode(4.2以降？）では、コンパイラは"gcc"から"clang"に変更されています。
		* XCode上で、実際のコンパイルの様子を見ることもできます。
			* 左枠のアイコン"Show the long navigation"をクリックして、"Build xxx"をクリック。
			* コンパイルのフェーズ毎に行が出ているので、その行の一番右側をクリックすると、コンパイルの詳細が表示されます。
			![](https://img.skitch.com/20120917-ttpgdfmhrc672yyti6fj2197j5.jpg)
		
第3回 Objective-Cのクラス定義を理解しよう
====
[http://www.atmarkit.co.jp/fcoding/articles/objc/03/objc03a.html](http://www.atmarkit.co.jp/fcoding/articles/objc/03/objc03a.html)

* クラスの容れ物
* インスタンス変数
* インスタンス変数の有効範囲
	* これはほとんどデフォルトの"protected"を使います。
	* オブジェクトの外から参照する場合でも、"public"は **ほとんど使いません**

[http://www.atmarkit.co.jp/fcoding/articles/objc/03/objc03b.html](http://www.atmarkit.co.jp/fcoding/articles/objc/03/objc03b.html)

* メソッド定義とメッセージ式
* インスタンスメソッドとクラスメソッド
* プロパティとアクセサ 
	* Objective-Cでは、PHPのような、"メンバ変数に直接アクセスする"方法はありません。すべてアクセサ（getter/setter)を経由してアクセスします。
	* Javaのgetter/setterのイメージに近いです。


[http://www.atmarkit.co.jp/fcoding/articles/objc/03/objc03c.html](http://www.atmarkit.co.jp/fcoding/articles/objc/03/objc03c.html)

* アクセサメソッドの自動生成
	* ここではさらりと書いてありますが、内部的にはややこしいことをやっています。
	* 参考：[■[iPhoneプログラミング]Objective-Cの @property と @synthesize の組み合わせが何をやっているのかを解説](http://d.hatena.ne.jp/nakamura001/20101101/1288632739)
* クラスのインスタンス生成と初期化
	

第4回 変数のデータ型や文字列の扱いを理解しよう
====
[http://www.atmarkit.co.jp/fcoding/articles/objc/04/objc04a.html](http://www.atmarkit.co.jp/fcoding/articles/objc/04/objc04a.html)

* ``「NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];…[pool drain]`` これは、プロジェクト生成時のmain.mに書いてある、``@autoreleasepool {…}``と同じです。これは最近のXCode(4.2以降?)に導入されたコンパイルディレクティブです。
* 変数のデータ型


[http://www.atmarkit.co.jp/fcoding/articles/objc/04/objc04b.html](http://www.atmarkit.co.jp/fcoding/articles/objc/04/objc04b.html)

* ラッパークラス
* 文字列を扱う
	* ``printf("Position: %d, Length: %d です。\n",searchResult.location, searchResult.length);`` ここでwarningがでるかもしれません。その場合、``%d``を``%ld``に置き換えてください。これは記事当時32bitだったのが最近は64bit基本になったためかと思われます。

[http://www.atmarkit.co.jp/fcoding/articles/objc/04/objc04c.html](http://www.atmarkit.co.jp/fcoding/articles/objc/04/objc04c.html)

* 可変の文字列

第5回 配列とループ処理を理解しよう
----
[http://www.atmarkit.co.jp/fcoding/articles/objc/05/objc05a.html](http://www.atmarkit.co.jp/fcoding/articles/objc/05/objc05a.html)

* C言語の配列
	* C言語の配列は、正直あまり使いません。固定長の配列ぐらいで使うぐらいです。
	* 高速化のためのチューニングで、Objective-Cの配列クラスからC言語の配列に書き換えることはあります。
* Objective-Cの配列クラス

[http://www.atmarkit.co.jp/fcoding/articles/objc/05/objc05b.html](http://www.atmarkit.co.jp/fcoding/articles/objc/05/objc05b.html)

* NSArrayクラス
	* ``int xxx = [array count];`` でwarningが出る場合があります。ここは``unsigned long xxx = [array count];``と書き換えましょう。
* 変更可能な配列
	* NSMutableArray
	
[http://www.atmarkit.co.jp/fcoding/articles/objc/05/objc05c.html](http://www.atmarkit.co.jp/fcoding/articles/objc/05/objc05c.html)

* ディクショナリ（連想配列）
	* NSDictionary
	* KeyとValueの順番が、PHP等は"Key","Value"の順が多い中、Objective-Cは"Value","Key"の順番が多いです。ここ要注意です。
* 変更可能なディクショナリ
	* NSMutableDictionary

[http://www.atmarkit.co.jp/fcoding/articles/objc/05/objc05d.html](http://www.atmarkit.co.jp/fcoding/articles/objc/05/objc05d.html)

* ループ処理
	* ``for(int i=0; i<[arry count]; i++ ){…}``
* 列挙子を使ったループ
	* ``NSEnumerator *e = [dict keyEnumerator];while (id key = [e nextObject]) {…}``
	* JavaのIteratorに似てます。
* 高速列挙を使ったループ
	* ``for (id obj in enumerator) {…}``
	* PHPのforeachに似ています。
	
	
第6回 コードをもっとオブジェクティブに
----

[http://www.atmarkit.co.jp/fcoding/articles/objc/06/objc06a.html](http://www.atmarkit.co.jp/fcoding/articles/objc/06/objc06a.html)

* クラスの継承

[http://www.atmarkit.co.jp/fcoding/articles/objc/06/objc06b.html](http://www.atmarkit.co.jp/fcoding/articles/objc/06/objc06b.html)

* プロトコル
	* JavaやPHP5の"インタフェース(interface)"と同じ機能です、が、"必須"と"オプション(あっても無くても良い)"がある点が異なります。
* プロトコル同士の継承と多重採用
	* この「多重採用」は、実際のiOS開発で多用されます。

[http://www.atmarkit.co.jp/fcoding/articles/objc/06/objc06c.html](http://www.atmarkit.co.jp/fcoding/articles/objc/06/objc06c.html)

* オブジェクトの判定
	* SEL型 ←iOSでの実装、特に「ボタンを押したらXXする」といった、target/actionという形での実装で多用されます。
* クラスクラスタ
	* NSStringとNSCFStringというように、ソースコード上意図したクラスではないクラスが帰ってくることが、iOS開発ではまま発生します。あまり気にしないことです。
	

[http://www.atmarkit.co.jp/fcoding/articles/objc/06/objc06d.html](http://www.atmarkit.co.jp/fcoding/articles/objc/06/objc06d.html)

* クラスのカテゴライズ
	* カテゴリはあまり使いません。ただこのカテゴリの機能を使って、"既存クラスを拡張する"(NSString等に新しいメソッドを追加）することが可能です。
		* [http://news.mynavi.jp/column/objc/008/index.html](http://news.mynavi.jp/column/objc/008/index.html)
	* 多用しすぎると混乱するので、このような使い方があるとだけ把握しておいてください。

第7回 メモリ管理を理解する（前編）
----
[http://www.atmarkit.co.jp/fcoding/articles/objc/07/objc07a.html](http://www.atmarkit.co.jp/fcoding/articles/objc/07/objc07a.html)

* 参照カウンタの動きを見てみよう
	* ``printf("%d\n", [myObj retainCount]);``は``printf("%ld\n", [myObj retainCount]);``にしましょう（warning対策)
	* 実は、ここの e のコメントを外しても、エラーとなりません。これはMacOS 10.5以降でXCodeのConsoleアプリのプロジェクトでは、メモリ管理で「ガベージコレクション」が使われてるため、動いてしまいます。iOSならエラーとなります。

[http://www.atmarkit.co.jp/fcoding/articles/objc/07/objc07b.html](http://www.atmarkit.co.jp/fcoding/articles/objc/07/objc07b.html)

* クラスのインスタンス変数の所有権
* クラスのインスタンス変数の解放

最終回 メモリ管理を理解する（後編）
----
[http://www.atmarkit.co.jp/fcoding/articles/objc/08/objc08a.html](http://www.atmarkit.co.jp/fcoding/articles/objc/08/objc08a.html)

* メモリのretainやreleaseの定石
* メモリ管理の責任範囲
	* アクセサ（setter)でオブジェクトを保持する場合は、1. それまで保持していたメンバ変数を解放(release)して、2. 新しいオブジェクトの所有権を取得（retain)する
	* クラスのメソッドで生成して返すオブジェクトは、autoreleaseしてから返す
		* autoreleaseされたオブジェクトは、@autoreleasepoolに到達した時点で解放(release）されます。
	* クラスのメンバ変数は、deallocで解放(release)する
* 半自動のメモリ管理（autorelease）
* autorelease済みのオブジェクトを返すメソッド
	* コンビニエンスコンストラクタはautorelease済みのオブジェクトを返します。

[http://www.atmarkit.co.jp/fcoding/articles/objc/08/objc08b.html](http://www.atmarkit.co.jp/fcoding/articles/objc/08/objc08b.html)

* 全自動のメモリ管理（ガベージコレクション）
	* 残念ながら、iOSではガベージコレクションが使えません。。


iOS開発へ
===
http://www.atmarkit.co.jp/fsmart/index/iphonesdk.html ここに移行していく予定です。
