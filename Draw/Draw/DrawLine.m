//
//  DrawLine.m
//  Draw
//
//  Created by gaoyou on 17/6/20.
//  Copyright © 2017年 xin. All rights reserved.
//

#import "DrawLine.h"

@implementation DrawLine


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
// 系统自动调用，视图现实在屏幕上显示的时候调用
- (void)drawRect:(CGRect)rect {
    drawline();
    
//    drawR();
    
//    drawTriangle();
}

//画线
void drawline(){
    //  1.获取图形上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    // 将上下文复制一份放到栈中
    CGContextSaveGState(context);
    //  2.绘制图形
    //设置线段宽度
    CGContextSetLineWidth(context, 2);
    //设置线条头尾部样式
    CGContextSetLineCap(context, kCGLineCapRound);
    //设置颜色
    CGContextSetRGBStrokeColor(context, 1, 0, 0, 1);
    //设置起点
    CGContextMoveToPoint(context, 10, 10);
    //画线
    CGContextAddLineToPoint(context, 100, 100);
    
    //  3.显示view
    CGContextStrokePath(context);
    // 出栈,替换当前上下文
    CGContextRestoreGState(context);
    
    
    //  ---------------2条线-------------
//    [[UIColor blueColor] set];
    //设置线条转折点样式
    CGContextSetLineJoin(context, kCGLineJoinRound);
    // 画线
    CGContextMoveToPoint(context, 100, 120);
    CGContextAddLineToPoint(context, 150, 120);
    CGContextAddLineToPoint(context, 150, 180);
    
    //  3.显示view
    CGContextStrokePath(context);
}


//画四边形
void drawR(){
    CGContextRef context = UIGraphicsGetCurrentContext();
    //绘制四边形
    CGContextAddRect(context, CGRectMake(10, 10, 120, 120));
    [[UIColor purpleColor] setFill];
    CGContextFillPath(context);
}

// 绘制三角形
void drawTriangle(){
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextMoveToPoint(context, 0, 0);
    CGContextAddLineToPoint(context, 100, 100);
    CGContextAddLineToPoint(context, 150, 100);
    //关闭路径，连接起点和终点
    CGContextClosePath(context);
    
    [[UIColor redColor] set];
    CGContextStrokePath(context);
}


@end
