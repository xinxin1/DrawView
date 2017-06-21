//
//  DrawCircle.m
//  Draw
//
//  Created by gaoyou on 17/6/20.
//  Copyright © 2017年 xin. All rights reserved.
//

#import "DrawCircle.h"

@implementation DrawCircle

//求弧度
CGFloat arc(CGFloat angle){
    return angle/180.f*M_PI;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
//    drawCircle();
    
//    drawArc();
    
//    drawText();
    
//    drawImg();
    
    drawBezier();
}


//画圆
void drawCircle(){
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextAddEllipseInRect(context, CGRectMake(50, 50, 100, 145));
    CGContextSetLineWidth(context, 10);
    CGContextStrokePath(context);
}

//画圆弧
void drawArc(){
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextAddArc(context, 100, 100, 100, arc(90), arc(180), 1);//1逆时针
    CGContextAddLineToPoint(context, 100, 100);
    CGContextClosePath(context);
//    CGContextStrokePath(context);
    CGContextFillPath(context);
}


//绘制文字
void drawText(){
    NSString *str = @"你好啊";
    NSMutableDictionary *attributes = [NSMutableDictionary dictionary];
    attributes[NSFontAttributeName] = [UIFont systemFontOfSize:20];
    attributes[NSForegroundColorAttributeName] = [UIColor purpleColor];
    [str drawInRect:CGRectMake(100, 100, 100, 30) withAttributes:attributes];
}


//绘制图片
void drawImg(){
    UIImage *image = [UIImage imageNamed:@"a"];
    
    //画
//    [image drawAtPoint:CGPointMake(50, 50)];
//    [image drawInRect:CGRectMake(50, 50, 50, 50)];
    [image drawAsPatternInRect:CGRectMake(0, 0, 200, 200)];
}


//贝塞尔曲线
void drawBezier(){
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextMoveToPoint(context, 10, 10);
    //2个控制点
    CGContextAddCurveToPoint(context, 120, 100, 180, 50, 190, 190);
    //1个控制点
    CGContextAddQuadCurveToPoint(context, 150, 200, 200, 100);
    CGContextStrokePath(context);
//    CGContextFillPath(context);
}

@end
