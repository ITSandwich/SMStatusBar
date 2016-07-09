//
//  SMStatusBar.h
//  SMStatusBar
//
//  Created by Chen Shangming on 16/7/9.
//  Copyright © 2016年 SM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SMStatusBar : NSObject

+(void)showMessage:(NSString *)msg image:(UIImage *)image;

+(void)showMessage:(NSString *)msg;

+(void)showSuccess:(NSString *)msg;

+(void)showError:(NSString *)msg;

+(void)showLoading:(NSString *)msg;

+(void)hide;
@end
