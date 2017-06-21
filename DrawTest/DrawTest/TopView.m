//
//  TopView.m
//  DrawTest
//
//  Created by gaoyou on 17/6/21.
//  Copyright © 2017年 xin. All rights reserved.
//

#import "TopView.h"

@implementation TopView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    
//    [self createTopView];
    [self secondTopView];
}


- (void)secondTopView{
    self.tempPath = [UIBezierPath bezierPath];
    [self.tempPath moveToPoint:CGPointMake(0, 0)];
    [self.tempPath addLineToPoint:CGPointMake(CGRectGetWidth([UIScreen mainScreen].bounds), 0)];
    [self.tempPath addLineToPoint:CGPointMake(CGRectGetWidth([UIScreen mainScreen].bounds)/2.0, 100)];
    [self.tempPath closePath];
//    [[UIColor redColor] setStroke];
    [[UIColor greenColor] setFill];
    [self.tempPath fill];
    
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.path = [self.tempPath CGPath];
    layer.fillColor = [[UIColor lightGrayColor] CGColor];
    layer.frame = self.frame;
    self.layer.mask = layer;
}


-(void)createTopView{
    self.tempPath = [UIBezierPath bezierPath];
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextMoveToPoint(context, 0, 0);
    CGContextAddLineToPoint(context, CGRectGetWidth([UIScreen mainScreen].bounds)/2, 100);
    CGContextAddLineToPoint(context, CGRectGetWidth([UIScreen mainScreen].bounds), 0);
    CGContextClosePath(context);
    
    [[UIColor greenColor] setFill];
    CGContextFillPath(context);
}


@end
