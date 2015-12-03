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
    NSData *data = [Dot dataFromDotFile:(__bridge NSURL *)url];

    if ([data length] > 0) {
        QLPreviewRequestSetDataRepresentation(preview, (__bridge CFDataRef)data, kUTTypePDF, NULL);
    } else {
        NSData *txtData = [NSData dataWithContentsOfURL:(__bridge NSURL *)url];
        QLPreviewRequestSetDataRepresentation(preview, (__bridge CFDataRef)txtData, kUTTypeUTF8PlainText, NULL);
    }

	return noErr;
}

void CancelPreviewGeneration(void* thisInterface, QLPreviewRequestRef preview)
{
    // implement only if supported
}
