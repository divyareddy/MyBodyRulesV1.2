//
//  FirstIpadViewViewController.h
//  MyBodyRules
//
//  Created by Divya Reddy on 8/08/13.
//  Copyright (c) 2013 Divya Reddy. All rights reserved.
//

#import <UIKit/UIKit.h>
#include <AssetsLibrary/AssetsLibrary.h> 

@interface MyProfileViewController : UIViewController <UIActionSheetDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate,UIPopoverControllerDelegate>
{
    UIButton *bodyMeasurements;
     UIButton *myProfile;
     UIButton *summary;
    UIImageView *beforeImageView,*afterImageView;
    
    ALAssetsLibrary *library;
    NSArray *imageArray;
    NSMutableArray *mutableArray;
    NSArray *loadedArray;
    NSInteger imageIndex;
  

}
-(void)allPhotosCollected:(NSArray*)imgArray;
- (IBAction)handleBeforeSwipe:(UIGestureRecognizer *)sender;
@property (strong) UIPopoverController *popoverImageViewController;
@property (nonatomic, strong) UIImage *unrotatedImage;
- (IBAction)handleAfterSwipe:(UIGestureRecognizer *)sender;
@property (nonatomic,strong) IBOutlet UIButton *summary,*myProfile,*bodyMeasurements;
@property (nonatomic, strong) IBOutlet UIImageView *beforeImageView,*afterImageView;
- (IBAction)whenbodyMeasurementsClicked:(UIButton *)sender;
- (IBAction)whenmyFitnessClicked:(UIButton *)sender;
- (IBAction)whensummaryClicked;

-(IBAction)btnPhotoClick:(id)sender;



@end
