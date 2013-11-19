//
//  Encasements.m
//  TherMal
//
//  Created by Gabriel on 11/5/13.
//  Copyright (c) 2013 Gabriel. All rights reserved.
//

#import "Encasements.h"

@implementation Encasements

- (void)setEncasements:(float)encasements {
    _encasements = encasements;
}
- (void)setAmount:(float)amount {
    _amount = amount;
}

- (float)encasements {
    return _encasements;
}
- (float)amount {
    return _encasements;
}

- (float)calculateCost {
    return _encasements * _amount;
}



@end
