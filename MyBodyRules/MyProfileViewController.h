//
//  FirstIpadViewViewController.h
//  MyBodyRules
//
//  Created by Divya Reddy on 8/08/13.
//  Copyright (c) 2013 Divya Reddy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyProfileViewController : UIViewController
{
    UIButton *bodyMeasurements;
     UIButton *myProfile;
     UIButton *summary;
  

}
@property (nonatomic,retain) IBOutlet UIButton *summary,*myProfile,*bodyMeasurements;
- (IBAction)whenbodyMeasurementsClicked;
- (IBAction)whenmyProfileClicked;
- (IBAction)whensummaryClicked;



@end
