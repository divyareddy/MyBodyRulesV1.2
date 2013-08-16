//
//  GirthMeasurementsController.m
//  MyBodyRules
//
//  Created by Divya Reddy on 16/08/13.
//  Copyright (c) 2013 Divya Reddy. All rights reserved.
//

#import "GirthMeasurementsController.h"

@end
@interface GirthMeasurementsController ()

@end

@implementation GirthMeasurementsController

@synthesize shoulderField,rBicepField,lBicepField,rCalfField,rThighField,resetButton,lCalfField,lThighField,navalField,calculateButton,totalLabel,chestField,hipsField;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

-(IBAction)calculateButtonClicked:(id)sender{
    
    NSLog(@"HI");
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end


