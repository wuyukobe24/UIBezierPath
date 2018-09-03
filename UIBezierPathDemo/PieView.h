//
//  PieView.h
//  UIBezierPathDemo
//
//  Created by WXQ on 2018/8/30.
//  Copyright © 2018年 JingBei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PieView : UIView

@property(nonatomic,copy)NSArray * dataArray;
@property(nonatomic,copy)NSArray * colorArray;
- (instancetype)initWithFrame:(CGRect)frame dataArray:(NSArray *)dataArray colorArray:(NSArray *)colorArray;
- (void)startStroke;

@end
