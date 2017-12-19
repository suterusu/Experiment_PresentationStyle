# Experiment_PresentationStyle


presentedとは

あるビューを置き換える(もしくは上に乗っける)  
presenting関係を作成する  

presenting決定の法則:presentViewControllerを呼び、そのVCのmodalPresentationStyleがCurrentContextなら  
自身の親ビューを上に進み、definesPresentationContextがYESなものを探し、最初に見つかったものがpresenting  
それ以外の場合はおそらくrootViewControllerでpresenting、それのpresentingを取り出していき、nilになったやつがpresentingとなる  

presentedのサイズ決定の法則  
CurrentContext presentingのすべての部分をカバーする様に  
それ以外、場合によって固定サイズ  
-(CGRect)frameOfPresentedViewInContainerView  
containerView(実質UIWindow?)座業系のframeを指定、presentingがなんであろうと、Screenから見た位置に乗っかる  

-(BOOL)shouldRemovePresentersView  
YESの場合、presentingをインターフェースから取り除く  
NOの場合、presentingをインターフェースから取り除かない  
