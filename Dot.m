//
//  Dot.m
//  quicklook-dot
//
//  Created by Besi on 09.03.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Dot.h"


@implementation Dot

+(NSData *)dataFromDotFile: (NSURL *) dotFile
{
    NSPipe *pipe = [NSPipe pipe];
    NSTask *task = [[NSTask alloc] init];

    NSString *command = [NSString stringWithFormat:@"dot -Tpdf %@", [dotFile path]];

    [task setLaunchPath:@"/bin/bash"];
    [task setArguments:@[@"-l", @"-c", command]];
    [task setStandardOutput:pipe];

    [task launch];

    return [[pipe fileHandleForReading] readDataToEndOfFile];
}

@end
