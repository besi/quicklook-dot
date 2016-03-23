//
//  Dot.h
//  quicklook-dot
//
//  Created by Besi on 09.03.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface Dot : NSObject {
}

+(NSData *)dataFromDotFile:(NSURL *)dotFile withTimeout:(int)timeout;

@end
