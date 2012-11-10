//
//  SDCSpeakersViewController.m
//  SDC12
//
//  Created by Derek Fernholz on 10/18/12.
//  Copyright (c) 2012 Derek Fernholz. All rights reserved.
//

#import "SDCSpeakersViewController.h"
#import "AFNetworking.h"
#import "SDCApiClient.h"
#import "SDCSpeaker.h"
#import "SDCSpeakerCell.h"
#import "SDCSpeakerDetailViewController.h"

@interface SDCSpeakersViewController () <UICollectionViewDataSource, UICollectionViewDelegate>
    @property(nonatomic, weak) IBOutlet UICollectionView *collectionView;
    @property (nonatomic, retain) NSArray *results;
@end

@implementation SDCSpeakersViewController

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
    
    [[SDCApiClient sharedInstance] getPath:@"speaker/?format=json" parameters:nil
                                   success:^(AFHTTPRequestOperation *operation, id response) {
                                       
                                       NSMutableArray *results = [NSMutableArray array];
                                       NSArray *responseArray = response[@"objects"];
                                       for (NSDictionary *speakerDictionary in responseArray) {
                                           SDCSpeaker *speaker = [[SDCSpeaker alloc] initWithDictionary:speakerDictionary];
                                           [results addObject:speaker];
                                       }
                                       self.results = results;
                                       [self.collectionView reloadData];
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

-(IBAction)twitterHandleTapped:(UIButton *)sender {
    
    UICollectionViewCell *cell = (UICollectionViewCell*)sender.superview.superview;    
    NSIndexPath *indexPath = [self.collectionView indexPathForCell:cell];
    
    SDCSpeaker *speaker = [self.results objectAtIndex:indexPath.row];
    NSString *handle = [speaker.twitter substringFromIndex:1];
    
    //Try tweetbot
    if ([[UIApplication sharedApplication] canOpenURL:
         [NSURL URLWithString:@"tweetbot://"]]) {        
        NSURL *tweetbotURL = [NSURL URLWithString:[NSString stringWithFormat:@"tweetbot://%@/user_profile/%@", handle, handle]];
        
        // Open the URL with TweetBot.
        [[UIApplication sharedApplication] openURL:tweetbotURL];
    }
    //Else try to open in twitter app
    else if ([[UIApplication sharedApplication] canOpenURL:
              [NSURL URLWithString:@"twitter://"]]) {
        
        NSURL *twitterUrl = [NSURL URLWithString:[NSString stringWithFormat: @"twitter://user?screen_name=%@", handle]];
        [[UIApplication sharedApplication] openURL:twitterUrl];
    }
    //If all else fails, open it in safari
    else {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://twitter.com/%@", handle]]];
    }
}

#pragma mark - UICollectionView Datasource
// 1
- (NSInteger)collectionView:(UICollectionView *)view numberOfItemsInSection:(NSInteger)section {
    return self.results.count;
}
// 2
- (NSInteger)numberOfSectionsInCollectionView: (UICollectionView *)collectionView {
    return 1;
}
// 3
- (UICollectionViewCell *)collectionView:(UICollectionView *)cv cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    SDCSpeakerCell *cell = [cv dequeueReusableCellWithReuseIdentifier:@"SpeakerCell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor]; //[UIColor colorWithPatternImage:[UIImage imageNamed:@"bluprint.png"]];
    
    SDCSpeaker *speaker = [self.results objectAtIndex:indexPath.row];
    cell.textLabel.text = [speaker.first_name stringByAppendingFormat:@" %@", speaker.last_name];
    [cell.speakerImage setImageWithURL:[NSURL URLWithString:speaker.photo relativeToURL:[NSURL URLWithString:@"http://southdakotacodecamp.net"]]];
    cell.bio.text = speaker.bio;
    
    return cell;
}
// 4
/*- (UICollectionReusableView *)collectionView:
 (UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
 {
 return [[UICollectionReusableView alloc] init];
 }*/

#pragma mark - UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    // TODO: Select Item
}
- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath {
    // TODO: Deselect item
}

#pragma mark - More info button handling

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(UIButton *)sender
{
    UICollectionViewCell *cell = (UICollectionViewCell*)sender.superview.superview;
    NSIndexPath *indexPath = [self.collectionView indexPathForCell:cell];
    
    if ([segue.identifier isEqualToString:@"speakerDetailSeque"]) {
        [segue.destinationViewController setSpeakerInfo:[self.results objectAtIndex:indexPath.row]];
    } 
}


@end
