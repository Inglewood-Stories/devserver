// Extend the loading screen duration for FiveM

var loadingScreenTime = 15000; // 15 seconds (in milliseconds)

// Add custom steps for loading screen
function simulateLoadingSteps() {
    console.log("Step 1: Initializing...");
    setTimeout(() => {
        console.log("Step 2: Syncing data...");
    }, 10000); // 5 seconds
    setTimeout(() => {
        console.log("Step 3: Almost ready...");
    }, 30000); // 10 seconds
    setTimeout(() => {
        // Logic to close loading screen
        SendNuiMessage(JSON.stringify({ type: "done" }));
        console.log("Welcome to the server!");
    }, loadingScreenTime); // 15 seconds
}

simulateLoadingSteps();
