//
//  WebViewController.h
//  Orlando
//
//  Created by Kevin Gajjar on 5/20/11.
//  Copyright 2011 Implicit Solutions. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface WebViewController : UIViewController<UIWebViewDelegate> {
	IBOutlet UIWebView *webview;
	
	NSString *twitter_URl;
	NSString *checkURl;
    
    IBOutlet UIImageView *navImage;
    IBOutlet UIButton    *main_button;
    
}

@property (nonatomic,retain)IBOutlet UIWebView *webview;
@property (nonatomic,retain)NSString *twitter_URl;
@property (nonatomic,retain)NSString *checkURl;

-(IBAction)main_button:(id)sender;

@end
