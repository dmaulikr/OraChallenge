// Generated by Apple Swift version 2.2 (swiftlang-703.0.18.8 clang-703.0.31)
#pragma clang diagnostic push

#if defined(__has_include) && __has_include(<swift/objc-prologue.h>)
# include <swift/objc-prologue.h>
#endif

#pragma clang diagnostic ignored "-Wauto-import"
#include <objc/NSObject.h>
#include <stdint.h>
#include <stddef.h>
#include <stdbool.h>

#if !defined(SWIFT_TYPEDEFS)
# define SWIFT_TYPEDEFS 1
# if defined(__has_include) && __has_include(<uchar.h>)
#  include <uchar.h>
# elif !defined(__cplusplus) || __cplusplus < 201103L
typedef uint_least16_t char16_t;
typedef uint_least32_t char32_t;
# endif
typedef float swift_float2  __attribute__((__ext_vector_type__(2)));
typedef float swift_float3  __attribute__((__ext_vector_type__(3)));
typedef float swift_float4  __attribute__((__ext_vector_type__(4)));
typedef double swift_double2  __attribute__((__ext_vector_type__(2)));
typedef double swift_double3  __attribute__((__ext_vector_type__(3)));
typedef double swift_double4  __attribute__((__ext_vector_type__(4)));
typedef int swift_int2  __attribute__((__ext_vector_type__(2)));
typedef int swift_int3  __attribute__((__ext_vector_type__(3)));
typedef int swift_int4  __attribute__((__ext_vector_type__(4)));
#endif

#if !defined(SWIFT_PASTE)
# define SWIFT_PASTE_HELPER(x, y) x##y
# define SWIFT_PASTE(x, y) SWIFT_PASTE_HELPER(x, y)
#endif
#if !defined(SWIFT_METATYPE)
# define SWIFT_METATYPE(X) Class
#endif

#if defined(__has_attribute) && __has_attribute(objc_runtime_name)
# define SWIFT_RUNTIME_NAME(X) __attribute__((objc_runtime_name(X)))
#else
# define SWIFT_RUNTIME_NAME(X)
#endif
#if defined(__has_attribute) && __has_attribute(swift_name)
# define SWIFT_COMPILE_NAME(X) __attribute__((swift_name(X)))
#else
# define SWIFT_COMPILE_NAME(X)
#endif
#if !defined(SWIFT_CLASS_EXTRA)
# define SWIFT_CLASS_EXTRA
#endif
#if !defined(SWIFT_PROTOCOL_EXTRA)
# define SWIFT_PROTOCOL_EXTRA
#endif
#if !defined(SWIFT_ENUM_EXTRA)
# define SWIFT_ENUM_EXTRA
#endif
#if !defined(SWIFT_CLASS)
# if defined(__has_attribute) && __has_attribute(objc_subclassing_restricted)
#  define SWIFT_CLASS(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) __attribute__((objc_subclassing_restricted)) SWIFT_CLASS_EXTRA
#  define SWIFT_CLASS_NAMED(SWIFT_NAME) __attribute__((objc_subclassing_restricted)) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
# else
#  define SWIFT_CLASS(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
#  define SWIFT_CLASS_NAMED(SWIFT_NAME) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
# endif
#endif

#if !defined(SWIFT_PROTOCOL)
# define SWIFT_PROTOCOL(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) SWIFT_PROTOCOL_EXTRA
# define SWIFT_PROTOCOL_NAMED(SWIFT_NAME) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_PROTOCOL_EXTRA
#endif

#if !defined(SWIFT_EXTENSION)
# define SWIFT_EXTENSION(M) SWIFT_PASTE(M##_Swift_, __LINE__)
#endif

#if !defined(OBJC_DESIGNATED_INITIALIZER)
# if defined(__has_attribute) && __has_attribute(objc_designated_initializer)
#  define OBJC_DESIGNATED_INITIALIZER __attribute__((objc_designated_initializer))
# else
#  define OBJC_DESIGNATED_INITIALIZER
# endif
#endif
#if !defined(SWIFT_ENUM)
# define SWIFT_ENUM(_type, _name) enum _name : _type _name; enum SWIFT_ENUM_EXTRA _name : _type
# if defined(__has_feature) && __has_feature(generalized_swift_name)
#  define SWIFT_ENUM_NAMED(_type, _name, SWIFT_NAME) enum _name : _type _name SWIFT_COMPILE_NAME(SWIFT_NAME); enum SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_ENUM_EXTRA _name : _type
# else
#  define SWIFT_ENUM_NAMED(_type, _name, SWIFT_NAME) SWIFT_ENUM(_type, _name)
# endif
#endif
#if defined(__has_feature) && __has_feature(modules)
@import UIKit;
@import ObjectiveC;
@import CoreGraphics;
#endif

#pragma clang diagnostic ignored "-Wproperty-attribute-mismatch"
#pragma clang diagnostic ignored "-Wduplicate-method-arg"
@class UITextField;
@class NSCoder;

SWIFT_CLASS("_TtC12OraChallenge25AccountNRegistrationCells")
@interface AccountNRegistrationCells : UITableViewCell <UITextFieldDelegate>
@property (nonatomic, copy) NSString * _Nonnull namePlaceholderString;
@property (nonatomic, copy) NSString * _Nonnull emailPlaceholderString;
@property (nonatomic, copy) NSString * _Nonnull passwordPlaceHolderString;
@property (nonatomic, copy) NSString * _Nonnull confirmPasswordPlaceHolderString;
@property (nonatomic, strong) UITextField * _Nonnull textField;
- (nonnull instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString * _Nullable)reuseIdentifier OBJC_DESIGNATED_INITIALIZER;
- (void)layoutSubviews;
- (void)textFieldDidBeginEditing:(UITextField * _Nonnull)textField;
- (void)textFieldDidEndEditing:(UITextField * _Nonnull)textField;
- (BOOL)textFieldShouldReturn:(UITextField * _Nonnull)textField;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end

@class UIWindow;
@class UIApplication;
@class NSObject;

SWIFT_CLASS("_TtC12OraChallenge11AppDelegate")
@interface AppDelegate : UIResponder <UIApplicationDelegate>
@property (nonatomic, strong) UIWindow * _Nullable window;
- (BOOL)application:(UIApplication * _Nonnull)application didFinishLaunchingWithOptions:(NSDictionary * _Nullable)launchOptions;
- (void)applicationWillResignActive:(UIApplication * _Nonnull)application;
- (void)applicationDidEnterBackground:(UIApplication * _Nonnull)application;
- (void)applicationWillEnterForeground:(UIApplication * _Nonnull)application;
- (void)applicationDidBecomeActive:(UIApplication * _Nonnull)application;
- (void)applicationWillTerminate:(UIApplication * _Nonnull)application;
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end

@class NSDictionary;

SWIFT_CLASS("_TtC12OraChallenge4Chat")
@interface Chat : NSObject
@property (nonatomic, copy) NSString * _Null_unspecified chatName;
@property (nonatomic, copy) NSString * _Null_unspecified chatCreatedDate;
@property (nonatomic, strong) NSDictionary * _Null_unspecified userDataDict;
@property (nonatomic, copy) NSString * _Null_unspecified userName;
@property (nonatomic, copy) NSString * _Null_unspecified lastMessageText;
@property (nonatomic, copy) NSString * _Null_unspecified lastMessageCreatedDate;
@property (nonatomic, copy) NSString * _Null_unspecified lastMessageUserName;
- (nonnull instancetype)initWithChatId:(NSInteger)chatId userId:(NSInteger)userId chatName:(NSString * _Nonnull)chatName chatCreationDate:(NSString * _Nonnull)chatCreationDate userName:(NSString * _Nonnull)userName lastMessageId:(NSInteger)lastMessageId lastMessageUserId:(NSInteger)lastMessageUserId lastMessageText:(NSString * _Nonnull)lastMessageText lastMessageCreatedDate:(NSString * _Nonnull)lastMessageCreatedDate lastMessageUserName:(NSString * _Nonnull)lastMessageUserName OBJC_DESIGNATED_INITIALIZER;
@end

@class UILabel;
@class UIColor;

SWIFT_CLASS("_TtC12OraChallenge13ChatsListCell")
@interface ChatsListCell : UITableViewCell
@property (nonatomic, strong) UILabel * _Nonnull authorTitleHeaderLabel;
@property (nonatomic, strong) UILabel * _Nonnull authorDateLabel;
@property (nonatomic, strong) UILabel * _Nonnull lastMessageTextLabel;
@property (nonatomic) CGFloat chatListCellHeight;
@property (nonatomic) CGFloat labelsXPos;
@property (nonatomic) CGFloat labelsWidth;
@property (nonatomic) CGFloat labelsHeight;
@property (nonatomic) CGFloat topMargin;
@property (nonatomic) CGFloat bottomMargin;
@property (nonatomic) CGFloat interLabelMargin;
@property (nonatomic, strong) UIColor * _Null_unspecified buttonYellowColor;
- (nonnull instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString * _Nullable)reuseIdentifier OBJC_DESIGNATED_INITIALIZER;
- (void)layoutSubviews;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end

@class UITableView;
@class UIButton;
@class UISearchBar;
@class UIBarButtonItem;
@class UIView;
@class NSIndexPath;
@class NSBundle;

SWIFT_CLASS("_TtC12OraChallenge23ChatsListViewController")
@interface ChatsListViewController : UIViewController <UIBarPositioningDelegate, UITableViewDataSource, UISearchBarDelegate, UIScrollViewDelegate, UITableViewDelegate>
@property (nonatomic, strong) IBOutlet UITableView * _Null_unspecified chatsTableView;
@property (nonatomic, strong) IBOutlet UIButton * _Null_unspecified plusButton;
@property (nonatomic, strong) IBOutlet UISearchBar * _Null_unspecified chatsSearchBar;
@property (nonatomic, strong) IBOutlet UIBarButtonItem * _Null_unspecified backButton;
@property (nonatomic, copy) NSArray<Chat *> * _Nonnull chatsArray;
@property (nonatomic, copy) NSArray<ChatsListCell *> * _Nonnull chatCellsArray;
@property (nonatomic, strong) UIColor * _Null_unspecified plusButtonYellow;
- (void)viewDidLoad;
- (IBAction)plusButtonPressed:(id _Nonnull)sender;
- (NSInteger)numberOfSectionsInTableView:(UITableView * _Nonnull)tableView;
- (NSInteger)tableView:(UITableView * _Nonnull)tableView numberOfRowsInSection:(NSInteger)section;
- (UIView * _Nullable)tableView:(UITableView * _Nonnull)tableView viewForHeaderInSection:(NSInteger)section;
- (CGFloat)tableView:(UITableView * _Nonnull)tableView heightForRowAtIndexPath:(NSIndexPath * _Nonnull)indexPath;
- (UITableViewCell * _Nonnull)tableView:(UITableView * _Nonnull)tableView cellForRowAtIndexPath:(NSIndexPath * _Nonnull)indexPath;
- (void)tableView:(UITableView * _Nonnull)tableView didSelectRowAtIndexPath:(NSIndexPath * _Nonnull)indexPath;
- (void)searchBarCancelButtonClicked:(UISearchBar * _Nonnull)searchBar;
- (void)searchBarSearchButtonClicked:(UISearchBar * _Nonnull)searchBar;
- (void)enterNewChatNameAlert:(NSString * _Nonnull)title message:(NSString * _Nonnull)message;
- (void)didReceiveMemoryWarning;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC12OraChallenge10LoginCells")
@interface LoginCells : UITableViewCell <UITextFieldDelegate>
@property (nonatomic, strong) UILabel * _Nonnull label;
@property (nonatomic, strong) UITextField * _Nonnull textField;
@property (nonatomic, copy) NSString * _Nonnull emailPlaceholderString;
@property (nonatomic, copy) NSString * _Nonnull passwordPlaceHolderString;
- (nonnull instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString * _Nullable)reuseIdentifier OBJC_DESIGNATED_INITIALIZER;
- (void)layoutSubviews;
- (void)textFieldDidBeginEditing:(UITextField * _Nonnull)textField;
- (void)textFieldDidEndEditing:(UITextField * _Nonnull)textField;
- (BOOL)textFieldShouldReturn:(UITextField * _Nonnull)textField;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC12OraChallenge22LoginRegViewController")
@interface LoginRegViewController : UIViewController <UIScrollViewDelegate, UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) UITableView * _Null_unspecified tableView;
@property (nonatomic, strong) IBOutlet UIBarButtonItem * _Null_unspecified leftBarButtonItem;
@property (nonatomic, strong) IBOutlet UIBarButtonItem * _Null_unspecified rightBarButtonItem;
@property (nonatomic, copy) NSArray<LoginCells *> * _Nonnull loginCellsArray;
@property (nonatomic, copy) NSArray<AccountNRegistrationCells *> * _Nonnull accountNRegCellsArray;
- (void)viewDidLoad;
- (IBAction)leftBarButtonPressed:(id _Nonnull)sender;
- (IBAction)rightNavBarButtonPressed:(id _Nonnull)sender;
- (NSInteger)numberOfSectionsInTableView:(UITableView * _Nonnull)tableView;
- (NSInteger)tableView:(UITableView * _Nonnull)tableView numberOfRowsInSection:(NSInteger)section;
- (UITableViewCell * _Nonnull)tableView:(UITableView * _Nonnull)tableView cellForRowAtIndexPath:(NSIndexPath * _Nonnull)indexPath;
- (void)showIncompleteAlert:(NSString * _Nonnull)title message:(NSString * _Nonnull)message;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC12OraChallenge7Message")
@interface Message : NSObject
@property (nonatomic, copy) NSString * _Null_unspecified chatName;
@property (nonatomic, copy) NSString * _Null_unspecified chatCreatedDate;
@property (nonatomic, strong) NSDictionary * _Null_unspecified userDataDict;
@property (nonatomic, copy) NSString * _Null_unspecified userName;
@property (nonatomic, copy) NSString * _Null_unspecified lastMessageText;
@property (nonatomic, copy) NSString * _Null_unspecified lastMessageCreatedDate;
@property (nonatomic, copy) NSString * _Null_unspecified lastMessageUserName;
- (nonnull instancetype)initWithChatId:(NSInteger)chatId userId:(NSInteger)userId chatName:(NSString * _Nonnull)chatName chatCreationDate:(NSString * _Nonnull)chatCreationDate userName:(NSString * _Nonnull)userName lastMessageId:(NSInteger)lastMessageId lastMessageUserId:(NSInteger)lastMessageUserId lastMessageText:(NSString * _Nonnull)lastMessageText lastMessageCreatedDate:(NSString * _Nonnull)lastMessageCreatedDate lastMessageUserName:(NSString * _Nonnull)lastMessageUserName OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC12OraChallenge20SecondViewController")
@interface SecondViewController : UIViewController
- (void)viewDidLoad;
- (void)didReceiveMemoryWarning;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC12OraChallenge17SectionHeaderView")
@interface SectionHeaderView : UIView
- (nonnull instancetype)initWithFrame:(CGRect)frame OBJC_DESIGNATED_INITIALIZER;
- (nonnull instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end

#pragma clang diagnostic pop
