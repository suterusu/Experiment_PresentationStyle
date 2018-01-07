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




-(BOOL)shouldPresentInFullscreen{
    return NO;
}

-(BOOL)shouldRemovePresentersView{
    return NO;
}

@end


@interface PresentedViewController1 ()<UIViewControllerTransitioningDelegate,UIAdaptivePresentationControllerDelegate>

@end

@implementation PresentedViewController1{
    PresentationController1 *aaa;
}


-(void)awakeFromNib{
    [super awakeFromNib];
    self.modalPresentationStyle = UIModalPresentationOverCurrentContext;
    self.transitioningDelegate = self;
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
        self.presentationController.containerView.userInteractionEnabled = YES;
}

- (UIModalPresentationStyle)adaptivePresentationStyleForPresentationController:(UIPresentationController *)controller traitCollection:(UITraitCollection *)traitCollection{
    return UIModalPresentationNone;
}

-(BOOL)definesPresentationContext{
    return YES;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}




-(UIPresentationController *)presentationControllerForPresentedViewController:(UIViewController *)presented presentingViewController:(UIViewController *)presenting sourceViewController:(UIViewController *)source{
    PresentationController1 *aa =  [[PresentationController1 alloc]initWithPresentedViewController:presented presentingViewController:presenting];
    aaa = aa;
    aa.delegate = self
    ;
    return aa;
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
