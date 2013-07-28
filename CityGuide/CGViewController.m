//
//  CGViewController.m
//  CityGuide
//
//  Created by Apple on 28/07/13.
//  Copyright (c) 2013 Apple. All rights reserved.
//

#import "CGViewController.h"
#import "CGAppDelegate.h"
#import "City.h"
#import "CityController.h"

@interface CGViewController ()

@end

@implementation CGViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"City Guide";
    CGAppDelegate *delegate =(CGAppDelegate *)
    [[UIApplication sharedApplication] delegate];
    cities = delegate.cities;
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark UITableViewDataSource Methods

- (UITableViewCell *)tableView:(UITableView *)tv cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tv dequeueReusableCellWithIdentifier:@"cell"];
    if (nil == cell) {
        cell = [[UITableViewCell alloc]
                initWithStyle:UITableViewCellStyleDefault
                reuseIdentifier:@"cell"];
    }
    City *thisCity = [cities objectAtIndex:indexPath.row];
    cell.textLabel.text = thisCity.cityName;
    return cell;
}

- (NSInteger)tableView:(UITableView *)tv numberOfRowsInSection:(NSInteger)section {
    return [cities count];
}

#pragma mark UITableViewDelegate Methods

- (void)tableView:(UITableView *)tv didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CGAppDelegate *delegate = (CGAppDelegate *)
    [[UIApplication sharedApplication] delegate];
    CityController *city = [[CityController alloc] initWithIndexPath:indexPath];
    [delegate.navController pushViewController:city animated:YES];
/*    City *thisCity = [cities objectAtIndex:indexPath.row];
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:thisCity.cityName message:thisCity.cityDescription delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
    [alert show];
 */
    
    [tv deselectRowAtIndexPath:indexPath animated:YES];
}

@end
