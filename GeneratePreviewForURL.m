#include <CoreFoundation/CoreFoundation.h>
#include <CoreServices/CoreServices.h>
#include <QuickLook/QuickLook.h>
#include <Foundation/Foundation.h>
#include <AppKit/AppKit.h>
#include "Dot.h"

/* -----------------------------------------------------------------------------
   Generate a preview for file

   This function's job is to create preview for designated file
   ----------------------------------------------------------------------------- */


OSStatus GeneratePreviewForURL(void *thisInterface, QLPreviewRequestRef preview, CFURLRef url, CFStringRef contentTypeUTI, CFDictionaryRef options)
{
		
	CGSize canvasSize = CGSizeMake(400,400);

	NSAutoreleasePool* pool = [[NSAutoreleasePool alloc] init];
	
	
	// Preview will be drawn in a vectorized context
	CGContextRef cgContext = QLPreviewRequestCreateContext(preview, *(CGSize *)&canvasSize, true, NULL);
	if(cgContext) { 
			
		NSData *imageData = [Dot dataFromDotFile: (NSURL *)url ];

			
		CGDataProviderRef imgDataProvider = CGDataProviderCreateWithCFData ((CFDataRef)imageData);
		CGImageRef image = CGImageCreateWithPNGDataProvider(imgDataProvider, NULL, true, kCGRenderingIntentDefault);
			
			
		CGContextDrawImage(cgContext,CGRectMake(0, 0, 400, 400), image);
			
		QLPreviewRequestFlushContext(preview, cgContext); CFRelease(cgContext);
	} 
	
	[pool release]; 
	
	return noErr;
	
}
	



void CancelPreviewGeneration(void* thisInterface, QLPreviewRequestRef preview)
{
    // implement only if supported
}
