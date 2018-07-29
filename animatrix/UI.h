//
//  UI.h
//  animatrix
//
//  Created by Igor on 25/12/2017.
//  Copyright © 2017 Igor Rudym. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface UI : SKNode

-(id)init;

-(void) onMouseAtPoint: (CGPoint) mouse;
-(void) onMouseClickAtPoint: (CGPoint) mouse;

@end
