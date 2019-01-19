/*****************************************************************************
 *	Name:   		Sam Faulkner and Arsheya Jain                            *
 *  Project Title:  Summative Assignment - Learn Dat Word                    *
 *	Course:         ICS4U                                                    *
 *	Date:           January 12, 2017                                         *
 *	Description:    This project is an iOS application that uses Objective-C *
                    in Xcode 8. It is a vocabulary builder application.      *
 *****************************************************************************/

//  FirstViewController.m

#import "FirstViewController.h"
#import <Foundation/Foundation.h>

@interface FirstViewController ()

//Variable Declaration
@property (weak, nonatomic) IBOutlet UILabel *LearnWTitle;
@property (weak, nonatomic) IBOutlet UIImageView *ArtPic;
@property (weak, nonatomic) IBOutlet UIImageView *happyPic;
@property (weak, nonatomic) IBOutlet UIImageView *PQPic;
@property (weak, nonatomic) IBOutlet UIImageView *NegativePic;
@property (weak, nonatomic) IBOutlet UIImageView *SATPic;
@property (weak, nonatomic) IBOutlet UIButton *ArtPress;
@property (weak, nonatomic) IBOutlet UIButton *HappyPress;
@property (weak, nonatomic) IBOutlet UIButton *PQPress;
@property (weak, nonatomic) IBOutlet UIButton *NegativePress;
@property (weak, nonatomic) IBOutlet UIButton *SATPress;
@property (weak, nonatomic) IBOutlet UIButton *finishButton;
@property (weak, nonatomic) IBOutlet UILabel *wordDefBox;
@property (weak, nonatomic) IBOutlet UIButton *nextArtButton;
@property (weak, nonatomic) IBOutlet UIButton *nextPQButton;
@property (weak, nonatomic) IBOutlet UIButton *nextSadButton;
@property (weak, nonatomic) IBOutlet UIButton *nextHappyButton;
@property (weak, nonatomic) IBOutlet UIButton *nextSATButton;

//Button Function Declaration
- (IBAction)ArtAction:(id)sender;
- (IBAction)HappyAction:(id)sender;
- (IBAction)PQAction:(id)sender;
- (IBAction)NegativeAction:(id)sender;
- (IBAction)SATAction:(id)sender;
- (IBAction)FinishAction:(id)sender;
- (IBAction)nextArtAction:(id)sender;
- (IBAction)nextPQAction:(id)sender;
- (IBAction)nextSadAction:(id)sender;
- (IBAction)nextHappyAction:(id)sender;
- (IBAction)nextSATAction:(id)sender;

//function declaration
- (void)viewDidAppear:(BOOL)animated;

@end

@implementation FirstViewController

//globals variables
int artPressed = 1;
int sadCountPressed = 1;
int happyPressed = 1;
int pqPressed = 1;
int SATPressed = 1;

//Button Function for art: First, it hides all of the necessary images and buttons. Then it opens the file and it displays the first word and its definition when the initial button is pressed.
- (IBAction)ArtAction:(id)sender {
    
    //hiding all of the images
    self.LearnWTitle.hidden = false;
    self.ArtPic.hidden = true;
    self.happyPic.hidden = true;
    self.PQPic.hidden = true;
    self.NegativePic.hidden = true;
    self.SATPic.hidden = true;
    self.ArtPress.hidden = true;
    self.HappyPress.hidden = true;
    self.PQPress.hidden = true;
    self.NegativePress.hidden = true;
    self.SATPress.hidden = true;
    self.nextPQButton.hidden = true;
    self.nextArtButton.hidden = false;
    self.nextSadButton.hidden = true;
    self.nextSATButton.hidden = true;
    self.nextHappyButton.hidden = true;
    self.finishButton.hidden = false;
    self.wordDefBox.hidden = false;
    
    //open file
    NSURL *myURL = [[NSBundle mainBundle] URLForResource: @"artList" withExtension:@"txt"];
    NSError *error = nil;
    NSString *string = [NSString stringWithContentsOfURL:myURL encoding:NSUTF8StringEncoding error:&error];
    NSArray *lines = [string componentsSeparatedByString:@"\n"];

    //output first definition to screen
    _wordDefBox.text = [NSString stringWithFormat:@"%@%@",_wordDefBox.text, lines[0]];
    _wordDefBox.text = [NSString stringWithFormat:@"%@%s",_wordDefBox.text, "\n"];
    _wordDefBox.text = [NSString stringWithFormat:@"%@%@",_wordDefBox.text, lines[1]];
    _wordDefBox.text = [NSString stringWithFormat:@"%@%s",_wordDefBox.text, "\n"];
}

//Button Function for the next button inside of art button: First, it hides all of the necessary images and buttons. Then it opens the file and displays the following words in the list and their definitions whenever it is pressed by maintaining a counter.

- (IBAction)nextArtAction:(id)sender {
    
    //hiding all of the images
    self.LearnWTitle.hidden = false;
    self.ArtPic.hidden = true;
    self.happyPic.hidden = true;
    self.PQPic.hidden = true;
    self.NegativePic.hidden = true;
    self.SATPic.hidden = true;
    self.ArtPress.hidden = true;
    self.HappyPress.hidden = true;
    self.PQPress.hidden = true;
    self.NegativePress.hidden = true;
    self.SATPress.hidden = true;
    self.nextPQButton.hidden = true;
    self.nextArtButton.hidden = false;
    self.nextSadButton.hidden = true;
    self.nextSATButton.hidden = true;
    self.nextHappyButton.hidden = true;
    self.finishButton.hidden = false;
    self.wordDefBox.hidden = false;
    
    //open file
    NSURL *myURL = [[NSBundle mainBundle]
                    URLForResource: @"artList" withExtension:@"txt"];
    NSError *error = nil;
    NSString *string = [NSString stringWithContentsOfURL:myURL encoding:NSUTF8StringEncoding error:&error];
    NSArray *lines = [string componentsSeparatedByString:@"\n"];
    
    //displays words and definitions
    if(artPressed * 2 < 20) {
        
        //output definition to screen
        _wordDefBox.text = @""; //clearing screen
        _wordDefBox.text = [NSString stringWithFormat:@"%@%@",_wordDefBox.text, lines[artPressed * 2]];
        _wordDefBox.text = [NSString stringWithFormat:@"%@%s",_wordDefBox.text, "\n"];
        _wordDefBox.text = [NSString stringWithFormat:@"%@%@",_wordDefBox.text, lines[artPressed * 2 + 1]];
        _wordDefBox.text = [NSString stringWithFormat:@"%@%s",_wordDefBox.text, "\n"];
        
        artPressed++;
    }
    
    //resets the counter if the entire list has been displayed
    else if(artPressed * 2 >= 20) {
        artPressed = 0;
    }
    //error checking
    else {
        NSLog(@"Error");
    }
}


//Button Function for happiness: First, it hides all of the necessary images and buttons. Then it opens the file and it displays the first word when the initial button is pressed.
- (IBAction)HappyAction:(id)sender {
    
    //hiding all of the images
    self.LearnWTitle.hidden = false;
    self.ArtPic.hidden = true;
    self.happyPic.hidden = true;
    self.PQPic.hidden = true;
    self.NegativePic.hidden = true;
    self.SATPic.hidden = true;
    self.ArtPress.hidden = true;
    self.HappyPress.hidden = true;
    self.PQPress.hidden = true;
    self.NegativePress.hidden = true;
    self.SATPress.hidden = true;
    self.nextPQButton.hidden = true;
    self.nextArtButton.hidden = true;
    self.nextSadButton.hidden = true;
    self.nextSATButton.hidden = true;
    self.nextHappyButton.hidden = false;
    self.finishButton.hidden = false;
    self.wordDefBox.hidden = false;
    
    //open file
    NSURL *myURL = [[NSBundle mainBundle]
                    URLForResource: @"happyList" withExtension:@"txt"];
    NSError *error = nil;
    NSString *string = [NSString stringWithContentsOfURL:myURL encoding:NSUTF8StringEncoding error:&error];
    
    NSArray *lines = [string componentsSeparatedByString:@"\n"];
    
    //output first definition to screen
    _wordDefBox.text = [NSString stringWithFormat:@"%@%@",_wordDefBox.text, lines[0]];
    _wordDefBox.text = [NSString stringWithFormat:@"%@%s",_wordDefBox.text, "\n"];
    _wordDefBox.text = [NSString stringWithFormat:@"%@%@",_wordDefBox.text, lines[1]];
    _wordDefBox.text = [NSString stringWithFormat:@"%@%s",_wordDefBox.text, "\n"];
}

//Button Function for the next button inside of happiness button: First, it hides all of the necessary images and buttons. Then it opens the file and displays the following words in the list whenever it is pressed by maintaining a counter.
- (IBAction)nextHappyAction:(id)sender {
    
    self.LearnWTitle.hidden = false;
    self.ArtPic.hidden = true;
    self.happyPic.hidden = true;
    self.PQPic.hidden = true;
    self.NegativePic.hidden = true;
    self.SATPic.hidden = true;
    self.ArtPress.hidden = true;
    self.HappyPress.hidden = true;
    self.PQPress.hidden = true;
    self.NegativePress.hidden = true;
    self.SATPress.hidden = true;
    self.nextPQButton.hidden = true;
    self.nextArtButton.hidden = true;
    self.nextSadButton.hidden = true;
    self.nextSATButton.hidden = true;
    self.nextHappyButton.hidden = false;
    self.finishButton.hidden = false;
    self.wordDefBox.hidden = false;
    
    //open file
    NSURL *myURL = [[NSBundle mainBundle]
                    URLForResource: @"happyList" withExtension:@"txt"];
    NSError *error = nil;
    NSString *string = [NSString stringWithContentsOfURL:myURL encoding:NSUTF8StringEncoding error:&error];
    
    NSArray *lines = [string componentsSeparatedByString:@"\n"];
    
    //displays words and definitions
    if(happyPressed * 2 < 36) {
        //output definition to screen
        _wordDefBox.text = @""; //clearing screen
        _wordDefBox.text = [NSString stringWithFormat:@"%@%@",_wordDefBox.text, lines[happyPressed * 2]];
        _wordDefBox.text = [NSString stringWithFormat:@"%@%s",_wordDefBox.text, "\n"];
        _wordDefBox.text = [NSString stringWithFormat:@"%@%@",_wordDefBox.text, lines[happyPressed * 2 + 1]];
        _wordDefBox.text = [NSString stringWithFormat:@"%@%s",_wordDefBox.text, "\n"];
        
        happyPressed++;
    }
    
    //resets the counter if the entire list has been displayed
    else if(happyPressed * 2 >= 36) {
        happyPressed = 0;
    }
    //error checking
    else {
        NSLog(@"Error");
    }
}

//Button Function for personal qualities: First, it hides all of the necessary images and buttons. Then it opens the file and it displays the first word when the initial button is pressed.
- (IBAction)PQAction:(id)sender {

    //hiding all of the images
    self.LearnWTitle.hidden = false;
    self.ArtPic.hidden = true;
    self.happyPic.hidden = true;
    self.PQPic.hidden = true;
    self.NegativePic.hidden = true;
    self.SATPic.hidden = true;
    self.ArtPress.hidden = true;
    self.HappyPress.hidden = true;
    self.PQPress.hidden = true;
    self.NegativePress.hidden = true;
    self.SATPress.hidden = true;
    self.nextPQButton.hidden = false;
    self.nextArtButton.hidden = true;
    self.nextSadButton.hidden = true;
    self.nextSATButton.hidden = true;
    self.nextHappyButton.hidden = true;
    self.finishButton.hidden = false;
    self.wordDefBox.hidden = false;
    
    //open file
    NSURL *myURL = [[NSBundle mainBundle]
                    URLForResource: @"pqList" withExtension:@"txt"];
    NSError *error = nil;
    NSString *string = [NSString stringWithContentsOfURL:myURL encoding:NSUTF8StringEncoding error:&error];
    NSArray *lines = [string componentsSeparatedByString:@"\n"];
    
    //output first definition to screen
    _wordDefBox.text = [NSString stringWithFormat:@"%@%@",_wordDefBox.text, lines[0]];
    _wordDefBox.text = [NSString stringWithFormat:@"%@%s",_wordDefBox.text, "\n"];
    _wordDefBox.text = [NSString stringWithFormat:@"%@%@",_wordDefBox.text, lines[1]];
    _wordDefBox.text = [NSString stringWithFormat:@"%@%s",_wordDefBox.text, "\n"];
}

//Button Function for the next button inside of personal qualities button: First, it hides all of the necessary images and buttons. Then it opens the file and displays the following words in the list whenever it is pressed by maintaining a counter.
- (IBAction)nextPQAction:(id)sender {
    
    self.LearnWTitle.hidden = false;
    self.ArtPic.hidden = true;
    self.happyPic.hidden = true;
    self.PQPic.hidden = true;
    self.NegativePic.hidden = true;
    self.SATPic.hidden = true;
    self.ArtPress.hidden = true;
    self.HappyPress.hidden = true;
    self.PQPress.hidden = true;
    self.NegativePress.hidden = true;
    self.SATPress.hidden = true;
    self.nextPQButton.hidden = false;
    self.nextArtButton.hidden = true;
    self.nextSadButton.hidden = true;
    self.nextSATButton.hidden = true;
    self.nextHappyButton.hidden = true;
    self.finishButton.hidden = false;
    self.wordDefBox.hidden = false;
    
    //open file
    NSURL *myURL = [[NSBundle mainBundle]
                    URLForResource: @"pqList" withExtension:@"txt"];
    NSError *error = nil;
    NSString *string = [NSString stringWithContentsOfURL:myURL encoding:NSUTF8StringEncoding error:&error];
    
    NSArray *lines = [string componentsSeparatedByString:@"\n"];
    //displays the words and definitions
    if(pqPressed * 2 < 22) {
        
        //output definition to screen
        _wordDefBox.text = @""; //clearing screen
        _wordDefBox.text = [NSString stringWithFormat:@"%@%@",_wordDefBox.text, lines[pqPressed * 2]];
        _wordDefBox.text = [NSString stringWithFormat:@"%@%s",_wordDefBox.text, "\n"];
        _wordDefBox.text = [NSString stringWithFormat:@"%@%@",_wordDefBox.text, lines[pqPressed * 2 + 1]];
        _wordDefBox.text = [NSString stringWithFormat:@"%@%s",_wordDefBox.text, "\n"];
        
        pqPressed++;
    }
    
    //resets the counter if the entire list has been displayed
    else if(pqPressed * 2 >= 22) {
        pqPressed = 0;
    }
    
    //error checking
    else {
        NSLog(@"Error");
    }
}

//Button Function for negative: First, it hides all of the necessary images and buttons. Then it opens the file and it displays the first word when the initial button is pressed.
- (IBAction)NegativeAction:(id)sender {
    
    //hiding all of the images
    self.LearnWTitle.hidden = false;
    self.ArtPic.hidden = true;
    self.happyPic.hidden = true;
    self.PQPic.hidden = true;
    self.NegativePic.hidden = true;
    self.SATPic.hidden = true;
    self.ArtPress.hidden = true;
    self.HappyPress.hidden = true;
    self.PQPress.hidden = true;
    self.NegativePress.hidden = true;
    self.SATPress.hidden = true;
    self.nextPQButton.hidden = true;
    self.nextArtButton.hidden = true;
    self.nextSadButton.hidden = false;
    self.nextSATButton.hidden = true;
    self.nextHappyButton.hidden = true;
    self.finishButton.hidden = false;
    self.wordDefBox.hidden = false;
    
    //open file
    NSURL *myURL = [[NSBundle mainBundle]
                    URLForResource: @"sadList" withExtension:@"txt"];
    NSError *error = nil;
    NSString *string = [NSString stringWithContentsOfURL:myURL encoding:NSUTF8StringEncoding error:&error];
    NSArray *lines = [string componentsSeparatedByString:@"\n"];
    
    //output first definition to screen
    _wordDefBox.text = [NSString stringWithFormat:@"%@%@",_wordDefBox.text, lines[0]];
    _wordDefBox.text = [NSString stringWithFormat:@"%@%s",_wordDefBox.text, "\n"];
    _wordDefBox.text = [NSString stringWithFormat:@"%@%@",_wordDefBox.text, lines[1]];
    _wordDefBox.text = [NSString stringWithFormat:@"%@%s",_wordDefBox.text, "\n"];
}

//Button Function for the next button inside of negative button: First, it hides all of the necessary images and buttons. Then it opens the file and displays the following words in the list whenever it is pressed by maintaining a counter.
- (IBAction)nextSadAction:(id)sender {
    
    //hiding all of the images
    self.LearnWTitle.hidden = false;
    self.ArtPic.hidden = true;
    self.happyPic.hidden = true;
    self.PQPic.hidden = true;
    self.NegativePic.hidden = true;
    self.SATPic.hidden = true;
    self.ArtPress.hidden = true;
    self.HappyPress.hidden = true;
    self.PQPress.hidden = true;
    self.NegativePress.hidden = true;
    self.SATPress.hidden = true;
    self.nextPQButton.hidden = true;
    self.nextArtButton.hidden = true;
    self.nextSadButton.hidden = false;
    self.nextSATButton.hidden = true;
    self.nextHappyButton.hidden = true;
    self.finishButton.hidden = false;
    self.wordDefBox.hidden = false;
    
    //open file
    NSURL *sadURL = [[NSBundle mainBundle]
                     URLForResource: @"sadList" withExtension:@"txt"];
    NSError *error = nil;
    NSString *string = [NSString stringWithContentsOfURL:sadURL encoding:NSUTF8StringEncoding error:&error];
    NSArray *sadLines = [string componentsSeparatedByString:@"\n"];
    
    //displays words and definitions
    if(sadCountPressed * 2 < 46) {
        
        //output definition to screen
        _wordDefBox.text = @""; //clearing screen
        _wordDefBox.text = [NSString stringWithFormat:@"%@%@",_wordDefBox.text, sadLines[sadCountPressed * 2]];
        _wordDefBox.text = [NSString stringWithFormat:@"%@%s",_wordDefBox.text, "\n"];
        _wordDefBox.text = [NSString stringWithFormat:@"%@%@",_wordDefBox.text, sadLines[sadCountPressed * 2 + 1]];
        _wordDefBox.text = [NSString stringWithFormat:@"%@%s",_wordDefBox.text, "\n"];
        
        sadCountPressed++;
    }
    
    //resets the counter if the entire list has been displayed
    else if(sadCountPressed * 2 >= 46) {
        sadCountPressed = 0;
    }
    //error checking
    else {
        NSLog(@"Error");
    }
}

//Button Function for Top picks for SAT: First, it hides all of the necessary images and buttons. Then it opens the file and it displays the first word when the initial button is pressed.
- (IBAction)SATAction:(id)sender {
    
    //hiding all of the images
    self.LearnWTitle.hidden = false;
    self.ArtPic.hidden = true;
    self.happyPic.hidden = true;
    self.PQPic.hidden = true;
    self.NegativePic.hidden = true;
    self.SATPic.hidden = true;
    self.ArtPress.hidden = true;
    self.HappyPress.hidden = true;
    self.PQPress.hidden = true;
    self.NegativePress.hidden = true;
    self.SATPress.hidden = true;
    self.nextPQButton.hidden = true;
    self.nextArtButton.hidden = true;
    self.nextSadButton.hidden = true;
    self.nextSATButton.hidden = false;
    self.nextHappyButton.hidden = true;
    self.finishButton.hidden = false;
    self.wordDefBox.hidden = false;
    
    //open file
    NSURL *myURL = [[NSBundle mainBundle]
                    URLForResource: @"SATList" withExtension:@"txt"];
    NSError *error = nil;
    NSString *string = [NSString stringWithContentsOfURL:myURL encoding:NSUTF8StringEncoding error:&error];
    NSArray *lines = [string componentsSeparatedByString:@"\n"];
    
    //output first definition to screen
    _wordDefBox.text = [NSString stringWithFormat:@"%@%@",_wordDefBox.text, lines[0]];
    _wordDefBox.text = [NSString stringWithFormat:@"%@%s",_wordDefBox.text, "\n"];
    _wordDefBox.text = [NSString stringWithFormat:@"%@%@",_wordDefBox.text, lines[1]];
    _wordDefBox.text = [NSString stringWithFormat:@"%@%s",_wordDefBox.text, "\n"];
}

//Button Function for the next button inside of Top picks for SAT button: First, it hides all of the necessary images and buttons. Then it opens the file and displays the following words in the list whenever it is pressed by maintaining a counter.
- (IBAction)nextSATAction:(id)sender {
    
    self.LearnWTitle.hidden = false;
    self.ArtPic.hidden = true;
    self.happyPic.hidden = true;
    self.PQPic.hidden = true;
    self.NegativePic.hidden = true;
    self.SATPic.hidden = true;
    self.ArtPress.hidden = true;
    self.HappyPress.hidden = true;
    self.PQPress.hidden = true;
    self.NegativePress.hidden = true;
    self.SATPress.hidden = true;
    self.nextPQButton.hidden = true;
    self.nextArtButton.hidden = true;
    self.nextSadButton.hidden = true;
    self.nextSATButton.hidden = false;
    self.nextHappyButton.hidden = true;
    self.finishButton.hidden = false;
    self.wordDefBox.hidden = false;
    
    //open file
    NSURL *myURL = [[NSBundle mainBundle]
                    URLForResource: @"SATList" withExtension:@"txt"];
    NSError *error = nil;
    NSString *string = [NSString stringWithContentsOfURL:myURL encoding:NSUTF8StringEncoding error:&error];
    NSArray *lines = [string componentsSeparatedByString:@"\n"];
    
    //displays words and definitions
    if(SATPressed * 2 < 334) {
        
        //output definition to screen
        _wordDefBox.text = @""; //clearing screen
        _wordDefBox.text = [NSString stringWithFormat:@"%@%@",_wordDefBox.text, lines[SATPressed * 2]];
        _wordDefBox.text = [NSString stringWithFormat:@"%@%s",_wordDefBox.text, "\n"];
        _wordDefBox.text = [NSString stringWithFormat:@"%@%@",_wordDefBox.text, lines[SATPressed * 2 + 1]];
        _wordDefBox.text = [NSString stringWithFormat:@"%@%s",_wordDefBox.text, "\n"];
        
        SATPressed++;
    }
    
    //resets the counter if the entire list has been displayed
    else if(SATPressed * 2 >= 334) {
        SATPressed = 0;
    }
    //error checking
    else {
        NSLog(@"Error");
    }
}

//Button Function for the finish button. First, it hides all of the necessary images and buttons. Then it resets the wordBox and all of the counters and then returns to the home page.
- (IBAction)FinishAction:(id)sender {
    
    //hiding all of the images
    self.LearnWTitle.hidden = false;
    self.ArtPic.hidden = true;
    self.happyPic.hidden = true;
    self.PQPic.hidden = true;
    self.NegativePic.hidden = true;
    self.SATPic.hidden = true;
    self.ArtPress.hidden = true;
    self.HappyPress.hidden = true;
    self.PQPress.hidden = true;
    self.NegativePress.hidden = true;
    self.SATPress.hidden = true;
    self.nextPQButton.hidden = true;
    self.nextArtButton.hidden = true;
    self.nextSadButton.hidden = true;
    self.nextSATButton.hidden = true;
    self.nextHappyButton.hidden = true;
    self.finishButton.hidden = false;
    self.wordDefBox.hidden = false;

    //clearing screen
     _wordDefBox.text = @"";
    
    //resetting counters back to 0
     artPressed = 0;
     sadCountPressed = 0;
     happyPressed = 0;
     pqPressed = 0;
     SATPressed = 0;
    
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
    self.LearnWTitle.hidden = false;
    self.ArtPic.hidden = false;
    self.happyPic.hidden = false;
    self.PQPic.hidden = false;
    self.NegativePic.hidden = false;
    self.SATPic.hidden = false;
    self.ArtPress.hidden = false;
    self.HappyPress.hidden = false;
    self.PQPress.hidden = false;
    self.NegativePress.hidden = false;
    self.SATPress.hidden = false;
    self.nextPQButton.hidden = true;
    self.nextArtButton.hidden = true;
    self.nextSadButton.hidden = true;
    self.nextSATButton.hidden = true;
    self.nextHappyButton.hidden = true;
    self.finishButton.hidden = true;
    self.wordDefBox.hidden = false;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
