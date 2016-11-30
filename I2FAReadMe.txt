Introduction
============

In this guide, we will help you integrate the user authentication of your iOS application with our award winning cloud based Integrated Two Factor Authentication(I2FA) technology. To reduce the work required to do the integration, we have developed the I2FA iOS SDK that will be used.


Pre-requisites
==============

To get started, you need

1. Get your unique I2FA URL from AppsPicket team that integrates with your user database or directory. We have connectors for most authentication setups.
2. Working iOS development environment with iOS SDK
3. iOS project of the application you wish to integrate

Get your unique I2FA URL
========================
AppsPicket team will configure a connector on our cloud based I2FA side that integrates with your user database or directory. We have connectors for most authentication setups. Please email info@appspicket.com  for more details.

Once the connector is configured, the unique URL for your application will be generated and provided to you.


Installation
============

Step 1. Download and Unzip I2FA_IOS. I2FA_IOS contains I2FA_Lib , I2FAReadMe.txt , I2FASampleAppReadMe.txt and SampleApp.
Step 2. Find I2FA_Lib inside I2FA_IOS. It contains 2 files I2FA.framework and libI2FA.a
Step 3. Create a New Project.
Step 4. Simply drag the I2FA.framework and libI2FA.a to your application's project, ensuring that it's being added to the necessary targets. 
Step 5. In your YourProjectName-Bridging-Header.h import I2FA SDK as 

	#import <I2FA/I2FA.h>

If YourProjectName-Bridging-Header.h is not present in the project , follow below steps.

1. Add a new file to Xcode (File > New > File), then select “Source” and click “Header File“.
2. Name your file “YourProjectName-Bridging-Header.h”.  Example: In SampleApp, the file is named “SampleApp-Bridging-Header”.
3. Create the file.
4. Navigate to your project build settings and find the “Swift Compiler – Code Generation” section.  You may find it faster to type in “Swift Compiler” into the search box to narrow down the results.  Note: If you don’t have a “Swift Compiler – Code Generation” section, this means you probably don’t have any Swift classes added to your project yet.  Add a Swift file, then try again.

5. Next to “Objective-C Bridging Header” you will need to add the name/path of your header file.  If your file resides in your project’s root folder simply put the name of the header file there.  Examples:  “ProjectName/ProjectName-Bridging-Header.h” or simply “ProjectName-Bridging-Header.h”.
Open up your newly created bridging header and import Objective-C classes using #import statements.  Any class listed in this file will be able to be accessed from your swift classes.


Step 6. Set Unique I2FA_URL with following code.
    
          //I2FA_URL is the the unique I2FA URL
          AuthService.setServiceUrl(I2FA_URL)
     
Step 7. Try running the code to confirm, there are no errors.


Use Cases
=========

Now we are ready to write the integration code. There are only two use cases,

1. Registration - When user signs up or registers for stronger authentication using I2FA.
2. Confirm OTP - When user confirm the sign up with help of OTP.
3. Login - When user login any subsequent time.


Registration
============

When the user registers for I2FA authentication, the user is authenticated against your user directory using the provided username and password, and any other out of band authentication (like email or phone) mechanism, and thereafter cryptographic key material is generated to authenticate user in future sessions. This is achieved using the following code.

		AuthService.signup(
			"email", // String containing email 
			username: "username", // String containing username
			password: "password", // String containing password
			mobileNo: "mobile no", // String containing mobile no
            		errorBlock:{ ( errorcode ,message) -> Void in
					// It handles the failure result.
      					// 10, AuthenticationException - thrown when User is not authenticated
      					// 15, InvalidEmailException - thrown when user failed email check
      					// 25, InvalidMobileException - throws when user failed mobile check
      					// 35, EmailMobileRequiredException - One of email or mobile input is required
      					// 51, EmptyUsernameException - Username is empty
      					// 52, EmptyPasswordException - Password is empty
      					// 55, EmptyEmailException - Email is empty
      					// 75, UnknownException 
                       },
            		responseBlock:{ (response) -> Void in
                			 // It handles the success result
        			}
        )

    
Confirm OTP
===========

When user has registered for I2FA authentication, then user needs to be activated using the OTP sent to the provided email / mobile. This is achieved using the following code.This process will automatically login.

		AuthService.signupOtp(
				"otp",//String containing otp received via email/mobile
                               errorBlock:{ (errorcode, message) -> Void in
                                	// It handles the failure result.
					// 51, EmptyUsernameException - thrown when Username is empty
    					// 53, EmptyOtpException - Otp is empty
    					// 54, EmptyUserIdException - UserId is empty
    					// 85, IncorrectOtpException - Incorrect Otp   
            					},
                              responseBlock:{ (response) -> Void in
                                	// It handles the success result
        				}
		)



Authentication
==============

After the first time, the password is never sent again over the network for authentication. The I2FA cloud performs the authentication based on the cryptographic key material (generated using registration) as well as the user provided password. The SDK performs this transparently for you and here are the steps for the same:

 		AuthService.login(
			"username", // String containing username 
                       password: "password", // String containing password
                       errorBlock:{ (errorcode, message) -> Void in
					// It handles the failure result.
      					// 10, AuthenticationException - thrown when User is not authenticated
      					// 51, EmptyUsernameException - Username is empty
      					// 52, EmptyPasswordException - Password is empty
      					// 75, UnknownException 
 
                       },
                       responseBlock:{ (response) -> Void in
                            // It handles the success result
                       }
		)


RUNNING THE SAMPLE APP
======================

This sample demonstrates how to use I2FA library to authenticate user with Integrated Two Factor Authentication(I2FA) technology. 

Follow the below steps to run this SampleApp:

     1.Download the project 
     2.Click on “clone or download” button .
     3.Click on “Download ZIP”.
     4.Unzip the downloaded project.
     5.Click on “Sample App” Folder. 
     6.Open the project using SampleApp.xcodeproj			
   

Now the  SampleApp app is ready to run. Click on Run button and you will find the sample running on your emulator or  device.