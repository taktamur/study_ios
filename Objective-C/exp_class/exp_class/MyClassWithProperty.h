//
//  MyClassWithProperty.h
//  exp_class
//
//  Created by 田村 孝文 on 12/09/17.
//  Copyright (c) 2012年 田村 孝文. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyClassWithProperty : NSObject{
    // メンバ変数
    double _valueA;      // double型の値
    NSString *_valueB;  // オブジェクトへのポインタ
    int _valueC;  // @propertyの無いメンバ変数は、外部からアクセスできない。

}
// コンストラクタ
-(id)init;

// メンバ変数へのアクセス
// http://d.hatena.ne.jp/nakamura001/20101101/1288632739
@property double valueA;
@property(nonatomic,retain) NSString *valueB;  // nonatomicとかretainは後で
// ↑が↓の代わりとなる。
//-(void)setValueA:(double)valueA;
//-(double)valueA;
//-(void)setValueB:(NSString *)valueB;
//-(NSString *)valueB;


// メソッド
-(NSString *)description;  // descriptionはNSObjectに定義されてる、「サマリ」を返すメソッド

// デストラクタ
-(void)dealloc;



@end
