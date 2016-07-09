//
//  SMStatusBar.m
//  SMStatusBar
//
//  Created by Chen Shangming on 16/7/9.
//  Copyright © 2016年 SM. All rights reserved.
//

#import "SMStatusBar.h"


#define SMMessageFont [UIFont systemFontOfSize:12]
static CGFloat const SMMessageDuration = 2.0;
static CGFloat const SMAnimationDuration = 0.25;

@implementation SMStatusBar

static UIWindow *window_;

/**
 *定时器
 */
static NSTimer *timer_;

+(void)showWindow
{
    CGFloat windowH = 20;
    CGRect frame = CGRectMake(0, -windowH, [UIScreen mainScreen].bounds.size.width, windowH);
    
    window_.hidden = YES;
    window_ = [[UIWindow alloc] init];
    window_.backgroundColor = [UIColor blackColor];
    window_.windowLevel = UIWindowLevelAlert;
    window_.frame = frame;
    window_.hidden = NO;
    
    frame.origin.y = 0;
    [UIView animateWithDuration:SMAnimationDuration animations:^{
        window_.frame = frame;
    }];
}

+(void)showMessage:(NSString *)msg image:(UIImage *)image;
{
    
    [timer_ invalidate];
    timer_ = nil;

    [self showWindow];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    if (image) {
        
        [button setImage:image forState:UIControlStateNormal];
        button.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    }
    [button setTitle:msg forState:UIControlStateNormal];
    button.titleLabel.font = SMMessageFont;
    button.frame = window_.bounds;
    [window_ addSubview:button];
    
    
    timer_ = [NSTimer scheduledTimerWithTimeInterval:SMMessageDuration target:self selector:@selector(hide) userInfo:nil repeats:NO];
}

+(void)showMessage:(NSString *)msg
{
    [self showMessage:msg image:nil];
}

+(void)showSuccess:(NSString *)msg
{
    [self showMessage:msg image:[UIImage imageNamed:@"SMStatusBar.bundle/success"]];
}

+(void)showError:(NSString *)msg
{
    [self showMessage:msg image:[UIImage imageNamed:@"SMStatusBar.bundle/error"]];
}

+(void)showLoading:(NSString *)msg;
{
    //停止定时器
    [timer_ invalidate];
    timer_ = nil;
    
    [self showWindow];
    
    UILabel *label = [[UILabel alloc] init];
    label.font = SMMessageFont;
    label.frame = window_.bounds;
    label.textAlignment = NSTextAlignmentCenter;
    label.text = msg;
    label.textColor = [UIColor whiteColor];
    [window_ addSubview:label];
    
    //添加圈圈
    UIActivityIndicatorView *loadingView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    //文字宽度
    CGFloat msgW = [msg sizeWithAttributes:@{NSFontAttributeName:SMMessageFont}].width;
    CGFloat centerX = (window_.frame.size.width - msgW) * 0.5 -20;
    CGFloat centerY = window_.frame.size.height * 0.5;
    loadingView.center = CGPointMake(centerX, centerY);
    [loadingView startAnimating];
    [window_ addSubview:loadingView];
    
    timer_ = [NSTimer scheduledTimerWithTimeInterval:SMMessageDuration target:self selector:@selector(hide) userInfo:nil repeats:NO];
    
}

+(void)hide{
    [UIView animateWithDuration:SMAnimationDuration animations:^{
        CGRect frame = window_.frame;
        frame.origin.y = -frame.size.height;
        window_.frame = frame;
    } completion:^(BOOL finished) {
        window_ = nil;
        timer_ = nil;
    }];
}

@end
