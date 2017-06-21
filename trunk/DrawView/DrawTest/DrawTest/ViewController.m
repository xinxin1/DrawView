//
//  ViewController.m
//  DrawTest
//
//  Created by gaoyou on 17/6/21.
//  Copyright © 2017年 xin. All rights reserved.
//

#import "ViewController.h"
#import "TopView.h"

@interface ViewController ()

@property (nonatomic, strong) TopView *topView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setTopView:[[TopView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth([UIScreen mainScreen].bounds), 200)]];
//    [self.topView setBackgroundColor:[UIColor yellowColor]];
    [self.view addSubview:self.topView];
    [self.topView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(myTap:)]];
    
    
}


- (void)myTap:(UITapGestureRecognizer *)tap{
    CGPoint tapPoint = [tap locationInView:tap.view];
    if ([self.topView.tempPath containsPoint:tapPoint]) {
        NSLog(@"tap点击");
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)prefersStatusBarHidden{
    return YES;
}


@end
