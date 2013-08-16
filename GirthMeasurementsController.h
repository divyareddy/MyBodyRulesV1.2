//
//  GirthMeasurementsController.h
//  MyBodyRules
//
//  Created by Divya Reddy on 16/08/13.
//  Copyright (c) 2013 Divya Reddy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GirthMeasurementsController : UIViewController
{
    UITextField *shoulderField,*hipsField, *chestField,*rThighField,*navalField,*lThighField,*rBicepField,*rCalfField,*lBicepField,*lCalfField;
    UILabel *totalLabel;
    UIButton *calculateButton,*resetButton;
}

@property(nonatomic,retain) IBOutlet UITextField *shoulderField,*hipsField, *chestField,*rThighField,*navalField,*lThighField,*rBicepField,*rCalfField,*lBicepField,*lCalfField;
@property(nonatomic,retain) IBOutlet UILabel *totalLabel;
@property (nonatomic,retain)IBOutlet UIButton *calculateButton,*resetButton;

-(IBAction)calculateButtonClicked:(id)sender;