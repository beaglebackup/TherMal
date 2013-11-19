//
//  Interceptors.m
//  TherMal
//
//  Created by Gabriel on 11/5/13.
//  Copyright (c) 2013 Gabriel. All rights reserved.
//

#import "Interceptors.h"

@implementation Interceptors

- (void)setInterceptors:(float)interceptors {
    _interceptors = interceptors;
}
- (void)setAmount:(float)amount {
    _amount = amount;
}

- (float)interceptors {
    return _interceptors;
}
- (float)amount {
    return _interceptors;
}


- (float)calculateCost {
    return _interceptors * _amount;
}



@end
