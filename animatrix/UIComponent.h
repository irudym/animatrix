//
//  UIComponent.h
//  animatrix
//
//  Created by Igor on 25/12/2017.
//  Copyright © 2017 Igor Rudym. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "UIProtocol.h"

@interface UIComponent : SKSpriteNode <UIProtocol>
+(id) createWithTexture: (SKTexture*) texture;
-(void) performAction;
-(void) onMouseHoverAt:(CGPoint)mouse;
// -(void) setAction: (void (^)(void))actionBlock;

@property void (^action)(void);

@end
