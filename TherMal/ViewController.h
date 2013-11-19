//
//  ViewController.h
//  TherMal
//
//  Created by Gabriel on 11/5/13.
//  Copyright (c) 2013 Gabriel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Thermal.h"
#import "FollowUp.h"
#import "Encasements.h"
#import "Interceptors.h"
#import "Units.h"
#import <MessageUI/MessageUI.h>



@interface ViewController : UIViewController <UITextFieldDelegate> {
    BOOL _keyboardIsShown;
}

// UI Elements
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) IBOutlet UIView *mainView;

@property (strong, nonatomic) IBOutlet UIButton *clear;
@property (strong, nonatomic) IBOutlet UITextField *lengthTextField;
@property (strong, nonatomic) IBOutlet UITextField *widthTextField;
@property (strong, nonatomic) IBOutlet UITextField *followupsTextField;
@property (strong, nonatomic) IBOutlet UITextField *encasementsTextField;
@property (strong, nonatomic) IBOutlet UITextField *interceptorsTextField;
@property (strong, nonatomic) IBOutlet UISwitch *permitSwitch;
@property (strong, nonatomic) IBOutlet UIButton *streetButton;
@property (strong, nonatomic) IBOutlet UIButton *meterButton;
@property (strong, nonatomic) IBOutlet UILabel *thermalcostLabel;
@property (strong, nonatomic) IBOutlet UILabel *followupcostLabel;
@property (strong, nonatomic) IBOutlet UILabel *extracostsLabel;
@property (strong, nonatomic) IBOutlet UIButton *totalButton;
@property (strong, nonatomic) IBOutlet UILabel *totalLabel;

@property (strong, nonatomic) IBOutlet UISwitch *multiSwitch;

@property (strong, nonatomic) IBOutlet UILabel *multiTextLabel;


@property (strong, nonatomic) IBOutlet UILabel *unitsTextLabel;

@property (strong, nonatomic) IBOutlet UITextField *unitsTextField;

@property (strong, nonatomic) IBOutlet UIButton *mtotalButton;

@property (strong, nonatomic) IBOutlet UILabel *mtotalLabel;


// Objects (which are calculations)
@property (strong, nonatomic) Thermal *ther;
@property (strong, nonatomic) FollowUp *foll;
@property (strong, nonatomic) Encasements *enca;
@property (strong, nonatomic) Interceptors *inte;
@property (strong, nonatomic) Units *unit;

@property float parkingCost;
@property (strong, nonatomic) NSString *parkingSwitchStatus;
@property (strong, nonatomic) NSString *multiSwitchStatus;
@property (strong, nonatomic) NSString *parkingType;


// Action
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event;



- (IBAction)calculateTotal:(id)sender;
- (IBAction)clearAll:(id)sender;
- (void)clearAllAction;
- (void)changeSwitch:(id)sender;
- (IBAction)permitSwitched:(id)sender;

- (IBAction)pickedStreet:(id)sender;
- (IBAction)pickedMeter:(id)sender;
- (IBAction)multiSwitched:(id)sender;
- (IBAction)calculatemTotal:(id)sender;
- (IBAction)thermalEmailButton:(id)sender;



@end
