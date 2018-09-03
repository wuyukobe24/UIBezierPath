//
//  DrawViewController.m
//  UIBezierPathDemo
//
//  Created by WXQ on 2018/8/30.
//  Copyright © 2018年 JingBei. All rights reserved.
//

#import "DrawViewController.h"
#import "HistogramView.h"
#import "BrokenView.h"
#import "PieView.h"

#define K_SCREEN_WIDTH        [UIScreen mainScreen].bounds.size.width
@interface DrawViewController ()
@property(nonatomic,strong)HistogramView * hisView;
@property(nonatomic,strong)BrokenView * broView;
@property(nonatomic,strong)PieView * pieView;
@property(nonatomic,copy)NSArray * topArray;
@property(nonatomic,copy)NSArray * bottomArray;
@property(nonatomic,copy)NSArray <UIColor *>* colorArray;
@property(nonatomic,copy)NSArray * pieArray;
@end

@implementation DrawViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    if (self.indexPath.row != 0) {
     self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"重新" style:UIBarButtonItemStylePlain target:self action:@selector(buttonClick)];
    }
    switch (self.indexPath.row) {
        case 0: [self.view addSubview:self.hisView]; break;
        case 1: [self.view addSubview:self.broView]; break;
        case 2: [self.view addSubview:self.pieView]; break;
        default: break;
    }
}

- (void)dealloc {
    NSLog(@"%@销毁了",self.class);
}
//柱状图
- (HistogramView *)hisView {
    if (!_hisView) {
        _hisView = [[HistogramView alloc]initWithFrame:CGRectMake(0, 0, K_SCREEN_WIDTH, K_SCREEN_WIDTH) topArray:self.topArray bottoArray:self.bottomArray];
        _hisView.center = self.view.center;
    }
    return _hisView;
}
//折线图
- (BrokenView *)broView {
    if (!_broView) {
        _broView = [[BrokenView alloc]initWithFrame:CGRectMake(0, 0, K_SCREEN_WIDTH, K_SCREEN_WIDTH) topArray:self.topArray bottoArray:self.bottomArray];
        _broView.center = self.view.center;
    }
    return _broView;
}
//饼状图
- (PieView *)pieView {
    if (!_pieView) {
        _pieView = [[PieView alloc]initWithFrame:CGRectMake(0, 0, K_SCREEN_WIDTH, K_SCREEN_WIDTH) dataArray:self.pieArray colorArray:self.colorArray];
        _pieView.center = self.view.center;
    }
    return _pieView;
}

- (void)buttonClick {
    switch (self.indexPath.row) {
        case 0: break;
        case 1: [self.broView startStroke]; break;
        case 2: [self.pieView startStroke]; break;
        default: break;
    }
}

#pragma mark - 初始化数据
- (NSArray *)topArray {
    return @[@"342",@"900",@"505",@"1780",@"1450",@"30",@"1000"];
}
- (NSArray *)bottomArray {
    return @[@"1月",@"2月",@"3月",@"4月",@"5月",@"6月",@"7月"];
}
- (NSArray *)pieArray {
    return @[@"70",@"60",@"100",@"50",@"80"];
}
- (NSArray *)colorArray {
    return @[[UIColor redColor],[UIColor purpleColor],[UIColor blueColor],[UIColor orangeColor],[UIColor blackColor]];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
