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
@synthesize myProfile,summary,bodyMeasurements,beforeImageView,popoverImageViewController,afterImageView;

     static int count =0;

-(void)getAllPictures
{
    imageArray=[[NSArray alloc] init];
    mutableArray =[[NSMutableArray alloc]init];
    NSMutableArray* assetURLDictionaries = [[NSMutableArray alloc] init];
    
    library = [[ALAssetsLibrary alloc] init];
    
    void (^assetEnumerator)( ALAsset *, NSUInteger, BOOL *) = ^(ALAsset *result, NSUInteger index, BOOL *stop) {
        if(result != nil) {
            if([[result valueForProperty:ALAssetPropertyType] isEqualToString:ALAssetTypePhoto]) {
                [assetURLDictionaries addObject:[result valueForProperty:ALAssetPropertyURLs]];
                
                NSURL *url= (NSURL*) [[result defaultRepresentation]url];
                
                [library assetForURL:url
                         resultBlock:^(ALAsset *asset) {
                             [mutableArray addObject:[UIImage imageWithCGImage:[[asset defaultRepresentation] fullScreenImage]]];
                             
                             if ([mutableArray count]==count)
                             {
                                 imageArray=[[NSArray alloc] initWithArray:mutableArray];
                                 [self allPhotosCollected:imageArray];
                             }
                         }
                        failureBlock:^(NSError *error){ NSLog(@"operation was not successfull!"); } ];
                
            }
        }
    };
    
    NSMutableArray *assetGroups = [[NSMutableArray alloc] init];
    
    void (^ assetGroupEnumerator) ( ALAssetsGroup *, BOOL *)= ^(ALAssetsGroup *group, BOOL *stop) {
        if(group != nil) {
            [group enumerateAssetsUsingBlock:assetEnumerator];
            [assetGroups addObject:group];
            count=[group numberOfAssets];
        }
    };
    
    assetGroups = [[NSMutableArray alloc] init];
    
    [library enumerateGroupsWithTypes:ALAssetsGroupAll
                           usingBlock:assetGroupEnumerator
                         failureBlock:^(NSError *error) {NSLog(@"There is an error");}];
}

-(void)allPhotosCollected:(NSArray*)imgArray
{
    //write your code here after getting all the photos from library...
    NSLog(@"all pictures are %@",imgArray);
    loadedArray = imgArray;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
        imageIndex = [loadedArray count];
    [self getAllPictures];
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

- (IBAction)whenbodyMeasurementsClicked:(UIButton *)sender
{
    UIActionSheet * actionSheet = [[UIActionSheet alloc] initWithTitle: nil
                                                              delegate: self
                                                     cancelButtonTitle: nil
                                                destructiveButtonTitle: nil
                                                     otherButtonTitles: @"BodyComposition",
                                   @"GirthMeasurements", nil];
    [actionSheet setTag:200];
    
    [actionSheet showFromRect: sender.frame inView: sender.superview animated: YES];

//    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil
//                                                    message:nil
//                                                   delegate:self
//                                          cancelButtonTitle:@"Body Composition"
//                                          otherButtonTitles:@"Girth Measurements", nil];
//
//    
//    [alert setTag:301];
//    
//        [alert show];
    
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
	
    if(actionSheet.tag == 200)
    {
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

	if (actionSheet.tag == 100) {
		
		if (buttonIndex == 0) {
			
			UIImagePickerController *imgPhoto = [[UIImagePickerController alloc] init];
			imgPhoto.sourceType = UIImagePickerControllerSourceTypeCamera;
			imgPhoto.delegate = self;
			imgPhoto.allowsEditing = YES;
            
            UIPopoverController *popOver = [[UIPopoverController alloc] initWithContentViewController:imgPhoto];
            popOver.delegate = self;
            self.popoverImageViewController = popOver;
            [self.popoverImageViewController presentPopoverFromRect:CGRectMake(10, 678, 160, 40) inView:self.view permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];

			
		}
		else if (buttonIndex == 1) {
			
			UIImagePickerController *imgPhoto = [[UIImagePickerController alloc] init];
			imgPhoto.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
			imgPhoto.delegate = self;
			imgPhoto.allowsEditing = YES;
            
            UIPopoverController *popOver = [[UIPopoverController alloc] initWithContentViewController:imgPhoto];
            popOver.delegate = self;
            self.popoverImageViewController = popOver;
            [self.popoverImageViewController presentPopoverFromRect:CGRectMake(10,678 , 160, 40) inView:self.view permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];

		}
	}
	else if(actionSheet.tag == 101){
		
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
    
    else
    {
        NSLog(@"user pressed Button Indexed 1");
        // Any action can be performed here
    }


}
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
	

    
	if ([info objectForKey:UIImagePickerControllerEditedImage] != nil) {
        if (isFirstImage) {
            self.beforeImageView.image = [info objectForKey:UIImagePickerControllerEditedImage];
           
            self.beforeImageView.image = [info objectForKey:UIImagePickerControllerOriginalImage];
        }else{
            self.afterImageView.image = [info objectForKey:UIImagePickerControllerEditedImage];
           
            self.afterImageView.image = [info objectForKey:UIImagePickerControllerOriginalImage];

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


- (IBAction)handleBeforeSwipe:(UIGestureRecognizer *)sender {
    
    NSLog(@"swiped");
 
    
        UISwipeGestureRecognizerDirection direction= [(UISwipeGestureRecognizer * )sender direction];
    
    switch (direction) {
        case UISwipeGestureRecognizerDirectionLeft:
            imageIndex++;
        
            break;
        case UISwipeGestureRecognizerDirectionRight:
            imageIndex--;
            
            break;
        default:
            break;
    }
    
    imageIndex = (imageIndex < 0) ? ([loadedArray count] -1): 
    imageIndex % [loadedArray count];
    beforeImageView.image = (UIImage*)[loadedArray objectAtIndex:imageIndex];
    
}
- (IBAction)handleAfterSwipe:(UIGestureRecognizer *)sender {
    
    UISwipeGestureRecognizerDirection direction= [(UISwipeGestureRecognizer * )sender direction];
    
    switch (direction) {
        case UISwipeGestureRecognizerDirectionLeft:
            imageIndex++;
            
            break;
        case UISwipeGestureRecognizerDirectionRight:
            imageIndex--;
            
            break;
        default:
            break;
    }
    
    imageIndex = (imageIndex < 0) ? ([loadedArray count] -1):
    imageIndex % [loadedArray count];
    afterImageView.image = (UIImage*)[loadedArray objectAtIndex:imageIndex];
}
@end
