

 //
 //  UIPresentationController.h
 //  UIKit
 //
 //  Copyright (c) 2014-2016 Apple Inc. All rights reserved.
 //

 @class UIPresentationController;
 
 @protocol UIAdaptivePresentationControllerDelegate <NSObject>
 
 @optional
 
 /* For iOS8.0, the only supported adaptive presentation styles are UIModalPresentationFullScreen and UIModalPresentationOverFullScreen. */
//iPadなどのため、状況によってUIModalPresentationStyleを変更できるようにする。(縦画面と横画面など)
- (UIModalPresentationStyle)adaptivePresentationStyleForPresentationController:(UIPresentationController *)controller;

// Returning UIModalPresentationNone will indicate that an adaptation should not happen.
- (UIModalPresentationStyle)adaptivePresentationStyleForPresentationController:(UIPresentationController *)controller traitCollection:(UITraitCollection *)traitCollection NS_AVAILABLE_IOS(8_3);

/* If this method is not implemented, or returns nil, then the originally presented view controller is used. */
- (nullable UIViewController *)presentationController:(UIPresentationController *)controller viewControllerForAdaptivePresentationStyle:(UIModalPresentationStyle)style;

// If there is no adaptation happening and an original style is used UIModalPresentationNone will be passed as an argument.
- (void)presentationController:(UIPresentationController *)presentationController willPresentWithAdaptiveStyle:(UIModalPresentationStyle)style transitionCoordinator:(nullable id <UIViewControllerTransitionCoordinator>)transitionCoordinator NS_AVAILABLE_IOS(8_3);


@end

NS_CLASS_AVAILABLE_IOS(8_0) @interface UIPresentationController : NSObject <UIAppearanceContainer, UITraitEnvironment, UIContentContainer, UIFocusEnvironment>


//presentedVCをpresentingしたVC、決定方法はREADME参照
//親がモーダル遷移した場合、子もその値が入る
@property(nonatomic, strong, readonly) UIViewController *presentingViewController;

@property(nonatomic, strong, readonly) UIViewController *presentedViewController;


presentedVCのpresentationStyle
@property(nonatomic, readonly) UIModalPresentationStyle presentationStyle;

// The view in which a presentation occurs. It is an ancestor of both the presenting and presented view controller's views.
// This view is being passed to the animation controller.
//presentingVC.viewのサイズと同じと思われる
@property(nullable, nonatomic, readonly, strong) UIView *containerView;

@property(nullable, nonatomic, weak) id <UIAdaptivePresentationControllerDelegate> delegate;

- (instancetype)initWithPresentedViewController:(UIViewController *)presentedViewController presentingViewController:(nullable UIViewController *)presentingViewController NS_DESIGNATED_INITIALIZER;
- (instancetype)init NS_UNAVAILABLE;

// By default this implementation defers to the delegate, if one exists, or returns the current presentation style. UIFormSheetPresentationController, and
// UIPopoverPresentationController override this implementation to return UIModalPresentationStyleFullscreen if the delegate does not provide an
// implementation for adaptivePresentationStyleForPresentationController:
#if UIKIT_DEFINE_AS_PROPERTIES




adaptivePresentationStyleとは？
横コンパクト環境でのみ使われる、プレゼンテーションスタイル、ポップオーバーとかだとiPhoneだとFullScreenスタイルが適用されるのはこいつのせい（ポップオーバーを担当しているプレゼンテーションコントローラーはこのメソッドでfullScreenを返させる）
おそらく、デリゲートを使用することにより、これを止めることが出来る(adaptivePresentationStyleForPresentationController:でUIModalPresentationNoneを返す、また調べていないがこれはUIModalPresentationNoneとFull系どちらかしか返せない)
これが変わるのはサイズクラス変更後、これを呼んでもスタイルが変わったりしないちなみにスタイル変わった結果プレゼンテーションが変わる場合もあるから気をつけて！
@property(nonatomic, readonly) UIModalPresentationStyle adaptivePresentationStyle;
- (UIModalPresentationStyle)adaptivePresentationStyle;



- (UIModalPresentationStyle)adaptivePresentationStyleForTraitCollection:(UITraitCollection *)traitCollection NS_AVAILABLE_IOS(8_3);

- (void)containerViewWillLayoutSubviews;
- (void)containerViewDidLayoutSubviews;


// By default each new presentation is full screen.
// This behavior can be overriden with the following method to force a current context presentation.
// (Default: YES)
/*
NOの場合UIModalPresentationCurrentContextになる
つまり、presentingVCに覆いかぶさるようになる presentingVCの確認はREADMEを確認
 */
@property(nonatomic, readonly) BOOL shouldPresentInFullscreen;

// Indicate whether the view controller's view we are transitioning from will be removed from the window in the end of the
// presentation transition
// (Default: NO)
//presentingViewをWindowから取るか
@property(nonatomic, readonly) BOOL shouldRemovePresentersView;
#else
- (nullable UIView *)presentedView;

// Position of the presented view in the container view by the end of the presentation transition.
// (Default: container view bounds)
//最後の位置でcontainerViewの座標形状、よって
- (CGRect)frameOfPresentedViewInContainerView;

- (void)presentationTransitionWillBegin;
- (void)presentationTransitionDidEnd:(BOOL)completed;
- (void)dismissalTransitionWillBegin;
- (void)dismissalTransitionDidEnd:(BOOL)completed;


//presentedVCのUITraitCollectionをオーバーライドしたいときに呼ぶ
@property(nullable, nonatomic, copy) UITraitCollection *overrideTraitCollection;

@end


