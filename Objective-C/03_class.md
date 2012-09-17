クラスを作る
====

今回のゴール
----
以下のクラスを作成して、値の代入、descriptionによるNSLogへの出力を行う

* メンバ変数：double lat(緯度), double lon(経度),NSString name(名称), NSString comment(コメント)
* メソッド：

宿題
----
[このへん](http://libro.tuyano.com/index3?id=542006)を読んで/試してみて、クラスの作成/インスタンス化/継承を試しておいてください。

座学：基本形
----
* 1クラスにファイルは２つ、\*.h(ヘッダファイル)と\*.m(実装ファイル)
	*	XCodeの"File"→"New"→"Files"でテンプレ作成されます。
	* XCodeのショートカットで、Ctrl+Command+↑で、\*.hと\*.mを行き来できます。

* *.hの書き方
	* ちょっと古いスタイルと最近のスタイルは微妙に違うけど、同じように動作します。

```
// ちょっと古いスタイル
@interface MyClass : NSObject{
    NSString *_value;
}
@property(nonatomic,retain)NSString *value; //"プロパティ"

-(NSString *)ore_method:(NSString *)param count:(int)c;  // "メソッド"
@end

// 最近のスタイル
@interface MyClass : NSObject  // ←メンバ変数の定義が無くなってるけど、コンパイラが自動で作ってる。
@property(nonatomic,retain)NSString *value; //"プロパティ"

-(NSString *)ore_method:(NSString *)param count:(int)c;  // "メソッド"
@end

```

* \*.mの書き方

```
@implementation MyClass
@synthesize value=_value;  // \*.hのプロパティと対応、_valueはメンバ変数

#pragma mark - object lifecycle
-(id)init
{
    if( (self=[super init]) != nil ){   // ←initでは割とよくある定番の書き方
        // 初期化メソッドはここに書く
    }
    return self;
}
-(void)dealloc
{
    [super dealloc];
    [_value release]; // ←メンバ変数はちゃんとリリースしましょう。
    _value=nil;
}

#pragma mark - 俺のメソッド
-(NSString *)ore_method:(NSString *)param count:(int)c
{
    // ここに処理内容を書く
    NSString *ret = [NSString stringWithFormat:@"%@",self.value];
    return nil;
}

@end

```

* 大体initとdeallocはセットで書きます。(非ARCなら必須)


座学：プロパティ
----
* 「プロパティ」は、オブジェクト外部からメンバ変数にアクセスするための口です。
* 大体@propertyと@syncesizeは大体ペアで設定し、これが設定されると、ドット演算子(XXX.value)でアクセスできるようになります。
	* ドット演算子を使わない、[XXX value]や[XXX setValue:(id)]という表現と実態は同じです。
* phpのXXX->valueやCの構造体(XXX.value)と違い、Objective-Cのドット演算子は、実態としては「valueメソッド」「setValueメソッド」(getter/setter)への呼び出しです。
	* @syncesizeで、 getter/setterが自動で作成されていますが、ソースコード上は現れません。
* getter/setterで何やってるのだろうか
	* 想像ですが、きっとこんな感じじゃないかと。
	
```
-(void)setValue:(NSString *)value
{
	if( _value==value ) return;
	if( _value != nil ){
		[_value release];  //@propertyの属性が"retain""copy"なら、ここでrelease
		_value=nil;
	}
	_value=[value retain]; // @propertyの属性が"retain"ならここでretain
// _value = [value copy];  // @propertyの属性が"copy"ならここでコピー
// _value = value;         // @propertyの属性が"assign"なら、retainしない
}
-(NSString *)value
{
	return _value;
}
``` 
* getter/setterでメモリ関係でややこしい事をしているので、```[XXX.value release];```とかしちゃだめです！

実践
----
* 名前（NSString),緯度(double),経度(double)をプロパティで持つクラスを作ってみましょう。
	* 	値を入れたりNSLogに出してみてどんな動作をするか確認しましょう。
* 自分で作成したクラスの実装ファイル(*.m)から、@syncesizeを削除しても動くようにsetter/getterを書いてみましょう。
* Profilerでメモリリークしてないかどうか確認しましょう。
	* for(int i=0; i<100; i++){〜} とかでループさせると、メモリリークしてる箇所が見つけやすくなります。

おまけ
----
* プロパティの歴史的な話：
	* Objective-C 1.0の頃は、@propertyや@syncesizeは無かったらしい。すべて[XXX setValue:hoge] とか val = [XXX value]とかやってたらしい。
	* Objective-C 2.0 で@propertyや@syncesizeが登場、ここで XXX.value=hoge や、 val = XXX.valueが可能になった。
	* 歴史的な話は[このへん](http://news.mynavi.jp/column/objc/101/index.html)に乗ってました。

* 説明の中の```-(void)setValue:(NSString *)value```で、valueにnilが入ってたらどうなるだろう？
	* ヒント：Objective-Cでは、nilにどんなメッセージを飛ばしても「反応しない」。

* ``#pragma mark - ほげほげ``を入れておくと、XCodeの「メソッド一覧表示」の時の区切りとなります。

![区切り](https://img.skitch.com/20120823-bymw61e31qexdmd994d161fiwq.jpg)

* XCodeのコードコンプリート：@propぐらいまで入力すると、XCodeは勝手に補完しようとします。
	* 補完の吹き出しが閉じても、"Ctrl+スペース"で出てきます。
		
