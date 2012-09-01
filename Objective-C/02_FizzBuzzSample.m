//
//  main.m
//  FizzBuzz
//
//  Created by 田村 孝文 on 12/09/01.
//  Copyright (c) 2012年 田村 孝文. All rights reserved.
//

#import <Foundation/Foundation.h>

NSArray *fizzBuzzArray(int count)
{
    NSMutableArray *fizzBuzzArray = [NSMutableArray arrayWithCapacity:count];
    for( int i=1; i<count+1; i++ ){
        if( i%15 == 0 ){
            [fizzBuzzArray addObject:@"Fizz Buzz"];
        }else if(i%3 == 0){
            [fizzBuzzArray addObject:@"Fizz"];
        }else if(i%5 == 0){
            [fizzBuzzArray addObject:@"Buzz"];
        }else{
            [fizzBuzzArray addObject:[NSString stringWithFormat:@"%d",i]];
        }
    }
    return fizzBuzzArray;
}

int main(int argc, const char * argv[])
{
    
    @autoreleasepool {
        NSArray *fizzBuzz = fizzBuzzArray(100);
        for (NSString *value in fizzBuzz) {
            NSLog(@"%@",value);
        }
    }
    return 0;
}


