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



@end

@implementation MyProfileViewController
@synthesize myProfile,summary,bodyMeasurements;



- (void)viewDidLoad
{
    [super viewDidLoad];
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

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    
    if ([alertView tag] == 301) {
        
        //Discard
        if (buttonIndex == 0) {
            
            BodyMeasurementsController *firstViewController=[[BodyMeasurementsController alloc] initWithNibName:@"BodyMeasurementsController" bundle:nil];
            //[self.navigationController pushViewController:secondViewController animated:YES];
           [self.view addSubview:firstViewController.view];
            
        }
        if (buttonIndex == 1) {
            GirthMeasurementsController *secondViewController = [[GirthMeasurementsController alloc] initWithNibName:@"GirthMeasurementsController" bundle:nil];
            //[self.navigationController pushViewController:secondViewController animated:YES];
            [self.view addSubview:secondViewController.view];
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
