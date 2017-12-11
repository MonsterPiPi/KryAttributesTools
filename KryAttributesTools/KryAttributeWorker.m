//
//  KryAttributeWorker.m
//  KryAttributesTools
//
//  Created by 廖靖宇 on 2017/11/17.
//  Copyright © 2017年 liaojingyu. All rights reserved.
//
//NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
//paragraphStyle.lineSpacing = 10;// 字体的行间距
//paragraphStyle.firstLineHeadIndent = 20.0f;//首行缩进
//paragraphStyle.alignment = NSTextAlignmentJustified;//（两端对齐的）文本对齐方式：（左，中，右，两端对齐，自然）
//paragraphStyle.lineBreakMode = NSLineBreakByTruncatingTail;//结尾部分的内容以……方式省略 ( "...wxyz" ,"abcd..." ,"ab...yz")

//paragraphStyle.headIndent = 20;//整体缩进(首行除外)
//paragraphStyle.tailIndent = 20;//
//paragraphStyle.minimumLineHeight = 10;//最低行高
//paragraphStyle.maximumLineHeight = 20;//最大行高
//paragraphStyle.paragraphSpacing = 15;//段与段之间的间距
//paragraphStyle.paragraphSpacingBefore = 22.0f;//段首行空白空间/* Distance between the bottom of the previous paragraph (or the end of its paragraphSpacing, if any) and the top of this paragraph. */
//paragraphStyle.baseWritingDirection = NSWritingDirectionLeftToRight;//从左到右的书写方向（一共三种）
//paragraphStyle.lineHeightMultiple = 15;/* Natural line height is multiplied by this factor (if positive) before being constrained by minimum and maximum line height. */
//paragraphStyle.hyphenationFactor = 1;//连字属性 在iOS，唯一支持的值分别为0和1

#import "KryAttributeWorker.h"
#import <objc/message.h>

@interface KryAttributeWorker (){
    NSRange  range;
}

@property (nonatomic, strong) NSMutableAttributedString * attstr;
@property (nonatomic, strong) NSString *  rangestr;
@property (nonatomic, strong) NSMutableParagraphStyle *style;
@property (nonatomic, assign) NSNumber  *  _partspacing;
@property (nonatomic, strong) UIColor   *  _partbackgroundColor;
@property (nonatomic, strong) UIFont    *  _partfont;
@property (nonatomic, strong) UIColor   *  _parttextColor;
@property (nonatomic, assign) NSNumber  *  _partNSUnderlineStyle;
@property (nonatomic, strong) UIColor   *  _partstrikethroughColor;
@property (nonatomic, assign) NSNumber  *  _partunderline;
@property (nonatomic, strong) UIColor   *  _partunderlineColor;
@property (nonatomic, strong) UIColor   *  _partstrokeColor;
@property (nonatomic, assign) NSNumber  *  _partstrokeWidth;
@property (nonatomic, strong) NSShadow  *  _partshadow;
@property (nonatomic, assign) NSNumber  *  _partObliqueness;
@property (nonatomic, assign) NSNumber  *  _partExpansion;
@property (nonatomic, assign) NSNumber  *  _partVerticalGlyph;
@property (nonatomic, assign) NSNumber  *  _partBaselineOffset;
@property (nonatomic, assign) NSNumber  *  _partTextEffect;
@end

@implementation KryAttributeWorker

- (instancetype)init {
    self = [super init];
    if ( !self ) return nil;
    [self prepareWork];
    return self;
}

- (void)prepareWork {
    _attstr = ((NSMutableAttributedString *(*)(id, SEL))(void *)objc_msgSend)((id)objc_getClass("NSMutableAttributedString"), sel_registerName("alloc"));
    _attstr  = ((NSMutableAttributedString *(*)(id, SEL))(void *)objc_msgSend)((id)_attstr, sel_registerName("init"));
}

-(NSMutableAttributedString *)endWork{
    [_attstr addAttribute:NSParagraphStyleAttributeName value:self.style range:_rangeAll(_attstr)];
    _style = nil;
    return _attstr;
}

- (NSMutableParagraphStyle *)style{
    if (_style == nil) {
        _style  = [[NSMutableParagraphStyle alloc]init];
    }
    return _style;
}

// firstLineHeadIndent
-(KryAttributeWorker * _Nullable (^)(float))paragraphfirstLineHeadIndent{
    return ^ KryAttributeWorker *(float paragraphfirstLineHeadIndent){
        self.style.firstLineHeadIndent = paragraphfirstLineHeadIndent;
        return self;
    };
}


//alignment
-(KryAttributeWorker * _Nullable (^)(int))paragraphalignment{
    return ^ KryAttributeWorker *(int  paragraphalignment){
        self.style.alignment = paragraphalignment ;
        return self;
    };
}


//paragraphlineBreakMode 结尾部分的内容以……方式省略
-(KryAttributeWorker * _Nullable (^)(int))paragraphlineBreakMode{
    return ^ KryAttributeWorker *(int paragraphlineBreakMode){
        self.style.lineBreakMode = paragraphlineBreakMode;
        return self;
    };
}

//整体缩进(首行除外) headIndent
-(KryAttributeWorker * _Nullable (^)(float))paragraphheadIndent{
    return ^ KryAttributeWorker *(float paragraphheadIndent){
        self.style.headIndent = paragraphheadIndent;
        return self;
    };
}

//tailIndent 行尾缩进,注意距离是从行首算起
-(KryAttributeWorker * _Nullable (^)(float))paragraphtailIndent{
    return ^ KryAttributeWorker *(float paragraphtailIndent){
        self.style.tailIndent = paragraphtailIndent;
        return self;
    };
}

//minimumLineHeight
-(KryAttributeWorker * _Nullable (^)(float))paragraphminimumLineHeight{
    return ^ KryAttributeWorker *(float paragraphminimumLineHeight){
        self.style.minimumLineHeight = paragraphminimumLineHeight;
        return self;
    };
}

//maximumLineHeight
-(KryAttributeWorker * _Nullable (^)(float))paragraphmaximumLineHeight{
    return ^ KryAttributeWorker *(float paragraphmaximumLineHeight){
        self.style.maximumLineHeight = paragraphmaximumLineHeight;
        return self;
    };
}


//paragraphSpacing
-(KryAttributeWorker * _Nullable (^)(float))paragraphSpacing{
    return ^ KryAttributeWorker *(float paragraphSpacing){
        self.style.paragraphSpacing = paragraphSpacing;
        return self;
    };
}

// 文字对齐方式
- (KryAttributeWorker * _Nullable (^)(int))paragraphbaseWritingDirection{
    return ^ KryAttributeWorker *(int paragraphbaseWritingDirection){
        self.style.baseWritingDirection = paragraphbaseWritingDirection;
        return self;
    };
}

//lineHeightMultiple 每行的高度
-(KryAttributeWorker * _Nullable (^)(float))paragraphlineHeightMultiple{
    return ^ KryAttributeWorker *(float paragraphlineHeightMultiple){
        self.style.lineHeightMultiple = paragraphlineHeightMultiple;
        return self;
    };
}

// 连字属性
-(KryAttributeWorker * _Nullable (^)(float))paragraphhyphenationFactor{
    return ^ KryAttributeWorker * (float paragraphhyphenationFactor){
        if (paragraphhyphenationFactor ==1) {
            self.style.hyphenationFactor = paragraphhyphenationFactor;
        }
        return self;
    };
}

// 段落首行空白区间
-(KryAttributeWorker *(^)(float))paragraphSpacingBefore{
    return ^ KryAttributeWorker *(float paragraphSpacingBefore) {
        self.style.paragraphSpacingBefore = paragraphSpacingBefore;
        return self;
    };
}

//  上下段落间距
-(KryAttributeWorker * _Nullable (^)(float))paragraphlineSpacing{
    return ^KryAttributeWorker *(float paragraphlineSpacing) {
        self.style.lineSpacing = paragraphlineSpacing;
    return self;
    };
}


/*************************************************部分设置*********************************************************/
//间距
-(KryAttributeWorker * _Nullable (^)(NSNumber * _Nonnull))partSpacing{
    return ^ KryAttributeWorker *(NSNumber * spacing){
        __partspacing = spacing;
        return  self;
    };
}


// text backgroundcolor
-(KryAttributeWorker * _Nullable (^)(UIColor * _Nonnull))partBackgroundColor {
    return ^ KryAttributeWorker *(UIColor *color) {
        __partbackgroundColor = color;
        return self;
    };
}


// text font
-(KryAttributeWorker * _Nullable (^)(UIFont * _Nonnull))partFont{
    return ^ KryAttributeWorker *(UIFont *font) {
        __partfont = font;
        return self;
    };
}

// text color
-(KryAttributeWorker * _Nullable (^)(UIColor * _Nonnull))partTextColor{
    return ^ KryAttributeWorker *(UIColor *textColor) {
        __parttextColor = textColor;
        return self;
    };
}


//NSStrikethroughStyleAttributeName(删除线)
-(KryAttributeWorker * _Nullable (^)(NSNumber * _Nonnull, UIColor * _Nullable))partDeletLine{
    return ^ KryAttributeWorker *(NSNumber *  NSUnderlineStyle,UIColor *  linecolor) {
        __partNSUnderlineStyle = NSUnderlineStyle;
        if (linecolor != nil) {
             __partstrikethroughColor = linecolor;
        }
        return self;
    };
}

// NSUnderlineStyleAttributeName(下划线)
-(KryAttributeWorker * _Nullable (^)(NSNumber * _Nonnull, UIColor * _Nullable))partUnderLine{
        return ^ KryAttributeWorker *(NSNumber *  underline,UIColor *  linecolor) {
            __partunderline = underline;
            if (linecolor !=nil) {
                 __partunderlineColor = linecolor;
            }
            return self;
        };
}

// NSStrokeColorAttributeName (边线颜色)
-(KryAttributeWorker * _Nullable (^)(UIColor * _Nonnull))partStrokeColor{
    return ^ KryAttributeWorker *(UIColor *strokeColor) {
        __partstrokeColor = strokeColor;
        return self;
    };
}

// NSStrokeWidthAttributeName(边线宽度)
-(KryAttributeWorker * _Nullable (^)(NSNumber * _Nonnull))partStrokeWidth{
    return ^ KryAttributeWorker *(NSNumber *  strokeWidth) {
        __partstrokeWidth = strokeWidth;
        return self;
    };
}

// NSShadowAttributeName 阴影
-(KryAttributeWorker * _Nullable (^)(float, UIColor * _Nonnull, CGSize))partShadow{
    return ^ KryAttributeWorker *(float shadowBlurRadius,UIColor * _Nonnull shadowColor, CGSize shadowOffset){
        NSShadow *exshadow = [[NSShadow alloc] init];
        exshadow.shadowBlurRadius = shadowBlurRadius;    // 模糊度
        exshadow.shadowColor = shadowColor;
        exshadow.shadowOffset = shadowOffset;
        __partshadow = exshadow;
        return self;
    };
}

///NSObliquenessAttributeName(倾斜)
-(KryAttributeWorker * _Nullable (^)(NSNumber * _Nonnull))partObliqueness{
    return ^ KryAttributeWorker *(NSNumber * Obliqueness){
        __partObliqueness = Obliqueness;
        return self;
    };
}

///NSExpansionAttributeName 扁平化
- (KryAttributeWorker * _Nullable (^)(NSNumber * _Nonnull))partExpansion{
    return ^ KryAttributeWorker *(NSNumber * Expansion){
        __partExpansion = Expansion;
        return self;
    };
}

-(KryAttributeWorker * _Nullable (^)(NSNumber * _Nonnull))partVerticalGlyph{
    return ^ KryAttributeWorker *(NSNumber * verticalGlyph){
        __partVerticalGlyph = verticalGlyph;
        return self;
    };
}

-(KryAttributeWorker * _Nullable (^)(NSNumber * _Nonnull))partBaselineOff{
    return ^ KryAttributeWorker *(NSNumber * baselineOff){
        __partBaselineOffset = baselineOff;
        return self;
    };
}

-(KryAttributeWorker * _Nullable (^)(NSNumber * _Nonnull))partTextEffect{
    return ^KryAttributeWorker *(NSNumber * textEffect){
        __partTextEffect = textEffect;
        return self;
    };
}

/*************************************************全部设置*********************************************************/
//间距
-(KryAttributeWorker * _Nullable (^)(NSNumber * _Nonnull ))spacing{
    return ^ KryAttributeWorker *(NSNumber *  spacing){
        [_attstr addAttribute:NSKernAttributeName value:spacing range:_rangeAll(_attstr)];
        return  self;
    };
    
}

// text backgroundcolor
- (KryAttributeWorker *(^)(UIColor *))backgroundColor {
    return ^ KryAttributeWorker *(UIColor *color) {
        [_attstr addAttribute:NSBackgroundColorAttributeName value:color range:[_rangestr rangeOfString:_rangestr]];
        return self;
    };
}

// text font
- (KryAttributeWorker *(^)(UIFont *))font {
    return ^ KryAttributeWorker *(UIFont *font) {
        [_attstr addAttribute:NSFontAttributeName value:font range:_rangeAll(_attstr)];
        return self;
    };
}

// text color
-(KryAttributeWorker * _Nullable (^)(UIColor * _Nullable))textColor{
    return ^ KryAttributeWorker *(UIColor *textColor) {
        [_attstr addAttribute:NSForegroundColorAttributeName value:textColor range:_rangeAll(_attstr)];
        return self;
    };
}


//NSStrikethroughStyleAttributeName(删除线)
-(KryAttributeWorker * _Nullable (^)(NSNumber * _Nonnull, UIColor * _Nullable))deletLine{
    return ^ KryAttributeWorker *(NSNumber *  NSUnderlineStyle,UIColor * linecolor) {
//        NSUnderlineStyleNone
        [_attstr addAttribute:NSStrikethroughStyleAttributeName value:NSUnderlineStyle  range:_rangeAll(_attstr)];
        if (linecolor !=nil) {
            [_attstr addAttribute:NSStrikethroughColorAttributeName value:linecolor  range:_rangeAll(_attstr)];
        }
        return self;
    };
}

//  NSUnderlineStyleAttributeName(下划线)
-(KryAttributeWorker * _Nullable (^)(NSNumber * _Nonnull, UIColor * _Nullable))underLine{
    return ^ KryAttributeWorker *(NSNumber *  underline , UIColor * linecolor){
        [_attstr addAttribute:NSUnderlineStyleAttributeName value:underline  range:_rangeAll(_attstr)];
        if (linecolor !=nil) {
          [_attstr addAttribute:NSUnderlineColorAttributeName value:linecolor  range:_rangeAll(_attstr)];
        }
        return self;
    };
}

// NSStrokeColorAttributeName (边线颜色)
-(KryAttributeWorker * _Nullable (^)(UIColor * _Nullable))strokeColor{
    return ^ KryAttributeWorker *(UIColor *strokeColor) {
        [_attstr addAttribute:NSStrokeColorAttributeName value:strokeColor range:_rangeAll(_attstr)];
        return self;
    };
}
// NSStrokeWidthAttributeName(边线宽度)
-(KryAttributeWorker * _Nullable (^)(NSNumber * _Nonnull ))strokeWidth{
    return ^ KryAttributeWorker *(NSNumber *  strokeWidth) {
        [_attstr addAttribute:NSStrokeWidthAttributeName value:strokeWidth range:_rangeAll(_attstr)];
        return self;
    };
}

// NSShadowAttributeName 阴影
-(KryAttributeWorker * _Nullable (^)(float, UIColor * _Nonnull, CGSize))shadow{
    return ^ KryAttributeWorker *(float shadowBlurRadius,UIColor * _Nonnull shadowColor, CGSize shadowOffset){
          NSShadow *exshadow = ((NSShadow *(*)(id, SEL))(void *)objc_msgSend)((id)objc_getClass("NSShadow"), sel_registerName("alloc"));
                   exshadow  = ((NSShadow *(*)(id, SEL))(void *)objc_msgSend)((id)_attstr, sel_registerName("init"));
                   exshadow.shadowBlurRadius = shadowBlurRadius;
                   exshadow.shadowColor = shadowColor;
                   exshadow.shadowOffset = shadowOffset;
        [_attstr addAttribute:NSShadowAttributeName value:exshadow range:_rangeAll(_attstr)];
        return self;
    };
}

/// NSObliquenessAttributeName(倾斜)
-(KryAttributeWorker * _Nullable (^)(NSNumber * _Nonnull))obliqueness{
    return ^ KryAttributeWorker *(NSNumber *  Obliqueness){
        [_attstr addAttribute:NSObliquenessAttributeName value:Obliqueness range:_rangeAll(_attstr)];
        return self;
    };
}

/// NSExpansionAttributeName 扁平化
-(KryAttributeWorker * _Nullable (^)(NSNumber * _Nonnull))expansion{
    return ^ KryAttributeWorker *(NSNumber *  Expansion){
        [_attstr addAttribute:NSExpansionAttributeName value:Expansion range:_rangeAll(_attstr)];
        return self;
    };
}

/// 值为整型NSNumber，0为水平排版的字，1为垂直排版的字。注意,在iOS中, 总是以横向排版   In iOS, horizontal text is always used and specifying a different value is undefined.
-(KryAttributeWorker * _Nullable (^)(NSNumber * _Nonnull))verticalGlyph{
    return ^KryAttributeWorker *(NSNumber *  verticalGlyph){
         [_attstr addAttribute:NSVerticalGlyphFormAttributeName value:verticalGlyph range:_rangeAll(_attstr)];
        return self;
    };
}

///  NSBaselineOffsetAttributeName 设置基线偏移值
/* 此属性的值是包含一个浮点值的NSNumber对象,表示的字符从基线偏移的NSNumber对象，默认值是0。正值上偏，负值下偏 */
-(KryAttributeWorker * _Nullable (^)(NSNumber * _Nonnull))baselineOff{
    return ^KryAttributeWorker *(NSNumber * baselineOff){
        [_attstr addAttribute:NSBaselineOffsetAttributeName value:baselineOff range:_rangeAll(_attstr)];
        return self;
    };
}

///NSTextEffectAttributeName 设置文本特殊效果，1为启用 0为不启用，目前只有一个可用效果  NSTextEffectLetterpressStyle（凸版印刷效果）
-(KryAttributeWorker * _Nullable (^)(NSNumber * _Nonnull))textEffect{
    return ^KryAttributeWorker *(NSNumber * textEffect){
        if ([textEffect intValue] == 1) {
            [_attstr addAttribute:NSTextEffectAttributeName value:NSTextEffectLetterpressStyle range:_rangeAll(_attstr)];
        }
            return self;
    };
}


/*************************************************插入 片段*********************************************************/
- (KryAttributeWorker * _Nonnull (^)(id _Nonnull, ...))insert {
    
    return ^ KryAttributeWorker *(id insert, ...) {
        va_list args;
        va_start(args, insert);
        if      ( [insert isKindOfClass:[NSString class]] ) {
            self.insertText(insert, va_arg(args, NSInteger));
        }
        else if ( [insert isKindOfClass:[NSAttributedString class]] ) {
            self.insertAttr(insert, va_arg(args, NSInteger));
        }
        else if ( [insert isKindOfClass:[UIImage class]] ) {
            self.insertImage(insert, va_arg(args, NSInteger), va_arg(args, CGRect));
        }
        va_end(args);
        return self;
    };
}

-(KryAttributeWorker * _Nonnull (^)(UIImage * _Nonnull, NSInteger,CGRect))insertImage{
    return ^ KryAttributeWorker *(UIImage *image, NSInteger index,CGRect frame) {
        if ( -1 == index ) index = _attstr.length;
        NSTextAttachment *attach = [[NSTextAttachment alloc] initWithData:nil ofType:nil];
        attach.bounds = frame;
        attach.image = image;
        
        self.insertAttr([NSAttributedString attributedStringWithAttachment:attach], index);
        return self;
    };
}

- (KryAttributeWorker * _Nonnull (^)(NSAttributedString * _Nonnull, NSInteger))insertAttr {
    return ^ KryAttributeWorker *(NSAttributedString *attr, NSInteger index) {
        if ( -1 == index ) index = _attstr.length;
        [_attstr insertAttributedString:attr atIndex:index];
        return self;
    };
}

- (KryAttributeWorker * _Nonnull (^)(NSString * _Nonnull, NSInteger))insertText {
    return ^ KryAttributeWorker *(NSString *text, NSInteger index) {
        if ( -1 == index ) index = _attstr.length;
        self.insertAttr([[NSAttributedString alloc] initWithString:text], index);
        return self;
    };
}

-(KryAttributeWorker * _Nonnull (^)(NSString * _Nonnull))editText{
    return ^KryAttributeWorker *(NSString * text) {
         self.insertAttr([[NSAttributedString alloc] initWithString:text],0);
        return self;
    };
}


-(KryAttributeWorker *(^)(NSRange))deleteText{
    return ^KryAttributeWorker *(NSRange range) {
        [self.attstr deleteCharactersInRange:range];
        return self;
    };
}

- (KryAttributeWorker * _Nonnull (^)(NSAttributedStringKey _Nonnull, NSRange))removeAttribute {
    return ^ KryAttributeWorker *(NSAttributedStringKey key, NSRange range) {
        [self.attstr removeAttribute:key range:range];
        return self;
    };
}


-(void (^)(void))removeAllAttribute{
    return ^(){
    [_attstr enumerateAttributesInRange:_rangeAll(_attstr) options:NSAttributedStringEnumerationReverse usingBlock:^(NSDictionary<NSAttributedStringKey,id> * _Nonnull attrs, NSRange range, BOOL * _Nonnull stop) {
        [attrs enumerateKeysAndObjectsUsingBlock:^(NSAttributedStringKey  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
            self.removeAttribute(key, range);
        }];
    }];
    };
}

/*************************************************range 片段*********************************************************/

-(void  (^)(NSRange))range{
    return ^(NSRange range){
        if (__partspacing) {
          [_attstr addAttribute:NSKernAttributeName value:__partspacing range:range];
            __partspacing = nil;
        }
        if (__partbackgroundColor) {
             [_attstr addAttribute:NSBackgroundColorAttributeName value:__partbackgroundColor range:range];
            __partbackgroundColor = nil;
        }
        if (__partfont) {
            [_attstr addAttribute:NSFontAttributeName value:__partfont range:range];
            __partfont = nil;
        }
        if (__parttextColor) {
            [_attstr addAttribute:NSForegroundColorAttributeName value:__parttextColor range:range];
            __parttextColor = nil;
        }
        if (__partNSUnderlineStyle) {
              [_attstr addAttribute:NSStrikethroughStyleAttributeName value:__partNSUnderlineStyle  range:range];
            __partNSUnderlineStyle = nil;
        }
        if (__partunderline) {
             [_attstr addAttribute:NSUnderlineStyleAttributeName value:__partunderline range:range];
            __partunderline = nil;
        }
        if (__partstrokeColor) {
            [_attstr addAttribute:NSStrokeColorAttributeName value:__partstrokeColor range:range];
            __partstrokeColor = nil;
        }
        if (__partstrokeWidth) {
            [_attstr addAttribute:NSStrokeWidthAttributeName value:__partstrokeWidth range:range];
            __partstrokeWidth = nil;
        }
        if (__partshadow) {
           [_attstr addAttribute:NSShadowAttributeName value:__partshadow range:range];
            __partshadow = nil;
        }
        if (__partObliqueness) {
              [_attstr addAttribute:NSObliquenessAttributeName value:__partObliqueness range:range];
            __partObliqueness = nil;
        }
        if (__partExpansion) {
            [_attstr addAttribute:NSExpansionAttributeName value:__partExpansion range:range];
            __partExpansion = nil;
        }
        if (__partVerticalGlyph) {
            [_attstr addAttribute:NSVerticalGlyphFormAttributeName value:__partVerticalGlyph range:range];
            __partVerticalGlyph = nil;
        }
        if (__partBaselineOffset) {
            [_attstr addAttribute:NSBaselineOffsetAttributeName value:__partBaselineOffset range:range];
            __partBaselineOffset = nil;
        }
        if ([__partTextEffect intValue] == 1) {
              [_attstr addAttribute:NSTextEffectAttributeName value:NSTextEffectLetterpressStyle range:range];
            __partTextEffect = nil;
        }
        if (__partunderlineColor) {
            [_attstr addAttribute:NSUnderlineColorAttributeName value:__partunderlineColor range:range];
            __partunderlineColor = nil;
        }
        if (__partstrikethroughColor) {
            [_attstr addAttribute:NSStrikethroughColorAttributeName value:__partstrikethroughColor range:range];
            __partstrikethroughColor = nil;
        }
    };
}

static inline  NSRange _rangeAll(NSAttributedString *attr) {
    return NSMakeRange(0, attr.length);
}

-(void (^)(NSString * _Nonnull, NSRange))settingHyperlink{
        return ^(NSString * url,NSRange range){
         [_attstr addAttribute:NSLinkAttributeName value:[NSURL URLWithString:url] range:range];
    };
}

/********************************           替换                         *********************************/
-(KryAttributeWorker * _Nonnull (^)(NSRange, id _Nonnull))replace{
    return ^KryAttributeWorker *(NSRange rang,id strORattstr){
        if([strORattstr isKindOfClass:[NSString class]]) {
                    [_attstr replaceCharactersInRange:range withString:strORattstr];
        }else if([strORattstr isKindOfClass:[NSAttributedString class]]) {
                    [_attstr replaceCharactersInRange:range withAttributedString:strORattstr];}
        return self;
        };
}
/********************************            color                          *********************************/
+ (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha
{
    //删除字符串中的空格
    NSString *cString = [[color stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    // String should be 6 or 8 characters
    if ([cString length] < 6)
    {
        return [UIColor clearColor];
    }
    // strip 0X if it appears
    //如果是0x开头的，那么截取字符串，字符串从索引为2的位置开始，一直到末尾
    if ([cString hasPrefix:@"0X"])
    {
        cString = [cString substringFromIndex:2];
    }
    //如果是#开头的，那么截取字符串，字符串从索引为1的位置开始，一直到末尾
    if ([cString hasPrefix:@"#"])
    {
        cString = [cString substringFromIndex:1];
    }
    if ([cString length] != 6)
    {
        return [UIColor clearColor];
    }
    
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    //r
    NSString *rString = [cString substringWithRange:range];
    //g
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    //b
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    return [UIColor colorWithRed:((float)r / 255.0f) green:((float)g / 255.0f) blue:((float)b / 255.0f) alpha:alpha];
}

//默认alpha值为1
+ (UIColor *)colorWithHexString:(NSString *)color
{
    return [self colorWithHexString:color alpha:1.0f];
}

@end
