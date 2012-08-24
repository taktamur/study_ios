LocalSearch APIを叩いてみる
====

今回のゴール
----
LocalSearchAPIを叩いて、「ミッドタウン近くのPOI」を表示する

宿題
----
* [Yahoo! YJDNのappid](https://e.developer.yahoo.co.jp/dashboard/)を取得しておいてください。
* [YOLPのYJDNページ](http://developer.yahoo.co.jp/webapi/map/openlocalplatform/v1/localsearch.html)を読んでおいてください


実践
----
* 「店名」「緯度経度」を管理するクラスを作成する。
* LocalSearchAPIを叩いて、JSONを取得する
	* Macでjsonフォーマットを見るのに、それようのツールを使うのが楽です。[Jason](http://olivierlabs.com/jason/index.html)とか。
		* 検索結果は１０件程度で充分です。量が多いと上記ツールのJasonが重たくなったりします。
	* APIを叩くのには、[NSURLConnectionの同期通信](http://www.google.co.jp/search?q=NSURLConnection&aq=f&sugexp=chrome,mod=17&sourceid=chrome&ie=UTF-8#hl=ja&sclient=psy-ab&q=NSURLConnection+%E5%90%8C%E6%9C%9F&oq=NSURLConnection+%E5%90%8C%E6%9C%9F&gs_l=serp.3..0l3j0i30l2j0i5i30.1986.3300.0.3887.7.7.0.0.0.2.192.884.0j7.7.0...0.0...1c.6i2bCqx4n4Q&pbx=1&bav=on.2,or.r_gc.r_pw.r_qf.&fp=235427c6c0a1b21f&biw=948&bih=561)がお手軽です。
	* ミッドタウンは[lat=35.6657214&lon=139.731005](http://maps.loco.yahoo.co.jp/maps?p=%E6%9D%B1%E4%BA%AC%E3%83%9F%E3%83%83%E3%83%89%E3%82%BF%E3%82%A6%E3%83%B3&lat=35.6657214&lon=139.7310058&ei=utf-8&datum=wgs&lnm=%E6%9D%B1%E4%BA%AC%E3%83%9F%E3%83%83%E3%83%89%E3%82%BF%E3%82%A6%E3%83%B3&idx=8&v=2&sc=3)です。

* 取得したNSDataをパースします。
	* jsonのパースには、[NSJSONSerialization](http://www.google.co.jp/search?q=JSONObjectWithData%3Aoptions%3Aerror&sugexp=chrome,mod=17&sourceid=chrome&ie=UTF-8#hl=ja&sclient=psy-ab&q=NSJSONSerialization+&oq=NSJSONSerialization+&gs_l=serp.3..0l6.122707.122707.12.123192.1.1.0.0.0.0.229.229.2-1.1.0...0.0...1c.m8KCdzizoYY&pbx=1&bav=on.2,or.r_gc.r_pw.r_qf.&fp=235427c6c0a1b21f&biw=948&bih=561)が便利です。※iOS5から標準、4までは外部ライブラリで対応
	* パースした結果には、[obj valueForKeyPath:@"〜〜" でアクセスできます。

```
// サンプル コピペ禁止
NSArray *ary = [jsonObject valueForKeyPath:@"Feature"];
for( int i=0; i<[ary count]; i++ ){
	id feature = [ary objectAtIndex:i];
	[feature valueForKeyPath:@"Name"]; 
	[feature valueForKeyPath: @"Geometory.Coordinate"];
}
```

* パースしたら、作成したクラスに値を入れて、それを[NSMutableArray](http://www.google.co.jp/webhp?sugexp=chrome,mod%3D17&sourceid=chrome&ie=UTF-8#hl=ja&sclient=psy-ab&q=NSMutableArray+addObject&oq=NSMutableArray+addObject&gs_l=serp.3...2153.5853.1.5985.12.11.1.0.0.0.368.1312.2j6j0j1.11.0...0.0...1c.UBpykIAkLvw&pbx=1&fp=1&biw=948&bih=561&bav=on.2,or.r_gc.r_pw.r_qf.&cad=b&sei=BSM3UOHsAsjzmAWAhYBo)に入れときます。

* NSMutableArrayから値を取得してNSLogで出力します。

```
サンプル：コピペ禁止
int arraySize = [array count];
for( int i=0; i<arraySize; i++ ){
	MyClass *obj = [array objectATIndex:i];
	… // ここでログ出力したらゴール
}
```
	
* Arrayの中のオブジェクトを通しで参照する方法は、[高速列挙](http://www.google.co.jp/search?q=Objective-C+%E9%AB%98%E9%80%9F%E5%88%97%E6%8C%99&aq=f&sugexp=chrome,mod=17&sourceid=chrome&ie=UTF-8)という手もあります。こっちの方がスマートです。

* 自作クラスに[desciption](http://www.google.co.jp/search?q=Objective-C+%E9%AB%98%E9%80%9F%E5%88%97%E6%8C%99&aq=f&sugexp=chrome,mod=17&sourceid=chrome&ie=UTF-8#hl=ja&sa=X&ei=PCY3UIqWI-vqmAW3kICIAw&ved=0CB4QvwUoAQ&q=Objective-C+description&spell=1&bav=on.2,or.r_gc.r_pw.r_qf.&fp=235427c6c0a1b21f&biw=948&bih=561)を付けておくと、NSLogの時に楽です。

* 出来たアプリが、メモリリークしていないかどうか、"Profile"して確認しましょう。


おまけ
----
* しょっちゅう使うコレクション
	* NSSet NSArray NSDictionary
	* NSMutableSet NSMutableArray NSMutableDictionary
	* "mutable"は「変更可能」な可変クラスです。オブジェクトの追加や削除が出来ます。
	* [Objective-C コレクション](http://www.google.co.jp/search?q=Objective-C+%E3%82%B3%E3%83%AC%E3%82%AF%E3%82%B7%E3%83%A7%E3%83%B3&aq=f&sugexp=chrome,mod=17&sourceid=chrome&ie=UTF-8)などで深追いしてください。

* Objective-C(=iOS)では、Cの配列はあまり使わず、NSArrayを使う場面が多いです。
	* 	固定長ならばC配列を使っても良いかも、程度
	
* XCodeの使い方
	* command+B,R,U ビルド、ラン、UnitTest
	* command+Shift+K クリーンアップ、オブジェクトファイル等を削除
		* XCodeがちょっと意図しない場合、クリーンアップで治る事もあります。
	* command+Ctrl+↑ \*.hと\*.mの切り替え
	
* 