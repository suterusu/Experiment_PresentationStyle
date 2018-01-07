//
//  NavigationControllerView.m
//  Experiment_PresentationStyle
//
//  Created by Inba on 2018/01/07.
//  Copyright © 2018年 Inba. All rights reserved.
//

#import "NavigationControllerView.h"

@interface NavigationControllerView ()

@end

@implementation NavigationControllerView

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(BOOL)definesPresentationContext{
    return NO;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
