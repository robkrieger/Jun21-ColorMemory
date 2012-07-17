//
//  View.m
//  ColorMemory
//
//  Created by admin on 7/13/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "View.h"
// #include <stdlib.h>

@implementation View

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:1.0];
        
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    CGFloat w = self.bounds.size.width;
    NSLog(@"w = %f", self.bounds.size.width); // 320
    CGFloat h = self.bounds.size.height;
    NSLog(@"h = %f", self.bounds.size.height); // 460
    CGContextRef c = UIGraphicsGetCurrentContext();
    
    /* BACKGROUND
     // CGRectMake ( CGFloat x, CGFloat y, CGFloat width, CGFloat height );
     CGContextBeginPath(c); 
     CGContextAddRect(c, CGRectMake(w/4, h/4, 2*(w/4), 2* (h/4)));
     
     // int rand = arc4random() % 100;
     // (CGContextRef c, CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha );
     CGContextSetRGBFillColor(c, 1.0, 1.0, 1.0, 1.0);
     CGContextFillPath(c);
     */
    
    
    // 1. Create an array and assign each quad to an index
    // 2. Give Q1 a random number 
    // 3. Have the number change the color for Q1
    // 4. Give Q2, Q3, Q4 random numbers and... 
    // 5. Assign a color to each based on the random number 
    
    // NSMutableArray *quad = [NSMutableArray array]; 
    
    /*
     for (int i = 0; i < 4; i++) {  
     float rand = (arc4random() % 100)/(float)100;
     NSLog(@"Random Number %i = %f", i, rand); 
     }
     */
    
    
    NSArray *colorset; 
    
    float red = (arc4random() % 100)/(float)100;
    NSNumber *n0 = [NSNumber numberWithFloat:red];
    
    float green = (arc4random() % 100)/(float)100;
    NSNumber *n1 = [NSNumber numberWithFloat:green];
    
    float blue = (arc4random() % 100)/(float)100;
    NSNumber *n2 = [NSNumber numberWithFloat:blue];
    
    float alpha = (arc4random() % 100)/(float)100;
    NSNumber *n3 = [NSNumber numberWithFloat:alpha];
    
    colorset = [NSArray arrayWithObjects:n0, n1, n2, n3, nil]; 
    
    for (NSNumber *n in colorset) { 
        NSLog(@"List of floats: %@", n); 
    }
    
    // Convert them back to CGFloat so they work with CGContextRGBFillColor
    CGFloat r = [n0 floatValue]; 
    CGFloat g = [n1 floatValue]; 
    CGFloat b = [n2 floatValue]; 
    CGFloat a = [n3 floatValue]; 
    
    
    // RANDOM 2
    
    CGFloat r2 = (arc4random() % 100)/(float)100;
    CGFloat g2 = (arc4random() % 100)/(float)100;
    CGFloat b2 = (arc4random() % 100)/(float)100;
    CGFloat a2 = (arc4random() % 100)/(float)100;
    
    int quadmatch = arc4random() % 3; // 0, 1, or 2
    NSLog(@"quadmatch = %i", quadmatch); 
    
    // OUTLINE: 
    // pick a second random color
    // Put a random into the first one
    // Pick a random number 2, 3, or 4
    // Based on random number, set X2 = one of the w/2, w/4, or w/4*2 
    // Set Y2 = h/4, h/4*2, or h/4*2
    // if random = 2, do this, else do something else 
    // Set X3 = one of the non-random ones that you've picked
    // Set Y3 = one of the non-random ones that you've picked
    // Set X4 = one of the non-random ones that you've picked
    // Set Y4 = one of the non-random ones that you've picked
    
    
    
    // 0: SET THE FIRST QUAD (and then test with random num quadmatch 0,1, or 2) 
    
    // Quad I (top left)
    // CGRectMake ( CGFloat x, CGFloat y, CGFloat width, CGFloat height );
    CGContextBeginPath(c); 
    CGContextAddRect(c, CGRectMake((w/4)-1, (h/4)-1, (w/4), (h/4)));
    CGContextSetRGBFillColor(c, r, g, b, a);
    CGContextFillPath(c);
    
    
    // Quad II (top right) 
    CGContextBeginPath(c); 
    CGContextAddRect(c, CGRectMake((w/2)+1, (h/4)-1, (w/4), (h/4)));
    
    if (quadmatch == 0) { 
        CGContextSetRGBFillColor(c, r, g, b, a);
    } else if (quadmatch == 1) {
        CGContextSetRGBFillColor(c, r2, g2, b2, a2);
    } else if (quadmatch == 2) { 
        CGContextSetRGBFillColor(c, r2, g2, b2, a2);
    }
    
    CGContextFillPath(c);
    
    
    // Quad III (bottom left)
    CGContextBeginPath(c); 
    CGContextAddRect(c, CGRectMake((w/4)-1, ((h/4)*2)+1, (w/4), (h/4)));
    
    if (quadmatch == 0) { 
        CGContextSetRGBFillColor(c, r2, g2, b2, a2);
    } else if (quadmatch == 1) {
        CGContextSetRGBFillColor(c, r, g, b, a);
    } else if (quadmatch == 2) { 
        CGContextSetRGBFillColor(c, r2, g2, b2, a2);
    }
    
    CGContextFillPath(c);
    
    
    // Quad IV (bottom right)
    CGContextBeginPath(c); 
    CGContextAddRect(c, CGRectMake(((w/4)*2)+1, ((h/4)*2)+1, (w/4), (h/4)));
    if (quadmatch == 0) { 
        CGContextSetRGBFillColor(c, r2, g2, b2, a2);
    } else if (quadmatch == 1) {
        CGContextSetRGBFillColor(c, r2, g2, b2, a2);
    } else if (quadmatch == 2) { 
        CGContextSetRGBFillColor(c, r, g, b, a);
    }
    
    CGContextFillPath(c);
    
    
    
    
    
    /* RESTART BUTTON
     // [self performSelector: @selector(setNeedsDisplay) withObject: nil afterDelay:2.0];
     */
    
}


@end
