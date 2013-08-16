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

@synthesize nameTextField,ageTextField,dateTextField,axilaField,bodyfatLabel,bodydensityLabel,tricepField,thighField,umbilicusField,subscapField,skinfoldLabel,siliacField,pecField,weightTextField,leanbodymassLabel,calculateButton,resetButton,genderField;

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
    
    int skintotal = [tricepField.text intValue]+[umbilicusField.text intValue]+[siliacField.text intValue]+[subscapField.text intValue]+[axilaField.text intValue]+[pecField.text intValue]+[thighField.text intValue];
    //  NSString*  str = tricepField.text;
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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
