//
//  ViewController.m
//  TherMal
//
//  Created by Gabriel on 11/5/13.
//  Copyright (c) 2013 Gabriel. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self clearAllAction];
    
    // Initialize objects
    self.ther = [[Thermal alloc] init];
    self.foll = [[FollowUp alloc] init];
    self.enca = [[Encasements alloc] init];
    self.inte = [[Interceptors alloc] init];
    self.unit = [[Units alloc] init];
    self.parkingSwitchStatus = @"ON";
    self.multiSwitchStatus = @"ON";
    self.parkingType = @"Street parking costs $300.00";

    
    self.parkingCost = 0;
    [self.streetButton setTitleEdgeInsets:UIEdgeInsetsMake(0.0, 2.0, 0.0, 2.0)];
    self.streetButton.layer.borderColor = [UIColor blueColor].CGColor;
    self.streetButton.layer.borderWidth = 0.6f;
    self.streetButton.layer.cornerRadius = 10.0f;
    self.streetButton.layer.backgroundColor = [UIColor whiteColor].CGColor;
    
    [self.meterButton setTitleEdgeInsets:UIEdgeInsetsMake(0.0, 2.0, 0.0, 2.0)];
    self.meterButton.layer.borderColor = [UIColor blueColor].CGColor;
    self.meterButton.layer.borderWidth = 0.6f;
    self.meterButton.layer.cornerRadius = 10.0f;
    self.meterButton.layer.backgroundColor = [UIColor whiteColor].CGColor;
    


    
    self.totalButton.layer.borderColor = [UIColor blueColor].CGColor;
    self.totalButton.layer.borderWidth = 0.6f;
    self.totalButton.layer.cornerRadius = 10.0f;
    self.totalButton.layer.backgroundColor = [UIColor orangeColor].CGColor;
    
    self.mtotalButton.layer.borderColor = [UIColor blueColor].CGColor;
    self.mtotalButton.layer.borderWidth = 0.6f;
    self.mtotalButton.layer.cornerRadius = 10.0f;
    self.mtotalButton.layer.backgroundColor = [UIColor orangeColor].CGColor;
  
    //Permit
    [self.permitSwitch addTarget:self action:@selector(changeSwitch:) forControlEvents:UIControlEventValueChanged];
 
    //MultiSwitch
    [self.multiSwitch addTarget:self action:@selector(multiSwitched:) forControlEvents:UIControlEventValueChanged];
    
    //    self.ther.length = 20;
    //    self.ther.width = 50;
    
        self.foll.amount = 300;
    //    self.foll.visits = 2;
    
    //    self.enca.encasements = 1;
        self.enca.amount = 50;
    
    //    self.inte.interceptors = 1;
    
    self.inte.amount = 5;

    //    NSLog(@"%.0fx%.0f", self.ther.length, self.ther.width);
//    NSLog(@"Area: %.0f", [self.ther calculateArea]);
//    
//    NSLog(@"Cost: %.2f", [self.ther calculateCost]);
//    float followUpTotal = [self.foll calculateCost];
//    float totalCost = [self.ther calculateCost] + [self.foll calculateCost];
//    NSLog(@"Total Cost: %.2f+%.2f = %.2f", [self.ther calculateCost], followUpTotal, totalCost);

    // self.totalLabel.text = [NSString stringWithFormat:@"%.2f", totalCost];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [[self view] endEditing:YES];
}




- (IBAction)calculateTotal:(id)sender {
    
    // Get values out of input fields
    self.ther.length = [self.lengthTextField.text floatValue];
    self.ther.width = [self.widthTextField.text floatValue];
    self.foll.visits = [self.followupsTextField.text floatValue];
    self.enca.encasements = [self.encasementsTextField. text floatValue];
    self.inte.interceptors = [self.interceptorsTextField. text floatValue];
    self.unit.units = [self.unitsTextField. text floatValue];
    
    // Process calculations and save to temporary variables
    float thermalCost = [self.ther calculateCost];
    float followupCost = [self.foll calculateCost];
    float encasementsCost = [self.enca calculateCost];
    float interceptorsCost = [self.inte calculateCost];
    float extraCosts = encasementsCost + interceptorsCost + self.parkingCost;
    float totalCosts = thermalCost + followupCost + extraCosts;
    

    
    // Output results to labels
    self.thermalcostLabel.text = [NSString stringWithFormat:@"%.2f",thermalCost];
    self.followupcostLabel.text = [NSString stringWithFormat:@"%.2f",followupCost];
    self.extracostsLabel.text = [NSString stringWithFormat:@"%.2f",extraCosts];
    self.totalLabel.text = [NSString stringWithFormat:@"%.2f",totalCosts];
    
}

- (IBAction)clearAll:(id)sender {
    
    [self clearAllAction];
    
}

- (void)clearAllAction {
    
    // Reset input fields to nada
    self.lengthTextField.text = @"";
    self.widthTextField.text = @"";
    self.followupsTextField.text = @"";
    self.encasementsTextField.text = @"";
    self.interceptorsTextField.text = @"";
    self.parkingCost = 0;
    self.unitsTextField.text = @"";

    
    // Reset totals to nada
    self.thermalcostLabel.text = @"0.00";
    self.followupcostLabel.text = @"0.00";
    self.extracostsLabel.text = @"0.00";
    self.totalLabel.text = @"0.00";
    self.mtotalLabel.text = @"0.00";
    
    // Unselect the buttons
    self.meterButton.layer.borderWidth = 0;
    self.streetButton.layer.borderWidth = 0;

}

- (void)changeSwitch:(id)sender{
    if([sender isOn]){
        // Execute any code when the switch is ON
        NSLog(@"Switch is ON");
        [self.streetButton setEnabled:YES];
        [self.meterButton setEnabled:YES];
    } else{
        // Execute any code when the switch is OFF
        NSLog(@"Switch is OFF");
        [self.streetButton setEnabled:NO];
        [self.meterButton setEnabled:NO];
        self.meterButton.layer.borderColor = [UIColor whiteColor].CGColor;
        self.streetButton.layer.borderColor = [UIColor whiteColor].CGColor;
        
        self.parkingCost = 0;
        
    }
}

- (IBAction)permitSwitched:(id)sender {
}

- (IBAction)pickedStreet:(id)sender {
    int streetCost = 300;
    self.parkingCost = [[NSNumber numberWithInt:streetCost] floatValue];
    self.parkingType = @"Street parking costs $300.00";
    
    // Mark button as selected
    self.streetButton.layer.borderColor = [UIColor blueColor].CGColor;
    self.streetButton.layer.borderWidth = 0.5f;
    self.streetButton.layer.cornerRadius = 10.0f;
    
    // Mark the meter btn unselected
    self.meterButton.layer.borderWidth = 0;
    
}

- (IBAction)pickedMeter:(id)sender {
    int meterCost = 500;
    self.parkingCost = [[NSNumber numberWithInt:meterCost] floatValue];
    self.parkingType = @"Meter parking costs $500.00";
    
    // Mark meter as selected
    self.meterButton.layer.borderColor = [UIColor blueColor].CGColor;
    self.meterButton.layer.borderWidth = 0.5f;
    self.meterButton.layer.cornerRadius = 10.0f;
    
    // Mark street unselected
    self.streetButton.layer.borderWidth = 0;


}

- (IBAction)multiSwitched:(id)sender {
    if([sender isOn]){
        // Execute any code when the switch is ON
        NSLog(@"Switch is ON");
        [self.mtotalLabel setEnabled:YES];
        [self.unitsTextField setEnabled:YES];
        [self.mtotalButton setEnabled: YES];
        [self.totalButton setEnabled:YES];
        [self.totalLabel setEnabled:YES];
        self.unitsTextField.textColor = [UIColor blackColor];
        self.unitsTextLabel.textColor = [UIColor blackColor];
        self.mtotalButton.titleLabel. textColor = [UIColor blackColor];
        self.mtotalLabel.textColor = [UIColor blackColor];
        self.totalButton.titleLabel. textColor = [UIColor orangeColor];
        self.totalLabel.textColor = [UIColor grayColor];
        self.parkingSwitchStatus = @"ON";
        self.multiSwitchStatus = @"ON";
        
    } else{
        // Execute any code when the switch is OFF
        NSLog(@"Switch is OFF");
        [self.totalButton setEnabled:YES];
        [self.mtotalLabel setEnabled: YES];
        [self.unitsTextField setEnabled: NO];
        [self.mtotalButton setEnabled: NO];
        
        self.unitsTextField.textColor = [UIColor grayColor];
        self.unitsTextLabel.textColor = [UIColor grayColor];
        self.mtotalButton.titleLabel. textColor = [UIColor orangeColor];
        self.mtotalLabel.textColor = [UIColor whiteColor];
        self.totalButton.titleLabel. textColor = [UIColor blackColor];
        self.totalLabel.textColor = [UIColor blackColor];
        self.parkingSwitchStatus = @"OFF";
        self.multiSwitchStatus = @"OFF";
        
    }

    
    
}

- (IBAction)calculatemTotal:(id)sender {
    
    // Get values out of input fields
    self.ther.length = [self.lengthTextField.text floatValue];
    self.ther.width = [self.widthTextField.text floatValue];
    self.foll.visits = [self.followupsTextField.text floatValue];
    self.enca.encasements = [self.encasementsTextField. text floatValue];
    self.inte.interceptors = [self.interceptorsTextField. text floatValue];
    self.unit.units = [self.unitsTextField. text floatValue];
    
    // Process calculations and save to temporary variables
    float thermalCost = [self.ther calculateCost];
    float followupCost = [self.foll calculateCost];
    float encasementsCost = [self.enca calculateCost];
    float interceptorsCost = [self.inte calculateCost];
    float extraCosts = encasementsCost + interceptorsCost + self.parkingCost;
    //float totalCosts = thermalCost + followupCost + extraCosts;
    float subtotalCost = thermalCost + followupCost;
    float mtotalCosts = self.unit.units * subtotalCost + extraCosts;
    
    
    // Output results to labels
    self.thermalcostLabel.text = [NSString stringWithFormat:@"%.2f",thermalCost];
    self.followupcostLabel.text = [NSString stringWithFormat:@"%.2f",followupCost];
    self.extracostsLabel.text = [NSString stringWithFormat:@"%.2f",extraCosts];
    //self.totalLabel.text = [NSString stringWithFormat:@"%.2f",totalCosts];
    self.mtotalLabel.text = [NSString stringWithFormat:@"%.2f", mtotalCosts];

    
}


- (IBAction)multiSwitch:(UISwitch *)sender {
}
- (IBAction)thermalEmailButton:(id)sender {
 //put variables
    NSString *length = self.lengthTextField.text;
    NSString *width = self.widthTextField.text;
    NSString *follow = self.followupsTextField.text;
    NSString *encasement = self.encasementsTextField.text;
    NSString *interceptors = self.interceptorsTextField.text;
    NSString *parkingSwitchStatus = self.parkingSwitchStatus;
    NSString *parkingType = self.parkingType;
    NSString *thermalcost = self.thermalcostLabel.text;
    NSString *followupcost = self.followupcostLabel.text;
    NSString *extracost = self.extracostsLabel.text;
    NSString *total = self.totalLabel.text;
    NSString *multiSwitchStatus = self.multiSwitchStatus;
    NSString *mtotal = self.mtotalLabel.text;
    
    
    
    // Email Subject
    NSString *emailTitle = @"Estimate";
    // Email Content
    NSString *messageBody = @"<h1>Thermal Estimate</h1><h3>Please add estimate to PestPac!</h3>";
    
    messageBody =
        [[[[[[[[[[@"<h1>Thermal Estimate</h1><h3>Please add estimate to PestPac!</h3><p>Length: "
           stringByAppendingString: length]
           stringByAppendingString:@"<br />Width: "]
           stringByAppendingString: width]
           stringByAppendingString:@"<br /><br />Number of follow-ups: "]
           stringByAppendingString: follow]
           stringByAppendingString:@"<br />Number of encasements: "]
           stringByAppendingString: encasement]
           stringByAppendingString:@"<br />Number of interceptors: "]
           stringByAppendingString: interceptors]
           stringByAppendingString:@"<br /><br />"];
    
    if ([parkingSwitchStatus isEqual: @"ON"]) {
        messageBody = [[[messageBody stringByAppendingString:@"Parking type: "] stringByAppendingString: parkingType] stringByAppendingString:@"<br /><br />"];
    }
    
    messageBody = [[[[[[[[[messageBody stringByAppendingString:@"<strong>Thermal cost:</strong> "]
                   stringByAppendingString: thermalcost]
                   stringByAppendingString:@"<br /><strong>Follow-up cost:</strong> "]
                   stringByAppendingString: followupcost]
                   stringByAppendingString:@"<br /><strong>Extra cost:</strong> "]
                   stringByAppendingString: extracost]
                   stringByAppendingString:@"</p><h4>Total: "]
                   stringByAppendingString: total]
                   stringByAppendingString:@"</h4>"];
    
    if ([multiSwitchStatus isEqual: @"ON"]) {
        messageBody = [[[messageBody stringByAppendingString:@"<h4>Multi-total: "] stringByAppendingString: mtotal] stringByAppendingString:@"</h4>"];
    }
    
    
    // To address
    NSArray *toRecipents = [NSArray arrayWithObjects:@"gabriel@pestecipm.com", nil];
    MFMailComposeViewController *mc = [[MFMailComposeViewController alloc] init];
    mc.mailComposeDelegate = self;
    [mc setSubject:emailTitle];
    [mc setMessageBody:messageBody isHTML:YES];
    [mc setToRecipients:toRecipents];
    
    //Present mail view controller on screen
    [self presentViewController:mc animated:YES completion: NULL];
    
}
- (void) mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error;
{
    switch (result)
    {
        case MFMailComposeResultCancelled:
            NSLog(@"Mail cancelled");
            break;
        case MFMailComposeResultSaved:
            NSLog(@"Mail saved");
            break;
        case MFMailComposeResultSent:
            NSLog(@"Mail sent");
            break;
        case MFMailComposeResultFailed:
            NSLog(@"Mail sent failure: %@", [error localizedDescription]);
            break;
        default:
            break;
    }
    
    // Close the Mail Interface
    [self dismissViewControllerAnimated:YES completion:NULL];
}

@end
