//
//  ViewController.m
//  chatDemo
//
//  Created by xieyan on 2016/12/9.
//  Copyright © 2016年 Fruitday. All rights reserved.
//

#import "ViewController.h"
#import "FDChatViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)onChatPress:(id)sender {
    FDChatViewController *chatVc = [[FDChatViewController alloc]init];
    [self.navigationController pushViewController:chatVc animated:YES];
}
@end
