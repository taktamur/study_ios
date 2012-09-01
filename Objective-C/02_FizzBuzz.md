制御構文とコレクションクラス
====
今回のゴール
----
[FizzBuzz問題](http://ja.wikipedia.org/wiki/Fizz_Buzz#FizzBuzz.E5.95.8F.E9.A1.8C.E3.80.80)を解く。


制御構文
----
Objective-Cは、C言語の拡張なので、C言語の制御構文がすべて使えます。
if, for, switch, return等々

関数
----
C言語の拡張なので、C言語の関数宣言が使えます。

```
NSString *convertValue( NSNumber *number ){
	…
	return value;
}
```
* C言語になれている人は、ポインタ型を返す所で気持ち悪さを感じるかもしれません。Objective-Cはリファレンスカウント方式のメモリ管理を行っていて、ポインタ型で返却されるオブジェクトには「autorelease」を付けて返すのが慣わしになっています。
* Objective-Cの「クラス定義」は、だいぶ雰囲気が違いますが、両者共存します。


コレクションクラス 
----
様々な集まりを管理するコレクションクラスが用意されています。

* 集合 _NSSet_(不変）と _NSMutableSet_(可変)
	* 順序なしのオブジェクトの集まりを管理する
* 配列 _NSArray_(不変) と _NSMutableArray_(可変)
	* 順序ありのオブジェクトの集まりを管理する
* 辞書 _NSDictionary_(不変) と _NSMutalbeDictionary_(可変)
	* キーワード付きのオブジェクトの集まりを管理する

それぞれ可変（Mutable)と不変(Inmutable)があります。

* 不変のコレクションは読み取りしかできません。
* 可変のコレクションは値の追加/削除ができます。

XCodeのリファレンスやぐぐって、使い方を調べておきましょう。

コンビニエンスコンストラクタ
----
[NSArrayのリファレンス](https://developer.apple.com/library/mac/#documentation/Cocoa/Reference/Foundation/Classes/NSArray_Class/NSArray.html)を見てると、"+ arrayXXXX"と、"- initXXXX"の似たようなものが定義されています。
- initXXXの方は、通常のコンストラクタですが、"+ arrayXXX"は「コンビニエンスコンストラクタ」と呼ばれています。コンビニエンスコンストラクタは、"autorelease"されたオブジェクトが帰ってくる点が通常のコンストラクタと異なっています。

```
// 通常のコンストラクタの例
NSString *str = [[NSString alloc]initWithFormat@"hoge"];
NSArray *array = [[NSArray alloc]initWithObjects:@"a",@"b",@"c",nil];
NSMutableArray *array2 = [[NSMutableArray alloc]initWithArray:array];

// コンビニエンスコンストラクタの例
NSString *str2 = [NSString stringWithFormat@"hoge"]; 
NSArray *array3 = [NSArray arrayWithObjects:@"a",@"b",@"c",nil];
NSMutableArray *array4 = [NSMutableArray arrayWithArray:array3];
// str2,array3,array4 は、autoreleaseされたオブジェクトを参照している。

```
コンビニエンスコンストラクタは、コレクションクラスだけではなく他のクラスでも用意されている事が多いです。特徴として、**クラスメソッド** で、**オブジェクト名が先頭について** (string〜とかarray〜とか）います。

コンビニエンスコンストラクタは、使い勝手は良いものの、使いすぎると思わぬ所で二重解放が発生してしまいがちなので、使い所が実は難しいかもしれません。


高速列挙
----
コレクションクラスの「値」を全て処理する場合に使います。

```
NSArray *array;
for( NSString *hoge in array){
	// arrayの中身がhogeに入ってるのでいろいろ処理する
}
```

参考：[@IT 第5回 配列とループ処理を理解しよう](http://www.atmarkit.co.jp/fcoding/articles/objc/05/objc05d.html)

実践
----
[新しいプロジェクトを作って](./01_createProject.md)、main.mに以下コードをコピペして、抜けてる所を埋めて、FizzBuzzの結果をNSLogに出力します。

```
#import <Foundation/Foundation.h>

NSArray *fizzBuzzArray(int count)
{
    // TODO
    // 配列を生成して、countの数だけFizzBuzzを解いて、
    // 配列を返します。
    // ヒント：配列にはNSMutableArrayを使うのが楽です。
    return nil;
}

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        NSArray *fizzBuzz = fizzBuzzArray(100);
        // TODO
        // fixxBuzzを回して、NSLogで出力していきます。
        // ヒント：forで回すのもあり、高速列挙で回すのもあり、
        // そのほかの方法で回すのもあり。
        // NSLogで↓のように出せればゴール
        // 1
        // 2
        // Fizz
        // 4
        // Buzz
        // Fizz
        // 7
        // 8 ...
    }
    return 0;
}

```

