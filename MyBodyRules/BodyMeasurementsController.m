//
//  BodyMeasurementsController.m
//  MyBodyRules
//
//  Created by Divya Reddy on 16/08/13.
//  Copyright (c) 2013 Divya Reddy. All rights reserved.
//

#import "BodyMeasurementsController.h"

@interface BodyMeasurementsController ()
{
    float db;
    int skinfoldtotal ;
    float skinfoldsqroot;
    
}
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
    
   UIButton *button=[UIButton buttonWithType:UIButtonTypeCustom];
    button.frame= CGRectMake(220, 127, 159, 50);

    [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
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
    
    bodydensityLabel.text = [NSString stringWithFormat: @"%f" ,roundf(db)];
    
    bodyfatLabel.text = [NSString stringWithFormat:@"%f",(4.95/db)*100 ];
    
    float totalbodyfat = ([bodyfatLabel.text intValue]/100)* [weightTextField.text floatValue];

    leanbodymassLabel.text = [NSString stringWithFormat:@"%f",[weightTextField.text floatValue]- totalbodyfat];
}

-(IBAction)changeSegment
{
    
    skinfoldtotal= [skinfoldLabel.text intValue];
    skinfoldsqroot = skinfoldtotal * skinfoldtotal;

    if(genderField.selectedSegmentIndex == 0)
    {
        
       db = 1.112-(0.00043499 *skinfoldtotal)+(0.00000055 * skinfoldsqroot)-(0.000288826*[ageTextField.text intValue]);
        
        
    }
    if(genderField.selectedSegmentIndex == 1)
    {
        db= 1.097 - (0.00046971 * skinfoldtotal) +(0.00000056 * skinfoldsqroot)- (0.00012828 * [ageTextField.text intValue]);
        
    }
    
}


-(IBAction)resetButtonClicked
{
    self.nameTextField.text = @"";
    self.weightTextField.text=@"";
    self.ageTextField.text=@"";
    self.dateTextField.text=@"";
    self.tricepField.text=@"";
    self.umbilicusField.text=@"";
    self.siliacField.text=@"";
    self.subscapField.text=@"";
    self.axilaField.text=@"";
    self.pecField.text=@"";
    self.thighField.text=@"";
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


-(void)buttonAction:(UIButton *)sender
{
    UIViewController *viewController = [[UIViewController alloc]init];
    UIView *viewForDatePicker = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 300, 200)];
    
    datepicker = [[UIDatePicker alloc]initWithFrame:CGRectMake(0, 0, 300, 200)];
    datepicker.datePickerMode = UIDatePickerModeDate;
    datepicker.autoresizingMask = UIViewAutoresizingFlexibleWidth;
   
    
    [datepicker addTarget:self action:@selector(dueDateChanged:) forControlEvents:UIControlEventValueChanged];
    
    datepicker.backgroundColor = [UIColor blackColor];
    
    [viewForDatePicker addSubview:datepicker];
    [viewController.view addSubview:viewForDatePicker];

    //[self.view addSubview:datepicker];
    popOverForDatePicker = [[UIPopoverController alloc]initWithContentViewController:viewController];
    popOverForDatePicker.delegate = self;
    [popOverForDatePicker setPopoverContentSize:CGSizeMake(300, 200) animated:NO];
    [popOverForDatePicker presentPopoverFromRect:sender.frame inView:self.view  permittedArrowDirections:(UIPopoverArrowDirectionUp|UIPopoverArrowDirectionDown| UIPopoverArrowDirectionLeft|UIPopoverArrowDirectionRight) animated:YES];
    
}
-(void) dueDateChanged:(UIDatePicker *)sender {
    NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateStyle:NSDateFormatterLongStyle];
    [dateFormatter setTimeStyle:NSDateFormatterNoStyle];
    
    self.dateTextField.text = [dateFormatter stringFromDate:[sender date]];
       
    NSLog(@"Picked the date %@", [dateFormatter stringFromDate:[sender date]]);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) dismiss
{
    
}
- (IBAction)backGroundClick:(id)sender {
    
    [datepicker removeFromSuperview];
    
}
@end
