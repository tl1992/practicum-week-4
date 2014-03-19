//
//  tableViewController.h
//  practicum week 4
//
//  Created by FHICT on 14/03/14.
//  Copyright (c) 2014 FHICT. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface tableViewController : UITableViewController

@property NSMutableArray *pirates;
- (void) parseJSONData:(id) JSON;
- (void) loadJsonData;

@end

