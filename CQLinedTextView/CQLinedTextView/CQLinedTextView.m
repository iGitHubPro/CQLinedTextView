//
//  CQLinedTextView.m
//  CQLinedTextView
//
//  Created by 刘超群 on 2020/3/21.
//  Copyright © 2020 chaoqun. All rights reserved.
//

#import "CQLinedTextView.h"

@interface CQLinedTextView ()
@property (nonatomic, strong) CQLinedTextLayoutManager *layoutManager;  ///< 布局

@end

@implementation CQLinedTextView
@synthesize layoutManager;

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.layoutManager = [[CQLinedTextLayoutManager alloc] init];
        NSTextStorage *textStorage = [[NSTextStorage alloc] init];
        [textStorage addLayoutManager:self.layoutManager];
        NSTextContainer *textContainer = [[NSTextContainer alloc] init];
        textContainer.size = CGSizeMake(frame.size.width, MAXFLOAT);
        [self.layoutManager addTextContainer:textContainer];
        self = [[CQLinedTextView alloc] initWithFrame:frame textContainer:textContainer];
    }
    return self;
}

@end

@implementation CQLinedTextLayoutManager
/*
 drawBackgroundForGlyphRange方法在每次输入文字，
 收到从storage发出的文本变化的通知之后，都会被调用。
 覆写该方法可以达到在指定Range范围内绘制背景的目的。
 */
/*
 enumerateLineFragmentsForGlyphRange
 可以遍历拿到container中所有的行片段，类型为CGRect;
 usingBlock中的rect是指整个行片段，这个rect是包括文字左右两边的空白区域的。
 而第二个参数usedRect就是指字形所使用的区域，就是包裹整行字形的rect范围。
*/
- (void)drawBackgroundForGlyphRange:(NSRange)glyphsToShow atPoint:(CGPoint)origin {
    [super drawBackgroundForGlyphRange:glyphsToShow atPoint:origin];
    [self enumerateLineFragmentsForGlyphRange:glyphsToShow usingBlock:^(CGRect rect,CGRect usedRect,NSTextContainer * _Nonnull textContainer,NSRange glyphRange,BOOL * _Nonnull stop) {
        // 拿到行数
        CGFloat y = rect.origin.y;
        CGFloat h = rect.size.height;
        //NSInteger row = (y / h) + 1;
        // 根据行数划线
        CGContextRef context = UIGraphicsGetCurrentContext();
        CGContextSetStrokeColorWithColor(context,UIColor.redColor.CGColor);
        CGContextBeginPath(context);
        CGContextMoveToPoint(context, 0, y+origin.y +h);// 起点
        CGContextAddLineToPoint(context, rect.size.width, y+origin.y +h);// 终点
        CGContextStrokePath(context);

    }];
}

@end
