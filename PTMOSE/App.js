import React, { Component } from 'react';
import {View, Text, StyleSheet, SafeAreaView} from 'react-native';
import Navigation from './src/navigation';

import Amplify, {Auth} from 'aws-amplify';
import config from './src/aws-exports';
import { SafeAreaProvider } from 'react-native-safe-area-context';

Amplify.configure(config);


// import EventsDetailsScreen from './src/screens/EventsDetailsScreen';

const App = () =>  {
// Auth.signOut();
  return (
    <SafeAreaProvider>
      <Navigation />
    </SafeAreaProvider>
  );
};

const styles = StyleSheet.create({
});

export default App;

// export default withAuthenticator(App, {signUpConfig});


// import SplashOneScreen from './src/screens/SplashOneScreen';
// import SplashTwoScreen from './src/screens/SplashTwoScreen';
// import SignInScreen from './src/screens/SignInScreen';
// import SignUpScreen from './src/screens/SignUpScreen';
// import ForgotPassScreen from './src/screens/ForgotPassScreen';
// import CreatePassScreen from './src/screens/CreatePassScreen';
// import OnBoardingCrouselScreen from './src/screens/OnBoardingCrouselScreen/OnBoardingCrouselScreen';
// import UserProfileScreen from './src/screens/UserProfileScreen';
// import WineryProfileScreen from './src/screens/WineryProfileScreen';
// import HomeScreenTastingScreen from './src/screens/HomeScreenTastingScreen';
// import HomeScreenShopScreen from './src/screens/HomeScreenShopScreen';
// import SideMenuScreen from './src/screens/SideMenuScreen';
// import EventsDetailsScreen from './src/screens/EventsDetailsScreen';
// import EventListScreen from './src/screens/EventListScreen';
// import WineDetailsScreen from './src/screens/WineDetailsScreen';
// import WineReviewScreen from './src/screens/WineReviewScreen';
// import RecommendationScreen from './src/screens/RecommendationScreen/RecommendationScreen';
// import WineriesListScreen from './src/screens/WineriesListScreen';
// import WineDetailsPurchaseScreen from './src/screens/WineDetailsPurchaseScreen';
// import CartScreenOne from './src/screens/CartScreenOne';
// import CartScreenTwo from './src/screens/CartScreenTwo/CartScreenTwo';
// import CartScreenThree from './src/screens/CartScreenThree';