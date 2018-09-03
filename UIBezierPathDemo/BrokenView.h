//
//  BrokenView.h
//  UIBezierPathDemo
//
//  Created by WXQ on 2018/8/31.
//  Copyright © 2018年 JingBei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BrokenView : UIView

@property(nonatomic,copy)NSArray * topArray;
@property(nonatomic,copy)NSArray * bottomArray;
- (instancetype)initWithFrame:(CGRect)frame topArray:(NSArray *)topArray bottoArray:(NSArray *)bottomArray;
- (void)startStroke;

@end
