//
//  CameraController.h
//  Accelerometer
//
//  Created by Greedy Jaw on 07.12.2017.
//  Copyright © 2017 Greedy Jaw. All rights reserved.
//

#import "ViewController.h"
#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import <CoreMotion/CoreMotion.h>

@interface CameraController : ViewController<AVCapturePhotoCaptureDelegate, AVCaptureVideoDataOutputSampleBufferDelegate>
@property (weak, nonatomic) IBOutlet UIView *camPreview;
@property (weak, nonatomic) IBOutlet UIView *shootBtnWrap;
@property (weak, nonatomic) IBOutlet UIButton *shootBtn;
- (IBAction)shoot:(id)sender;

@end
