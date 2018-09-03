//
//  PieView.m
//  UIBezierPathDemo
//
//  Created by WXQ on 2018/8/30.
//  Copyright © 2018年 JingBei. All rights reserved.
//

#import "PieView.h"
#import "UILabel+Category.h"

#define K_WIDTH          CGRectGetWidth(self.frame)
#define K_HEIGHT         CGRectGetHeight(self.frame)
@implementation PieView{
    CGFloat _total;
    CAShapeLayer * _backLayer;
}

- (instancetype)initWithFrame:(CGRect)frame dataArray:(NSArray *)dataArray colorArray:(NSArray *)colorArray {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        self.dataArray = dataArray;
        self.colorArray = colorArray;
    }
    return self;
}

//动画
- (void)startStroke {
    [_backLayer addAnimation:self.pathAnimation forKey:@"circleAnimation"];
}

- (void)drawRect:(CGRect)rect {
    if (self.dataArray.count < 1) return;
    //设置饼状图中心点
    CGFloat centerX = K_WIDTH * 0.5f;
    CGFloat centerY = K_HEIGHT * 0.5f;
    CGPoint centerPoint = CGPointMake(centerX, centerY);
    //设置半径
    CGFloat radius = MIN(centerX, centerY) * 0.5f;//MIN(A,B)为获取两者最小值
    //获取展示数据总和
    CGFloat nums = 0.0f;
    for (int i=0; i<self.dataArray.count; i++) {
        nums += [self.dataArray[i] floatValue];
    }
    
    //绘制背景圆的路径
    UIBezierPath * backPath = [UIBezierPath bezierPathWithArcCenter:centerPoint
                                                             radius:radius
                                                         startAngle:-M_PI_2
                                                           endAngle:M_PI_2*3
                                                          clockwise:YES];
    _backLayer = [CAShapeLayer layerWithFillColor:[UIColor clearColor].CGColor
                                      strokeColor:[UIColor greenColor].CGColor
                                      strokeStart:0.0f
                                        strokeEnd:1.0f
                                        zPosition:1
                                        lineWidth:radius * 2.0f
                                             path:backPath.CGPath];
    
    //绘制各个扇形的路径
    UIBezierPath * subPath = [UIBezierPath bezierPathWithArcCenter:centerPoint
                                                            radius:radius
                                                        startAngle:-M_PI_2
                                                          endAngle:M_PI_2*3
                                                         clockwise:YES];
    //设置各个扇形开始和结束位置
    CGFloat start = 0.0f;
    CGFloat end = 0.0f;
    for (int i=0; i<self.dataArray.count; i++) {
        end = [self.dataArray[i] floatValue]/nums + start;
        CGColorRef strokeColor = (!self.colorArray ||  self.colorArray.count == 0 || i>self.colorArray.count-1) ? [UIColor purpleColor].CGColor : ((UIColor *)self.colorArray[i]).CGColor;
        CAShapeLayer * subLayer = [CAShapeLayer layerWithFillColor:[UIColor clearColor].CGColor
                                                       strokeColor:strokeColor
                                                       strokeStart:start
                                                         strokeEnd:end
                                                         zPosition:2
                                                         lineWidth:radius * 2.0f
                                                              path:subPath.CGPath];
        [self.layer addSublayer:subLayer];
        
        //百分比label
        CGFloat angle = M_PI * (start + end);//扇形角度
        CGFloat labelCenterX = centerX * 0.5f * sinf(angle) + centerX;
        CGFloat labelCenterY = -centerX * 0.5f * cosf(angle) + centerY;
        UILabel * label = [UILabel labelWithFrame:CGRectMake(0, 0, radius * 0.8f, radius * 0.3f) text:[NSString stringWithFormat:@"%@  %ld%%",self.dataArray[i],(NSInteger)((end-start+0.005)*100)] textColor:[UIColor redColor] textAlignment:NSTextAlignmentCenter font:15];
        label.center = CGPointMake(labelCenterX, labelCenterY);
        label.backgroundColor = [UIColor whiteColor];
        label.layer.zPosition = 3;
        [self addSubview:label];
        
        start = end;
    }
    [self.layer addSublayer:_backLayer];
    self.layer.mask = _backLayer;
    [self startStroke];
}


@end
