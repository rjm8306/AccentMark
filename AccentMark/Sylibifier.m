
    //
    //  Sylibifier.m
    //  AccentMark
    //
    //  Created by Robert Millar on 6/21/13.
    //  Copyright (c) 2013 Robert Millar. All rights reserved.
    //

#import "Sylibifier.h"
#import "LearnToMarkWordsViewController.h"
#import "EnterAccentViewController.h"



@implementation Sylibifier
-(void)setWord:(NSString*)words
{
    words = word;
    
}

+(NSString *) sylibify:(NSString *)words
{
    //NSLog(@"inside sylibify");
    
    //NSLog(@"%@", words);
    
        //Step 2
        //if word begins with prefix
        //    if ([words hasPrefix: @"circun"])
        //    {
        //        NSLog(@"IF statement");
        //        NSString *sylibifyWord = @"circun ";
        //        words =[words substringFromIndex: 6];
        //
        //    }
        //    else if ([words hasPrefix: @"cuadri"])
        //    {
        //        NSString *sylibifyWord = @"circun ";
        //        words =[words substringFromIndex: 6];
        //  }
        //
        //expand to include all prefixs
        //
    
    
        //Step 3 and step 4 skip
    NSMutableArray *characters;
    NSString *sylable;
    NSString *sylable1;
    NSString *sylable2;
    NSString *sylable3;
    NSString *temp;
    int count;
    int i;
    int j;
    int k;
    int firstVowel=0;
        //step 5
    characters = [[NSMutableArray alloc] initWithCapacity:[words length]+20];
    
    //int counter = [words length];
//    NSLog(@"counter %d", counter);
    
        //possible problem
    for (int i=0; i < [words length]; i++){//put into array
        NSString *temp  = [NSString stringWithFormat:@"%c", [words characterAtIndex:i]];
        if (i<[words length]-1) {
            NSString *temp1 = [NSString stringWithFormat:@"%c", [words characterAtIndex:i+1]];//char at i +1
            temp1 =  [NSString stringWithFormat:@"%@%@", temp , temp1];
                //put ch, ll, rr into one index so they will be treated as a single consinent
            if ([temp1 isEqualToString:@"ch"] || [temp1 isEqualToString:@"ll"] || [temp1 isEqualToString:@"rr"]) {
                [characters addObject:temp1];
                i++;
            } else {
                [characters addObject:temp];
            }
            
        } else{
            [characters addObject:temp];
  
        }
    

        
     //   NSLog(@"%@", temp);
     //   NSLog(@"i=%d", i);
     //   NSLog(@"added");
    }//string now in array
    [characters arrayByAddingObject:@" "];
    [characters arrayByAddingObject:@" "];
    [characters arrayByAddingObject:@" "];
    [characters arrayByAddingObject:@" "];
    //NSLog(@"%@", characters);
    for (int i=0; i < [characters count]; i++){
        if ([[characters objectAtIndex:i] isEqualToString:@"·"])
            [characters replaceObjectAtIndex:i withObject:@"á"];
        
        if ([[characters objectAtIndex:i] isEqualToString:@"È"])
            [characters replaceObjectAtIndex:i withObject:@"é"];
        
        if ([[characters objectAtIndex:i] isEqualToString:@"Ì"])
            [characters replaceObjectAtIndex:i withObject:@"í"];
        
        if ([[characters objectAtIndex:i] isEqualToString:@"Û"])
            [characters replaceObjectAtIndex:i withObject:@"ó"];
        
        if ([[characters objectAtIndex:i] isEqualToString:@"˙"])
            [characters replaceObjectAtIndex:i withObject:@"ú"];
        
        if ([[characters objectAtIndex:i] isEqualToString:@"Ò"])
            [characters replaceObjectAtIndex:i withObject:@"ñ"];
    }
//    NSLog(@"%@", characters);
//    for (i=0; i< [words length]-1; i++)
//    {
//        char test = [words characterAtIndex:i];
//        NSLog(@"char = %c", test);
//    }
    for (i=0; i<[characters count]; i++) {
        if ([[characters objectAtIndex:i] isEqualToString:@"a"] ||
            [[characters objectAtIndex:i] isEqualToString:@"e"] ||
            [[characters objectAtIndex:i] isEqualToString:@"i"] ||
            [[characters objectAtIndex:i] isEqualToString:@"o"] ||
            [[characters objectAtIndex:i] isEqualToString:@"u"] ||
            [[characters objectAtIndex:i] isEqualToString:@"á"] ||
            [[characters objectAtIndex:i] isEqualToString:@"é"] ||
            [[characters objectAtIndex:i] isEqualToString:@"í"] ||
            [[characters objectAtIndex:i] isEqualToString:@"ó"] ||
            [[characters objectAtIndex:i] isEqualToString:@"ú"] ){
            firstVowel = i;
  //          NSLog(@"%d firstvowel", firstVowel);
        break;
        }//for loop
    }//end if statement
    //for (i=firstVowel; i< [words length]; i++) {
    //int charCount = [characters count];
    //charCount--;
   // int charactersCount = [characters count];
    for (i=firstVowel; i<[characters count]-1; i++) {
     //   NSLog(@"%lu", (unsigned long)[characters count]);
     //   charactersCount = [characters count];
     //   NSLog(@"char = %@", [characters objectAtIndex:i]);

        if (!([[characters objectAtIndex:i] isEqualToString:@"a"] ||
              [[characters objectAtIndex:i] isEqualToString:@"e"] ||
              [[characters objectAtIndex:i] isEqualToString:@"i"] ||
              [[characters objectAtIndex:i] isEqualToString:@"o"] ||
              [[characters objectAtIndex:i] isEqualToString:@"u"] ||
              [[characters objectAtIndex:i] isEqualToString:@"á"] ||
              [[characters objectAtIndex:i] isEqualToString:@"é"] ||
              [[characters objectAtIndex:i] isEqualToString:@"í"] ||
              [[characters objectAtIndex:i] isEqualToString:@"ó"] ||
              [[characters objectAtIndex:i] isEqualToString:@"ú"] ||
              [[characters objectAtIndex:i] isEqualToString:@" "] )){
           // if (i<[characters count]-2) {
                if (!([[characters objectAtIndex:i+1] isEqualToString:@"a"] ||
                  [[characters objectAtIndex:i+1] isEqualToString:@"e"] ||
                  [[characters objectAtIndex:i+1] isEqualToString:@"i"] ||
                  [[characters objectAtIndex:i+1] isEqualToString:@"o"] ||
                  [[characters objectAtIndex:i+1] isEqualToString:@"u"] ||
                  [[characters objectAtIndex:i+1] isEqualToString:@"á"] ||
                  [[characters objectAtIndex:i+1] isEqualToString:@"é"] ||
                  [[characters objectAtIndex:i+1] isEqualToString:@"í"] ||
                  [[characters objectAtIndex:i+1] isEqualToString:@"ó"] ||
                  [[characters objectAtIndex:i+1] isEqualToString:@"ú"] ||
                  [[characters objectAtIndex:i+1] isEqualToString:@" "] )){
                    if (!([[characters objectAtIndex:i+2] isEqualToString:@"a"] ||
                      [[characters objectAtIndex:i+2] isEqualToString:@"e"] ||
                      [[characters objectAtIndex:i+2] isEqualToString:@"i"] ||
                      [[characters objectAtIndex:i+2] isEqualToString:@"o"] ||
                      [[characters objectAtIndex:i+2] isEqualToString:@"u"] ||
                      [[characters objectAtIndex:i+2] isEqualToString:@"á"] ||
                      [[characters objectAtIndex:i+2] isEqualToString:@"é"] ||
                      [[characters objectAtIndex:i+2] isEqualToString:@"í"] ||
                      [[characters objectAtIndex:i+2] isEqualToString:@"ó"] ||
                      [[characters objectAtIndex:i+2] isEqualToString:@"ú"]||
                      [[characters objectAtIndex:i+1] isEqualToString:@" "])) {
                            //possible problem word = abril
                        if (([[characters objectAtIndex:i+2] isEqualToString:@"l"] ||
                             [[characters objectAtIndex:i+2] isEqualToString:@"r"])) {
                            [characters insertObject:@" " atIndex:(i+1)];
          //                  NSLog(@"loop i+2 = l or r");
                  //              NSLog(@"space1");
                                //NSLog(@"%d", i);
                            i++;
                               //  break;
                            
                        } else {
                            [characters insertObject:@" " atIndex:(i+2)];
        //                    NSLog(@"loop i+2 != l or r");
                   //             NSLog(@"space2");
                                //NSLog(@"%d", i);
                            i=i+2;
                        }
                    } else {
                        if (([[characters objectAtIndex:i+1] isEqualToString:@"l"] ||
                         [[characters objectAtIndex:i+1] isEqualToString:@"r"])) {
                        [characters insertObject:@" " atIndex:(i+1)];//12/27 changed from i to i+1
     // NSLog(@"in right loop i+1 = l or r");
                            i=i+2;
                         //       NSLog(@"space3");
                                //NSLog(@"%d", i);
                          //  i=i++;
                        } else {
                            [characters insertObject:@" " atIndex:(i+1)];
             //                   NSLog(@"space4");
                                //NSLog(@"%d", i+1);
                            i=i+2;
                      //  break;
                        }
                    }
                } else {//second if
                        //NSLog(@"space5");
                        //NSLog(@"%d", i);
                    [characters insertObject:@" " atIndex:(i)];
                    i++;
                        // break;
                }
         //   }
        }
    }//end first if
        //end step 5
    
 
    
        //step 7
    //NSLog(@"step 7");
    count = [characters count]-1;
    for (i=1; i<count; i++) {
            //looking for guí or quí
        if (i<[characters count]-2) {
            if (([[characters objectAtIndex:(i)] isEqualToString:@"q"] || [[characters objectAtIndex:(i)] isEqualToString:@"g"])  && ([[characters objectAtIndex:(i+1)] isEqualToString:@"u"]) &&  ([[characters objectAtIndex:(i+2)] isEqualToString:@"í"])){
                [characters insertObject:@" " atIndex:(i+3)];
                i=i+3;
                
            }
        }
        
        if (([[characters objectAtIndex:i] isEqualToString:@"a"] || [[characters objectAtIndex:i] isEqualToString:@"e"] || [[characters objectAtIndex:i] isEqualToString:@"i"] || [[characters objectAtIndex:i] isEqualToString:@"o"] || [[characters objectAtIndex:i] isEqualToString:@"u"]) && (i<[characters count]-1)) {
            if ([[characters objectAtIndex:i+1] isEqualToString:@"í"] || [[characters objectAtIndex:i+1] isEqualToString:@"ú"]) {
                [characters insertObject:@" " atIndex:(i+1)];
            //    NSLog(@"space6");
              //  NSLog(@"%d", i);
            }
        } else {
            if ([[characters objectAtIndex:i] isEqualToString:@"í"] || [[characters objectAtIndex:i] isEqualToString:@"ú"]) {
                if ([[characters objectAtIndex:(i+1)] isEqualToString:@"a"] || [[characters objectAtIndex:(i+1)] isEqualToString:@"e"] || [[characters objectAtIndex:(i+1)] isEqualToString:@"i"] || [[characters objectAtIndex:(i+1)] isEqualToString:@"o"] || [[characters objectAtIndex:(i+1)] isEqualToString:@"u"]) {
                    [characters insertObject:@" " atIndex:(i+1)];
           //         NSLog(@"space7");
           //         NSLog(@"%d", i);
                    i=i+1;
                }
            }
        }
        if ([[characters objectAtIndex:(i)] isEqualToString:@"a"] || [[characters objectAtIndex:(i)] isEqualToString:@"e"] || [[characters objectAtIndex:(i)] isEqualToString:@"o"]) {
            if ([[characters objectAtIndex:(i+1)] isEqualToString:@"a"] || [[characters objectAtIndex:(i+1)] isEqualToString:@"e"] || [[characters objectAtIndex:(i+1)] isEqualToString:@"o"] || [[characters objectAtIndex:(i+1)] isEqualToString:@"á"] || [[characters objectAtIndex:(i+1)] isEqualToString:@"é"] || [[characters objectAtIndex:(i+1)] isEqualToString:@"ó"] ) {
                [characters insertObject:@" " atIndex:(i+1)];
                i=i+1;
            }
        }
   
    //    NSLog(@"end step 7");
    } //end step 7 for loop
      //trim spaces
    while ([[characters objectAtIndex:(0)] isEqualToString:@" "]) {
        [characters removeObject:0];
    }
    while ([[characters lastObject] isEqualToString:@" "]) {
        [characters removeLastObject];
    }
    
    count = [characters count]-1;
    for (i=0; i< count; i++) {
        if ([[characters objectAtIndex:(i)] isEqualToString:@" "]) {
            if ([[characters objectAtIndex:(i+1)] isEqualToString:@" "]) {
                [characters removeObjectAtIndex:i];
                i=i-2;
            }
        }
    }
    j=0;
    
    
    i=[characters count]-1;
    
        //find fist space
    while (!([[characters objectAtIndex:(i)] isEqualToString:@" "])) {
        if (i>0) {
            
            i--;
        } else {
            i=0;
            break;
        }
    }
    if (i<1) {
            // _label.text = word;
    } else {
        
            //   NSLog(@"test");
        k=i;//K is the last space
        i--;
     //   NSLog(@"test2");
        while (!([[characters objectAtIndex:(i)] isEqualToString:@" "])) {
            if (i<0) {
                i--;
            } else {
                break;
            }
            
            
        }
        j=i;//K is the last space
     //   NSLog(@"my spaces are at indexs:");
     //  NSLog(@"k %d",k);
     //   NSLog(@"j %d",j);
        
        count=[characters count];
            // NSLog(@"Count = %d",  count);
        
        sylable1 = [[NSMutableString alloc] init];
        sylable2 = [[NSMutableString alloc] init];
        sylable3 = [[NSMutableString alloc] init];
     //   NSLog(@"K = %d", k);
        if (j>0){
                //3 or more sylables
            for (i=k; i<count; i++) {
                temp = [characters objectAtIndex:i];
                sylable3 = [sylable3 stringByAppendingString:temp];
       //         NSLog(@"sylable3 = %@", sylable3);
            }
    //        NSLog(@"sylable3 = %@", sylable3);
                //sylable 2
            for (i=j; i<k; i++) {
                temp = [characters objectAtIndex:i];
                sylable2 = [sylable2 stringByAppendingString:temp];
            }
      //      NSLog(@"sylable2 = %@", sylable2);
                //sylable 1
            for (i=0; i<j; i++) {
                temp = [characters objectAtIndex:i];
                sylable1 = [sylable1 stringByAppendingString:temp];
                
            }
        //    NSLog(@"sylable1 = %@", sylable1);
            sylable = sylable1;
            sylable = [sylable stringByAppendingString:sylable2];
            sylable = [sylable stringByAppendingString:sylable3];
           NSLog(@"sylable = %@", sylable);
            
        } else if (k>0) {
            for (i=0; i<k; i++) {
                temp = [characters objectAtIndex:i];
                sylable2 = [sylable2 stringByAppendingString:temp];
          //      NSLog(@"k is ok");
  
            }
        //    NSLog(@"sylable2 = %@", sylable2);
            
            for (i=i; i<count; i++) {
        //        NSLog(@"count = %d", count);
                temp = [characters objectAtIndex:i];
                sylable3 = [sylable3 stringByAppendingString:temp];
        //        NSLog(@"i is ok");
            }
          //  NSLog(@"sylable3 = %@", sylable3);
            sylable = sylable2;
            sylable = [sylable stringByAppendingString:sylable3];
            NSLog(@"sylable = %@", sylable);
          //  NSLog(@"char = %@", [characters objectAtIndex:i]);
        }
        else
            NSLog(@"fail");
    }
    for (int i=0; i < [words length]; i++){
     //   NSLog(@"in last loop changing weird chars");
        if ([[characters objectAtIndex:i] isEqualToString:@"á"])
            [characters replaceObjectAtIndex:i withObject:@"a"];
        
        if ([[characters objectAtIndex:i] isEqualToString:@"é"])
            [characters replaceObjectAtIndex:i withObject:@"e"];
        
        if ([[characters objectAtIndex:i] isEqualToString:@"í"])
            [characters replaceObjectAtIndex:i withObject:@"i"];
        
        if ([[characters objectAtIndex:i] isEqualToString:@"ó"])
            [characters replaceObjectAtIndex:i withObject:@"o"];
        
        if ([[characters objectAtIndex:i] isEqualToString:@"ú"])
            [characters replaceObjectAtIndex:i withObject:@"u"];
    }
    return sylable;
    }

@end




