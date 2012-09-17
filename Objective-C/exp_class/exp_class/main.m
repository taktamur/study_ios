//
//  main.m
//  exp_class
//
//  Created by 田村 孝文 on 12/09/17.
//  Copyright (c) 2012年 田村 孝文. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MyClass.h" // *.hを読み込む
#import "MyClassWithProperty.h"
int main(int argc, const char * argv[])
{

    @autoreleasepool {
//        MyClass *myObj=[[MyClass alloc]init];
        MyClassWithProperty *myObj=[[MyClassWithProperty alloc]init];
        NSLog( @"%@",[myObj description]);
        
        // myObjへの値の代入と参照（メソッド呼び出しの形）
        [myObj setValueA:45.6];
        [myObj setValueB:@"Hello!"];
        NSLog( @"valueA=%lf",[myObj valueA]);
        NSLog( @"valueB=%@",[myObj valueB]);
        NSLog( @"%@",[myObj description]);

        //myObjへの値の代入と参照（ドット演算子の形）
        // [myObj setXXX]や[myObj xxx]の形（メソッド呼び出し）に変換されて
        myObj.valueA=12345.6;
        myObj.valueB=@"World!";
        NSLog( @"valueA=%lf",myObj.valueA);
        NSLog( @"valueB=%@",myObj.valueB);
        NSLog( @"%@",[myObj description]);
        
        
        // myObjの廃棄
        [myObj release];
        myObj=nil;
        
    }
    return 0;
}

