//
//  UI.m
//  animatrix
//
//  Created by Igor on 25/12/2017.
//  Copyright © 2017 Igor Rudym. All rights reserved.
//

#import "UI.h"
#import "UIComponent.h"

@implementation UI
{
    NSMutableArray* uiComponents;
}

-(id) init {
    self = [super init];
    if(self == nil) return nil;
    
    uiComponents = [NSMutableArray array];
    
    return self;
}

-(void) onMouseAtPoint: (CGPoint) mouse {
    UIComponent *component = (UIComponent*)[self nodeAtPoint:mouse];
    if(component != nil) {
        if ([component.userData[@"type"] isEqualToString:@"UI"]) {
            [component onMouseHoverAt: mouse];
        }
    }
}

-(void) onMouseClickAtPoint: (CGPoint) mouse {
    // select the ui component
    UIComponent *component = (UIComponent*)[self nodeAtPoint:mouse];
    if(component != nil) {
        NSLog(@"Node type: %@", component.userData[@"type"]);
        if ([component.userData[@"type"] isEqualToString:@"UI"]) {
            [component performAction];
        }
    }
}


@end
