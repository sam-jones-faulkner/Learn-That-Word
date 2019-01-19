/*****************************************************************************
 *	Name:   		Sam Faulkner and Arsheya Jain                            *
 *  Project Title:  Summative Assignment - Learn Dat Word                    *
 *	Course:         ICS4U                                                    *
 *	Date:           January 12, 2017                                         *
 *	Description:    This project is an iOS application that uses Objective C *
 in Xcode 8. It is a vocabulary builder application.                         *
 *****************************************************************************/

//  SecondViewController.m

#import "SecondViewController.h"

@interface SecondViewController ()

//Variable Declaration
@property (weak, nonatomic) IBOutlet UIImageView *artImage;    //Images
@property (weak, nonatomic) IBOutlet UIImageView *happinessImage;
@property (weak, nonatomic) IBOutlet UIImageView *PQImage;
@property (weak, nonatomic) IBOutlet UIImageView *NegativeImage;
@property (weak, nonatomic) IBOutlet UIImageView *SATImage;
@property (weak, nonatomic) IBOutlet UIImageView *allWordsImage;
@property (weak, nonatomic) IBOutlet UILabel *TestYTitle;      //Label
@property (weak, nonatomic) IBOutlet UIButton *artButton;      //Buttons
@property (weak, nonatomic) IBOutlet UIButton *HappinessButton;
@property (weak, nonatomic) IBOutlet UIButton *PQButton;
@property (weak, nonatomic) IBOutlet UIButton *NegativeButton;
@property (weak, nonatomic) IBOutlet UIButton *allWordsButton;
@property (weak, nonatomic) IBOutlet UIButton *SATButton;
@property (weak, nonatomic) IBOutlet UILabel *defLabel;
@property (weak, nonatomic) IBOutlet UIButton *terminateButton;
@property (weak, nonatomic) IBOutlet UIButton *nextSATPress;
@property (weak, nonatomic) IBOutlet UIButton *nextArtPress;
@property (weak, nonatomic) IBOutlet UIButton *nextPQPress;
@property (weak, nonatomic) IBOutlet UIButton *nextSadPress;
@property (weak, nonatomic) IBOutlet UIButton *nextHappyPress;
@property (weak, nonatomic) IBOutlet UIButton *nextAllPress;

//Button Function Declaration
- (IBAction)ArtMovement:(id)sender;
- (IBAction)HappyMovement:(id)sender;
- (IBAction)PQMovement:(id)sender;
- (IBAction)allWordsMovement:(id)sender;
- (IBAction)NegativeMovement:(id)sender;
- (IBAction)SATMovement:(id)sender;
- (IBAction)nextArtMovement:(id)sender;
- (IBAction)nextPQMovement:(id)sender;
- (IBAction)nextSadMovement:(id)sender;
- (IBAction)nextHappyMovement:(id)sender;
- (IBAction)nextSATMovement:(id)sender;
- (IBAction)terminateAction:(id)sender;
- (IBAction)nextAllMovement:(id)sender;
- (void)viewDidAppear:(BOOL)animated;

@end

@implementation SecondViewController

//global variables
int countPressed = 1;
int pqCount = 1;
int allCount = 1;
int SATCount = 1;
int SadCount = 1;
int happyCount = 1;

//Button Functions

//Button Function for art: First, it hides all of the necessary images and buttons. Then it opens the file and it displays the first word when the initial button is pressed.
- (IBAction)ArtMovement:(id)sender {

    //hiding all of the images
    self.artImage.hidden = true;
    self.happinessImage.hidden = true;
    self.PQImage.hidden = true;
    self.NegativeImage.hidden = true;
    self.SATImage.hidden = true;
    self.TestYTitle.hidden = false;
    self.artButton.hidden = true;
    self.HappinessButton.hidden = true;
    self.PQButton.hidden = true;
    self.NegativeButton.hidden = true;
    self.SATButton.hidden = true;
    self.nextPQPress.hidden = true;
    self.terminateButton.hidden = false;
    self.defLabel.hidden = false;
    self.nextSATPress.hidden = true;
    self.nextHappyPress.hidden = true;
    self.nextSadPress.hidden = true;
    self.nextAllPress.hidden = true;
    self.nextArtPress.hidden = false;
    self.nextPQPress.hidden = true;
    self.allWordsImage.hidden = true;
    self.allWordsButton.hidden = true;
    
    //open file
    NSURL *myURL = [[NSBundle mainBundle]
                    URLForResource: @"artList" withExtension:@"txt"];
    NSError *error = nil;
    NSString *string = [NSString stringWithContentsOfURL:myURL encoding:NSUTF8StringEncoding error:&error];
    NSArray *lines = [string componentsSeparatedByString:@"\n"];
    
    //output first word to screen
    _defLabel.text = [NSString stringWithFormat:@"%@%@",_defLabel.text, lines[0]];
    _defLabel.text = [NSString stringWithFormat:@"%@%s",_defLabel.text, "\n"];
}

//Button Function for the next button inside of art button: First, it hides all of the necessary images and buttons. Then it opens the file and alernates between displaying the definition of the word in the list and the next word whenever it is pressed by maintaining a counter.
- (IBAction)nextArtMovement:(id)sender {
    
    //hiding all of the images
    self.artImage.hidden = true;
    self.happinessImage.hidden = true;
    self.PQImage.hidden = true;
    self.NegativeImage.hidden = true;
    self.SATImage.hidden = true;
    self.TestYTitle.hidden = false;
    self.artButton.hidden = true;
    self.HappinessButton.hidden = true;
    self.PQButton.hidden = true;
    self.NegativeButton.hidden = true;
    self.SATButton.hidden = true;
    self.nextPQPress.hidden = true;
    self.terminateButton.hidden = false;
    self.nextSATPress.hidden = true;
    self.nextHappyPress.hidden = true;
    self.nextSadPress.hidden = true;
    self.nextAllPress.hidden = true;
    self.nextArtPress.hidden = false;
    self.nextPQPress.hidden = true;
    self.defLabel.hidden = false;
    self.allWordsImage.hidden = true;
    self.allWordsButton.hidden = true;
    
    //open file
    NSURL *myURL = [[NSBundle mainBundle]
                    URLForResource: @"artList" withExtension:@"txt"];
    NSError *error = nil;
    NSString *string = [NSString stringWithContentsOfURL:myURL encoding:NSUTF8StringEncoding error:&error];
    NSArray *lines = [string componentsSeparatedByString:@"\n"];
    
    if(countPressed < 20) {
        //output definition to screen
        _defLabel.text = @""; //clearing screen
        _defLabel.text = [NSString stringWithFormat:@"%@%@",_defLabel.text, lines[countPressed]];
        _defLabel.text = [NSString stringWithFormat:@"%@%s",_defLabel.text, "\n"];
        
        countPressed++;
    }
    
    //resets the counter if the entire list has been displayed
    else if(countPressed >= 20) {
        countPressed = 0;
    }
    //error checking
    else {
        NSLog(@"Error");
    }
}

//Button Function for happiness: First, it hides all of the necessary images and buttons. Then it opens the file and it displays the first word when the initial button is pressed.

- (IBAction)HappyMovement:(id)sender {
    
    //hiding all of the images
    self.artImage.hidden = true;
    self.happinessImage.hidden = true;
    self.PQImage.hidden = true;
    self.NegativeImage.hidden = true;
    self.SATImage.hidden = true;
    self.TestYTitle.hidden = false;
    self.artButton.hidden = true;
    self.HappinessButton.hidden = true;
    self.PQButton.hidden = true;
    self.NegativeButton.hidden = true;
    self.SATButton.hidden = true;
    self.nextPQPress.hidden = true;
    self.terminateButton.hidden = false;
    self.nextSATPress.hidden = true;
    self.nextHappyPress.hidden = false;
    self.nextSadPress.hidden = true;
    self.nextAllPress.hidden = true;
    self.nextArtPress.hidden = true;
    self.nextPQPress.hidden = true;
    self.defLabel.hidden = false;
    self.allWordsImage.hidden = true;
    self.allWordsButton.hidden = true;
    
    //open file
    NSURL *myURL = [[NSBundle mainBundle]
                    URLForResource: @"happyList" withExtension:@"txt"];
    NSError *error = nil;
    NSString *string = [NSString stringWithContentsOfURL:myURL encoding:NSUTF8StringEncoding error:&error];
    
    NSArray *lines = [string componentsSeparatedByString:@"\n"];
    
    //output first definition to screen
    _defLabel.text = [NSString stringWithFormat:@"%@%@",_defLabel.text, lines[0]];
    _defLabel.text = [NSString stringWithFormat:@"%@%s",_defLabel.text, "\n"];

}

//Button Function for the next button inside of happiness button: First, it hides all of the necessary images and buttons. Then it opens the file and alernates between displaying the definition of the word in the list and the next word whenever it is pressed by maintaining a counter.
- (IBAction)nextHappyMovement:(id)sender {
    
    //hiding all of the images
    self.artImage.hidden = true;
    self.happinessImage.hidden = true;
    self.PQImage.hidden = true;
    self.NegativeImage.hidden = true;
    self.SATImage.hidden = true;
    self.TestYTitle.hidden = false;
    self.artButton.hidden = true;
    self.HappinessButton.hidden = true;
    self.PQButton.hidden = true;
    self.NegativeButton.hidden = true;
    self.SATButton.hidden = true;
    self.nextPQPress.hidden = true;
    self.terminateButton.hidden = false;
    self.nextSATPress.hidden = true;
    self.nextHappyPress.hidden = false;
    self.nextSadPress.hidden = true;
    self.nextAllPress.hidden = true;
    self.nextArtPress.hidden = true;
    self.nextPQPress.hidden = true;
    self.defLabel.hidden = false;
    self.allWordsImage.hidden = true;
    self.allWordsButton.hidden = true;
    
    //open file
    NSURL *myURL = [[NSBundle mainBundle]
                    URLForResource: @"happyList" withExtension:@"txt"];
    NSError *error = nil;
    NSString *string = [NSString stringWithContentsOfURL:myURL encoding:NSUTF8StringEncoding error:&error];
    NSArray *lines = [string componentsSeparatedByString:@"\n"];
    
    if(happyCount < 36) {
        //output definition to screen
        _defLabel.text = @""; //clearing screen
        _defLabel.text = [NSString stringWithFormat:@"%@%@",_defLabel.text, lines[happyCount]];
        _defLabel.text = [NSString stringWithFormat:@"%@%s",_defLabel.text, "\n"];
        
        happyCount++;
    }
    
    //resets the counter if the entire list has been displayed
    else if(happyCount >= 36) {
        happyCount = 0;
    }
    else {
        //error checking
        NSLog(@"Error");
    }
}

//Button Function for personal qualities: First, it hides all of the necessary images and buttons. Then it opens the file and it displays the first word when the initial button is pressed.
- (IBAction)PQMovement:(id)sender {
    
    //hiding all of the images
    self.artImage.hidden = true;
    self.happinessImage.hidden = true;
    self.PQImage.hidden = true;
    self.NegativeImage.hidden = true;
    self.SATImage.hidden = true;
    self.TestYTitle.hidden = false;
    self.artButton.hidden = true;
    self.HappinessButton.hidden = true;
    self.PQButton.hidden = true;
    self.NegativeButton.hidden = true;
    self.SATButton.hidden = true;
    self.nextPQPress.hidden = true;
    self.terminateButton.hidden = false;
    self.nextSATPress.hidden = true;
    self.nextHappyPress.hidden = true;
    self.nextSadPress.hidden = true;
    self.nextAllPress.hidden = true;
    self.nextArtPress.hidden = true;
    self.nextPQPress.hidden = false;
    self.defLabel.hidden = false;
    self.allWordsImage.hidden = true;
    self.allWordsButton.hidden = true;
    
    //open file
    NSURL *myURL = [[NSBundle mainBundle]
                    URLForResource: @"pqList" withExtension:@"txt"];
    NSError *error = nil;
    NSString *string = [NSString stringWithContentsOfURL:myURL encoding:NSUTF8StringEncoding error:&error];
    
    NSArray *lines = [string componentsSeparatedByString:@"\n"];
    
    //output first definition to screen
    _defLabel.text = [NSString stringWithFormat:@"%@%@",_defLabel.text, lines[0]];
    _defLabel.text = [NSString stringWithFormat:@"%@%s",_defLabel.text, "\n"];
}

//Button Function for the next button inside of the personal qualities button: First, it hides all of the necessary images and buttons. Then it opens the file and alernates between displaying the definition of the word in the list and the next word whenever it is pressed by maintaining a counter.
- (IBAction)nextPQMovement:(id)sender {
    
    //hiding all of the images
    self.artImage.hidden = true;
    self.happinessImage.hidden = true;
    self.PQImage.hidden = true;
    self.NegativeImage.hidden = true;
    self.SATImage.hidden = true;
    self.TestYTitle.hidden = false;
    self.artButton.hidden = true;
    self.HappinessButton.hidden = true;
    self.PQButton.hidden = true;
    self.NegativeButton.hidden = true;
    self.SATButton.hidden = true;
    self.nextPQPress.hidden = true;
    self.terminateButton.hidden = false;
    self.nextSATPress.hidden = true;
    self.nextHappyPress.hidden = true;
    self.nextSadPress.hidden = true;
    self.nextAllPress.hidden = true;
    self.nextArtPress.hidden = true;
    self.nextPQPress.hidden = false;
    self.defLabel.hidden = false;
    self.allWordsImage.hidden = true;
    self.allWordsButton.hidden = true;
    
    //open file
    NSURL *myURL = [[NSBundle mainBundle]
                    URLForResource: @"pqList" withExtension:@"txt"];
    NSError *error = nil;
    NSString *string = [NSString stringWithContentsOfURL:myURL encoding:NSUTF8StringEncoding error:&error];
    NSArray *lines = [string componentsSeparatedByString:@"\n"];
    
    if(pqCount < 22) {
        //output definition to screen
        _defLabel.text = @""; //clearing screen
        _defLabel.text = [NSString stringWithFormat:@"%@%@",_defLabel.text, lines[pqCount]];
        _defLabel.text = [NSString stringWithFormat:@"%@%s",_defLabel.text, "\n"];
        
        pqCount++;
    }
    
    //resets the counter if the entire list has been displayed
    else if(pqCount >= 22) {
        pqCount = 0;
    }
    //error checking
    else {
        NSLog(@"Error");
    }
}
//Button Function for all words: First, it hides all of the necessary images and buttons. Then it opens the file and it displays the first word when the initial button is pressed.

- (IBAction)allWordsMovement:(id)sender {
    
    //hiding all of the images
    self.artImage.hidden = true;
    self.happinessImage.hidden = true;
    self.PQImage.hidden = true;
    self.NegativeImage.hidden = true;
    self.SATImage.hidden = true;
    self.TestYTitle.hidden = false;
    self.artButton.hidden = true;
    self.HappinessButton.hidden = true;
    self.PQButton.hidden = true;
    self.NegativeButton.hidden = true;
    self.SATButton.hidden = true;
    self.nextPQPress.hidden = true;
    self.terminateButton.hidden = false;
    self.nextSATPress.hidden = true;
    self.nextHappyPress.hidden = true;
    self.nextSadPress.hidden = true;
    self.nextAllPress.hidden = false;
    self.nextArtPress.hidden = true;
    self.nextPQPress.hidden = true;
    self.defLabel.hidden = false;
    self.allWordsImage.hidden = true;
    self.allWordsButton.hidden = true;
    
    //open file
    NSURL *myURL = [[NSBundle mainBundle]
                    URLForResource: @"allWordsList" withExtension:@"txt"];
    NSError *error = nil;
    NSString *string = [NSString stringWithContentsOfURL:myURL encoding:NSUTF8StringEncoding error:&error];
    
    NSArray *lines = [string componentsSeparatedByString:@"\n"];
    
    //output first definition to screen
    _defLabel.text = [NSString stringWithFormat:@"%@%@",_defLabel.text, lines[0]];
    _defLabel.text = [NSString stringWithFormat:@"%@%s",_defLabel.text, "\n"];
}

//Button Function for the next button inside of all words button: First, it hides all of the necessary images and buttons. Then it opens the file and alernates between displaying the definition of the word in the list and the next word whenever it is pressed by maintaining a counter.
- (IBAction)nextAllMovement:(id)sender {
    
    //hiding all of the images
    self.artImage.hidden = true;
    self.happinessImage.hidden = true;
    self.PQImage.hidden = true;
    self.NegativeImage.hidden = true;
    self.SATImage.hidden = true;
    self.TestYTitle.hidden = false;
    self.artButton.hidden = true;
    self.HappinessButton.hidden = true;
    self.PQButton.hidden = true;
    self.NegativeButton.hidden = true;
    self.SATButton.hidden = true;
    self.nextPQPress.hidden = true;
    self.terminateButton.hidden = false;
    self.nextSATPress.hidden = true;
    self.nextHappyPress.hidden = true;
    self.nextSadPress.hidden = true;
    self.nextAllPress.hidden = false;
    self.nextArtPress.hidden = true;
    self.nextPQPress.hidden = true;
    self.defLabel.hidden = false;
    self.allWordsImage.hidden = true;
    self.allWordsButton.hidden = true;
    
    //open file
    NSURL *myURL = [[NSBundle mainBundle]
                    URLForResource: @"allWordsList" withExtension:@"txt"];
    NSError *error = nil;
    NSString *string = [NSString stringWithContentsOfURL:myURL encoding:NSUTF8StringEncoding error:&error];
    NSArray *lines = [string componentsSeparatedByString:@"\n"];
    
    if(allCount < 459) {
        //output definition to screen
        _defLabel.text = @""; //clearing screen
        _defLabel.text = [NSString stringWithFormat:@"%@%@",_defLabel.text, lines[allCount]];
        _defLabel.text = [NSString stringWithFormat:@"%@%s",_defLabel.text, "\n"];
        
        allCount++;
    }
    //resets the counter if the entire list has been displayed
    else if(allCount >= 459) {
        allCount = 0;
    }
    //error checking
    else {
        NSLog(@"Error");
    }
}

//Button Function for negative: First, it hides all of the necessary images and buttons. Then it opens the file and it displays the first word when the initial button is pressed.

- (IBAction)NegativeMovement:(id)sender {
    
    //hiding all of the images
    self.artImage.hidden = true;
    self.happinessImage.hidden = true;
    self.PQImage.hidden = true;
    self.NegativeImage.hidden = true;
    self.SATImage.hidden = true;
    self.TestYTitle.hidden = false;
    self.artButton.hidden = true;
    self.HappinessButton.hidden = true;
    self.PQButton.hidden = true;
    self.NegativeButton.hidden = true;
    self.SATButton.hidden = true;
    self.nextPQPress.hidden = true;
    self.terminateButton.hidden = false;
    self.nextSATPress.hidden = true;
    self.nextHappyPress.hidden = true;
    self.nextSadPress.hidden = false;
    self.nextAllPress.hidden = true;
    self.nextArtPress.hidden = true;
    self.nextPQPress.hidden = true;
    self.defLabel.hidden = false;
    self.allWordsImage.hidden = true;
    self.allWordsButton.hidden = true;
    
    //open file
    NSURL *myURL = [[NSBundle mainBundle]
                    URLForResource: @"sadList" withExtension:@"txt"];
    NSError *error = nil;
    NSString *string = [NSString stringWithContentsOfURL:myURL encoding:NSUTF8StringEncoding error:&error];
    
    NSArray *lines = [string componentsSeparatedByString:@"\n"];
    
    //output first definition to screen
    _defLabel.text = [NSString stringWithFormat:@"%@%@",_defLabel.text, lines[0]];
    _defLabel.text = [NSString stringWithFormat:@"%@%s",_defLabel.text, "\n"];
}

//Button Function for the next button inside of negative button: First, it hides all of the necessary images and buttons. Then it opens the file and alernates between displaying the definition of the word in the list and the next word whenever it is pressed by maintaining a counter.
- (IBAction)nextSadMovement:(id)sender {
    
    //hiding all of the images
    self.artImage.hidden = true;
    self.happinessImage.hidden = true;
    self.PQImage.hidden = true;
    self.NegativeImage.hidden = true;
    self.SATImage.hidden = true;
    self.TestYTitle.hidden = false;
    self.artButton.hidden = true;
    self.HappinessButton.hidden = true;
    self.PQButton.hidden = true;
    self.NegativeButton.hidden = true;
    self.SATButton.hidden = true;
    self.nextPQPress.hidden = true;
    self.terminateButton.hidden = false;
    self.nextSATPress.hidden = true;
    self.nextHappyPress.hidden = true;
    self.nextSadPress.hidden = false;
    self.nextAllPress.hidden = true;
    self.nextArtPress.hidden = true;
    self.nextPQPress.hidden = true;
    self.defLabel.hidden = false;
    self.allWordsImage.hidden = true;
    self.allWordsButton.hidden = true;
    
    //open file
    NSURL *myURL = [[NSBundle mainBundle]
                    URLForResource: @"sadList" withExtension:@"txt"];
    NSError *error = nil;
    NSString *string = [NSString stringWithContentsOfURL:myURL encoding:NSUTF8StringEncoding error:&error];
    NSArray *lines = [string componentsSeparatedByString:@"\n"];

    if(SadCount < 46) {
        //output definition to screen
        _defLabel.text = @""; //clearing screen
        _defLabel.text = [NSString stringWithFormat:@"%@%@",_defLabel.text, lines[SadCount]];
        _defLabel.text = [NSString stringWithFormat:@"%@%s",_defLabel.text, "\n"];
        
        SadCount++;
    }
    //resets the counter if the entire list has been displayed
    else if(SadCount >= 46) {
        SadCount = 0;
    }
    else {
        //error checking
        NSLog(@"Error");
    }
}

//Button Function for SAT: First, it hides all of the necessary images and buttons. Then it opens the file and it displays the first word when the initial button is pressed.

- (IBAction)SATMovement:(id)sender {
    
    //hiding all of the images
    self.artImage.hidden = true;
    self.happinessImage.hidden = true;
    self.PQImage.hidden = true;
    self.NegativeImage.hidden = true;
    self.SATImage.hidden = true;
    self.TestYTitle.hidden = false;
    self.artButton.hidden = true;
    self.HappinessButton.hidden = true;
    self.PQButton.hidden = true;
    self.NegativeButton.hidden = true;
    self.SATButton.hidden = true;
    self.nextPQPress.hidden = true;
    self.terminateButton.hidden = false;
    self.nextSATPress.hidden = false;
    self.nextHappyPress.hidden = true;
    self.nextSadPress.hidden = true;
    self.nextAllPress.hidden = true;
    self.nextArtPress.hidden = true;
    self.nextPQPress.hidden = true;
    self.defLabel.hidden = false;
    self.allWordsImage.hidden = true;
    self.allWordsButton.hidden = true;
    
    //open file
    NSURL *myURL = [[NSBundle mainBundle]
                    URLForResource: @"SATList" withExtension:@"txt"];
    NSError *error = nil;
    NSString *string = [NSString stringWithContentsOfURL:myURL encoding:NSUTF8StringEncoding error:&error];
    
    NSArray *lines = [string componentsSeparatedByString:@"\n"];
    
    //output first definition to screen
    _defLabel.text = [NSString stringWithFormat:@"%@%@",_defLabel.text, lines[0]];
    _defLabel.text = [NSString stringWithFormat:@"%@%s",_defLabel.text, "\n"];
}

//Button Function for the next button inside of SAT button: First, it hides all of the necessary images and buttons. Then it opens the file and alernates between displaying the definition of the word in the list and the next word whenever it is pressed by maintaining a counter.
- (IBAction)nextSATMovement:(id)sender {
    
    //hiding all of the images
    self.artImage.hidden = true;
    self.happinessImage.hidden = true;
    self.PQImage.hidden = true;
    self.NegativeImage.hidden = true;
    self.SATImage.hidden = true;
    self.TestYTitle.hidden = false;
    self.artButton.hidden = true;
    self.HappinessButton.hidden = true;
    self.PQButton.hidden = true;
    self.NegativeButton.hidden = true;
    self.SATButton.hidden = true;
    self.nextPQPress.hidden = true;
    self.terminateButton.hidden = false;
    self.nextSATPress.hidden = false;
    self.nextHappyPress.hidden = true;
    self.nextSadPress.hidden = true;
    self.nextAllPress.hidden = true;
    self.nextArtPress.hidden = true;
    self.nextPQPress.hidden = true;
    self.defLabel.hidden = false;
    self.allWordsImage.hidden = true;
    self.allWordsButton.hidden = true;
    
    //open file
    NSURL *myURL = [[NSBundle mainBundle]
                    URLForResource: @"SATList" withExtension:@"txt"];
    NSError *error = nil;
    NSString *string = [NSString stringWithContentsOfURL:myURL encoding:NSUTF8StringEncoding error:&error];
    NSArray *lines = [string componentsSeparatedByString:@"\n"];
    
    if(SATCount < 334) {
        //output definition to screen
        _defLabel.text = @""; //clearing screen
        _defLabel.text = [NSString stringWithFormat:@"%@%@",_defLabel.text, lines[SATCount]];
        _defLabel.text = [NSString stringWithFormat:@"%@%s",_defLabel.text, "\n"];
        
        SATCount++;
    }
    //resets the counter if the entire list has been displayed
    else if(SATCount >= 334) {
        SATCount = 0;
    }
    else {
       //error checking
        NSLog(@"Error");
    }
}

//Button Function for the finish button. First, it hides all of the necessary images and buttons. Then it resets the wordBox and all of the counters and then returns to the home page.
- (IBAction)terminateAction:(id)sender {
    
    //hiding all of the images
    self.artImage.hidden = true;
    self.happinessImage.hidden = true;
    self.PQImage.hidden = true;
    self.NegativeImage.hidden = true;
    self.SATImage.hidden = true;
    self.TestYTitle.hidden = false;
    self.artButton.hidden = true;
    self.HappinessButton.hidden = true;
    self.PQButton.hidden = true;
    self.NegativeButton.hidden = true;
    self.SATButton.hidden = true;
    self.nextPQPress.hidden = true;
    self.terminateButton.hidden = true;
    self.nextSATPress.hidden = true;
    self.nextHappyPress.hidden = true;
    self.nextSadPress.hidden = true;
    self.nextAllPress.hidden = true;
    self.nextArtPress.hidden = true;
    self.nextPQPress.hidden = true;
    self.defLabel.hidden = false;
    self.allWordsImage.hidden = true;
    self.allWordsButton.hidden = true;
    
    //clearing screen
    _defLabel.text = @"";
    
    //resetting all the counters back to 0
    countPressed = 0;
    SadCount = 0;
    happyCount = 0;
    allCount = 0;
    SATCount = 0;
    pqCount = 0;
    
    [self viewDidLoad]; //loading the 'home page' again
}

//function that is used to return to the home page
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

//"Home page" function. Hides all of the necessary images
- (void)viewDidLoad {
    [super viewDidLoad];
    
    //Home page: What you first see
    self.artImage.hidden = false;
    self.happinessImage.hidden = false;
    self.PQImage.hidden = false;
    self.NegativeImage.hidden = false;
    self.SATImage.hidden = false;
    self.TestYTitle.hidden = false;
    self.artButton.hidden = false;
    self.HappinessButton.hidden = false;
    self.PQButton.hidden = false;
    self.NegativeButton.hidden = false;
    self.SATButton.hidden = false;
    self.allWordsImage.hidden = false;
    self.allWordsButton.hidden = false;
    self.nextPQPress.hidden = true;
    self.terminateButton.hidden = true;
    self.nextSATPress.hidden = true;
    self.nextHappyPress.hidden = true;
    self.nextSadPress.hidden = true;
    self.nextAllPress.hidden = true;
    self.nextArtPress.hidden = true;
    self.nextPQPress.hidden = true;
    self.defLabel.hidden = true;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
