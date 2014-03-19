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
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return _pirates.count;
}

- (void) loadJsonData
{
    NSLog(@"test inside loadJsonData");
    
    //Create URL
    
    NSURL* url = [NSURL URLWithString:@"http://athena.fhict.nl/users/i282933/pirates.json"];
    
    //Sometimes servers return a wrong header. Use thi to add a new accepted type
    
    NSURLRequest* request = [NSURLRequest requestWithURL:url];
    
    AFHTTPRequestOperation* operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    
    operation.responseSerializer = [AFJSONResponseSerializer serializer];
    
    operation.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"application/x-javascript"];
    
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject)
     
     {
         
         NSLog(@"%@",responseObject);
         
         [self parseJSONData:responseObject];
         
        
         
     } failure:^(AFHTTPRequestOperation *operation, NSError *error)
     
     {
         
         NSLog(@"Error: %@", error);
         
     }
     
     ];
    
    [operation start];
    

}
-(void)parseJSONData:(id) JSON
{
      NSLog(@"test inside parseJSONData");
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

- (void)viewDidLoad
{
    NSLog(@"test inside viewDidLoad");
    //[super viewDidLoad];
    
    [super viewDidLoad];
    
    self.pirates = [[NSMutableArray alloc] init];
    [self loadJsonData];
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"test inside cellForRowAtIndexPath");
    //Get the cell. Note that this name is the same as in the storyboard
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    //Set the correct name in the cell.
    //Do so by looking up the row in indexpath and choosing the same element in the array
    NSInteger currentRow = indexPath.row;
    Pirate * currentPirate = [self.pirates objectAtIndex:currentRow];
    
    NSString *textForCell = currentPirate.name;
    
    //Set the text in the cell
    cell.textLabel.text = textForCell;
    
    NSLog(@"%@",currentPirate.name);

    
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    //Find the selected pirate
    NSIndexPath *selectedRow = [self.tableView indexPathForSelectedRow];
    Pirate *selectedPirate =  [self.pirates objectAtIndex:selectedRow.row];
    //Pass the selected pirate to the next viewcontroller
    detailsViewController *controller = segue.destinationViewController;
    controller.selectedPirate = selectedPirate;
    
}

@end
