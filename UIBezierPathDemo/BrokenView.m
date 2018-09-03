//
//  BrokenView.m
//  UIBezierPathDemo
//
//  Created by WXQ on 2018/8/31.
//  Copyright © 2018年 JingBei. All rights reserved.
//

#import "BrokenView.h"
#import "UILabel+Category.h"

#define K_WIDTH          CGRectGetWidth(self.frame)
#define K_HEIGHT         CGRectGetHeight(self.frame)
#define K_LABEL_HEIGHT   30
#define K_ACROSS_NUM     6 //横线默认条数
@implementation BrokenView {
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

- (void)drawRect:(CGRect)rect {
    NSUInteger count = self.topArray.count;
    if (count<1) return;
    //获取数据最大值
    float max = [[self.topArray valueForKeyPath:@"@max.intValue"] floatValue];//获取比例大小
    float scale = (K_HEIGHT-K_LABEL_HEIGHT*2)/max;//上下两个label高度和
    
    //绘制坐标系
    for (int i=0; i<K_ACROSS_NUM; i++) {
        //横线
        UIBezierPath * across = [UIBezierPath bezierPath];
        [across moveToPoint:CGPointMake(0, (K_HEIGHT-K_LABEL_HEIGHT)/K_ACROSS_NUM*(i+1))];
        [across addLineToPoint:CGPointMake(K_WIDTH, (K_HEIGHT-K_LABEL_HEIGHT)/K_ACROSS_NUM*(i+1))];
        [[UIColor greenColor] set];
        [across stroke];
    }
    
    for (int j=0; j<count; j++) {
        //竖线
        UIBezierPath * vertical = [UIBezierPath bezierPath];
        [vertical moveToPoint:CGPointMake(K_WIDTH/(count*2)+K_WIDTH/count*j, K_HEIGHT-K_LABEL_HEIGHT)];
        [vertical addLineToPoint:CGPointMake(K_WIDTH/(count*2)+K_WIDTH/count*j, 0)];
        [[UIColor greenColor] set];
        [vertical stroke];
        
        //绘制各坐标点
        UIBezierPath * point = [UIBezierPath bezierPathWithArcCenter:CGPointMake(K_WIDTH/(count*2)+K_WIDTH/count*j, K_HEIGHT-K_LABEL_HEIGHT-[self.topArray[j] floatValue]*scale) radius:5.0f startAngle:-M_PI endAngle:M_PI*3 clockwise:YES];
        CAShapeLayer * pointLayer = [CAShapeLayer layerWithFillColor:[UIColor blueColor].CGColor strokeColor:[UIColor clearColor].CGColor strokeStart:0.0f strokeEnd:1.0f zPosition:0 lineWidth:0.0f path:point.CGPath];
        [self.layer addSublayer:pointLayer];
        
        //上label
        [self addSubview:[UILabel labelWithFrame:CGRectMake(K_WIDTH/count*j, K_HEIGHT-60-[self.topArray[j] floatValue]*scale, K_WIDTH/count, K_LABEL_HEIGHT) text:self.topArray[j] textColor:[UIColor redColor] textAlignment:NSTextAlignmentCenter font:15]];
        //下label
        [self addSubview:[UILabel labelWithFrame:CGRectMake(K_WIDTH/count*j, K_HEIGHT-K_LABEL_HEIGHT, K_WIDTH/count, K_LABEL_HEIGHT) text:self.bottomArray[j] textColor:[UIColor blackColor] textAlignment:NSTextAlignmentCenter font:13]];
    }
    //绘制折线
    UIBezierPath * broPath = [UIBezierPath bezierPath];
    [broPath moveToPoint:CGPointMake(K_WIDTH/(count*2), K_HEIGHT-K_LABEL_HEIGHT-[self.topArray[0] floatValue]*scale)];
    for (int j=1; j<count; j++) {
        [broPath addLineToPoint:CGPointMake(K_WIDTH/(count*2)+K_WIDTH/count*j, K_HEIGHT-K_LABEL_HEIGHT-[self.topArray[j] floatValue]*scale)];
    }
    [broPath stroke];
    _shaLayer = [CAShapeLayer layer];
    _shaLayer.lineWidth = 2.0f;
    _shaLayer.fillColor = [UIColor clearColor].CGColor;
    _shaLayer.strokeColor = [UIColor blueColor].CGColor;
    _shaLayer.path = broPath.CGPath;
    [self.layer addSublayer:_shaLayer];
    
    [self startStroke];
}


@end
