//
//  QRCodeViewController.h
//  Orlando
//
//  Created by Kevin Gajjar on 5/27/11.
//  Copyright 2011 Implicit Solutions. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface QRCodeViewController : UIViewController {
	IBOutlet UITextView *TextView;
	
	
}

@property (nonatomic, retain)NSString *checkString;
-(IBAction)DownloadApp;

@end
