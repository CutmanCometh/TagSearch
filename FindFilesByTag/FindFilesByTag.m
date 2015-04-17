//
//  FindFilesByTag.m
//  FindFilesByTag
//
//  Created by Josh Walker on 4/17/15.
//  Copyright (c) 2015 7 September Digital. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FindFilesByTag.h"

@implementation FindFilesByTag

-(NSArray*)findFilesIn:(NSURL *)directory withTag:(NSString *)tag
{
    NSMutableArray* matchingFiles = [[NSMutableArray alloc]init];
    
    NSFileManager* fileManager = [[NSFileManager alloc]init];
    NSArray* keys = [NSArray arrayWithObject:NSURLIsDirectoryKey];
    
    NSDirectoryEnumerator* enumerator = [fileManager enumeratorAtURL:directory includingPropertiesForKeys:keys options:0 errorHandler:^(NSURL* url, NSError* error){
        //TODO handle this error
        return NO;
    }];
    
    for(NSURL* file in enumerator)
    {
        NSNumber* isDirectoryNum = nil;
        
        //is is it directory
        BOOL isDirectory = [file getResourceValue:&isDirectoryNum forKey:NSURLIsDirectoryKey error:nil];
        if(isDirectory && [isDirectoryNum boolValue])
        {
            //YES! iterate through it
            [matchingFiles addObjectsFromArray:[self findFilesIn:file withTag:tag]];
        }
        
        //we DON'T need an if else here. if else would mean, if it's a directory, scour it, otherwise check if if is tagged with our parameter. since the directory itself could be tagged, we need to ALSO check for a tag on the directory. an else clause would prevent this
        if([FindFilesByTag file:file isTaggedWith:tag])
           [matchingFiles addObject:file];
        
    }
    
    
    return matchingFiles;
}

+(BOOL)file:(NSURL *)file isTaggedWith:(NSString *)tag
{
    
    NSArray* tags = [FindFilesByTag getTagsForFile:file];
    
    for(NSString* fileTag in tags)
    {
        if([fileTag isEqualToString:tag])
            return YES;
    }
    
    return NO;
}

+(NSArray*)getTagsForFile:(NSURL *)file
{
    //NSDictionary* dictionary =
    return [[file resourceValuesForKeys:[NSArray arrayWithObject:NSURLTagNamesKey] error:nil]valueForKey:NSURLTagNamesKey];
    
    //return [dictionary valueForKey:NSURLTagNamesKey];
}

-(id)init
{
    self = [super init];
    
    //TODO init the array
    
    return self;
}

-(id)initWithOptions:(NSDictionary *)options
{
    self = [super init];
    
    //TODO init the options
    
    return self;
}

@end