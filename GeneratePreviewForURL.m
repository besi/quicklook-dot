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

    @autoreleasepool {
        CGDataProviderRef imgDataProvider = CGDataProviderCreateWithCFData((__bridge CFDataRef)imageData);
        CGPDFDocumentRef document = CGPDFDocumentCreateWithProvider(imgDataProvider);

        if (CGPDFDocumentGetNumberOfPages(document) > 0) {
            CGPDFPageRef page = CGPDFDocumentGetPage(document, 1);
            CGRect pageRect = CGPDFPageGetBoxRect(page, kCGPDFMediaBox);

            CGContextRef cgContext = QLPreviewRequestCreateContext(preview, *(CGSize *)&pageRect.size, false, NULL);
            if (cgContext) {
                CGContextDrawPDFPage(cgContext, page);
                QLPreviewRequestFlushContext(preview, cgContext);

                CFRelease(cgContext);
            }
        }

        CGPDFDocumentRelease(document);
        CGDataProviderRelease(imgDataProvider);
    }

	return noErr;
}

void CancelPreviewGeneration(void* thisInterface, QLPreviewRequestRef preview)
{
    // implement only if supported
}
