//
//  ExitButton.m
//  Accelerometer
//
//  Created by Greedy Jaw on 07.12.2017.
//  Copyright © 2017 Greedy Jaw. All rights reserved.
//

#import "ExitButton.h"

@implementation ExitButton

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    exit(0);
}

@end
