//
//  ViewController.m
//  Experiment_PresentationStyle
//
//  Created by Inba on 2017/12/19.
//  Copyright © 2017年 Inba. All rights reserved.
//

#import "ViewController.h"

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

-(BOOL)definesPresentationContext{
    return YES;
}

-(UIViewController *)presentingViewController{
    return [super presentingViewController];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    UIStoryboard *story = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *con = [story instantiateViewControllerWithIdentifier:@"PresentedViewController1"];
    [self presentViewController:con animated:YES completion:nil];
}

@end
