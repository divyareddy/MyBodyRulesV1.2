//
//  FirstIpadViewViewController.h
//  MyBodyRules
//
//  Created by Divya Reddy on 8/08/13.
//  Copyright (c) 2013 Divya Reddy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyProfileViewController : UIViewController <UIActionSheetDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate,UIPopoverControllerDelegate>
{
    UIButton *bodyMeasurements;
     UIButton *myProfile;
     UIButton *summary;
    UIImageView *photoImageView1,*photoImageView2;
  

}
@property (strong) UIPopoverController *popoverImageViewController;
@property (nonatomic, strong) UIImage *unrotatedImage;
@property (nonatomic,strong) IBOutlet UIButton *summary,*myProfile,*bodyMeasurements;
@property (nonatomic, strong) IBOutlet UIImageView *photoImageView1,*photoImageView2;
- (IBAction)whenbodyMeasurementsClicked:(UIButton *)sender;
- (IBAction)whenmyProfileClicked;
- (IBAction)whensummaryClicked;

-(IBAction)btnPhotoClick:(id)sender;



@end
