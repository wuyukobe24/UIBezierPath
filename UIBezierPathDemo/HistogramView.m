//
//  HistogramView.m
//  UIBezierPathDemo
//
//  Created by WXQ on 2018/8/30.
//  Copyright © 2018年 JingBei. All rights reserved.
//

#import "HistogramView.h"
#import "UILabel+Category.h"

#define K_WIDTH          CGRectGetWidth(self.frame)
#define K_HEIGHT         CGRectGetHeight(self.frame)
#define K_LABEL_HEIGHT   30
@implementation HistogramView {
    CAShapeLayer * _shaLayer;
}

- (instancetype)initWithFrame:(CGRect)frame topArray:(NSArray *)topArray bottoArray:(NSArray *)bottomArray {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        self.topArray = topArray;
        self.bottomArray = bottomArray;
    }
    return self;
}

//动画
- (void)startStroke {
    [_shaLayer addAnimation:self.pathAnimation forKey:@"strokeEndAnimation"];
}

- (void)layoutSubviews {
    NSUInteger count = self.topArray.count;
    if (count<1) return;
    
    //获取数据最大值
    float max = [[self.topArray valueForKeyPath:@"@max.intValue"] floatValue];
    //获取比例大小
    float scale = (K_HEIGHT-K_LABEL_HEIGHT*2)/max;
    //创建label和饼状图
    for (int i=0; i<count; i++) {
        //上label
        [self addSubview:[UILabel labelWithFrame:CGRectMake(K_WIDTH/count*i, K_HEIGHT-60-[self.topArray[i] floatValue]*scale, K_WIDTH/count, K_LABEL_HEIGHT) text:self.topArray[i] textColor:[UIColor redColor] textAlignment:NSTextAlignmentCenter font:15]];
        //下label
        [self addSubview:[UILabel labelWithFrame:CGRectMake(K_WIDTH/count*i, K_HEIGHT-K_LABEL_HEIGHT, K_WIDTH/count, K_LABEL_HEIGHT) text:self.bottomArray[i] textColor:[UIColor blackColor] textAlignment:NSTextAlignmentCenter font:13]];
        
        //柱状图
        UIBezierPath * bePath = [UIBezierPath bezierPath];
        //起点
        [bePath moveToPoint:CGPointMake(K_WIDTH/(count*2)+K_WIDTH/count*i, K_HEIGHT-K_LABEL_HEIGHT)];
        //终点
        [bePath addLineToPoint:CGPointMake(K_WIDTH/(count*2)+K_WIDTH/count*i, K_HEIGHT-K_LABEL_HEIGHT-[self.topArray[i] floatValue]*scale)];
        [bePath stroke];
        
        //添加CAShapeLayer
        _shaLayer = [CAShapeLayer layerWithFillColor:[UIColor clearColor].CGColor strokeColor:[UIColor greenColor].CGColor strokeStart:0.0f strokeEnd:1.0f zPosition:1 lineWidth:30.0f path:bePath.CGPath];
        [self.layer addSublayer:_shaLayer];
        
        [self startStroke];
    }
}
@end
