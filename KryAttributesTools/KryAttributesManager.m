//
//  KryAttributesManager.m
//  KryAttributesTools
//
//  Created by 廖靖宇 on 2017/11/17.
//  Copyright © 2017年 liaojingyu. All rights reserved.
//

#import "KryAttributesManager.h"
#import "KryAttributeWorker.h"

@implementation KryAttributesManager


+(KryAttributesManager*) sharedInstance{
    static id  instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc]init];
    });
    return instance;
}

-(NSAttributedString *)createwithStr:(NSString *)str task:(void(^)(KryAttributeWorker * worker))task{
    NSAssert(str, @"param must not be empty!");
    KryAttributeWorker * worker = [KryAttributeWorker new];
    worker.editText(str);
    task(worker);
   return  [worker endWork];
}

-(NSAttributedString *)createwithAttStr:(NSMutableAttributedString *)AttStr task:(void (^)(KryAttributeWorker *))task{
    NSAssert(AttStr, @"param must not be empty!");
    KryAttributeWorker * worker = [KryAttributeWorker new];
    worker.insert(AttStr);
    task(worker);
    return  [worker endWork];
}

-(NSAttributedString *)createHyperlinkwithAttStr:(NSString *)str withUrl:(NSString *)url withRange:(NSRange )range{
    NSAssert(str, @"param must not be empty!");
    NSAssert(url, @"param must not be empty!");
    KryAttributeWorker * worker = [KryAttributeWorker new];
    worker.editText(str);
    worker.settingHyperlink(url, range);
    return  [worker endWork];
}
@end
