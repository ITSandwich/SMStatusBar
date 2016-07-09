//
//  ViewController.m
//  SMStatusBar
//
//  Created by Chen Shangming on 16/7/9.
//  Copyright © 2016年 SM. All rights reserved.
//

#import "ViewController.h"
#import "SMStatusBar.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    

    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
}
- (IBAction)success:(id)sender {
    [SMStatusBar showSuccess:@"成功！"];
}
- (IBAction)error:(id)sender {
    [SMStatusBar showError:@"失败！"];
}
- (IBAction)loading:(id)sender {
    [SMStatusBar showLoading:@"正在加载..."];
}
- (IBAction)hide:(id)sender {
    [SMStatusBar hide];
}
- (IBAction)message:(id)sender {
    [SMStatusBar showMessage:@"提示信息！"];
}

@end
