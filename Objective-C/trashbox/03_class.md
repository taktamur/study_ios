クラスを作る
====

今回のゴール
----
以下のクラスを作成して、値の代入、descriptionによるNSLogへの出力を行う

* メンバ変数：double lat(緯度), double lon(経度),NSString name(名称), NSString comment(コメント)
* メソッド：NSString description (サマリーを返す)


オブジェクトのライフサイクル
----

* 初期化：init initWithXXX
	* 親クラスのinitも呼び出します
	* メンバ変数の初期化もここで行います。
* メソッドの呼び出し
* メンバ変数へのアクセス
	* メンバ変数へのアクセスも、実態はメソッド呼び出しです。
	* setter/getterでアクセスします。ドット記法でもアクセスできます。
* オブジェクトの廃棄(dealloc)
	* メンバ変数のメモリを解放します(release)
	* 親クラスのdeallocを呼び出します。

![オブジェクトのライフサイクル](http://www.websequencediagrams.com/cgi-bin/cdraw?lz=dGl0bGUg44Kq44OW44K444Kn44Kv44OI44Gu44Op44Kk44OV44K144KkABMFqwoKYWx0IOWIneacn-WMlgogIFVzZXItPitNeU9iamVjdDogK2FsbG9jCiAgAAsILS0-LVVzZXI656K65L-d44GX44Gf44Oh44Oi44OqAC8ULWluaXQoV2l0aFhYWCkAPww-K3N1cGVyKOe2meaJv-WFgyk6AB8O77yK5oyH5a6aAIE3BYvjgrfjg6MAgUQHgrYKICAAMBAtLT4tAIEzCmlkCiAgbm90ZSByaWdodCBvZgCBPgkKICAgIOOBk-OBk-OBpwCBOwWz44OQ5aSJ5pWw44Gq44Gp44GuAIISCeOCkuihjOOBhgogIGVuZABQBQCCARRpZAplbmQAglIG44Oh44K944OD44OJ5ZG844Gz5Ye644GXAIJgByAAghcObWV0aG9kQQCCVhQAFRxCABwVAHcNAIFMDbjjga7jgqLjgq_jgrvjgrkAgQMKIACDJwxzZXRYWFhYAIMgDQCECwoAgiAPWFhYAFMG5YCk44K7AIFtBYgAgS4bAIRVDC14eHgAhEoUKACDBA94eHgAWQiS6L-U44GZKQCCXwsAhV4U5buD5qOEAIFJF2RlAIVQCACEBB0gAIIvEq7jg6rjg6rjg7zjgrkoIFt4eHggcmVsZWFzZV0pAIRRBQCEFQsAhi0KAIJcBQCFXBIAfAwAhS8dAIZ0DgCDWws&s=default)

サンプルコード：

* [MyClass.h](https://github.com/taktamur/study_ios/blob/master/Objective-C/exp_class/exp_class/MyClass.h)
* [MyClass.m](https://github.com/taktamur/study_ios/blob/master/Objective-C/exp_class/exp_class/MyClass.m)


実習
----
githubから https://github.com/taktamur/study_ios をcloneして、study_ios / Objective-C / exp_class にあるプロジェクトをXCodeで開いて動かしてみてください。


座学:getter/setterについて
----
* Objective-Cはメンバ変数へのアクセスも、「メソッド呼び出し」です。メソッドとしてgetterメソッド、setterメソッドを用意する必要があります。
	* ``double a = [myobj valueA];`` 
* getterメソッド、setterメソッドへのアクセスは、ドットでも可能です。
	* ``double a = myobj.valueA;`` 
	* ↑の場合、内部的には[myobj valueA]メソッドが呼び出されます。
* getter/setterメソッドを作るのは面倒なので、@property、@synthesize が用意されています。
	* 参考ページ：(http://d.hatena.ne.jp/nakamura001/20101101/1288632739)
	


実習
----
先にgithubからcloneしたプロジェクトで、MyClassWithProperty(＝@propertyを使ったバージョン)のコメントを外して、同じ動きをすることを確認してください。

実習
----
自分でクラスを作成してください。

* メンバ変数：double lat(緯度), double lon(経度),NSString name(名称), NSString comment(コメント)
* メソッド：NSString description (サマリーを返す)

おまけ
----
* プロパティの歴史的な話：
	* Objective-C 1.0の頃は、@propertyや@syncesizeは無かったらしい。すべて[XXX setValue:hoge] とか val = [XXX value]とかやってたらしいです。
	* Objective-C 2.0 で@propertyや@syncesizeが登場、ここで XXX.value=hoge や、 val = XXX.valueが可能になった。
	* 歴史的な話は[このへん](http://news.mynavi.jp/column/objc/101/index.html)に乗ってました。

* ``#pragma mark - ほげほげ``を入れておくと、XCodeの「メソッド一覧表示」の時の区切りとなります。

![区切り](https://img.skitch.com/20120823-bymw61e31qexdmd994d161fiwq.jpg)

* XCodeのコードコンプリート：@propぐらいまで入力すると、XCodeは勝手に補完しようとします。
	* 補完の吹き出しが閉じても、"Ctrl+."で出てきます。
		
