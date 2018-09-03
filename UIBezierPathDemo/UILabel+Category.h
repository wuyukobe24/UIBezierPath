//
//  UILabel+Category.h
//  UIBezierPathDemo
//
//  Created by WXQ on 2018/8/30.
//  Copyright © 2018年 JingBei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (Category)

+ (UILabel *)labelWithFrame:(CGRect)frame
                       text:(NSString *)text
                  textColor:(UIColor *)textColor
              textAlignment:(NSTextAlignment)textAlignment
                       font:(CGFloat)font;

@end



@interface NSObject (Category)

//动画
- (CABasicAnimation *)pathAnimation;

@end



@interface CAShapeLayer (Category)

/** CAShapeLayer
 * @param fillColor   填充颜色
 * @param strokeColor 填充路径的描边轮廓的颜色
 * @param strokeStart 表示路径的起点,在[0,1]的范围内
 * @param strokeEnd   表示路径的终点,在[0,1]的范围内
 * @param zPosition   表示在superlayer中的位置
 * @param lineWidth   填充路径的线宽
 * @param path        表示要呈现形状的路径
 */
+ (CAShapeLayer *)layerWithFillColor:(CGColorRef)fillColor
                         strokeColor:(CGColorRef)strokeColor
                         strokeStart:(CGFloat)strokeStart
                           strokeEnd:(CGFloat)strokeEnd
                           zPosition:(CGFloat)zPosition
                           lineWidth:(CGFloat)lineWidth
                                path:(CGPathRef)path;

@end
