メモリ(retain,retainCount,release)
====

このメモリの回は後回しにしたいと思います。すみません！
----

今回のゴール
----
メモリリークさせて、何が起きるか観測する。メモリリークのチェッカーを使ってみる

宿題
----
* [iPhoneアプリ開発時のメモリ管理で気をつけること](http://d.hatena.ne.jp/glass-_-onion/20090831/1251723900)を読んで、実際に試してみて、参照カウンタって何者かをがんばって理解しておきましょう。（誰かに説明してもらいます）


座学
----
* XXXX *a = [[XXXX alloc]init]という書き方はObjective-Cでの定番オブジェクト生成方法
* retain = 参照カウンタを+1する
* retainCount = 参照カウンタの数を返すメソッド
* release = 参照カウンタを-1する、0になったらメモリを解放する
* releaseせずにアプリを動かして、メモリリークする事を確認しましょう。
	* メモリリークは、"Product"→"Profile"で起動するInstrumentで、"Leaks"を選択して起動。
		* XCodeの左上の ▶ を押しっぱなしにして、その中のProfileを選んでもOK
	* 画面の見方は分かりにくいけど、赤いバーが伸びてる所がだいたいリークしてる。
	![リーク現場](https://img.skitch.com/20120823-nub37h3bs8q4ntkifrx6d8nigi.jpg)
	* ↓のように書くとすごいリークします。
	
```
for( int i=0; i<1000; i++ ){
	NSString  *s = [[NSString alloc]initWithFormat:@"hoge"];
//	[s release];  // ここのコメントを外すとリークしなくなります。
// [s autorelease] // こっちを外すとautoreleasepoolでリリースされ、やっぱりリークしなくなります。
}

```

実践
----
* 意図的にメモリリークさせて、Instrumentでリークしているのを確認しましょう。
* メモリリークさせた所を修正して、リークしてない状態にしてInstrumentで確認しましょう。



座学：autorelease
----
* @autoreleasepoolというのは最近の形。以前は違う書き方でした。でも機能は同じです。

```
  NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
  // この間でいろいろやる
  [pool release];
```
* [Object autorelease]は、このautoreleasepoolに登録するメソッドです。
* autoreleasepoolが終わる時、登録されたオブジェクトすべてにreleaseメッセージを送って、メモリ解放するように促します。
	* releaseメッセージを送っているだけなので、retainCountが2以上の場合(=複数のオブジェクトが参照している)は、retainCountが減るだけで実際にはリリースされません。
	* ここに解放済みオブジェクトがあると、BAD ACCESSでアプリが落ちる事が良くあります。
		* 実際にどのオブジェクトが悪さしているのか見つけにくい、やっかいなバグになります。
	* autoreleaseは、関数からの戻りでオブジェクトを返す場合によく使います。
		
		
おまけ
----
* iOS5から使えるARCは、上記のretainとかrelease、autoreleaseを良い感じに自動でやってくれます。
	* だけど色々と細かなルールもあり、その裏側の参照カウンタが理解出来ないと謎挙動します。
	* 現実問題、iOS4も対象機種にするアプリを作る場面も多いので、まだretain/release/autoreleaseを使わないといけません。
* [詳解Objective-C 2.0](http://www.amazon.co.jp/%E8%A9%B3%E8%A7%A3-Objective-C-2-0-%E7%AC%AC3%E7%89%88-%E8%8D%BB%E5%8E%9F/dp/4797368276/ref=sr_1_1?s=books&ie=UTF8&qid=1345701754&sr=1-1)は全般的におすすめです。もちろんメモリ管理についても充実しています。
* メモリ管理(retain/release..)とARCをマニアックに知りたければ、[エキスパートObjective-C](http://www.amazon.co.jp/%E3%82%A8%E3%82%AD%E3%82%B9%E3%83%91%E3%83%BC%E3%83%88Objective-C%E3%83%97%E3%83%AD%E3%82%B0%E3%83%A9%E3%83%9F%E3%83%B3%E3%82%B0-%EF%BC%8DiOS-OS-X%E3%81%AE%E3%83%A1%E3%83%A2%E3%83%AA%E7%AE%A1%E7%90%86%E3%81%A8%E3%83%9E%E3%83%AB%E3%83%81%E3%82%B9%E3%83%AC%E3%83%83%E3%83%89%EF%BC%8D-%E5%9D%82%E6%9C%AC/dp/4844331094)が詳しくておすすめです。
* autoreleasepoolの中身は普通見えないのですが、非公開メソッドで覗き見できます。ただこれが残っていると「非公開メソッド」なので、AppStoreに出せません。

```
/* 関数宣言 */
extern void _objc_autoreleasePoolPrint();
…
/* デバッグ出力 */
_objc_autoreleasePoolPrint();

```

* メモリリークのチェックは、iOSアプリでも同じように出来ます。手持ちのiOS Projectがあれば、それで試してみましょう。初めてならきっと面白いぐらいリークしてます。

