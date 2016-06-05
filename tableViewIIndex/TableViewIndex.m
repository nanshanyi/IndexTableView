//
//  IndexView.m
//  tableViewIIndex
//
//  Created by 李国怀 on 16/6/4.
//  Copyright © 2016年 李国怀. All rights reserved.
//

#import "TableViewIndex.h"

@interface TableViewIndex ()
@property (nonatomic,strong)NSArray *indexArray;
@property (nonatomic)CGSize textLayerSize;
@end

@implementation TableViewIndex

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {

    }
    return  self;
}
- (void)layoutSubviews{
    [super layoutSubviews];
    [self setup];
    [self.indexArray enumerateObjectsUsingBlock:^(NSString *index, NSUInteger idx, BOOL * _Nonnull stop) {
        CATextLayer *layer = [self textLayerWithText:index Frame:CGRectMake(0, idx*_textLayerSize.height, _textLayerSize.width, _textLayerSize.height)];

        [self.layer addSublayer:layer];

    }];
}
- (UILabel*)textLbelWithText:(NSString*)title Frame:(CGRect)frame tag:(NSInteger)tag{
    UILabel *label = [[UILabel alloc]initWithFrame:frame];
    label.text = title;
    label.tag = 100+tag;
    return label;
}
- (CATextLayer*)textLayerWithText:(NSString*)title Frame:(CGRect)frame{
    CATextLayer *layer = [CATextLayer layer];
    layer.frame = frame;
    layer.alignmentMode = kCAAlignmentCenter;
    layer.string = title;
    layer.foregroundColor = self.textColor.CGColor;
    CFStringRef fontName = (__bridge CFStringRef)_textFont.fontName;
    CGFontRef fontRef = CGFontCreateWithFontName(fontName);
    layer.font = fontRef;
    layer.fontSize = _textFont.pointSize;
    CGFontRelease(fontRef);
    layer.contentsScale = [UIScreen mainScreen].scale;
    return layer;
}
- (void)setDelegate:(id<tableViewIndexDelegate>)delegate{
    _delegate = delegate;
    [self layoutSubviews];
}
- (void)setup{
    self.indexArray = [self.delegate tableViewIndexArray:self];
    _textLayerSize = CGSizeMake(self.bounds.size.width, self.frame.size.height/self.indexArray.count);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [super touchesBegan:touches withEvent:event];
    [self sendTouchEventToDelegate:event];
}
- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [super touchesMoved:touches withEvent:event];
    [self sendTouchEventToDelegate:event];
}
- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.delegate tableViewIndexTouchEnd:self];

}
- (void)sendTouchEventToDelegate:(UIEvent*)event{
    UITouch *touch = [[event allTouches] anyObject];
    CGPoint touchPoint = [touch locationInView:self];
    
    NSInteger index = (NSInteger)(touchPoint.y/_textLayerSize.height);
 
    if (index < 0 || index > self.indexArray.count-1) {
        return;
    }
    [self.delegate tableViewIndex:self selectSectionIndex:index sectionTitle:_indexArray[index]];
}


@end
