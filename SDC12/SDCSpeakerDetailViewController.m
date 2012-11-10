//
//  SDCSpeakerDetailViewController.m
//  SDC12
//
//  Created by Derek Fernholz on 10/19/12.
//  Copyright (c) 2012 Derek Fernholz. All rights reserved.
//

#import "SDCSpeakerDetailViewController.h"
#import "AFNetworking.h"
#import "SDCApiClient.h"
#import "SDCSession.h"

@interface SDCSpeakerDetailViewController ()
    @property (nonatomic, retain) SDCSession *session;
@end

@implementation SDCSpeakerDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    self.view.frame = CGRectMake(0, 0, 320, 460);
    self.scrollView.frame = CGRectMake(0, 0, 320, 200);
    
    //self.scrollView.contentSize = CGSizeMake(self.view.frame.size.width, self.view.frame.size.height);
    [self.scrollView setScrollEnabled:YES];
    [self.scrollView setClipsToBounds:YES];
    self.scrollView.backgroundColor = [UIColor darkGrayColor];
    
    [self.scrollView setContentSize:CGSizeMake(320, 2000)];
    
    self.detailTitle.text = [NSString stringWithFormat:@"%@ %@", self.speakerInfo.first_name, self.speakerInfo.last_name];
    self.detailBio.text = self.speakerInfo.bio;
    

}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    
    NSString *path = [self.speakerInfo.session substringFromIndex:8];
    
    [[SDCApiClient sharedInstance] getPath:[path stringByAppendingString:@"?format=json"] parameters:nil
                                   success:^(AFHTTPRequestOperation *operation, id response) {
                                       
                                       NSMutableArray *results = [NSMutableArray array];
                                       SDCSession *session = [[SDCSession alloc] initWithDictionary:response];
                                       [results addObject:session];
                                       self.session = session;
                                       self.sessionName.text = self.session.title;
                                       
                                       self.sessionAbstract.text = self.session.abstract;
                                       
                                       
                                   }
                                   failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                                       NSLog(@"Error fetching speaker!");
                                       NSLog(@"%@", error);
                                   }];

    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)doneTapped:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

//-(void)setSpeakerInfo:(NSDictionary *)speakerInfo {
//    _speakerInfo = speakerInfo;
//}

@end
