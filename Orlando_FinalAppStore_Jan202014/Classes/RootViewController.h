//
//  RootViewController.h
//  Orlando
//
//  Created by Kevin Gajjar on 5/18/11.
//  Copyright 2011 Implicit Solutions. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MainMenuViewController;
@interface RootViewController : UIViewController {
	MainMenuViewController *MainMenuView;
}

-(void)MoveToMainMenu;

@end
