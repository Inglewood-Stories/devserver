// Overall Volume for the Loading Screen
var volume = 1.0 // 1.0 is the highest, 0.0 is silent.

// Intro part of loading screen
var smallLogoMaxHeight = 10 // Increasing or decreasing this will allow the logo to be larger or smaller
var largeLogoMaxHeight = 20 // Increasing or decreasing this will allow the logo to be larger or smaller

// First Flash Screen
var flash1Text = "Welcome aboard! Created by roleplayers for roleplayers, we’re here to bring you exciting features for a smooth flight into the city.";
var flash1Time = 2000; // How long should this text be on screen? (In milliseconds)

// Second Flash Screen
var flash2Text = "Prepare for landing! This community was founded so everyone can build and enjoy together. You’re the co-pilot here, making this journey special. Join us in our Discord community and, most importantly, have fun!";
var flash2Text1 = "Fasten your seatbelts! Please do not quit or turn off your system while the save icon is showing.";
var flash2Text2 = "Landing gear is down! Please do not quit or turn off your system while the loading icon is showing.";
var flash2Text3 = "Approaching the runway! Please do not quit or turn off your system while the FiveM cloud save icon is showing.";
var flash2Time = 4000; // How long should this text be on screen? (In milliseconds)

// Loading Screen After Flash Screens
var useLogo = true; // Weather to even use the logo on the slideshow part of the loading screen
var useSmallLogo = true; // Weather to use the small or large logo for the slideshow part of the loading screen
var logoMaxHeight = 10; // Allows the logo to be larger or smaller for the slideshow part of the loading screen
var logoPadding = 2; // Spaces the logo from the bottom left corner for the slideshow part of the loading screen
var loadingText = "Departing the aircraft.." // Loading Text
var slideTime = 5000 // How long to wait before changing to another slide (In Miliseconds)
var slides = [
    [
        title = "Welcome Aboard!", // Title of the Slide
        subtitle = "A Brand-New Roleplay Journey Begins", // Subtitle of the Slide
        desc = "Happy New Year! Our city is brand new and ready for takeoff! Explore Los Santos for exclusive vehicles at the dealership or join us at our weekly car meets to connect with fellow passengers and make new friends!", // Description of the Slide
        image = "slide1.jpg" // Filename of Image in the "images" folder
    ],
    [
        title = "Captain’s Log: Update 3.0.3", // Title of the Slide
        subtitle = "New Features Cleared for Takeoff", // Subtitle of the Slide
        desc = "Attention passengers! With the New Year comes a fresh start. Our latest update brings new clothing, vehicles, maps, and items to elevate your roleplay experience. Buckle up and enjoy the ride—see you in the skies of RP!", // Description of the Slide
        image = "slide2.png" // Filename of Image in the "images" folder
    ],
];
// Loading Screen Background
var background = "slideshow" // You can use a youtube ID here (such as "Iggl9ymglXw") or leave as slideshow for the images
var backgroundTime = 6000 // How long to wait before switching to another background (In Miliseconds) (Only works for slideshow)
var backgroundImages = ["bg1.jpg", "bg2.jpg", "bg3.jpg", "bg4.jpg"]; // The filenames of the images in the "images" folder