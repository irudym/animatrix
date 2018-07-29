//
//  MainMenu.m
//  animatrix
//
//  Created by Igor on 24/12/2017.
//  Copyright © 2017 Igor Rudym. All rights reserved.
//

#import "MainMenu.h"
#import <SpriteKit/SpriteKit.h>

#import "GameScene.h"


@implementation MainMenu

@synthesize appScene;

- (IBAction)openFolder:(id)pId; {
    // SKSpriteNode* sprite = [SKSpriteNode spriteNodeWithImageNamed:@"test.png"];
    // [appScene addChild:sprite];
    NSURL *path = [self getPath];
    if(path) {
        NSLog(@"Selected folder: %@", [path path]);
        NSMutableArray* animationFrames = [NSMutableArray array];
        
        //get list of files and add them to animation
        NSFileManager *fileManager = [NSFileManager defaultManager];
        NSArray *keys = [NSArray arrayWithObject:NSURLIsDirectoryKey];
        NSDirectoryEnumerator *enumerator = [fileManager
                                            enumeratorAtURL:path
                                            includingPropertiesForKeys:keys
                                            options:0
                                            errorHandler:^(NSURL *url, NSError *error) {
                                                // Handle the error.
                                                // Return YES if the enumeration should continue after the error.
                                                NSLog(@"ERROR at %@: %@", [url path], [error domain]);
                                                return YES;
                                            }];
        for (NSURL *url in enumerator) {
            NSError *error;
            NSNumber *isDirectory = nil;
            if (! [url getResourceValue:&isDirectory forKey:NSURLIsDirectoryKey error:&error]) {
                NSLog(@"ERROR while iterate files: %@", [error domain]);
            }
            else if (! [isDirectory boolValue]) {
                // No error and it’s not a directory; do something with the file
                NSLog(@"Load file: %@", [url path]);
                [animationFrames addObject:[SKTexture textureWithImageNamed:[url path]]];
            }
        }
        // add animation to the scene
        [(GameScene*)appScene setAnimation:animationFrames];
    }
}

- (NSURL*)getPath {
    NSOpenPanel *panel = [NSOpenPanel openPanel];
    [panel setAllowsMultipleSelection:NO];
    [panel setCanChooseDirectories:YES];
    [panel setCanChooseFiles:NO];
    if ([panel runModal] != NSFileHandlingPanelOKButton) return nil;
    return [[panel URLs] lastObject];
}

@end
