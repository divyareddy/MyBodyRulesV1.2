//
//  BodyMeasurementsController.m
//  MyBodyRules
//
//  Created by Divya Reddy on 16/08/13.
//  Copyright (c) 2013 Divya Reddy. All rights reserved.
//

#import "BodyMeasurementsController.h"

@interface BodyMeasurementsController ()

@end

@implementation BodyMeasurementsController

@synthesize nameTextField,ageTextField,dateTextField,axilaField,bodyfatLabel,bodydensityLabel,tricepField,thighField,umbilicusField,subscapField,skinfoldLabel,siliacField,pecField,weightTextField,leanbodymassLabel,calculateButton,resetButton,genderField,toolbar;

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

    UIBarButtonItem *imagesButton = [[UIBarButtonItem alloc]initWithTitle:@"Cancel" style:UIBarButtonItemStyleDone target:self action:@selector(dismiss:)];
    UIBarButtonItem *fixed = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
	fixed.width = 40.0f;
	UIBarButtonItem *flex = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
	
	[self.toolbar setItems:[NSArray arrayWithObjects:flex, imagesButton, fixed, nil]];
    
[self.view addSubview:toolbar];
   
    // Do any additional setup after loading the view from its nib.
}
-(IBAction)calculateButtonClicked:(id)sender{
    
    int skintotal = [tricepField.text intValue]+[umbilicusField.text intValue]+[siliacField.text intValue]+[subscapField.text intValue]+[axilaField.text intValue]+[pecField.text intValue]+[thighField.text intValue];
    
    skinfoldLabel.text =[NSString stringWithFormat: @"%d", skintotal];

    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    if (textField == nameTextField)
    {
        [nameTextField resignFirstResponder];
    }
    if(textField == ageTextField){
        [ageTextField resignFirstResponder];}
    if(textField == dateTextField){
        [dateTextField resignFirstResponder];}
    if(textField == weightTextField){
        [weightTextField resignFirstResponder];}
    if(textField == tricepField){
        [tricepField resignFirstResponder];}
    if(textField == umbilicusField){
        [umbilicusField resignFirstResponder];}
    if(textField == siliacField){
        [siliacField resignFirstResponder];}
    if (textField == subscapField) {
        [subscapField resignFirstResponder];
    }if(textField == axilaField){
        [axilaField resignFirstResponder];}
    if(textField == pecField){
        [pecField resignFirstResponder];}
    if(textField == thighField){
        [thighField resignFirstResponder];}
    
    return YES;
    
}
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if (textField == self.tricepField || textField == self.umbilicusField ||textField == self.siliacField ||textField == self.subscapField ||textField == self.axilaField ||textField == self.pecField ||textField == self.thighField  )
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

-(void) dismiss
{
    
}
@end
