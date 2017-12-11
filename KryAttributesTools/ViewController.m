//
//  ViewController.m
//  KryAttributesTools
//
//  Created by 廖靖宇 on 2017/11/17.
//  Copyright © 2017年 liaojingyu. All rights reserved.
//

#import "ViewController.h"
#import "KryAttributesManager.h"
#import "KryAttributeWorker.h"


@interface ViewController ()<UITextViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    float floatvalue = 123.213323;
    float hahah = floor(floatvalue*100) / 100;
    NSLog(@"%0.2f", ceil((double)hahah*100) / 100 );
    
    self.view.backgroundColor = [UIColor whiteColor];
    UILabel * label = [UILabel new];
    label.frame = CGRectMake(100, 100, 200, 420);
    label.numberOfLines = 0;
    label.text = @"©©©©© Ah! that is the question. I have my suspicions, but I may be wrong. But when Brenda came home with the news of a murder I guessed that the victim was Malet. The servants came to my study door and found it locked. Robert was with me then, and I had locked the door because I did not want him to be seen. They thought it was you I was talking to, and I said it was you. When afterward you came in by the front door they knew, of course, that I had lied. Brenda asked me about that, and I still declared that you had been with me, but that you had gone out of the study window to the front door. I told her also that I was the man seen by Harold Burton.";

//    label.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:label];
    
    
    UILabel * label1 = [UILabel new];
    label1.frame = CGRectMake(100, 550, 100, 100);
    label1.text = @"woriasdasdasd";
        label1.numberOfLines = 0;
    [self.view addSubview:label1];
    
    
    KryAttributesManager * manager = [KryAttributesManager sharedInstance];
    label.attributedText =  [manager createwithStr:label.text task:^(KryAttributeWorker *worker) {
        worker
        .partBackgroundColor([UIColor purpleColor])
        .partFont([UIFont fontWithName:@"courer-Bold" size:18])
//        .paragraphlineSpacing(10)
        .range(NSMakeRange(11, 30));
        
        worker
        .insertImage([UIImage imageNamed:@"2321.png"], 1,CGRectMake(0, 0, 50, 50))
        .partTextColor([UIColor orangeColor])
        .partVerticalGlyph(@0)
//        .paragraphlineSpacing(60)
        .partDeletLine(@4, [UIColor blackColor])
        .partTextEffect(@1)
        .range(NSMakeRange(50, 80));
    }];
    /**
     * 此属性的值是NSURL对象（首选）或一个NSString对象。此属性的默认值为nil，表示没有链接。
     * UILabel无法使用该属性, 可以使用UITextView 控件.
     */
   
//    UITextView *textView = [[UITextView alloc] initWithFrame:CGRectMake(20, 450, 320, 60)];
//    textView.text = @"哈哈哈哈哈哈百度哈";
//    [self.view addSubview:textView];
//    textView.backgroundColor  = [UIColor orangeColor];
//    textView.attributedText =  [manager createHyperlinkwithAttStr:textView.text withUrl:@"http://www.baidu.com" withRange:NSMakeRange(1, 5)];
//    textView.editable = NO;
//    /* 签订协议, 指定代理人之后. 但点击链接时, 会回调协议方法 (- textView:shouldInteractWithURL:inRange:) */
//    textView.delegate = self;
}

-(BOOL)textView:(UITextView *)textView shouldInteractWithURL:(NSURL *)URL inRange:(NSRange)characterRange interaction:(UITextItemInteraction)interaction{
    return YES;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
