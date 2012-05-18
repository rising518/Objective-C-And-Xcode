#import <Foundation/Foundation.h>

// init
// dealloc

@interface Car : NSObject {
	@private
		int speed;
}

-(id) initWithSpeed: (int) sp;
-(void) foo;

@end


@implementation Car

-(id) initWithSpeed: (int) sp {
	//부모의 초기화 함수를 꼭 먼저 부른다.
	self = [super init];
	if (self != nil)
		speed = sp; //부모의 생성자에서 실패하여, nil이 들어왔다면
					//자식에서 초기화 루틴을 수행할 필요가 없다.
	return self;
}

-(void) dealloc
{
	[self foo];
	NSLog(@"Car가 파괴됩니다");
	[super dealloc]; //부모의 dealloc을 반드시 호출해야 합니다.
}
	
-(void) foo {
	NSLog(@"foo");
}

@end


int main() {
	//명시적으로 초기화 함수를 호출한다. 
	Car* c1 = [[Car alloc] initWithSpeed: 10];
	[c1 release];
}