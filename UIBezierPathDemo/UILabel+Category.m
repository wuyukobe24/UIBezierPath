//
//  UILabel+Category.m
//  UIBezierPathDemo
//
//  Created by WXQ on 2018/8/30.
//  Copyright © 2018年 JingBei. All rights reserved.
//

#import "UILabel+Category.h"

@implementation UILabel (Category)

+ (UILabel *)labelWithFrame:(CGRect)frame
                       text:(NSString *)text
                  textColor:(UIColor *)textColor
              textAlignment:(NSTextAlignment)textAlignment
                       font:(CGFloat)font {
    UILabel * label = [[UILabel alloc]initWithFrame:frame];
    label.text = text;
    label.textColor = textColor;
    label.textAlignment = textAlignment;
    label.font = [UIFont systemFontOfSize:font];
    return label;
}

@end



@implementation NSObject (Category)

//动画
- (CABasicAnimation *)pathAnimation {
    CABasicAnimation * pathAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    pathAnimation.duration = 2.0f;
    pathAnimation.fromValue = @0.0f;//动画开始位置
    pathAnimation.toValue = @1.0f;//动画停止位置
    pathAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];//添加动画样式
    return pathAnimation;
}

@end

@implementation CAShapeLayer (Category)

/** CAShapeLayer
 * @param fillColor   填充颜色
 * @param strokeColor 填充路径的描边轮廓的颜色
 * @param strokeStart 表示路径的起点,在[0,1]的范围内
 * @param strokeEnd   表示路径的终点,在[0,1]的范围内
 * @param zPosition   表示在superlayer中的位置
 * @param lineWidth   填充路径的线宽
 * @param path        表示要呈现形状的路径
 */
+ (CAShapeLayer *)layerWithFillColor:(CGColorRef)fillColor strokeColor:(CGColorRef)strokeColor strokeStart:(CGFloat)strokeStart strokeEnd:(CGFloat)strokeEnd zPosition:(CGFloat)zPosition lineWidth:(CGFloat)lineWidth path:(CGPathRef)path {
    CAShapeLayer * layer = [CAShapeLayer layer];
    layer.fillColor = fillColor;
    layer.strokeColor = strokeColor;
    layer.strokeStart = strokeStart;
    layer.strokeEnd = strokeEnd;
    layer.zPosition = zPosition;
    layer.lineWidth = lineWidth;
    layer.path  = path;
    return layer;
}

@end
