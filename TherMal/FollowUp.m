//
//  FollowUp.m
//  TherMal
//
//  Created by Gabriel on 11/5/13.
//  Copyright (c) 2013 Gabriel. All rights reserved.
//

#import "FollowUp.h"

@implementation FollowUp

- (void)setAmount:(float)amount {
    _amount = amount;
}
- (void)setVisits:(float)visits {
    _visits = visits;
}

- (float)amount {
    return _amount;
}
- (float)visits {
    return _visits;
}

- (float)calculateCost {
    return _amount * _visits;
}



@end
