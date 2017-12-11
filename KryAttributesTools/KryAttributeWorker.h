//
//  KryAttributeWorker.h
//  KryAttributesTools
//
//  Created by 廖靖宇 on 2017/11/17.
//  Copyright © 2017年 liaojingyu. All rights reserved.
//
#import <UIKit/UIKit.h>

@interface KryAttributeWorker : NSObject

/*************************************************整体设置*********************************************************/

///整体背景颜色 对象是UIColor
@property (nonatomic, copy, readonly) KryAttributeWorker *_Nullable(^ _Nonnull backgroundColor)(UIColor * _Nonnull backgroundColor);

///整体字体 对象是UIFont
@property (nonatomic, copy, readonly) KryAttributeWorker *_Nullable(^ _Nonnull font)(UIFont * _Nonnull font);

///整体字体颜色  对象是UIColor
@property (nonatomic, copy, readonly) KryAttributeWorker *_Nullable(^ _Nonnull textColor)(UIColor * _Nonnull textColor);

///整体间距(float)
@property (nonatomic, copy, readonly) KryAttributeWorker *_Nullable(^ _Nonnull spacing)(NSNumber * _Nonnull   spacing);

///整体设置文本扁平化(int).正值横向拉伸文本，负值横向压缩文本
@property (nonatomic, copy, readonly) KryAttributeWorker *_Nullable(^ _Nonnull expansion)(NSNumber * _Nonnull   expansion);

///整体设置倾斜(int).正值右倾，负值左倾
@property (nonatomic, copy, readonly) KryAttributeWorker *_Nullable(^ _Nonnull obliqueness)(NSNumber * _Nonnull   obliqueness);

///整体设置阴影.shadowBlurRadius模糊度 shadowColor模糊颜色 shadowOffset模糊偏移量
@property (nonatomic, copy, readonly) KryAttributeWorker *_Nullable(^ _Nonnull shadow)(float shadowBlurRadius,UIColor * _Nonnull shadowColor, CGSize shadowOffset);

///整体设置边线宽度(int)
@property (nonatomic, copy, readonly) KryAttributeWorker *_Nullable(^ _Nonnull strokeWidth)(NSNumber * _Nonnull  strokeWidth);

///整体设置边线颜色(UIColor)
@property (nonatomic, copy, readonly) KryAttributeWorker *_Nullable(^ _Nonnull strokeColor)(UIColor * _Nonnull strokeColor);

///整体设置删除线(NSUnderlineStyle,UIColor)(颜色默认传空nil)
@property (nonatomic, copy, readonly) KryAttributeWorker *_Nullable(^ _Nonnull deletLine)(NSNumber * _Nonnull  deletlineStyle,UIColor * _Nullable  lineColor);

///整体设置下划线(NSUnderlineStyle,UIColor)(颜色默认传空nil)
@property (nonatomic, copy, readonly) KryAttributeWorker *_Nullable(^ _Nonnull underLine)(NSNumber * _Nonnull  underlineStyle, UIColor * _Nullable  lineColor);

///整体设置文字排版方向(0为水平排版的字，1为垂直排版的字)
@property (nonatomic, copy, readonly) KryAttributeWorker *_Nullable(^ _Nonnull verticalGlyph)(NSNumber * _Nonnull  verticalGlyph);

///整体设置基线偏移值(正值上偏，负值下偏)
@property (nonatomic, copy, readonly) KryAttributeWorker *_Nullable(^ _Nonnull baselineOff)(NSNumber * _Nonnull baselineOff);

///整体设置文本特殊效果，1为启用 0为不启用，目前只有一个可用效果  NSTextEffectLetterpressStyle（凸版印刷效果）
@property (nonatomic, copy, readonly) KryAttributeWorker *_Nullable(^ _Nonnull textEffect)(NSNumber * _Nonnull  textEffect);


/*************************************************部分设置*********************************************************/

///背景颜色 对象是UIColor
@property (nonatomic, copy, readonly) KryAttributeWorker *_Nullable(^ _Nonnull partBackgroundColor)(UIColor * _Nonnull backgroundColor);

///整体字体 对象是UIFont
@property (nonatomic, copy, readonly) KryAttributeWorker *_Nullable(^ _Nonnull partFont)(UIFont * _Nonnull font);

///整体字体颜色  对象是UIColor
@property (nonatomic, copy, readonly) KryAttributeWorker *_Nullable(^ _Nonnull partTextColor)(UIColor * _Nonnull textColor);

///整体间距(float)
@property (nonatomic, copy, readonly) KryAttributeWorker *_Nullable(^ _Nonnull partSpacing)(NSNumber * _Nonnull  spacing);

///整体设置文本扁平化(int).正值横向拉伸文本，负值横向压缩文本
@property (nonatomic, copy, readonly) KryAttributeWorker *_Nullable(^ _Nonnull partExpansion)(NSNumber * _Nonnull  expansion);

///整体设置倾斜(int).正值右倾，负值左倾
@property (nonatomic, copy, readonly) KryAttributeWorker *_Nullable(^ _Nonnull partObliqueness)(NSNumber * _Nonnull obliqueness);

///整体设置阴影.shadowBlurRadius模糊度 shadowColor模糊颜色 shadowOffset模糊偏移量
@property (nonatomic, copy, readonly) KryAttributeWorker *_Nullable(^ _Nonnull partShadow)(float shadowBlurRadius,UIColor * _Nonnull shadowColor, CGSize shadowOffset);

///整体设置边线宽度(int)
@property (nonatomic, copy, readonly) KryAttributeWorker *_Nullable(^ _Nonnull partStrokeWidth)(NSNumber * _Nonnull strokeWidth);

///整体设置边线颜色(UIColor)
@property (nonatomic, copy, readonly) KryAttributeWorker *_Nullable(^ _Nonnull partStrokeColor)(UIColor * _Nonnull strokeColor);

///整体设置删除线(NSUnderlineStyle,UIColor)(颜色默认传空nil)
@property (nonatomic, copy, readonly) KryAttributeWorker *_Nullable(^ _Nonnull partDeletLine)(NSNumber * _Nonnull deletLineStyle ,UIColor * _Nullable  lineColor);

///整体设置下划线(NSUnderlineStyle,UIColor)(颜色默认传空nil)
@property (nonatomic, copy, readonly) KryAttributeWorker *_Nullable(^ _Nonnull partUnderLine)(NSNumber * _Nonnull underLineStyle, UIColor * _Nullable  lineColor);

///整体设置文字排版方向(0为水平排版的字，1为垂直排版的字)
@property (nonatomic, copy, readonly) KryAttributeWorker *_Nullable(^ _Nonnull partVerticalGlyph)(NSNumber * _Nonnull verticalGlyph);

///整体设置基线偏移值(正值上偏，负值下偏)
@property (nonatomic, copy, readonly) KryAttributeWorker *_Nullable(^ _Nonnull partBaselineOff)(NSNumber * _Nonnull baselineOff);


///整体设置文本特殊效果，1为启用 0为不启用，目前只有一个可用效果  NSTextEffectLetterpressStyle（凸版印刷效果）
@property (nonatomic, copy, readonly) KryAttributeWorker *_Nullable(^ _Nonnull partTextEffect)(NSNumber * _Nonnull  textEffect);


/**********************************************paragraphstyle设置**************************************************/
///firstLineHeadIndent 首行缩进
@property (nonatomic, copy ,readonly) KryAttributeWorker * _Nullable(^ _Nonnull paragraphfirstLineHeadIndent)(float paragraphfirstLineHeadIndent);


///paragraphStyle.alignment = NSTextAlignmentJustified;//（两端对齐的）文本对齐方式：（左，中，右，两端对齐，自然）
@property (nonatomic, copy ,readonly) KryAttributeWorker * _Nullable(^ _Nonnull paragraphalignment)(int  paragraphalignment);

///paragraphlineBreakMode 结尾部分的内容以……方式省略
@property (nonatomic, copy ,readonly) KryAttributeWorker * _Nullable(^ _Nonnull paragraphlineBreakMode)(int paragraphlineBreakMode);

///整体缩进(首行除外) headIndent
@property (nonatomic, copy ,readonly) KryAttributeWorker * _Nullable(^ _Nonnull paragraphheadIndent)(float paragraphheadIndent);

///tailIndent 行尾缩进,注意距离是从行首算起
@property (nonatomic, copy ,readonly) KryAttributeWorker * _Nullable(^ _Nonnull paragraphtailIndent)(float paragraphtailIndent);

///paragraphminimumLineHeight 最低行高
@property (nonatomic, copy ,readonly) KryAttributeWorker * _Nullable(^ _Nonnull paragraphminimumLineHeight)(float paragraphminimumLineHeight);

//／maximumLineHeight 最大行高
@property (nonatomic, copy ,readonly) KryAttributeWorker * _Nullable(^ _Nonnull paragraphmaximumLineHeight)(float paragraphmaximumLineHeight);

///paragraphSpacing  段与段之间的间距
@property (nonatomic, copy, readonly) KryAttributeWorker *_Nullable(^ _Nonnull paragraphSpacing)(float paragraphSpacing);

/// 文字对齐方式 
@property (nonatomic, copy, readonly) KryAttributeWorker *_Nullable(^ _Nonnull paragraphbaseWritingDirection)(int   paragraphbaseWritingDirection);

///每行的高度    lineHeightMultiple /* Natural line height is multiplied by this factor (if positive) before being constrained by minimum and maximum line height. */
@property (nonatomic, copy, readonly) KryAttributeWorker *_Nullable(^ _Nonnull paragraphlineHeightMultiple)(float  paragraphlineHeightMultiple);

/// 连字属性 0 or 1 
@property (nonatomic, copy, readonly) KryAttributeWorker *_Nullable(^ _Nonnull paragraphhyphenationFactor)(float  paragraphhyphenationFactor);

//／  上下段落间距
@property (nonatomic, copy, readonly) KryAttributeWorker *_Nullable(^ _Nonnull paragraphlineSpacing)(float paragraphlineSpacing);

/// 整体 段前间隔(\n)
@property (nonatomic, copy, readonly) KryAttributeWorker *_Nullable(^ _Nonnull paragraphSpacingBefore)(float paragraphSpacingBefore);


/**********************************************调用方法**************************************************/
@property (nonatomic,copy) KryAttributeWorker * _Nonnull (^ _Nonnull editText)(NSString * _Nonnull );

@property (nonatomic, copy, readonly) KryAttributeWorker *_Nonnull(^ _Nonnull insert)(id _Nonnull strOrAttrStrOrImg, ...);

//插入图片 位置 尺寸 图片
@property (nonatomic, copy, readonly) KryAttributeWorker *_Nonnull(^ _Nonnull insertImage)(UIImage * _Nonnull image, NSInteger index, CGRect frame);

/// 插入某一段文本(使用时第二个参数一定要有值)
@property (nonatomic,copy) KryAttributeWorker * _Nonnull (^ _Nonnull insertText)(NSString * _Nonnull, NSInteger);

///取代某一段文本
@property (nonatomic, copy, readonly) KryAttributeWorker *_Nonnull(^ _Nonnull replace)(NSRange range, id _Nonnull strOrAttrStr);

///指定范围类 ***使用part时.一定要在最后设置.
@property (nonatomic, copy, readonly)  void(^ _Nonnull range)(NSRange range);

///删除某一段文本
@property (nonatomic,copy) KryAttributeWorker * _Nonnull (^ _Nonnull deleteText)(NSRange range);

///移除某一个属性
@property (nonatomic,copy) KryAttributeWorker * _Nonnull (^ _Nonnull removeAttribute)(NSAttributedStringKey _Nonnull, NSRange);

///移除全部属性 还原到最原本的状态
@property (nonatomic,copy) void  (^ _Nonnull removeAllAttribute)(void);

///将全部文本设置为超链接(必须要在textview中设置)
@property (nonatomic,copy) void  (^ _Nonnull settingHyperlink)(NSString * _Nonnull url,NSRange range);

/// 结束工作
-(NSMutableAttributedString * _Nullable )endWork;
@end
