//
//  FirstIpadViewViewController.m
//  MyBodyRules
//
//  Created by Divya Reddy on 8/08/13.
//  Copyright (c) 2013 Divya Reddy. All rights reserved.
//

#import "MyProfileViewController.h"

#import "BodyMeasurementsController.h"
#import "GirthMeasurementsController.h"


@end
@interface MyProfileViewController ()

{
    BOOL isFirstImage;
    
}

@end

@implementation MyProfileViewController
@synthesize myProfile,summary,bodyMeasurements,photoImageView1,popoverImageViewController,photoImageView2;



- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
	// Do any additional setup after loading the view, typically from a nib.
}

- (NSUInteger)supportedInterfaceOrientations
{
    //return (UIInterfaceOrientationMaskAllButUpsideDown);
     return (UIInterfaceOrientationMaskAll);
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)whenbodyMeasurementsClicked
{

    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil
                                                    message:nil
                                                   delegate:self
                                          cancelButtonTitle:@"Body Composition"
                                          otherButtonTitles:@"Girth Measurements", nil];

    
    [alert setTag:301];
    
        [alert show];
    
}
-(IBAction)btnPhotoClick:(id)sender
{
    UIButton *mButton = (UIButton *)sender;
    
    if (mButton.tag == 101) {
        isFirstImage = YES;
    }else{
        isFirstImage = NO;
    
    }
        
               NSString *titleStr = @"Select Picture";
        
        if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
            
         
            UIActionSheet *action = [[UIActionSheet alloc] initWithTitle:titleStr delegate:self cancelButtonTitle:@"cancel" destructiveButtonTitle:nil otherButtonTitles:@"Take a Photo", @"Choose A Photo", nil, nil];
            
            [action setTag:100];
            [action showInView:self.view];
        
        }
        else {
            
            UIActionSheet *action = [[UIActionSheet alloc]initWithTitle:titleStr delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"Choose A Photo", nil, nil];
            
            [action setTag:101];
            [action showInView:self.view];
          
        }
    
}
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
	
	if (actionSheet.tag == 100) {
		
		if (buttonIndex == 0) {
			
			UIImagePickerController *imgPhoto = [[UIImagePickerController alloc] init];
			imgPhoto.sourceType = UIImagePickerControllerSourceTypeCamera;
			imgPhoto.delegate = self;
			imgPhoto.allowsEditing = YES;
            
            UIPopoverController *popOver = [[UIPopoverController alloc] initWithContentViewController:imgPhoto];
            popOver.delegate = self;
            self.popoverImageViewController = popOver;
            [self.popoverImageViewController presentPopoverFromRect:CGRectMake(0, 0, 160, 40) inView:self.view permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];

			
		}
		else if (buttonIndex == 1) {
			
			UIImagePickerController *imgPhoto = [[UIImagePickerController alloc] init];
			imgPhoto.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
			imgPhoto.delegate = self;
			imgPhoto.allowsEditing = YES;
            
            UIPopoverController *popOver = [[UIPopoverController alloc] initWithContentViewController:imgPhoto];
            popOver.delegate = self;
            self.popoverImageViewController = popOver;
            [self.popoverImageViewController presentPopoverFromRect:CGRectMake(0, 0, 160, 40) inView:self.view permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];

		}
	}
	else {
		
		if (buttonIndex == 0) {
			
			UIImagePickerController *imgPhoto = [[UIImagePickerController alloc] init];
			imgPhoto.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
			imgPhoto.delegate = self;
			imgPhoto.allowsEditing = YES;
            
            UIPopoverController *popOver = [[UIPopoverController alloc] initWithContentViewController:imgPhoto];
            popOver.delegate = self;
            self.popoverImageViewController = popOver;
            [self.popoverImageViewController presentPopoverFromRect:CGRectMake(0, 0, 160, 40) inView:self.view permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];

		}
	}
}
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
	

    
	if ([info objectForKey:UIImagePickerControllerEditedImage] != nil) {
        if (isFirstImage) {
            self.photoImageView1.image = [info objectForKey:UIImagePickerControllerEditedImage];
            // AND the original image works great
            self.photoImageView1.image = [info objectForKey:UIImagePickerControllerOriginalImage];
        }else{
            self.photoImageView2.image = [info objectForKey:UIImagePickerControllerEditedImage];
            // AND the original image works great
            self.photoImageView2.image = [info objectForKey:UIImagePickerControllerOriginalImage];

        }
        
        
                }

}
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    
    if ([alertView tag] == 301) {
        
        //Discard
        if (buttonIndex == 0) {
            
            UIStoryboard *mainStoryBoard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:[NSBundle mainBundle]];
            
            BodyMeasurementsController *firstViewController= [mainStoryBoard instantiateViewControllerWithIdentifier:@"body.measurements"];
            NSLog(@"%@", self.navigationController);
            //[firstViewController.view setFrame:self.view.bounds];
            [self.navigationController pushViewController:firstViewController animated:YES];
           //[self.view addSubview:firstViewController.view];
            
        }
        if (buttonIndex == 1) {
            UIStoryboard *mainStoryBoard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:[NSBundle mainBundle]];
            
            GirthMeasurementsController *secondViewController= [mainStoryBoard instantiateViewControllerWithIdentifier:@"body.girth"];
            NSLog(@"%@", self.navigationController);
            //[firstViewController.view setFrame:self.view.bounds];
            [self.navigationController pushViewController:secondViewController animated:YES];
            
         
                   }
        
          }
    else
    {
        NSLog(@"user pressed Button Indexed 1");
        // Any action can be performed here
    }
}
- (IBAction)whenmyProfileClicked
{
    
}

- (IBAction)whensummaryClicked
{
    
}

@end
