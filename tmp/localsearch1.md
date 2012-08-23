localsearch1.md
====

今回のゴール
----
ローカルサーチAPIを叩いてJSONをNSLogに出す

__TODO__ これかきかけ


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
	

