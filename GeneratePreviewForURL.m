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
	
	NSData *imageData = [Dot dataFromDotFile: (__bridge NSURL *)url];
	NSImage *imageForSize = [[NSImage alloc] initWithData: imageData];
	
	CGSize canvasSize = CGSizeMake(imageForSize.size.width,imageForSize.size.height);

    @autoreleasepool {
        // Preview will be drawn in a vectorized context
        CGContextRef cgContext = QLPreviewRequestCreateContext(preview, *(CGSize *)&canvasSize, false, NULL);
        if(cgContext) { 
            CGDataProviderRef imgDataProvider = CGDataProviderCreateWithCFData ((__bridge CFDataRef)imageData);
            CGPDFDocumentRef document = CGPDFDocumentCreateWithProvider(imgDataProvider);
			
            if (CGPDFDocumentGetNumberOfPages(document) > 0) {
                CGPDFPageRef page = CGPDFDocumentGetPage(document, 1);
                CGContextDrawPDFPage(cgContext, page);
            }
			
            QLPreviewRequestFlushContext(preview, cgContext);
            
            CGPDFDocumentRelease(document);
            CGDataProviderRelease(imgDataProvider);
            CFRelease(cgContext);
        }
    }
	
	return noErr;
}
	



void CancelPreviewGeneration(void* thisInterface, QLPreviewRequestRef preview)
{
    // implement only if supported
}
