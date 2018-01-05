//
//  PresentedViewController1.m
//  Experiment_PresentationStyle
//
//  Created by Inba on 2017/12/19.
//  Copyright © 2017年 Inba. All rights reserved.
//

#import "PresentedViewController1.h"

@interface PresentationController1 : UIPresentationController

@end


@implementation PresentationController1

-(CGRect)frameOfPresentedViewInContainerView{
    
}

-(BOOL)shouldPresentInFullscreen{
    return NO;
}



@end


@interface PresentedViewController1 ()<UIViewControllerTransitioningDelegate>

@end

@implementation PresentedViewController1

-(void)awakeFromNib{
    [super awakeFromNib];
    self.modalPresentationStyle = UIModalPresentationCustom;
    self.transitioningDelegate = self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(BOOL)definesPresentationContext{
    return NO;
}

-(UIPresentationController *)presentationControllerForPresentedViewController:(UIViewController *)presented presentingViewController:(UIViewController *)presenting sourceViewController:(UIViewController *)source{
    
    return [[PresentationController1 alloc]initWithPresentedViewController:presented presentingViewController:presenting];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UIStoryboard *story = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *con = [story instantiateViewControllerWithIdentifier:@"PresentedViewController2"];
    [self presentViewController:con animated:YES completion:nil];
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
