//
//  ShowViewController.m
//  KryAttributesTools
//
//  Created by 廖靖宇 on 2017/12/11.
//  Copyright © 2017年 liaojingyu. All rights reserved.
//

#import "ShowViewController.h"
#import "KryAttributeWorker.h"
#import "KryAttributesManager.h"

@interface ShowViewController ()<UITextViewDelegate>
@property (nonatomic, strong) UILabel * label;
@property (nonatomic, strong) UITextView * textView;
@end

@implementation ShowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    
        _label = [UILabel new];
        _label.frame = CGRectMake(100, 100, 200, 420);
        _label.numberOfLines = 0;
        _label.text = @"©©©©© 从我身边的情况来讲，程序员是一个很大的吸烟群体，作为曾经一个重度吸烟者，我想吸烟的好处太多了。初去一个公司方便融入团队，每一个互联网公司大概都会有一堆烟民，工作匮乏的时候大家一起下楼聊聊天八卦，马上会有都是革命同志的亲切感；吸烟可以帮助解决问题，当你遇到一个非常复杂的bug，想了半天不能解决，这个时候想出去抽根烟压压惊，可能在眼抽到一半的时候，突然灵光一闪想到了解决方案，回到工位一试果然是这样，还是抽烟有效率；吸烟能提神，能促进交流，能突现灵感，你看程序员们的偶像张小龙也是一个烟鬼，不然他怎么能搞出微信呢？";
        _label.backgroundColor = [UIColor orangeColor];
        [self.view addSubview:_label];
    
    
        _textView = [[UITextView alloc] initWithFrame:CGRectMake(20, 450, 320, 60)];
        _textView.text = @"哈哈哈哈哈哈百度哈";
        [self.view addSubview:_textView];
        _textView.hidden = YES;
        _textView.backgroundColor  = [UIColor orangeColor];
        _textView.editable = NO;
        _textView.delegate = self;
    
    
    [self setupwithindex:self.index];
}

- (void)setupwithindex:(NSInteger)index{
 
    switch (index) {
        case 0:{ // 全部设置
            KryAttributesManager * manager = [KryAttributesManager sharedInstance];
            _label.attributedText =  [manager createwithStr:_label.text task:^(KryAttributeWorker *worker) {
                // range 一定要最后设置
                worker
                .backgroundColor([UIColor blackColor])
                .font([UIFont systemFontOfSize:14])
                .spacing(@1)
                .textColor([UIColor blackColor]);
//                .expansion(@1)
//                .obliqueness(@1)
//                .shadow(0.5, [UIColor purpleColor], CGSizeMake(1, 1))
//                .strokeWidth(@1)
//                .strokeColor([UIColor blueColor])
//                .deletLine(@1, [UIColor blackColor])
//                .underLine(@1, [UIColor lightGrayColor]);
//                .verticalGlyph(@1)
//                .baselineOff(@1)
//                .textEffect(@1);
            }];
        }
            break;
        case 1:{
            KryAttributesManager * manager = [KryAttributesManager sharedInstance];
            _label.attributedText =  [manager createwithStr:_label.text task:^(KryAttributeWorker *worker) {
                // range 一定要最后设置
                //  部分设置时候 参数都是part 开头的
                worker
                .partFont([UIFont fontWithName:@"courer-Bold" size:18])
                .range(NSMakeRange(11, 30));
                
                worker
                .insertImage([UIImage imageNamed:@"2321.png"], 1,CGRectMake(0, 0, 20, 20))
                .insert(@"我是插入文本",1)
                .partTextColor([UIColor yellowColor])
                .partVerticalGlyph(@0)
                .partDeletLine(@1, [UIColor lightGrayColor])
                .range(NSMakeRange(50, 80));
            }];
        }
            break;
        case 2:{
            KryAttributesManager * manager = [KryAttributesManager sharedInstance];
            _label.attributedText =  [manager createwithStr:_label.text task:^(KryAttributeWorker *worker) {
                // range 一定要最后设置
                //  部分设置时候 参数都是part 开头的
                worker
                .font([UIFont systemFontOfSize:12])
                .paragraphlineSpacing(10)
                .paragraphfirstLineHeadIndent(20)
                .paragraphalignment(NSTextAlignmentLeft)
                .paragraphlineBreakMode(NSLineBreakByTruncatingTail)
                .paragraphheadIndent(20)
                .paragraphtailIndent(0)
                .paragraphminimumLineHeight(10)
                .paragraphmaximumLineHeight(20)
                .paragraphSpacing(15)
                .paragraphSpacingBefore(22)
                .paragraphbaseWritingDirection(NSWritingDirectionLeftToRight)
                .paragraphlineHeightMultiple(15)
                .paragraphhyphenationFactor(1);
                
            }];
        }
            break;
        case 3:{
            _label.hidden = YES;
            _textView.hidden = NO;
            KryAttributesManager * manager = [KryAttributesManager sharedInstance];
            _textView.attributedText =  [manager createHyperlinkwithAttStr:_textView.text withUrl:@"http://www.baidu.com" withRange:NSMakeRange(1, 5)];
        }
            break;
        default:
            break;
    }
}
-(BOOL)textView:(UITextView *)textView shouldInteractWithURL:(NSURL *)URL inRange:(NSRange)characterRange interaction:(UITextItemInteraction)interaction{
    return YES;
}

@end
