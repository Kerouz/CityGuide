//
//  CGViewController.h
//  CityGuide
//
//  Created by Apple on 28/07/13.
//  Copyright (c) 2013 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CGViewController : UIViewController

<UITableViewDataSource,
UITableViewDelegate> {
    NSMutableArray *cities;
}

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
