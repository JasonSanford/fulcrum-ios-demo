//
//  SNClassificationSetsViewController.m
//  FulcrumAPITest
//
//  Created by Ben Rigas on 5/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SNClassificationSetsViewController.h"
#import "SNClassificationSetAPI.h"

@interface SNClassificationSetsViewController ()

@property (nonatomic, retain) NSArray* classificationSets;

@end

@implementation SNClassificationSetsViewController

@synthesize tableView = _tableView;
@synthesize classificationSets = _classificationSets;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"Classification Sets";
        self.tabBarItem.title = @"Classification Sets";
        self.tabBarItem.image = [UIImage imageNamed:@"15-tags"];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self fetchClassificationSets];
}

- (void)viewDidUnload
{
    [self setTableView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

#pragma mark -
#pragma SNClassificationSetAPI

- (void) fetchClassificationSets
{
    
    [SNClassificationSetAPI getClassificationSetsSuccess:^(NSArray* classificationSets){
        self.classificationSets = classificationSets;
        [self.tableView reloadData];
    } 
        failure:^(NSError* error){
            UIAlertView* alert = [[[UIAlertView alloc] initWithTitle:@"Error" 
                                                             message:[NSString stringWithFormat:@"Error loading Classification Sets: %@", error] delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil] autorelease];
            [alert show];
        } ];
}

#pragma mark -
#pragma mark UITableView

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.classificationSets.count;
}

- (UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString* cellID = @"cell";
    
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil)
    {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID] autorelease];
    }
    
    SNClassificationSet* classificaitonSet = [self.classificationSets objectAtIndex:indexPath.row];
    
    cell.textLabel.text = classificaitonSet.name;
    cell.detailTextLabel.text = classificaitonSet.description;
    
    return cell;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)dealloc {
    [_tableView release];
    [_classificationSets release];
    [super dealloc];
}
@end
