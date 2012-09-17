//
//  MyClass.h
//  exp_class
//
//  Created by 田村 孝文 on 12/09/17.
//  Copyright (c) 2012年 田村 孝文. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyClass : NSObject{
    // メンバ変数
    double _valueA;      // double型の値
    NSString *_valueB;  // オブジェクトへのポインタ
    int _valueC;  // getter/setterの無いメンバ変数は、外部からアクセスできない。
}
// コンストラクタ
-(id)init;

// メンバ変数へのアクセス
-(void)setValueA:(double)valueA;    // valueAのsetter
-(double)valueA;                    // valueAのgetter
-(void)setValueB:(NSString *)valueB;// valueBのsetter
-(NSString *)valueB;                // valueBのgetter

// メソッド
-(NSString *)description;  // descriptionはNSObjectに定義されてる、「サマリ」を返すメソッド

// デストラクタ
-(void)dealloc;

@end
