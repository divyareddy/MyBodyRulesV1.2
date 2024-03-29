//
//  BodyMeasurementsController.h
//  MyBodyRules
//
//  Created by Divya Reddy on 16/08/13.
//  Copyright (c) 2013 Divya Reddy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BodyMeasurementsController : UIViewController <UITextFieldDelegate, UIPopoverControllerDelegate>
{
    UIDatePicker *datepicker;
    UIPopoverController *popOverForDatePicker;

}
@property (weak, nonatomic) IBOutlet UIButton *datePickerButton;

@property (nonatomic, strong) IBOutlet UIToolbar *toolbar;
@property(nonatomic, weak) IBOutlet UITextField *tricepField,*umbilicusField,*siliacField,*subscapField,*axilaField,*pecField,*thighField,*nameTextField, *ageTextField,*dateTextField,*weightTextField;
@property(nonatomic,retain) IBOutlet UIButton *calculateButton,*resetButton;
@property (nonatomic,retain) IBOutlet UILabel *skinfoldLabel,*bodydensityLabel,*bodyfatLabel,*leanbodymassLabel;
- (IBAction)backGroundClick:(id)sender;
@property(nonatomic,retain) IBOutlet UISegmentedControl *genderField;

-(IBAction)calculateButtonClicked:(id)sender;
-(IBAction)resetButtonClicked;
-(IBAction)changeSegment;


@end
