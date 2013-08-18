//
//  AddCityController.m
//  CityGuide
//
//  Created by Apple on 3/08/13.
//  Copyright (c) 2013 Apple. All rights reserved.
//

#import "AddCityController.h"
#import "CGAppDelegate.h"
#import "CGViewController.h"
#import "City.h"

@interface AddCityController ()

@end

@implementation AddCityController

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
    self.title = @"New City";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(saveCity:)];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)saveCity:(id)sender {
    CGAppDelegate *delegate = (CGAppDelegate *)[[UIApplication sharedApplication] delegate];
    NSMutableArray *cities = delegate.cities;
    UITextField *nameEntry = (UITextField *)[nameCell viewWithTag:777];
    UITextView *descriptionEntry = (UITextView *)[descriptionCell viewWithTag:777];
    
    if (nameEntry.text.length > 0) {
        City *newCity = [[City alloc] init];
        newCity.cityName = nameEntry.text;
        newCity.cityDescription = descriptionEntry.text;
        newCity.cityPicture = nil;
        [cities addObject:newCity];
        NSLog(@"Current city count = %d", cities.count);
        CGViewController *viewController = delegate.viewController;
        [viewController.tableView reloadData];
    }
    [delegate.navController popViewControllerAnimated:YES];
}


#pragma mark UITableViewDataSource Methods

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = nil;
    if (indexPath.row == 0) {
        cell = nameCell;
    } else {
        cell = descriptionCell;
    }
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}



#pragma mark UITableViewDelegate Methods

- (CGFloat) tableView:(UITableView *)tv heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat height;
    if (indexPath.row == 0) {
        height = 44;
    } else {
        height = 440;
    }
    return height;
}


@end
