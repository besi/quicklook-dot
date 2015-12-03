//
//  Dot.m
//  quicklook-dot
//
//  Created by Besi on 09.03.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Dot.h"


@implementation Dot

+(NSData *)dataFromDotFile:(NSURL *)dotFile withTimeout:(int)timeout
{
    NSPipe *pipe = [NSPipe pipe];
    NSTask *task = [[NSTask alloc] init];

    NSString *format = @"perl -e 'alarm %d; exec @ARGV' 'dot -Tpdf \"%@\"'";
    NSString *command = [NSString stringWithFormat:format, timeout, [dotFile path]];

    [task setLaunchPath:@"/bin/bash"];
    [task setArguments:@[@"-l", @"-c", command]];
    [task setStandardOutput:pipe];

    [task launch];

    return [[pipe fileHandleForReading] readDataToEndOfFile];
}

@end
