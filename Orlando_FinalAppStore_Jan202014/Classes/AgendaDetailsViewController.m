//
//  AgendaDetailsViewController.m
//  Orlando
//
//  Created by Kevin Gajjar on 5/19/11.
//  Copyright 2011 Implicit Solutions. All rights reserved.
//

#import "AgendaDetailsViewController.h"
#import "SpeakerDetailsViewController.h"
#import "OrlandoAppDelegate.h"
#import "Session.h"
#import "ImgSession.h"
#import "Speakers.h"

#define heightDifferenceInBackgroundImageForiPhone5 94

@implementation AgendaDetailsViewController

@synthesize number,agendaDetailView,detailViewFromAgenda3,comeFromImgdetailView,comeFromImgAgenda2,comeFromImgAgenda3,img_agendaDatails;
@synthesize funString,funStringFromAgendaView2;
@synthesize is_from;

// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
/*
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization.
    }
    return self;
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
  
	//NSLog(@"agendaDetailView--> %@",agendaDetailView);
	//NSLog(@"comeFromImgAgenda3--> %@",comeFromImgAgenda3);
	
	if([agendaDetailView isEqualToString:@"AgendaViewController3"]||[agendaDetailView isEqualToString:@"FromAgendaView3"])
	{
		appDelegate = (OrlandoAppDelegate *)[[UIApplication sharedApplication] delegate];
		detailText.font = [UIFont fontWithName:@"Arial" size:13];
        UIImageView *img_titleView = [[UIImageView alloc]initWithFrame:CGRectMake(100, 21, 120, 15)];
        img_titleView.image = [UIImage imageNamed:@"imgTitle.png"];
        [navImage addSubview:img_titleView];
        [img_titleView release];
        

	}
	else {
		
		appDelegate = (OrlandoAppDelegate *)[[UIApplication sharedApplication] delegate];
		detailText.font = [UIFont fontWithName:@"Arial" size:13];
        UIImageView *img_titleView = [[UIImageView alloc]initWithFrame:CGRectMake(100, 21, 120, 15)];
        img_titleView.image = [UIImage imageNamed:@"clcTitle.png"];
        [navImage addSubview:img_titleView];
        [img_titleView release];
        
	}
	
	UISwipeGestureRecognizer *swipeLeft = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(nextImageButtonClicked:)];
	swipeLeft.numberOfTouchesRequired = 1;
	swipeLeft.direction = UISwipeGestureRecognizerDirectionLeft;
	[self.view addGestureRecognizer:swipeLeft];
	
	UISwipeGestureRecognizer *swipeRight = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(prevImageButtonClicked:)];
	swipeRight.numberOfTouchesRequired = 1;
	swipeRight.direction = UISwipeGestureRecognizerDirectionRight;
	[self.view addGestureRecognizer:swipeRight];
    
//    [self loadViewForiPhone5];
	
    [super viewDidLoad];
     
}

-(void)handleLeft {
	
	@try {
		if([agendaDetailView isEqualToString:@"AgendaViewController3"])
		{
			if([appDelegate.ImgSessions count] > number)
			{
				
				NSMutableArray *sessionsToDisplayForImg = [[NSMutableArray alloc] init];
				for (ImgSession *session in appDelegate.ImgSessions) {
					if ([session.Date isEqualToString:appDelegate.dateOnFocus]) 
						[sessionsToDisplayForImg addObject:session];
				}
				
				if(number == [sessionsToDisplayForImg count]){
					[sessionsToDisplayForImg release];
                    
                    nextImageButton.hidden=YES;
                    prevImageButton.hidden=NO;

				}
				else {
					number++ ;
                    
                    if (number!=0) {
                        
                        prevImageButton.hidden=NO;
                    }
                    else {
                        
                        prevImageButton.hidden=YES;
                        
                    }
                    if ([sessionsToDisplayForImg count]<=(number+1)) {
                        
                        nextImageButton.hidden=YES;
                        prevImageButton.hidden=NO;
                        
                    }
                    else {
                        nextImageButton.hidden=NO;
                        
                    }


                    if ([sessionsToDisplayForImg count]>number)
                    {
                        
                        [self SetDataForImg];
                    }
                    else {
                        number--;
                        
                    }

                    [sessionsToDisplayForImg release];

				}
			}
		}
		else {
			if([appDelegate.Sessions count] > number)
			{
				NSMutableArray *sessionsToDisplay = [[NSMutableArray alloc] init];
				for (Session *session in appDelegate.Sessions) { 
					if ([session.Date isEqualToString:appDelegate.dateOnFocus]) 
						[sessionsToDisplay addObject:session];
				}
				
				if(number == [sessionsToDisplay count]){
					[sessionsToDisplay release];
                    nextImageButton.hidden=YES;
                    prevImageButton.hidden=NO;

				}
				else {
					number++ ;
                    
                    if (number!=0) {
                        
                        prevImageButton.hidden=NO;
                    }
                    else {
                        
                        prevImageButton.hidden=YES;
                        
                    }
                    if ([sessionsToDisplay count]<=(number+1)) {
                        
                        nextImageButton.hidden=YES;
                        prevImageButton.hidden=NO;
                        
                        
                    }
                    else {
                        nextImageButton.hidden=NO;
                        
                    }
                    
                   // NSLog(@"%d %d",[sessionsToDisplay count],number);
                    
                    if ([sessionsToDisplay count]>number)
                    {
                    
					[self SetData];
                        
                    }
                    else
                    {
                        number--;

                    }
                    
                    [sessionsToDisplay release];

				}
			}
            else {
                
                nextImageButton.hidden=YES;
                prevImageButton.hidden=NO;

            }
			
		}
	}
	@catch (NSException * e) {
		NSLog(@"NSException %@ %@", [e reason],[e description]);
	}
	
}

-(void)handleRight {
	
	if([agendaDetailView isEqualToString:@"AgendaViewController3"])
	{
		if(number == 0){
			
            prevImageButton.hidden=YES;
            nextImageButton.hidden=NO;

		}
		else {
			number-- ;
			[self SetDataForImg];
            
            prevImageButton.hidden=NO;
            nextImageButton.hidden=NO;
            
            if (number == 0) {
                
                prevImageButton.hidden=YES;
                nextImageButton.hidden=NO;
                
            }

		}
	}
	
	else {
		if(number == 0){
			
            prevImageButton.hidden=YES;
            nextImageButton.hidden=NO;

		}
		else {
			number-- ;
			[self SetData];
            
            prevImageButton.hidden=NO;
            nextImageButton.hidden=NO;
            
            if (number == 0) {
                
                prevImageButton.hidden=YES;
                nextImageButton.hidden=NO;
                
            }

		}
		
	}
	
	
	
}



-(void)viewDidAppear:(BOOL)animated{
	
[super viewDidAppear:YES];
	
}



#pragma mark 
#pragma mark backButton Action

-(IBAction)backButton:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)viewWillAppear:(BOOL)animated{

	if([agendaDetailView isEqualToString:@"AgendaViewController3"]||[agendaDetailView isEqualToString:@"FromAgendaView3"])
	{
		
		UIImageView *headerImage = [[UIImageView alloc] initWithFrame:CGRectMake(-1, 57, 322, 42)];
		headerImage.image = [UIImage imageNamed:@"header_Bar.png"];
        headerImage.userInteractionEnabled = YES;
		[self.view addSubview:headerImage];
		
		UILabel *dayDateLabel  = [[UILabel alloc] initWithFrame:CGRectMake(110, 10, 160, 15)];
		dayDateLabel.numberOfLines = 1;
		dayDateLabel.font = [UIFont boldSystemFontOfSize:12];
		dayDateLabel.backgroundColor = [UIColor clearColor];
		dayDateLabel.textColor = [UIColor whiteColor];
        
        UIImageView *img_titleView = [[UIImageView alloc]initWithFrame:CGRectMake(110, 7, 124, 11)];
        [headerImage addSubview:img_titleView];
        img_titleView.contentMode = UIViewContentModeScaleAspectFit;
        
        
		if([comeFromImgdetailView isEqualToString:@"FomAgendaView"])
		{
            img_titleView.image = [UIImage imageNamed:@"tuesday.png"];
		}
		if([comeFromImgAgenda2 isEqualToString:@"FromAgendaView2"])
		{
            img_titleView.image = [UIImage imageNamed:@"wednesday.png"];
		}
		if([comeFromImgAgenda2 isEqualToString:@"funForDetailAgenda"]||[comeFromImgAgenda3 isEqualToString:@"FromAgendaView3"]) {
            
            if(is_from == TRUE)
                img_titleView.image = [UIImage imageNamed:@"wednesday.png"];
            else
                img_titleView.image = [UIImage imageNamed:@"thursday.png"];
		}

//		[headerImage addSubview:dayDateLabel];
        [img_titleView release];
		
		prevImageButton = [UIButton buttonWithType:UIButtonTypeCustom];
		prevImageButton.frame = CGRectMake(7, 70, 98, 30);
		[prevImageButton setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
		[prevImageButton setContentVerticalAlignment:UIControlContentVerticalAlignmentCenter];
		[prevImageButton setBackgroundColor:[UIColor clearColor]];
		[prevImageButton setImage:[UIImage imageNamed:@"prev1.png"] forState:UIControlStateNormal];
		[prevImageButton addTarget:self action:@selector(prevImageButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
		[self.view addSubview:prevImageButton];
		
		nextImageButton = [UIButton buttonWithType:UIButtonTypeCustom];
		nextImageButton.frame = CGRectMake(216, 70, 98, 30);
		[nextImageButton setContentHorizontalAlignment:UIControlContentHorizontalAlignmentRight];
		[nextImageButton setContentVerticalAlignment:UIControlContentVerticalAlignmentCenter];
		[nextImageButton setBackgroundColor:[UIColor clearColor]];
		[nextImageButton setImage:[UIImage imageNamed:@"next1.png"] forState:UIControlStateNormal];
		[nextImageButton addTarget:self action:@selector(nextImageButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
		[self.view addSubview:nextImageButton];
        [self SetDataForImg];
        
        if ([appDelegate.Sessions count]==(number+1)) {
            
            nextImageButton.hidden=YES;
            prevImageButton.hidden=NO;
        }
        else if (number==0)
        {
            nextImageButton.hidden=NO;
            prevImageButton.hidden=YES;

        }
		[headerImage release];
		[dayDateLabel release];
	}
	else {
		
		
        UIImageView *headerImage = [[UIImageView alloc] initWithFrame:CGRectMake(-1, 57, 322, 42)];
		headerImage.image = [UIImage imageNamed:@"header_Bar.png"];
        headerImage.userInteractionEnabled = YES;

		[self.view addSubview:headerImage];
		
		UILabel *dayDateLabel  = [[UILabel alloc] initWithFrame:CGRectMake(110, 10, 160, 15)];
		dayDateLabel.numberOfLines = 1;
		dayDateLabel.font = [UIFont boldSystemFontOfSize:12];
		dayDateLabel.backgroundColor = [UIColor clearColor];
		dayDateLabel.textColor = [UIColor whiteColor];
        
        UIImageView *img_titleView = [[UIImageView alloc]initWithFrame:CGRectMake(110, 7, 124, 11)];
        [headerImage addSubview:img_titleView];
        img_titleView.contentMode = UIViewContentModeScaleAspectFit;
        
		if([comeFromImgdetailView isEqualToString:@"FomAgendaView"])
		{
            img_titleView.image = [UIImage imageNamed:@"tuesday.png"];
		}
		else if([comeFromImgAgenda2 isEqualToString:@"FromAgendaView2"]){
		
			img_titleView.image = [UIImage imageNamed:@"wednesday.png"];
		}
		else if([comeFromImgAgenda3 isEqualToString:@"FromAgendaView3"])
		{
			img_titleView.image = [UIImage imageNamed:@"thursday.png"];
		}
//		[headerImage addSubview:dayDateLabel];
        [img_titleView release];
		
		prevImageButton = [UIButton buttonWithType:UIButtonTypeCustom];
		prevImageButton.frame = CGRectMake(7, 70, 98, 30);
		[prevImageButton setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
		[prevImageButton setContentVerticalAlignment:UIControlContentVerticalAlignmentCenter];
		[prevImageButton setBackgroundColor:[UIColor clearColor]];
		[prevImageButton setImage:[UIImage imageNamed:@"prev1.png"] forState:UIControlStateNormal];
		[prevImageButton addTarget:self action:@selector(prevImageButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
		[self.view addSubview:prevImageButton];
		
		nextImageButton = [UIButton buttonWithType:UIButtonTypeCustom];
		nextImageButton.frame = CGRectMake(216, 70, 98, 30);
		[nextImageButton setContentHorizontalAlignment:UIControlContentHorizontalAlignmentRight];
		[nextImageButton setContentVerticalAlignment:UIControlContentVerticalAlignmentCenter];
		[nextImageButton setBackgroundColor:[UIColor clearColor]];
		[nextImageButton setImage:[UIImage imageNamed:@"next1.png"] forState:UIControlStateNormal];	
		[nextImageButton addTarget:self action:@selector(nextImageButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
		[self.view addSubview:nextImageButton];
		
        
        [self SetData];
        
       // NSLog(@"%d  %d",[appDelegate.Sessions count],number);
        
        if ([appDelegate.Sessions count]==(number+1)) {
            
            nextImageButton.hidden=YES;
            prevImageButton.hidden=NO;
        }
        else if (number==0)
        {
            nextImageButton.hidden=NO;
            prevImageButton.hidden=YES;
            
        }

        
		[headerImage release];
//		[grayHeaderImage release];
		[dayDateLabel release];
	}
	
	[super viewWillAppear:YES];
}

-(void)SetData{

	Session *aPromo;
	if([appDelegate.allDates isEqualToString:@""]){
		
		NSMutableArray *sessionsToDisplay = [[NSMutableArray alloc] init];
		for (Session *session in appDelegate.Sessions) {  
			
			if([comeFromImgdetailView isEqualToString:@"FomAgendaView"])
			{
				if ([session.Date isEqualToString:@"2013-05-14"])
					[sessionsToDisplay addObject:session];
			}
			else if([comeFromImgAgenda2 isEqualToString:@"FromAgendaView2"]){
				
				if ([session.Date isEqualToString:@"2013-05-15"])
					[sessionsToDisplay addObject:session];
			}
			else if([comeFromImgAgenda3 isEqualToString:@"FromAgendaView3"])
			{
				 if ([session.Date isEqualToString:@"2013-05-16"])
					[sessionsToDisplay addObject:session];			}
			
		}
        
        if ([sessionsToDisplay count]<=(number+1)) {
            
            nextImageButton.hidden=YES;
            prevImageButton.hidden=NO;
        }
        else if (number==0)
        {
            nextImageButton.hidden=NO;
            prevImageButton.hidden=YES;
            
        }

        if ([sessionsToDisplay count]>number) {
            
            aPromo = [sessionsToDisplay objectAtIndex:number];
        }

        else {
            
            number--;
            return;
        }
        
		[sessionsToDisplay release];
	}else{
        
        if ([appDelegate.Sessions count]>number) {

		aPromo = [appDelegate.Sessions objectAtIndex:number];
        }
	}
	
	NSString *date1 = @"2013-05-14";
	NSString *date2 = @"2013-05-15";
	NSString *date3 = @"2013-05-16";
	
	NSString *itemDate = [aPromo Date];
	
	if([date1 isEqualToString:itemDate]){
		self.title = @"Tues, June 14th";
	}
	if([date2 isEqualToString:itemDate]){
		self.title = @"Wed, June 15th";
	}
	if([date3 isEqualToString:itemDate]){
		self.title = @"Thurs, June 16th";
	}
	
    CGRect newFrame;
    CGSize newSize;
    
    newSize =[[aPromo Session_Name] sizeWithFont:Room.font constrainedToSize:CGSizeMake(230, 47) lineBreakMode:NSLineBreakByCharWrapping];
    newFrame = Name.frame;
    newFrame.size.height = newSize.height;
    Name.frame = newFrame;

    
	Name.text = [aPromo Session_Name];
	NSString *speakerList = [aPromo.Speakers stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
	NSArray *speakerArray = [speakerList componentsSeparatedByString:@","];
	
	
	Speaker.text = @"";
	if([[aPromo Speakers] isEqualToString:@"N/A"]){
		Bio.hidden = YES;
	}
	else {
		Bio.hidden = NO;
		for(NSInteger i=0;i<[speakerArray count];i++){
			NSUInteger sid = [[[speakerArray objectAtIndex:i] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] integerValue];
			//NSLog(@"Speaker %d -->",sid);
			
			if(sid <= [appDelegate.Speakers count]){
				
				if(i==0)
					speakerNumber = sid;
				
				Speakers *speakers = [appDelegate.Speakers objectAtIndex:sid-1];
				
				if([speakerArray count] > 1)
				{
					Speaker.text = [Speaker.text stringByAppendingString:[NSString stringWithFormat:@"%@ %@,",speakers.First_Name,speakers.Last_Name]];
				}else{
					Speaker.text = [Speaker.text stringByAppendingString:[NSString stringWithFormat:@"%@ %@",speakers.First_Name,speakers.Last_Name]];
				}
				
			}
			
		}
	}
	if([speakerArray count] > 1){
		if ( [Speaker.text length] > 0 )
			Speaker.text = [Speaker.text substringToIndex:[Speaker.text length] - 1];
	}
	
	Time.text = [aPromo Time];
	Time.textColor = [UIColor colorWithRed:189.0/255.0 green:190.0/255.0 blue:192.0/255.0 alpha:1.0];

	NSString *descriptionStr1 = [NSString stringWithFormat:@"%@",[aPromo Room]];
	if([descriptionStr1 isEqualToString:@"(null)"]||[descriptionStr1 isEqualToString:@"N/A"])
		descriptionStr1 = [descriptionStr1 stringByReplacingOccurrencesOfString:@"(null)" withString:@" "];
		descriptionStr1 = [descriptionStr1 stringByReplacingOccurrencesOfString:@"N/A" withString:@" "];
	Room.text = [NSString stringWithFormat:@"%@", descriptionStr1];  
    
    newSize =[[NSString stringWithFormat:@"%@", descriptionStr1] sizeWithFont:Room.font constrainedToSize:CGSizeMake(230, 30) lineBreakMode:NSLineBreakByCharWrapping];
    newFrame = Room.frame;
    newFrame.size.height = newSize.height;
    newFrame.origin.y=Name.frame.origin.y+Name.frame.size.height;//+5
    Room.frame = newFrame;

	
	
	Room.textColor = [UIColor colorWithRed:189.0/255.0 green:190.0/255.0 blue:192.0/255.0 alpha:1.0];
	
	NSString *descriptionString = [NSString stringWithFormat:@"%@", [aPromo Description]];
		
		if([descriptionString isEqualToString:@"N/A"])
			descriptionString = [descriptionString stringByReplacingOccurrencesOfString:@"N/A" withString:@" "];
	
	NSString *description_Str = [descriptionString stringByReplacingOccurrencesOfString:@";" withString:@"\n"];
   
//    newSize =[[NSString stringWithFormat:@"%@", description_Str] sizeWithFont:Desc.font constrainedToSize:CGSizeMake(230, 29) lineBreakMode:NSLineBreakByCharWrapping];
//    newFrame = Desc.frame;
//    newFrame.size.height = newSize.height;
//    newFrame.origin.y=Room.frame.origin.y+Room.frame.size.height+5;
//    Desc.frame = newFrame;

	Desc.text = [NSString stringWithFormat:@"%@", description_Str];
	
	
	Desc.font = [UIFont fontWithName:@"Arial" size:11.0];
	Desc.textColor = [UIColor whiteColor];
	Desc.backgroundColor = [UIColor clearColor];

}
  

-(void)SetDataForImg {
		

	ImgSession *imgPromo;
    if([appDelegate.allDates isEqualToString:@""]){
        NSMutableArray *sessionsToDisplayForImg = [[NSMutableArray alloc] init];
        for (ImgSession *session in appDelegate.ImgSessions) {
            
            if([comeFromImgdetailView isEqualToString:@"FomAgendaView"])//comeFromImgdetailView
            {
                if ([session.Date isEqualToString:@"2013-05-14"])
                    [sessionsToDisplayForImg addObject:session];
            }
            else if([comeFromImgAgenda2 isEqualToString:@"FromAgendaView2"]||[comeFromImgAgenda2 isEqualToString:@"funForDetailAgenda"]){
                
                if ([session.Date isEqualToString:@"2013-05-15"])
                    [sessionsToDisplayForImg addObject:session];
            }
            else if([comeFromImgAgenda3 isEqualToString:@"FromAgendaView3"])
            {
                if ([session.Date isEqualToString:@"2013-05-16"])
                    [sessionsToDisplayForImg addObject:session];
            }
        }
        
        if ([sessionsToDisplayForImg count]==(number+1)) {
            
            nextImageButton.hidden=YES;
            prevImageButton.hidden=NO;
        }
        else if (number==0)
        {
            nextImageButton.hidden=NO;
            prevImageButton.hidden=YES;
            
        }
        if ([sessionsToDisplayForImg count]>number) {
            
            imgPromo = [sessionsToDisplayForImg objectAtIndex:number];
        }
        else {
            nextImageButton.hidden=YES;
            prevImageButton.hidden=NO;
            number--;
            return;
        }

        
        [sessionsToDisplayForImg release];
    }else{
        
        if ([appDelegate.Sessions count]<=(number+1)) {
            
            nextImageButton.hidden=YES;
            prevImageButton.hidden=NO;
        }
        else if (number==0)
        {
            nextImageButton.hidden=NO;
            prevImageButton.hidden=YES;
            
        }

        if ([appDelegate.Sessions count]>number) {
            imgPromo = [appDelegate.Sessions objectAtIndex:number];
        }
//        else {
//            
//            return;
//        }

    }
    
        /*for (ImgSession *session in appDelegate.ImgSessions) {
            if ([session.Date isEqualToString:appDelegate.dateOnFocus]) 
                [sessionsToDisplayForImg addObject:session];
        }
        
        imgPromo = [sessionsToDisplayForImg objectAtIndex:number];
        [sessionsToDisplayForImg release];
    }else{
        imgPromo = [appDelegate.ImgSessions objectAtIndex:number];
    }*/
 /*
  Session *aPromo;
  if([appDelegate.allDates isEqualToString:@""]){
  
  NSMutableArray *sessionsToDisplay = [[NSMutableArray alloc] init];
  for (Session *session in appDelegate.Sessions) {
  
  if([comeFromImgdetailView isEqualToString:@"FomAgendaView"])
  {
  if ([session.Date isEqualToString:@"2013-05-14"])
  [sessionsToDisplay addObject:session];
  }
  else if([comeFromImgAgenda2 isEqualToString:@"FromAgendaView2"]){
  
  if ([session.Date isEqualToString:@"2013-05-15"])
  [sessionsToDisplay addObject:session];
  }
  else if([comeFromImgAgenda3 isEqualToString:@"FromAgendaView3"])
  {
  if ([session.Date isEqualToString:@"2013-05-16"])
  [sessionsToDisplay addObject:session];			}
  
  }
  
  aPromo = [sessionsToDisplay objectAtIndex:number];
  [sessionsToDisplay release];
  }else{
  aPromo = [appDelegate.Sessions objectAtIndex:number];
  }
*/
    
    NSString *date1 = @"2013-05-14";
    NSString *date2 = @"2013-05-15";
    NSString *date3 = @"2013-05-16";
    
    NSString *itemDate = [imgPromo Date];
    
    if([date1 isEqualToString:itemDate]){
        self.title = @"Tues, June 14th";
    }
    if([date2 isEqualToString:itemDate]){
        self.title = @"Wed, June 15th";
    }
    if([date3 isEqualToString:itemDate]){
        self.title = @"Thurs, June 16th";
    }
    
    
    CGRect newFrame;
    CGSize newSize;
    
    newSize =[[imgPromo Session_Name] sizeWithFont:Room.font constrainedToSize:CGSizeMake(230, 47) lineBreakMode:NSLineBreakByCharWrapping];
    newFrame = Name.frame;
    newFrame.size.height = newSize.height;
    Name.frame = newFrame;
    

	Name.text = [imgPromo Session_Name];
	NSString *speakerList = [imgPromo.Speakers stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
	NSArray *speakerArray = [speakerList componentsSeparatedByString:@","];
  
	Speaker.text = @"";
	if([[imgPromo Speakers] isEqualToString:@"N/A"]){
		Bio.hidden = YES;
	}
	else {
		Bio.hidden = NO;
		for(NSInteger i=0;i<[speakerArray count];i++){
			NSUInteger sid = [[[speakerArray objectAtIndex:i] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] integerValue];
		//	NSLog(@"Speaker %d -->",sid);
            
			if(sid <= [appDelegate.Speakers count]){
                
                if(i==0)
                    speakerNumber = sid;
                
				Speakers *speakers = [appDelegate.Speakers objectAtIndex:sid-1];
                
                if([speakerArray count] > 1)
                {
                    Speaker.text = [Speaker.text stringByAppendingString:[NSString stringWithFormat:@"%@ %@,",speakers.First_Name,speakers.Last_Name]];
                }else{
                    Speaker.text = [Speaker.text stringByAppendingString:[NSString stringWithFormat:@"%@ %@",speakers.First_Name,speakers.Last_Name]];
                }
				
			}
				
		}
	}
    if([speakerArray count] > 1){
        if ( [Speaker.text length] > 0 )
            Speaker.text = [Speaker.text substringToIndex:[Speaker.text length] - 1];
    }
	
	Time.text = [imgPromo Time];
	Time.textColor = [UIColor colorWithRed:189.0/255.0 green:190.0/255.0 blue:192.0/255.0 alpha:1.0];

    
    newSize =[[imgPromo Room] sizeWithFont:Room.font constrainedToSize:CGSizeMake(230, 30) lineBreakMode:NSLineBreakByCharWrapping];
    newFrame = Room.frame;
    newFrame.size.height = newSize.height;
    newFrame.origin.y=Name.frame.origin.y+Name.frame.size.height;//+5
    Room.frame = newFrame;
    
	Room.text = [imgPromo Room];
	Room.textColor = [UIColor colorWithRed:189.0/255.0 green:190.0/255.0 blue:192.0/255.0 alpha:1.0];
	
	NSString *descriptionString = [NSString stringWithFormat:@"%@", [imgPromo Description]];
	
	if([descriptionString isEqualToString:@"N/A"])
		descriptionString = [descriptionString stringByReplacingOccurrencesOfString:@"N/A" withString:@" "];
	
	NSString *description_Str = [descriptionString stringByReplacingOccurrencesOfString:@";" withString:@"\n"];
	Desc.text = [NSString stringWithFormat:@"%@", description_Str];
	
	Desc.font = [UIFont fontWithName:@"Arial" size:11.0];
	Desc.textColor = [UIColor whiteColor];
	Desc.backgroundColor = [UIColor clearColor];
}

#pragma mark 
#pragma mark Prev & Next Button Action
-(void)nextImageButtonClicked:(id)sender {

	@try {
		if([agendaDetailView isEqualToString:@"AgendaViewController3"]|[agendaDetailView isEqualToString:@"FromAgendaView3"])
		{
			if([appDelegate.ImgSessions count] > number)
			{
                nextImageButton.hidden=NO;

			NSMutableArray *sessionsToDisplayForImg = [[NSMutableArray alloc] init];
			
			for (ImgSession *session in appDelegate.ImgSessions) {
				if ([session.Date isEqualToString:appDelegate.dateOnFocus]) 
					[sessionsToDisplayForImg addObject:session];
			}
			
			if(number == [sessionsToDisplayForImg count]){
				[sessionsToDisplayForImg release];
                
                nextImageButton.hidden=YES;
                prevImageButton.hidden=NO;

			}
			else {
				number++ ;
                
                if (number!=0) {
                    
                    prevImageButton.hidden=NO;
                }
                else {
                    
                    prevImageButton.hidden=YES;
                    
                }
                if ([sessionsToDisplayForImg count]==(number+1)) {
                    
                    nextImageButton.hidden=YES;
                    prevImageButton.hidden=NO;
                    
                    
                }
                else {
                    nextImageButton.hidden=NO;
                    
                }

                [sessionsToDisplayForImg release];

				[self SetDataForImg];
			}
			}
            else {
                
                
                nextImageButton.hidden=YES;
            }
		}
		else {
			if([appDelegate.Sessions count] > number)
			{
                 nextImageButton.hidden=NO;
			NSMutableArray *sessionsToDisplay = [[NSMutableArray alloc] init];
			for (Session *session in appDelegate.Sessions) { 
				if ([session.Date isEqualToString:appDelegate.dateOnFocus]) 
					[sessionsToDisplay addObject:session];
			}
			
			if(number == [sessionsToDisplay count]){
				[sessionsToDisplay release];
                
                nextImageButton.hidden=YES;
                prevImageButton.hidden=NO;

			}
			else {
				
				number++ ;
                
                if (number!=0) {
                    
                    prevImageButton.hidden=NO;
                }
                else {
                    
                    prevImageButton.hidden=YES;

                }
                if ([sessionsToDisplay count]==(number+1)) {
                    
                    nextImageButton.hidden=YES;
                    prevImageButton.hidden=NO;

                    
                }
                else {
                    nextImageButton.hidden=NO;

                }

                [sessionsToDisplay release];
				[self SetData];
                
			}
		}
            else {
                 nextImageButton.hidden=YES;
                prevImageButton.hidden=NO;

            }
		}
	}
	@catch (NSException * e) {
		NSLog(@"NSException %@ %@", [e reason],[e description]);
	}
	
}

-(void)prevImageButtonClicked:(id)sender {
	
	if([agendaDetailView isEqualToString:@"AgendaViewController3"]|[agendaDetailView isEqualToString:@"FromAgendaView3"])
	{
		if(number == 0){
			
             prevImageButton.hidden=YES;
             nextImageButton.hidden=NO;
		}
		else {
			number-- ;
			[self SetDataForImg];
            
            prevImageButton.hidden=NO;
            nextImageButton.hidden=NO;
            
            if (number == 0) {
                
                prevImageButton.hidden=YES;
                nextImageButton.hidden=NO;
                
            }

		}
	}
	
	else {
		if(number == 0){
			
            prevImageButton.hidden=YES;
            nextImageButton.hidden=NO;

		}
		else {
			number-- ;
			[self SetData];
            
            prevImageButton.hidden=NO;
            nextImageButton.hidden=NO;
            
            if (number == 0) {
                
                prevImageButton.hidden=YES;
                nextImageButton.hidden=NO;

            }

		}
		
	}

	
}

-(IBAction)ShowBio:(id)sender{
	if(SpeakerDetailView == nil){
		SpeakerDetailView = [[SpeakerDetailsViewController alloc] init];	
	}
	SpeakerDetailView.number = speakerNumber-1;
	[self.navigationController pushViewController:SpeakerDetailView animated:YES];
}



-(void)loadViewForiPhone5{
    appDelegate = (OrlandoAppDelegate *)[[UIApplication sharedApplication] delegate];
    if ([appDelegate checkIfDeviceIsiPhone5]){
        CGRect backgroundImageFrame = backgroundImageView.frame;
        backgroundImageFrame.size.height += heightDifferenceInBackgroundImageForiPhone5;
        backgroundImageView.frame = backgroundImageFrame;
        
        CGRect descFrame = Desc.frame;
        descFrame.size.height += heightDifferenceInBackgroundImageForiPhone5;
        Desc.frame = descFrame;
        
        
    }
}



- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end
