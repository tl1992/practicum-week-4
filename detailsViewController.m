//
//  detailsViewController.m
//  practicum week 4
//
//  Created by FHICT on 14/03/14.
//  Copyright (c) 2014 FHICT. All rights reserved.
//

#import "detailsViewController.h"

@interface detailsViewController ()

@end

@implementation detailsViewController

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void) viewDidAppear:(BOOL)animated
{
    self.name.text = self.selectedPirate.name;
    self.life.text = self.selectedPirate.life;
    self.years.text = self.selectedPirate.active;
    self.country.text = self.selectedPirate.countryOfOrigin;
    self.comments.text = self.selectedPirate.comments;
    //Todo set the other UI elements
}

@end
