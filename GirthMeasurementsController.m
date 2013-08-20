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
@synthesize  shoulderField,hipsField, chestField,rThighField,navalField,lThighField,rBicepField,rCalfField,lBicepField,lCalfField;


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
    [self.navigationController setNavigationBarHidden:NO animated:YES];

    // Do any additional setup after loading the view from its nib.
}

-(IBAction)calculateButtonClicked{
    
   // NSLog(@"HI");
    int girthTotal = [shoulderField.text intValue]+[hipsField.text intValue]+[chestField.text intValue]+
    [rThighField.text intValue]+[navalField.text intValue]+[lThighField.text intValue]+[rBicepField.text intValue]+[rCalfField.text intValue]+[lBicepField.text intValue]+[lCalfField.text intValue];

    self.totalLabel.text =[NSString stringWithFormat: @"%d", girthTotal];

    
    
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if (textField == self.shoulderField || textField == self.hipsField ||textField == self.chestField ||textField == self.rThighField ||textField == self.navalField ||textField == self.lThighField ||textField == self.rBicepField ||textField == self.rCalfField||textField == self.lBicepField||textField == self.lCalfField )
    {
        NSString *newString = [textField.text stringByReplacingCharactersInRange:range withString:string];
        
        NSString *expression = @"^([0-9]+)?(\\.([0-9]{1,2})?)?$";
        
        NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:expression
                                                                               options:NSRegularExpressionCaseInsensitive
                                                                                 error:nil];
        NSUInteger numberOfMatches = [regex numberOfMatchesInString:newString
                                                            options:0
                                                              range:NSMakeRange(0, [newString length])];
        if (numberOfMatches == 0)
            return NO;
    }
    
    return YES;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end


