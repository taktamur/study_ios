Objective-C勉強会
====
この勉強会は、iPhone開発に入る前に、Objective-Cそのもののを学習する為に実施します。
UIには手を出さず、まずはコンソールアプリから入ります。

ここでやる事
----
* 手を動かす事、困っている所の相談会
* XCodeを軽く使えるようになる
* コンソールアプリを作れる
* Objective-Cのクラス作成が出来る
* 単純な通信が出来てパース出来る
* メモリリークの検出方法を知る


ここではやらない事
---
* 座学
* MVCモデルはまだ手を出さない
* iOSのUIには手を出さない
* ARCは使わない、retain/releaseをまじめにやる

参考
----
* [ぐぐるさん](http://www.google.co.jp/search?q=objective-C&sugexp=chrome,mod=17&sourceid=chrome&ie=UTF-8#hl=ja&sclient=psy-ab&q=objective-C+%E5%85%A5%E9%96%80&oq=objective-C+%E5%85%A5%E9%96%80&gs_l=serp.3..0l8.2061.3533.0.3814.9.9.0.0.0.2.116.806.7j2.9.0...0.0...1c.dFmVOU3gKdE&pbx=1&bav=on.2,or.r_gc.r_pw.r_qf.&fp=60e72f2798c919cf&biw=948&bih=561)
* [AppleのDevCenterのpdf](https://developer.apple.com/jp/devcenter/ios/library/documentation/ObjC.pdf)
* 


1. 何かログに出力してみる
---

* XCodeでのプロジェクト作成
	* Coccoa コンソール、ARC無し
		* typeをFoundationにする
		* [画像](https://img.skitch.com/20120822-d3rq8tmqht92dwn8nxwbungptd.jpg)
* NSLog
* NSString
	* XCodeのヘルプ参照方法
	* NSStringのメソッドあんちょこ(コピー配布）
* 実行
	* XCodeのログの出方
* Macの使い方
	* terminal, iTerminal2とか
	* command+ZXCV
	* command+N,W,Q

2. ローカルサーチAPIを叩いてみる
----
* NSSet/NSArray/NSDictionary
	* Mutableなもの
	* コピー配布
* クラス作成	
	* XCodeでの作り方
	* *.m, *.hの説明
	* initとdeacllo
		* initは決まり文句がある
	* @property @syncesize
	* setter,getterとXXX.yyyの関係
	* retain,release,autorelease
* XCodeの使い方
	* command+B,R,U、Command+Shift+K
	* command+Ctrl+↑
	
* Modelの作成
	* NSString *name,double lat,double lon;
	* __FIXME__ 先にクラスの作り方やるか？
	
* NSURLConnectionで通信
	* Y!のappidを取っておく事
	* [YOLPのYJDNページ](http://developer.yahoo.co.jp/webapi/map/openlocalplatform/v1/localsearch.html)
* JSONのパース
	* NSJSONSerialization
	* (id) valueForKeyPath:(NSString *)

3. メモリをまじめに考える
----
* retain,release,retainCount,autorelease
* autoreleaseって何？
* わざと壊して何が起きるのかを見る
	* メモリリークのチェッカーを使う
		* [メモリリークのチェック方法](http://d.hatena.ne.jp/thata/20100807/1284881195)
	* 二重解放
	* メモリリーク
	* autoreleaseしてるものをreleaseする
* Appleの命名規則
	* alloc, new, copy, mutableCopy←自分が所有する
* (autoreleasepoolを覗き見する)

4. オブジェクトをまじめに考える
----
* @propertyを@syncesizeが何をやってるのか。
	* setterとgetterとの関係
	* @syncesizeと@property無しでプロパティを作ってみる
* 継承、プロトコル、カテゴリ拡張
* メソッドのセレクタ


小ネタ
----
* \#pragma mark - XXX
	* エディタの上からメソッド選択
* Unit Test
* XCodeの使い方
	* リファクタリング（名前変更）
	* インデントの調整

中級編
----

* 中級編
	* Block構文
	* ARC
	* スレッド
	* KVC,(KVO) <- あまり使わないけどキーワード的に
	
* 応用編	
	* NSNotification
	

おまけ 田村がよくXCodeと一緒に使ってるmacのアプリ
====
* KeyRemap4MacBook キーバインドの変更
* Dash XCodeのヘルプよりも早いドキュメントビュアー、snippet
* Mu Markdownエディタ、メモ書き等に
* jason jsonフォーマットのビュアー、ただしでかいファイルは苦手
* Skitch 画面キャプチャと加工、ネットに共有