//
//  ViewController.h
//  MusicTest
//
//  Created by Taylor Ledingham on 2014-11-13.
//  Copyright (c) 2014 Taylor Ledingham. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import <MediaPlayer/MediaPlayer.h>
#import <CoreMedia/CoreMedia.h>

@interface ViewController : UIViewController <MPMediaPickerControllerDelegate>

- (IBAction)prevButtonPressed:(id)sender;
- (IBAction)nextButtonPressed:(id)sender;
- (IBAction)playPauseButtonPressed:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *currentSongLabel;

@end

