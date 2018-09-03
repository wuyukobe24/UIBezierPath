//
//  HistogramView.h
//  UIBezierPathDemo
//
//  Created by WXQ on 2018/8/30.
//  Copyright © 2018年 JingBei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HistogramView : UIView

@property(nonatomic,copy)NSArray * topArray;
@property(nonatomic,copy)NSArray * bottomArray;
- (instancetype)initWithFrame:(CGRect)frame topArray:(NSArray *)topArray bottoArray:(NSArray *)bottomArray;
- (void)startStroke;

@end
