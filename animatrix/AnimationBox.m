//
//  AnimationBox.m
//  animatrix
//
//  Created by Igor on 25/12/2017.
//  Copyright © 2017 Igor Rudym. All rights reserved.
//

#import "AnimationBox.h"

@implementation AnimationBox
{
    SKAction* action;
}
@synthesize animationFrames;
@synthesize animationSpeed;

+(id) createWithFrames: (NSArray*) frames {
    AnimationBox* box = [[AnimationBox alloc] initWithTexture:[frames objectAtIndex:0]];
    if(box == nil) return nil;
    
    [box setAnimationFrames:frames];
    
    SKTexture* frame = [frames objectAtIndex:0];
    CGSize rectSize = [frame size];
    
    [box setAnimationSpeed:0.05f];
    [box play];
    box.anchorPoint = CGPointMake(0, 0);
    
    //add frame around the node
    SKShapeNode *rect = [[SKShapeNode alloc] init];
    CGMutablePathRef myPath = CGPathCreateMutable();
    CGPathAddRect(myPath, nil, CGRectMake(0,0, rectSize.width+60, rectSize.height+60));
    rect.path = myPath;
    rect.lineWidth = 2.0;
    rect.strokeColor = [SKColor grayColor];
    [rect setPosition:CGPointMake(-30, -30)];
    [box addChild: rect];
    return box;
}

-(void) setFrame: (SKTexture*) frame {
    //NSLog(@"Call setFrame...");
    [self setTexture:frame];
    [self setSize: [frame size]];
}

-(void) setFrameNumber:(int)frameNum {
    [self setFrame: [animationFrames objectAtIndex:frameNum]];
}

-(void) play {
    SKAction *action = [SKAction repeatActionForever: [SKAction animateWithTextures: animationFrames timePerFrame:self.animationSpeed]];
    [self runAction:action];
}

-(void) stop {
    [self removeAllActions];
    [self setFrameNumber:0];
}

@end
