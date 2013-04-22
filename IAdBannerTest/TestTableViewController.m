//
//  TestTableViewController.m
//  IAdBannerTest
//
//  Created by Big Sauce on 4/22/13.
//  This source code is Open Source.
//

#import "TestTableViewController.h"

// screen dimensions
#define SCREEN_LENGTH_X  ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT_Y  ([[UIScreen mainScreen] bounds].size.height)

#define STATUS_BAR_HEIGHT ([UIApplication sharedApplication].statusBarFrame.size.height)

@interface TestTableViewController ()

@end

@implementation TestTableViewController

@synthesize adBanner;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*  uncomment viewWillLayoutSubviews to fix AdBannerView issue!
- (void)viewWillLayoutSubviews {
    
    [super viewWillLayoutSubviews];
    [self layoutAdBanner];
}
 */

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [super tableView:tableView cellForRowAtIndexPath:indexPath];
}
#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self layoutAdBanner];
}

- (void) layoutAdBanner {
    
    // frames of the content (tableview) and banner
    CGRect contentFrame = self.view.bounds;
    CGRect bannerFrame = self.adBanner.frame;
    
    // by default, content will take up all available space in current tab
    contentFrame.size.height = SCREEN_HEIGHT_Y - self.tabBarController.tabBar.frame.size.height - STATUS_BAR_HEIGHT;
    
    contentFrame.size.height -=  adBanner.frame.size.height;
    
    //content frame immediately underneath status bar
    contentFrame.origin.y = 0;
    
    
    // banner at bottom of content frame
    bannerFrame = CGRectMake(bannerFrame.origin.x, contentFrame.size.height, bannerFrame.size.width, bannerFrame.size.height);
    
    // move tableview to presenting location - no animation
    self.tableView.frame = contentFrame;
    
    // move ad banner to presenting location, and fade in
    adBanner.frame = bannerFrame;
    
    // remove and re-add AdBannerView
    [self.adBanner removeFromSuperview];
    [[self.tableView superview] addSubview:self.adBanner];
}

@end
