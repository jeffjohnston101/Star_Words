//
//  Jedi1WrongController.m
//  StarWords1
//
//  Created by Jeffrey Johnston on 11/21/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "Jedi1WrongController.h"
#import "Jedi1Controller.h"
#import "MainMenuController.h"

@implementation Jedi1WrongController




@synthesize mainMenuController;
@synthesize jedi1Controller;
@synthesize skipButton;
@synthesize mainMenuButton;
@synthesize tryAgainButton;



-(IBAction) mainButtonPressed:(id)sender {
    mainMenuController = [[MainMenuController alloc] initWithNibName:@"MainMenuController" bundle:nil];
    [UIView setAnimationDuration: 2.0];
    self.mainMenuController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentModalViewController:self.mainMenuController animated:YES];
    
}

-(IBAction) tryAgainButtonPressed:(id)sender {
    jedi1Controller = [[Jedi1Controller alloc] initWithNibName:@"Jedi1Controller" bundle:nil];
    [UIView setAnimationDuration: 2.0];
    self.jedi1Controller.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentModalViewController:self.jedi1Controller animated:YES];
    
}

-(IBAction) skipButtonPressed:(id)sender {
    UIAlertView *alert = [[UIAlertView alloc]
                          initWithTitle:@"Coming Soon"
                          message:@"The ability to skip levels in each category is coming soon.  This will allow the user to Skip a level and eventually come back to it."
                          delegate:self
                          cancelButtonTitle:@"Cancel"
                          otherButtonTitles: nil];
    
    [alert show];
    
    
}




- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    CFURLRef url = CFBundleCopyResourceURL(CFBundleGetMainBundle(),(CFStringRef) @"bfat_han",CFSTR("wav"),NULL);
    AudioServicesCreateSystemSoundID(url, &badFeelingQuoteSound);	
    AudioServicesPlaySystemSound(badFeelingQuoteSound);
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return ((interfaceOrientation != UIInterfaceOrientationPortrait) && (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown));}


@end
