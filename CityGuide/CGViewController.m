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
#import "AddCityController.h"


@interface CGViewController ()

@end

@implementation CGViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"City Guide";
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
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

/*  OLD VERSION OF THIS METHOD
- (void)setEditing:(BOOL)editing animated:(BOOL) animated {
    if (editing != self.editing) {
        [super setEditing:editing animated:animated];
        [self.tableView setEditing:editing animated:animated];
        
        NSArray *indexes = [NSArray arrayWithObject: [NSIndexPath indexPathForRow:cities.count inSection:0]];
        if (editing == YES) {
            [self.tableView insertRowsAtIndexPaths:indexes withRowAnimation:UITableViewRowAnimationLeft];
        } else {
            [self.tableView deleteRowsAtIndexPaths:indexes withRowAnimation:UITableViewRowAnimationLeft];
        }
    }
}
*/

//NEW VERSION OF THIS METHOD
- (void)setEditing:(BOOL)editing animated:(BOOL) animated {
    if (editing != self.editing) {
        [super setEditing:editing animated:animated];
        [self.tableView setEditing:editing animated:animated];
        
        NSMutableArray *indices = [[NSMutableArray alloc] init];
        for (int i=0; i < cities.count; i++) {
            [indices addObject:[NSIndexPath indexPathForRow:i inSection:0]];
        }
        NSArray *lastIndex = [NSArray arrayWithObject:[NSIndexPath indexPathForRow:cities.count inSection:0]];
        
        if (editing == YES) {
            for (int i=0; i < cities.count; i++) {
                UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:[indices objectAtIndex:i]];
                [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
            }
            [self.tableView insertRowsAtIndexPaths:lastIndex withRowAnimation:UITableViewRowAnimationLeft];
        } else {
            for (int i=0 ; i < cities.count ; i++) {
                UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:[indices objectAtIndex:i]];
                [cell setSelectionStyle:UITableViewCellSelectionStyleBlue];
            }
            [self.tableView deleteRowsAtIndexPaths:lastIndex withRowAnimation:UITableViewRowAnimationLeft];
        }
    }
}

#pragma mark UITableViewDataSource Methods

- (UITableViewCell *)tableView:(UITableView *)tv cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tv dequeueReusableCellWithIdentifier:@"cell"];
    if (nil == cell) {
        cell = [[UITableViewCell alloc]
                initWithFrame:CGRectZero
                reuseIdentifier:@"cell"];
    }
    
    NSLog(@"indexPath.ro = %d, cities.count = %d", indexPath.row, cities.count);
    if (indexPath.row < cities.count) {
        City *thisCity = [cities objectAtIndex:indexPath.row];
        cell.textLabel.text = thisCity.cityName;
        cell.textLabel.textColor = [UIColor blackColor];
        cell.editingAccessoryType = UITableViewCellAccessoryNone;
        if (self.editing) {
            [cell setSelectionStyle:UITableViewCellEditingStyleNone];
        }
    } else {
        cell.textLabel.text = @"Add New City...";
        cell.textLabel.textColor = [UIColor lightGrayColor];
        cell.editingAccessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    return cell;
}

- (NSInteger)tableView:(UITableView *)tv numberOfRowsInSection:(NSInteger)section {
    NSInteger count = cities.count;
    if (self.editing) {
        count = count + 1;
    }
    return count;
}

- (void) tableView:(UITableView *)tv commitEditingStyle:(UITableViewCellEditingStyle)editing forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editing == UITableViewCellEditingStyleDelete) {
        [cities removeObjectAtIndex:indexPath.row];
        [tv deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationLeft];
    }
}

#pragma mark UITableViewDelegate Methods

- (void)tableView:(UITableView *)tv didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CGAppDelegate *delegate = (CGAppDelegate *)
    [[UIApplication sharedApplication] delegate];
    if (indexPath.row < cities.count && !self.editing) {
        CityController *city = [[CityController alloc] initWithIndexPath:indexPath];
        [delegate.navController pushViewController:city animated:YES];
    }
    if (indexPath.row == cities.count && self.editing) {
        AddCityController *addCity = [[AddCityController alloc] init];
        [delegate.navController pushViewController:addCity animated:YES];
    }
/*    City *thisCity = [cities objectAtIndex:indexPath.row];
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:thisCity.cityName message:thisCity.cityDescription delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
    [alert show];
 */
    
    [tv deselectRowAtIndexPath:indexPath animated:YES];
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row < cities.count) {
        return UITableViewCellEditingStyleDelete;
    } else {
        return UITableViewCellEditingStyleInsert;
    }
}

@end
