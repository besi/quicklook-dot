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
    NSTask *task;
    task = [[NSTask alloc] init];
    [task setLaunchPath: @"/usr/bin/dot"];
	
    NSArray *arguments;	
	NSString *dotPath = [dotFile path];
	
	NSLog(@"Path: %@",dotPath);
	
	
    arguments = [NSArray arrayWithObjects:dotPath, @"-Tpng", nil];
    [task setArguments: arguments];
	
    NSPipe *pipe;
    pipe = [NSPipe pipe];
    [task setStandardOutput: pipe];
	
    NSFileHandle *file;
    file = [pipe fileHandleForReading];
	
    [task launch];
	
	return [file readDataToEndOfFile];
}


@end
