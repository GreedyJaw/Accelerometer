//
//  CameraController.m
//  Accelerometer
//
//  Created by Greedy Jaw on 07.12.2017.
//  Copyright © 2017 Greedy Jaw. All rights reserved.
//

#import "CameraController.h"
#import <AVFoundation/AVFoundation.h>
#import <CoreMotion/CoreMotion.h>

@interface CameraController ()

@end

@implementation CameraController
AVCaptureSession *session;
AVCapturePhotoOutput *photoOutput;
CMMotionManager *manager;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    manager = [[CMMotionManager alloc] init];
    [manager startDeviceMotionUpdates];
    [manager startGyroUpdates];

    [NSTimer scheduledTimerWithTimeInterval:0.1 repeats:YES block:^(NSTimer *time) {
        CGFloat pitch = manager.deviceMotion.attitude.pitch * 180.0f / M_PI;
    
        if(pitch >= self.angleFrom && pitch <= self.angleTo) {
            [_shootBtnWrap setBackgroundColor:[UIColor greenColor]];
            [_shootBtn setEnabled:YES];
        } else {
            [_shootBtnWrap setBackgroundColor:[UIColor redColor]];
            [_shootBtn setEnabled:NO];
        }
    }];

    session = [[AVCaptureSession alloc] init];
    [session setSessionPreset:AVCaptureSessionPresetPhoto];
    
    AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    NSError *error;
    AVCaptureDeviceInput *input = [AVCaptureDeviceInput deviceInputWithDevice:device error:&error];
    
    if([session canAddInput:input]) {
        [session addInput:input];
    }
    
    AVCaptureVideoPreviewLayer *preview = [[AVCaptureVideoPreviewLayer alloc] initWithSession:session];
    [preview setVideoGravity:AVLayerVideoGravityResizeAspectFill];
    
    CALayer *rootLayer = [_camPreview layer];
    [preview setFrame:_camPreview.frame];
    [rootLayer insertSublayer:preview atIndex:0];
    
    photoOutput = [[AVCapturePhotoOutput alloc] init];
    [session addOutput:photoOutput];
    [session startRunning];
}

-(void)captureOutput:(AVCapturePhotoOutput *)captureOutput didFinishProcessingPhotoSampleBuffer:(CMSampleBufferRef)photoSampleBuffer previewPhotoSampleBuffer:(CMSampleBufferRef)previewPhotoSampleBuffer resolvedSettings:(AVCaptureResolvedPhotoSettings *)resolvedSettings bracketSettings:(AVCaptureBracketedStillImageSettings *)bracketSettings error:(NSError *)error
{
    if (photoSampleBuffer) {
        NSData *data = [AVCapturePhotoOutput JPEGPhotoDataRepresentationForJPEGSampleBuffer:photoSampleBuffer previewPhotoSampleBuffer:previewPhotoSampleBuffer];
        self.photo = [UIImage imageWithData:data];
        
        [manager stopDeviceMotionUpdates];
        [session stopRunning];

        [self performSegueWithIdentifier:@"showPhoto" sender:self];
    }
}

- (IBAction)shoot:(id)sender {
    AVCapturePhotoSettings *settings = [[AVCapturePhotoSettings alloc] init];
    [photoOutput capturePhotoWithSettings:settings delegate:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
