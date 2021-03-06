//
//  MyClassWithProperty.m
//  exp_class
//
//  Created by 田村 孝文 on 12/09/17.
//  Copyright (c) 2012年 田村 孝文. All rights reserved.
//

#import "MyClassWithProperty.h"

@implementation MyClassWithProperty
// コンストラクタ
-(id)init
{
    if ((self=[super init]) !=nil) {   // ←親クラスの指定イニシャライザを呼び出す
        // メンバ変数の初期化
        // Objective-Cは、0(=nil)で初期化されるので、
        // 0(=nil)で初期化したい場合は不要
        _valueA=12.3;
        _valueB=@"hogehoge";
    }
    return self;  // ←selfはJavaやPHPの"this"と同じ
}

// メンバ変数へのアクセス
// http://d.hatena.ne.jp/nakamura001/20101101/1288632739
@synthesize valueA=_valueA;
@synthesize valueB=_valueB;
// ↑は↓と同じ事をしている。
/*
// valueAのsetter
-(void)setValueA:(double)valueA
{
    _valueA=valueA;
}
// valueAのgetter
-(double)valueA
{
    return _valueA;
}

//valueBのsetter
-(void)setValueB:(NSString *)valueB
{
    if( _valueB!=valueB){
        [_valueB release];    // ←保持しているオブジェクトを解放してる。
        _valueB=valueB;
    }
}
//valueBのgetter
-(NSString *)valueB
{
    return _valueB;
}
*/
// メソッド
-(NSString *)description
{
    return [NSString stringWithFormat:@"MyClassWithProperty valueA:%lf, valueB:%@",
            [self valueA],
            [self valueB] ];
}


// デストラクタ
-(void)dealloc
{
    [_valueB release];
    [super dealloc];
}


@end
