#import <Foundation/Foundation.h>

@interface Dialog : NSObject {
	@private
}

-(void) close;
@end

@implementation Dialog 

-(void) close {
	NSLog(@"Dialog Close");
}

@end

@interface Button : NSObject {
	@private
		id target; //모든타입이 올수있다
		SEL action;
}

-(void) click;
-(void) close;
-(void) addTarget:(id)t action:(SEL)a;

@end

@implementation Button

-(void) click {
	[target performSelector:action];
	
}

-(void) close {
	NSLog(@"Button Close");
}

-(void)addTarget:(id)t action:(SEL)a
{
	target = t;
	action = a;
}

@end

///////////////
int main()
{
	Dialog* dialog = [Dialog alloc];
	Button* button = [Button alloc];
	[button addTarget:dialog action:@selector(close)];
	
	[button click];
	
	[dialog release];
	[button release];
}
