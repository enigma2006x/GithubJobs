//
//  GBMAppDelegate.m
//  GithubJobs
//
//  Created by GBM Mobile on 8/15/14.
//  Copyright (c) 2014 GBM. All rights reserved.
//

#import "GBMAppDelegate.h"

@implementation GBMAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    NSLog(@"Commit ejemplo");

    NSLog(@"Hola, es un ejemplo del libro.");
    
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end

/*

 - Iniciar cocoaPods
    - pod init
    - agregar dependencies
    - pod install
    - Nota: es necesario correr el pod install si se agrega un nuevo ambiente
 - Instalar .gitignore "https://raw.githubusercontent.com/github/gitignore/master/Global/Xcode.gitignore"
 - Agregar AdHoc como nuevo Target, copiando el de Debug
 - BuildSettings/Build Active Architecture Only, adhoc lo ponemos en NO, para que realice repidamente la compilacion
 - adhoc Analyze During Build adhoc ponerlo en YES
 - BuildSettings/GCC_PREPROCESSOR_DEFINITIONS
 - User-Defined para relación URL <-> TARGETS; es necesario declarar en el plist para accesar
 - Para levantar un servidor rapido; ir al directorio y con la terminal -> ruby -run -e httpd . -p 9000
 - Cambiar Bundle versions string, short 0.1
 - Cambiar Bundle version 0.1
 - plcrashreporter.org -> opensource
 - Utilidad para cargar aplicacion sin usar iTunes http://support.apple.com/downloads/#iphone
 - actualizar ruby si es necesario "\curl -L https://get.rvm.io | bash -s stable --ruby"
 - Error Shenzhen quitar con ARCHFLAGS=-Wno-error=unused-command-line-argument-hard-error-in-future gem install json
 - intalar shenzhen para crear versiones de apps rapidamente https://github.com/nomad/shenzhen  ; $ ipa build -c AdHoc -d ~/Desktop
 - Cambiando la direccion de Jenkins   $java -jar jenkins.war --httpPort=8908 --httpListenAddress=192.168.1.14
*/