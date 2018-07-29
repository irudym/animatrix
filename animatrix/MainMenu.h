//
//  MainMenu.h
//  animatrix
//
//  Created by Igor on 24/12/2017.
//  Copyright © 2017 Igor Rudym. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <SpriteKit/SpriteKit.h>


@interface MainMenu : NSMenu

- (IBAction)openFolder:(id)pId;
- (NSURL*)getPath;

@property SKScene* appScene;

@end
