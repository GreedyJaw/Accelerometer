//
//  ViewController.m
//  Accelerometer
//
//  Created by Greedy Jaw on 02.12.2017.
//  Copyright © 2017 Greedy Jaw. All rights reserved.
//

#import "ViewController.h"
#import "CameraController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _toField.delegate = self;
    _fromField.delegate = self;
    
    if(_photo) {
        _photoView.image = _photo;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (BOOL) textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:@"startCamera"]) {
        CameraController *controller = (CameraController *)segue.destinationViewController;
        controller.angleFrom = [_fromField.text floatValue];
        controller.angleTo = [_toField.text floatValue];
    }
    
    if([segue.identifier isEqualToString:@"showPhoto"]) {
        ViewController *photoController = (ViewController *)segue.destinationViewController;
        photoController.photo = _photo;
    }
}

- (IBAction)startCamera:(id)sender {
    _angleFrom = [_fromField.text floatValue];
    _angleTo = [_toField.text floatValue];
    
    if(_angleTo > _angleFrom) {
        [self performSegueWithIdentifier:@"startCamera" sender:self];
    } else {
        NSLog(@"Error interval");
    }
}
@end
