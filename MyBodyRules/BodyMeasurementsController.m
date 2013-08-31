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
    BOOL flag;
    int skinfoldtotal,skintotal ;
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
    
    if ([self.nameTextField.text isEqual: @" "]||[self.ageTextField.text isEqualToString:@""]||[self.weightTextField.text isEqualToString:@""]||[self.tricepField.text isEqualToString:@""]||[self.umbilicusField.text isEqualToString:@""]||[self.siliacField.text isEqualToString:@""]||[self.subscapField.text isEqualToString:@""]||[self.axilaField.text isEqualToString:@""]||[self.pecField.text isEqualToString:@""]||[self.thighField.text isEqualToString:@""]) {
        
        UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Please Fill  all the Details"
                                                          message:nil
                                                         delegate:self
                                                cancelButtonTitle:@"OK"
                                                otherButtonTitles:nil, nil];
        [message show];
    }
    else
    {
    
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    
    [formatter setNumberStyle:NSNumberFormatterDecimalStyle];
    
    [formatter setMaximumFractionDigits:2];
    
    [formatter setRoundingMode: NSNumberFormatterRoundUp];
    
    skintotal = [tricepField.text intValue]+[umbilicusField.text intValue]+[siliacField.text intValue]+[subscapField.text intValue]+[axilaField.text intValue]+[pecField.text intValue]+[thighField.text intValue];
    //skinfoldtotal= [skinfoldLabel.text intValue]
    skinfoldsqroot = skintotal * skintotal;

    if(flag==0)
    {
       db = 1.112-(0.00043499 *skintotal)+(0.00000055 * skinfoldsqroot)-(0.00028826*[ageTextField.text intValue]);
    }if(flag ==1 )
    {
        db= 1.097 - (0.00046971 * skintotal) +(0.00000056 * skinfoldsqroot)- (0.00012828 * [ageTextField.text intValue]);
    }
   
    
    skinfoldLabel.text =[NSString stringWithFormat: @"%d", skintotal];
    
    float dbvalue = db;
    
    NSString *numberdb = [formatter stringFromNumber:[NSNumber numberWithFloat:dbvalue]];

    
    bodydensityLabel.text = numberdb;
    
    
    float bodytotal = ((4.95/db)-4.5)*100 ;
    NSString *numberString = [formatter stringFromNumber:[NSNumber numberWithFloat:bodytotal]];

    float totalbodyfat = (bodytotal /100)* [weightTextField.text floatValue];

     bodyfatLabel.text = numberString;
    
    float leanbody = [weightTextField.text floatValue] - totalbodyfat;
    NSString *number = [formatter stringFromNumber:[NSNumber numberWithFloat:leanbody]];
    

    leanbodymassLabel.text = number;
    }
}
-(IBAction)changeSegment
{
     
    if(genderField.selectedSegmentIndex == 0)
    {
        flag =0;
    }
    if(genderField.selectedSegmentIndex == 1)
    {
        flag = 1;
    
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
    self.skinfoldLabel.text=@"";
    self.leanbodymassLabel.text=@"";
    self.bodydensityLabel.text=@"";
    self.bodyfatLabel.text=@"";
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
