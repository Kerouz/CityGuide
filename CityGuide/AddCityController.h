//
//  AddCityController.h
//  CityGuide
//
//  Created by Apple on 3/08/13.
//  Copyright (c) 2013 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddCityController : UIViewController

<UITableViewDataSource, UITableViewDelegate> {
    IBOutlet UITableView *tableView;
    IBOutlet UITableViewCell *nameCell;
    IBOutlet UITableViewCell *descriptionCell;
}

@end
