//
//  SpeakerWebView.h
//  Orlando
//
//  Created by Prateek Sachdev on 4/28/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface SpeakerWebView : UIViewController <UIWebViewDelegate>{

	IBOutlet UIWebView *webView;
    IBOutlet UIButton  *backButton;
    IBOutlet UIImageView *navImage;
	NSString *urlString;
}

@property (nonatomic, retain)NSString *urlString;

-(IBAction)backButton_Click:(id)sender;

@end
