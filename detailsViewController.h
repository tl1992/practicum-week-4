//
//  detailsViewController.h
//  practicum week 4
//
//  Created by FHICT on 14/03/14.
//  Copyright (c) 2014 FHICT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Pirate.h"

@interface detailsViewController : UIViewController

@property Pirate *selectedPirate;

@property (strong, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *life;
@property (weak, nonatomic) IBOutlet UILabel *years;
@property (weak, nonatomic) IBOutlet UILabel *country;
@property (weak, nonatomic) IBOutlet UITextView *comments;


@end
