//
//  SharedTextureAtlas.h
//  animatrix
//
//  Created by Igor on 24/12/2017.
//  Copyright © 2017 Igor Rudym. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SpriteKit/SpriteKit.h>

@interface SharedTextureAtlas : NSObject

+(void) initSharedAtlas;
+(void) addAtlas: (SKTextureAtlas*) atlas WithName: (NSString*)atlasName;
+(SKTextureAtlas*) getAtlasByName: (NSString*)name;

+(SKTextureAtlas*) loadAtlas: (NSString*)atlasName;

@end
