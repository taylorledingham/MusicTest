//
//  ViewController.m
//  MusicTest
//
//  Created by Taylor Ledingham on 2014-11-13.
//  Copyright (c) 2014 Taylor Ledingham. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@property (strong, nonatomic) NSArray* songsArray;
@property (strong, nonatomic) MPMediaItemCollection *items;

@end

@implementation ViewController {
    
    MPMediaPickerController *picker;
    MPMediaPlaylist *playlist;
    MPMusicPlayerController *player;
    AVPlayer *audioPlayer;

    BOOL isPaused;


}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.songsArray = [[NSMutableArray alloc]init];
    player = [MPMusicPlayerController applicationMusicPlayer];
    [self showMediaPicker];
    

    
    
}


- (void) showMediaPicker
{
    picker =
    [[MPMediaPickerController alloc] initWithMediaTypes: MPMediaTypeAnyAudio];
    
    [[picker view] setFrame:CGRectMake(0, 0, 320, 480)];
    
    picker.delegate  = self;
    picker.allowsPickingMultipleItems = YES;
    picker.prompt      = NSLocalizedString (@"AddSongsPrompt", @"Prompt to user to choose some songs to play");
    picker.showsCloudItems = NO;
    [self presentViewController:picker animated:YES completion:nil];
}


- (void) mediaPicker: (MPMediaPickerController *) mediaPicker
   didPickMediaItems: (MPMediaItemCollection *) collection
{
    [self dismissViewControllerAnimated:YES completion:nil];
    self.songsArray = [collection items] ;
    self.items = collection;
    [self setUpPlayer];
    
}

-(void)setUpPlayer {
    
    [player setQueueWithItemCollection:self.items];
    [player setShuffleMode:MPMusicShuffleModeSongs];
    [player prepareToPlay];
    float prevState = player.currentPlaybackRate;
    [player play];
    isPaused = NO;
    MPMediaItem *item = self.songsArray[[player indexOfNowPlayingItem]];
    self.currentSongLabel.text = [NSString stringWithFormat: @"Current Song: %@", item.title];
    while (player.currentPlaybackRate == prevState) {
        
    }

    [player setCurrentPlaybackRate:1.3];


}



- (void)mediaPickerDidCancel:(MPMediaPickerController *)mediaPicker
{
    [self dismissMoviePlayerViewControllerAnimated];
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)prevButtonPressed:(id)sender {
        NSLog(@"before: %f ", player.currentPlaybackRate);
        float prevState = player.currentPlaybackRate;
        [player skipToPreviousItem];
        while (player.currentPlaybackRate != 1.0 ) {
            
        }

        [player setCurrentPlaybackRate:1.3f];
        NSLog(@"after: %f ", player.currentPlaybackRate);
}

- (IBAction)nextButtonPressed:(id)sender {

    NSLog(@"before: %f ", player.currentPlaybackRate);
    float prevState = player.currentPlaybackRate;
    [player skipToNextItem];
    while (player.currentPlaybackRate == prevState) {
        
    }

    [player setCurrentPlaybackRate:1.3];
    NSLog(@"after: %f ", player.currentPlaybackRate);

}

- (IBAction)playPauseButtonPressed:(id)sender {
    
    if(isPaused == NO){
        [player pause];
        isPaused = YES;
    }
    else {
        [player play];
        isPaused = NO;
    }
}
@end
