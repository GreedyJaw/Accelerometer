//
//  ViewController.h
//  Accelerometer
//
//  Created by Greedy Jaw on 02.12.2017.
//  Copyright © 2017 Greedy Jaw. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface ViewController : UIViewController<UITextFieldDelegate>

@property CGFloat angleFrom;
@property CGFloat angleTo;
@property UIImage *photo;
@property (weak, nonatomic) IBOutlet UITextField *fromField;
@property (weak, nonatomic) IBOutlet UITextField *toField;
@property (weak, nonatomic) IBOutlet UIImageView *photoView;

- (IBAction)startCamera:(id)sender;


@end

