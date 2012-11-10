//
//  SDCSessionsViewController.m
//  SDC12
//
//  Created by Derek Fernholz on 10/16/12.
//  Copyright (c) 2012 Derek Fernholz. All rights reserved.
//

#import "SDCSessionsViewController.h"
#import "AFNetworking.h"
#import "SDCApiClient.h"
#import "SDCSession.h"
#import "SDCSessionCell.h"

@interface SDCSessionsViewController () <UICollectionViewDataSource, UICollectionViewDelegate>
    @property(nonatomic, weak) IBOutlet UICollectionView *collectionView;
    @property (nonatomic, retain) NSArray *results;
@end

@implementation SDCSessionsViewController

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
    
    [[SDCApiClient sharedInstance] getPath:@"session/?format=json" parameters:nil
                                   success:^(AFHTTPRequestOperation *operation, id response) {

                                            NSMutableArray *results = [NSMutableArray array];
                                            NSArray *responseArray = response[@"objects"];
                                            for (NSDictionary *sessionDictionary in responseArray) {
                                                SDCSession *session = [[SDCSession alloc] initWithDictionary:sessionDictionary];
                                                [results addObject:session];
                                            }
                                            self.results = results;
                                            [self.collectionView reloadData];
                                   }
                                   failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                                       NSLog(@"Error fetching session!");
                                       NSLog(@"%@", error);
                                   }];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    SDCSessionCell *cell = [cv dequeueReusableCellWithReuseIdentifier:@"SessionCell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor]; //[UIColor colorWithPatternImage:[UIImage imageNamed:@"bluprint.png"]];
//    cell.backgroundView = [[UIView alloc] initWithFrame:cell.frame];
//    cell.backgroundView.backgroundColor = [UIColor whiteColor];
//    cell.backgroundView.alpha = 0.5f;
    
    SDCSession *session = [self.results objectAtIndex:indexPath.row];
    cell.textLabel.text = session.title;
    cell.metaLabel.text = [NSString stringWithFormat:@"Room: %@  Time: %@", session.room, session.time];
    
    cell.detailTextLabel.text = session.abstract;
    
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

@end
