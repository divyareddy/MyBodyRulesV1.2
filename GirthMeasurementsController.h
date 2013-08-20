//
//  GirthMeasurementsController.h
//  MyBodyRules
//
//  Created by Divya Reddy on 16/08/13.
//  Copyright (c) 2013 Divya Reddy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GirthMeasurementsController : UIViewController <UITextFieldDelegate>
{

    
}

@property(nonatomic,weak) IBOutlet UITextField *shoulderField,*hipsField, *chestField,*rThighField,*navalField,*lThighField,*rBicepField,*rCalfField,*lBicepField,*lCalfField;
@property(nonatomic,weak) IBOutlet UILabel *totalLabel;


-(IBAction)calculateButtonClicked;
-(IBAction)resetButtonClicked;