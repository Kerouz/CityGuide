//
//  CityController.h
//  CityGuide
//
//  Created by Apple on 28/07/13.
//  Copyright (c) 2013 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CityController : UIViewController {
    NSIndexPath *index;
    
    IBOutlet UIImageView *pictureView;
    IBOutlet UITextView *descriptionView;
}

- (id)initWithIndexPath:(NSIndexPath *)indexPath;

@end
