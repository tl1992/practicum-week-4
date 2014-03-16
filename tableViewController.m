//
//  tableViewController.m
//  practicum week 4
//
//  Created by FHICT on 14/03/14.
//  Copyright (c) 2014 FHICT. All rights reserved.
//

#import "tableViewController.h"

#import "AFNetworking.h" 
#import "Pirate.h" 
#import "DetailsViewController.h"

@interface tableViewController ()

@end

@implementation tableViewController

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
    
    self.pirates = [[NSMutableArray alloc] init];
    [self loadJsonData];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}

- (void) loadJsonData
{
    //Create an URL
    NSURL *url = [NSURL URLWithString:@"http://athena.fhict.nl/users/i886625/pirates.json"];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"application/x-javascript"];
    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id JSON) {
        [self parseJsonData:JSON];
        
        NSLog(@"JSON: %@", JSON);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
    
 
    

}

-(void)parseJsonData:(id) JSON
{
    //Loop through all objects in JSON array
    for (NSDictionary *dict in JSON) {
        //Create a pirate object where thejsondata can be stored
        Pirate *pirate = [[Pirate alloc]init];
        //Get the JSON data from the dictionary and store it at the Pirate object
        pirate.name = [dict objectForKey:@"name"];
        pirate.life = [dict objectForKey:@"life"];
        pirate.countryOfOrigin = [dict objectForKey:@"country_of_origin"];
        pirate.active = [dict objectForKey:@"years_active"];
        pirate.comments = [dict objectForKey:@"comments"];
        
        //Add the pirates to the array
        [self.pirates addObject:pirate];
    }
    [self.tableView reloadData];
}

@end
