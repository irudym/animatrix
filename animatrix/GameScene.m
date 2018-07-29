//
//  GameScene.m
//  animatrix
//
//  Created by Igor on 24/12/2017.
//  Copyright © 2017 Igor Rudym. All rights reserved.
//

#import "GameScene.h"
#import "SharedTextureAtlas.h"

@implementation GameScene {
    SKLabelNode *_label;
    SKLabelNode *_frameCountLabel;
    SKTextureAtlas *atlas;
}

@synthesize animationFrames;
@synthesize animationBox;
@synthesize currentFrame;

- (void)didMoveToView:(SKView *)view {
    // Setup your scene here
    
    // Get label node from scene and store it for use later
    _label = (SKLabelNode *)[self childNodeWithName:@"//titleLabel"];
    _frameCountLabel = (SKLabelNode *)[self childNodeWithName:@"//frameCountLabel"];
    
    
    _label.alpha = 0.0;
    [_label runAction:[SKAction fadeInWithDuration:2.0]];
    
    [self setCurrentFrame:0];
    
    animationBox = nil;
    [self setAnimationSpeed:0.05f];
    
    [SharedTextureAtlas loadAtlas:@"ui"];
    atlas = [SharedTextureAtlas getAtlasByName:@"ui"];
    
    //create UI
    _mainUI = [[UI alloc] init];
    [self addChild: _mainUI];
    
    UIComponent* playButton = [UIComponent createWithTexture:[atlas textureNamed:@"ui-play"]];
    playButton.position = CGPointMake(50, 630);
    [playButton setAction:^{
        NSLog(@"Perform play action");
        if (animationBox!=nil) [animationBox play];
    }];
    [playButton performAction];
    
    [_mainUI addChild: playButton];
    
    UIComponent* stopButton = [UIComponent createWithTexture:[atlas textureNamed:@"ui-stop"]];
    stopButton.position = CGPointMake(112, 630);
    [stopButton setAction:^{
        if (animationBox!=nil) {
            [animationBox stop];
            [self setCurrentFrame:0];
            [self updateFrameCountLabel];
        }
    }];
    [_mainUI addChild: stopButton];
    
    UIComponent* bstepButton = [UIComponent createWithTexture:[atlas textureNamed:@"ui-step-b"]];
    bstepButton.position = CGPointMake(204, 630);
    [bstepButton setAction:^{
        if (animationBox!=nil) {
            [animationBox stop];
            [self prevFrame];
            [animationBox setFrameNumber: self.currentFrame];
        }
    }];
    [_mainUI addChild: bstepButton];
    
    UIComponent* fstepButton = [UIComponent createWithTexture:[atlas textureNamed:@"ui-step-f"]];
    fstepButton.position = CGPointMake(320, 630);
    [fstepButton setAction:^{
        if( animationBox!= nil) {
            [animationBox stop];
            [self nextFrame];
            [animationBox setFrameNumber: self.currentFrame];
        }
    }];
    [_mainUI addChild: fstepButton];
}

-(void) setAnimation: (NSMutableArray*) frames {
    [self setAnimationFrames:frames];
    if(self.animationBox != nil) {
        [self.animationBox removeAllActions];
        [self.animationBox removeFromParent];
    }
    [self setAnimationBox:[AnimationBox createWithFrames:frames]];
    [self addChild: self.animationBox];
    [animationBox setPosition:CGPointMake(80, 280)];
    
    [self setCurrentFrame:0];
}

-(int) nextFrame {
    self.currentFrame += 1;
    if(self.currentFrame >= [[self animationFrames] count]) {
        self.currentFrame = 0;
    }
    [self updateFrameCountLabel];
    return self.currentFrame;
}

-(int) prevFrame {
    currentFrame -= 1;
    if( self.currentFrame < 0) {
        self.currentFrame = [[self animationFrames] count] - 1;
    }
    [self updateFrameCountLabel];
    return self.currentFrame;
}

-(void) updateFrameCountLabel {
    [_frameCountLabel setText:[NSString stringWithFormat:@"%d", self.currentFrame]];
}


- (void)touchDownAtPoint:(CGPoint)pos {
    [_mainUI onMouseAtPoint:pos];
}

- (void)touchMovedToPoint:(CGPoint)pos {
    
}

- (void)touchUpAtPoint:(CGPoint)pos {
    [_mainUI onMouseClickAtPoint:pos];
}

- (void)movedAtPoint: (CGPoint)pos {
    [_mainUI onMouseAtPoint:pos];
}

- (void)keyDown:(NSEvent *)theEvent {
}

- (void)mouseDown:(NSEvent *)theEvent {
    [self touchDownAtPoint:[theEvent locationInNode:self]];
}
- (void)mouseDragged:(NSEvent *)theEvent {
    [self touchMovedToPoint:[theEvent locationInNode:self]];
}
- (void)mouseUp:(NSEvent *)theEvent {
    [self touchUpAtPoint:[theEvent locationInNode:self]];
}

-(void)mouseMoved:(NSEvent *)theEvent {
    NSLog(@"Mouse move event");
    [self movedAtPoint:[theEvent locationInNode: self]];
}


-(void)update:(CFTimeInterval)currentTime {
    // Called before each frame is rendered
}

@end
