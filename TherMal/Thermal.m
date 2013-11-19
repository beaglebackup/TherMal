//
//  Thermal.m
//  TherMal
//
//  Created by Gabriel on 11/5/13.
//  Copyright (c) 2013 Gabriel. All rights reserved.
//

#import "Thermal.h"

@implementation Thermal

- (void)setLength:(float)length {
    _length = length;
}

- (void)setWidth:(float)width {
    _width = width;
}

- (float)length {
    return _length;
}

- (float)width {
    return _width;
}

- (float)calculateArea {
    // return _length * _width;
    // return [self length] * [self width];
    return _length * _width;
    
}

- (float)calculateCost {
    return 2.00 * [self calculateArea];
}

@end