//
//  PresentedViewController2.m
//  Experiment_PresentationStyle
//
//  Created by Inba on 2017/12/19.
//  Copyright © 2017年 Inba. All rights reserved.
//

#import "PresentedViewController2.h"


@interface PresentationController2 : UIPresentationController

@end


@implementation PresentationController2


-(BOOL)shouldPresentInFullscreen{
    return NO;
}

-(BOOL)shouldRemovePresentersView{
    return NO;
}





@end


@interface PresentedViewController2 ()<UIViewControllerTransitioningDelegate>

@end

@interface PresentedViewController2 ()

@end

@implementation PresentedViewController2

-(void)awakeFromNib{
    [super awakeFromNib];
    self.modalPresentationStyle = UIModalPresentationOverCurrentContext;
    self.transitioningDelegate = self;
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    self.presentationController.containerView.userInteractionEnabled = YES;
}

-(BOOL)definesPresentationContext{
    return YES;
}

-(UIPresentationController *)presentationControllerForPresentedViewController:(UIViewController *)presented presentingViewController:(UIViewController *)presenting sourceViewController:(UIViewController *)source{
    
    return [[PresentationController2 alloc]initWithPresentedViewController:presented presentingViewController:presenting];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UIViewController *aa = self.presentingViewController;
    UIViewController *aa2 = [UIApplication sharedApplication].keyWindow.rootViewController;
    
    
    
    NSInteger a = 4;
    a++;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
