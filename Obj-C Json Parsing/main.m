//
//  main.m
//  Obj-C Json Parsing
//
//  Created by Consultant on 1/10/23.
//

#import <Foundation/Foundation.h>
#import <stdio.h>

void getJSON(void)
{
    NSString *urlString = @"https://api.themoviedb.org/3/movie/popular?api_key=44c6646d5f54689bfe347b17860dcc67&language=en-US&page=1";
    NSURL *url = [NSURL URLWithString: urlString];
    
    [[NSURLSession.sharedSession dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        NSError *err;
        NSDictionary *popularData = [NSJSONSerialization JSONObjectWithData: data options: NSJSONReadingAllowFragments error: &err];
        if(err)
        {
            NSLog(@"Failed: %@", err);
            return;
        }
        
        for(id key in popularData)
        {
            NSLog(@"%@: %@", key, [popularData objectForKey:key]);
        }
        
    }] resume];
}


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
    }
    
    getJSON();
    
    for(long i = 0; i < 10000000000; i++)
    {
        ;
    }
    
    return 0;
}
