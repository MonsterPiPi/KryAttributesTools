//
//  KryAttributesManager.h
//  KryAttributesTools
//
//  Created by 廖靖宇 on 2017/11/17.
//  Copyright © 2017年 liaojingyu. All rights reserved.
//

#import <UIKit/UIKit.h>

@class KryAttributeWorker;


@interface KryAttributesManager : NSObject

+(KryAttributesManager*) sharedInstance;

-(NSAttributedString *)createwithStr:(NSString *)str task:(void (^)(KryAttributeWorker * worker))task;

-(NSAttributedString *)createwithAttStr:(NSMutableAttributedString *)AttStr task:(void (^)(KryAttributeWorker * worker))task;

-(NSAttributedString *)createHyperlinkwithAttStr:(NSString *)str withUrl:(NSString *)url withRange:(NSRange )range;

@end
