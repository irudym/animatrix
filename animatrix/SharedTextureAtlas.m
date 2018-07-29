//
//  SharedTextureAtlas.m
//  animatrix
//
//  Created by Igor on 24/12/2017.
//  Copyright © 2017 Igor Rudym. All rights reserved.
//

#import "SharedTextureAtlas.h"

extern NSMutableDictionary* gSharedTextures = nil;

@implementation SharedTextureAtlas

+(void) initSharedAtlas {
    gSharedTextures = [[NSMutableDictionary alloc] init];
}

+(void) addAtlas: (SKTextureAtlas*) atlas WithName: (NSString*)atlasName {
    if(!gSharedTextures) [SharedTextureAtlas initSharedAtlas];
    [gSharedTextures setObject: atlas forKey: atlasName];
}

+(SKTextureAtlas*) getAtlasByName: (NSString*) name {
    return gSharedTextures[name];
}

+(SKTextureAtlas*) loadAtlas:(NSString *)atlasName {
    SKTextureAtlas* atlas = [SKTextureAtlas atlasNamed:atlasName];
    if(atlas) [SharedTextureAtlas addAtlas:atlas WithName:atlasName];
    return atlas;
}

@end
