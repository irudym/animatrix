//
//  ViewController.m
//  animatrix
//
//  Created by Igor on 24/12/2017.
//  Copyright © 2017 Igor Rudym. All rights reserved.
//

#import "ViewController.h"
#import "GameScene.h"

#import "MainMenu.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Load the SKScene from 'GameScene.sks'
    GameScene *scene = (GameScene *)[SKScene nodeWithFileNamed:@"GameScene"];
    
    // Set the scale mode to scale to fit the window
    scene.scaleMode = SKSceneScaleModeAspectFill;
    
    // Present the scene
    [self.skView presentScene:scene];
    
    self.skView.showsFPS = YES;
    self.skView.showsNodeCount = YES;
    
    
    
    //pass scene to mainmenu
    MainMenu *mainMenu = (MainMenu*) [[NSApplication sharedApplication] mainMenu];
    [mainMenu setAppScene: scene];
    
    [self.skView.window setAcceptsMouseMovedEvents: YES];
}

@end
