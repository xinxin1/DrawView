//
//  DrawHuan.m
//  Draw
//
//  Created by gaoyou on 17/6/20.
//  Copyright © 2017年 xin. All rights reserved.
//

#import "DrawHuan.h"
#define JKRadius 70
#define JKTopY 100
#define JKColor(r,g,b) [UIColor colorWithRed:(r)/255.f green:(g)/255.f blue:(b)/255.f alpha:1]

@implementation DrawHuan


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    drawBody(context, rect);//画身体
    drawMouse(context, rect);//画嘴巴
    drawEyes(context, rect);//画眼睛

}

//画身体
void drawBody(CGContextRef context, CGRect rect){
    //上半圆
    CGFloat topX = rect.size.width*0.5;
    CGFloat topY = JKTopY;
    CGFloat topRadius = JKRadius;
    CGContextAddArc(context, topX, topY, topRadius, 0, M_PI, 1);
    
    //向下延伸
    CGFloat middleX = topX-topRadius;
    CGFloat middleH = JKTopY;
    CGFloat middleY = topY + middleH;
    CGContextAddLineToPoint(context, middleX, middleY);
    
    //下半圆
    CGFloat bottomX = topX;
    CGFloat bottomY = middleY;
    CGFloat bottomRadius = topRadius;
    CGContextAddArc(context, bottomX, bottomY, bottomRadius, M_PI, 0, 1);
    
    //合并路径
    CGContextClosePath(context);
    //设置颜色
    [JKColor(252, 218, 0) set];
    //显示
    CGContextFillPath(context);
}
//画嘴巴
void drawMouse(CGContextRef context, CGRect rect){
    //设置一个控制点
    CGFloat controlX = rect.size.width*0.5;
    CGFloat controlY = rect.size.height*0.35;
    
    //设置当前点
    CGFloat marginX = 20;
    CGFloat marginY = 10;
    CGFloat currentX = controlX - marginX;
    CGFloat currentY = controlY - marginY;
    CGContextMoveToPoint(context, currentX, currentY);
    
    //结束点
    CGFloat endX = controlX + marginX;
    CGFloat endY = currentY;
    
    //贝塞尔曲线
    CGContextAddQuadCurveToPoint(context, controlX, controlY, endX, endY);
    
    [[UIColor blackColor] set];
    
    CGContextStrokePath(context);
}
//画眼睛
void drawEyes(CGContextRef context, CGRect rect){
    //黑色绑带
    CGFloat startX = rect.size.width*0.5-JKRadius;
    CGFloat startY = JKTopY;
    CGContextMoveToPoint(context, startX, startY);
    
    CGFloat endX = startX + 2*JKRadius;
    CGFloat endY = startY;
    CGContextAddLineToPoint(context, endX, endY);
    CGContextSetLineWidth(context, 15);
    [[UIColor blackColor] set];
    
    CGContextStrokePath(context);
    
    
    //灰色镜框
    [JKColor(61, 62, 66) set];
    CGFloat kuangRadius = JKRadius*0.4;
    CGFloat kuangY = startY;
    CGFloat kuangX = rect.size.width *0.5-kuangRadius;
    CGContextAddArc(context, kuangX+25, kuangY, kuangRadius, 0, M_PI*2, 1);
    
    CGContextFillPath(context);
    
    
    //  白色框
    [[UIColor whiteColor] set];
    CGFloat whiteRadius = kuangRadius*0.7;
    CGFloat whiteX = kuangX;
    CGFloat whiteY = kuangY;
    CGContextAddArc(context, whiteX+25, whiteY, whiteRadius, 0, M_PI*2, 0);
    CGContextFillPath(context);
    
    //眼睛
    [[UIColor blackColor] set];
    CGFloat blackRadius = whiteRadius*0.5;
    CGFloat blackX = whiteX;
    CGFloat blackY = whiteY;
    CGContextAddArc(context, blackX+25, blackY, blackRadius, 0, M_PI*2, 0);
    
    CGContextFillPath(context);
}

@end
