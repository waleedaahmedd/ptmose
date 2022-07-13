import { StyleSheet, Text, View, ActivityIndicator } from 'react-native'
import React, {useEffect, useState} from 'react'

import { NavigationContainer } from '@react-navigation/native';
import { createNativeStackNavigator } from '@react-navigation/native-stack';





import SplashOneScreen from '../screens/SplashOneScreen';
import SplashTwoScreen from '../screens/SplashTwoScreen';
import SignInScreen from '../screens/SignInScreen';
import SignUpScreen from '../screens/SignUpScreen';
import ForgotPassScreen from '../screens/ForgotPassScreen';
import CreatePassScreen from '../screens/CreatePassScreen';
import OnBoardingCrouselScreen from '../screens/OnBoardingCrouselScreen/OnBoardingCrouselScreen';
import ConfirmEmailScreen from '../screens/ConfirmEmailScreen';
import UserProfileScreen from '../screens/UserProfileScreen';
import WineryProfileScreen from '../screens/WineryProfileScreen';
import HomeScreen from '../components/TabNav/tabs';
import HomeScreenShopScreen from '../screens/HomeScreenShopScreen';
import SideMenuScreen from '../screens/SideMenuScreen';
import EventsDetailsScreen from '../screens/EventsDetailsScreen';
import EventsListScreen from '../screens/EventsListScreen';
import WineDetailsScreen from '../screens/WineDetailsScreen';
import WineReviewScreen from '../screens/WineReviewScreen';
import RecommendationScreen from '../screens/RecommendationScreen/RecommendationScreen';
import WineriesListScreen from '../screens/WineriesListScreen';
import WineryDetailsScreen from '../screens/WineryDetailsScreen/WineryDetailsScreen';
import WineDetailsPurchaseScreen from '../screens/WineDetailsPurchaseScreen';
import CartScreenOne from '../screens/CartScreenOne';
import CartScreenTwo from '../screens/CartScreenTwo/CartScreenTwo';
import CartScreenThree from '../screens/CartScreenThree';
import MyReservationConfirmedScreen from '../screens/MyReservationConfirmedScreen/MyReservationConfirmedScreen';
import MyReservationUnconfirmedScreen from '../screens/MyReservationUnconfirmedScreen';

import {Auth, Hub} from 'aws-amplify';



const Stack = createNativeStackNavigator();



const Navigation = () => {
  const [user, setUser] = useState(undefined);

  const checkUser = async () => {
    try {
      const authUser = await Auth.currentAuthenticatedUser({bypassCache: true});
      setUser(authUser);
    } catch (e) {
      setUser(null);
    }
  };
  
  useEffect(() => {
    checkUser();
  },[]);

  useEffect(() => {
    const listener = data => {
      if (data.payload.event === 'signIn' || data.payload.event === 'signOut') {
        checkUser();
      }
    };

    Hub.listen('auth', listener);
    return () => Hub.remove('auth', listener);
  }, []);

  if (user === undefined) {
    return (
      <View style={{flex: 1, justifyContent: 'center', alignItems: 'center'}}>
        <ActivityIndicator />
      </View>
    );
  }


  return (
    <NavigationContainer>
        <Stack.Navigator screenOptions={{headerShown: false}}>
          {user ? (
            <>

            
              <Stack.Screen name='HomeScreen' component={HomeScreen} />
              <Stack.Screen name='UserProfileScreen' component={UserProfileScreen} />
              <Stack.Screen name='WineryDetailsScreen' component={WineryDetailsScreen} />
              <Stack.Screen name='HomeScreenShopScreen' component={HomeScreenShopScreen} />
              <Stack.Screen name='WineryProfileScreen' component={WineryProfileScreen} />
              <Stack.Screen name='SideMenuScreen' component={SideMenuScreen} />
              <Stack.Screen name='EventsDetailsScreen' component={EventsDetailsScreen} />
              <Stack.Screen name='EventsListScreen' component={EventsListScreen} />
              <Stack.Screen name='MyReservationConfirmedScreen' component={MyReservationConfirmedScreen} />
              <Stack.Screen name='MyReservationUnconfirmedScreen' component={MyReservationUnconfirmedScreen} />
              <Stack.Screen name='WineDetailsScreen' component={WineDetailsScreen} />
              <Stack.Screen name='WineReviewScreen' component={WineReviewScreen} />
              <Stack.Screen name='RecommendationScreen' component={RecommendationScreen} />
              <Stack.Screen name='WineriesListScreen' component={WineriesListScreen} />
              <Stack.Screen name='WineDetailsPurchaseScreen' component={WineDetailsPurchaseScreen} />
              <Stack.Screen name='CartScreenOne' component={CartScreenOne} />
              <Stack.Screen name='CartScreenTwo' component={CartScreenTwo} />          
              <Stack.Screen name='CartScreenThree' component={CartScreenThree} />

              <Stack.Screen name='SplashOneScreen' component={SplashOneScreen} />
              <Stack.Screen name='SplashTwoScreen' component={SplashTwoScreen} />
              <Stack.Screen name='SignInScreen' component={SignInScreen} />
              <Stack.Screen name='SignUpScreen' component={SignUpScreen} />
              <Stack.Screen name='ConfirmEmailScreen' component={ConfirmEmailScreen} />
              <Stack.Screen name='ForgotPassScreen' component={ForgotPassScreen} />
              <Stack.Screen name='CreatePassScreen' component={CreatePassScreen} />
              <Stack.Screen name='OnBoardingCrouselScreen' component={OnBoardingCrouselScreen} />
            </>
          ) : (
            <>
              <Stack.Screen name='SplashOneScreen' component={SplashOneScreen} />
              <Stack.Screen name='SplashTwoScreen' component={SplashTwoScreen} />
              <Stack.Screen name='SignInScreen' component={SignInScreen} />
              <Stack.Screen name='SignUpScreen' component={SignUpScreen} />
              <Stack.Screen name='ConfirmEmailScreen' component={ConfirmEmailScreen} />
              <Stack.Screen name='ForgotPassScreen' component={ForgotPassScreen} />
              <Stack.Screen name='CreatePassScreen' component={CreatePassScreen} />
              <Stack.Screen name='OnBoardingCrouselScreen' component={OnBoardingCrouselScreen} />
          
          </>
          )}
        </Stack.Navigator>
    </NavigationContainer>
  );
};
export default Navigation;


{/* <NavigationContainer>
<Stack.Navigator screenOptions={{headerShown: false}}>
  <Stack.Screen name='SplashOneScreen' component={SplashOneScreen} />
  <Stack.Screen name='SplashTwoScreen' component={SplashTwoScreen} />
  <Stack.Screen name='SignInScreen' component={SignInScreen} />
  <Stack.Screen name='SignUpScreen' component={SignUpScreen} />
  <Stack.Screen name='ConfirmEmailScreen' component={ConfirmEmailScreen} />
  <Stack.Screen name='ForgotPassScreen' component={ForgotPassScreen} />
  <Stack.Screen name='CreatePassScreen' component={CreatePassScreen} />
  <Stack.Screen name='OnBoardingCrouselScreen' component={OnBoardingCrouselScreen} />
  <Stack.Screen name='UserProfileScreen' component={UserProfileScreen} />
  <Stack.Screen name='HomeScreen' component={HomeScreen} />
  <Stack.Screen name='WineryDetailsScreen' component={WineryDetailsScreen} />
  <Stack.Screen name='HomeScreenShopScreen' component={HomeScreenShopScreen} />
  <Stack.Screen name='WineryProfileScreen' component={WineryProfileScreen} />
  <Stack.Screen name='SideMenuScreen' component={SideMenuScreen} />
  <Stack.Screen name='EventsDetailsScreen' component={EventsDetailsScreen} />
  <Stack.Screen name='EventsListScreen' component={EventsListScreen} />
  <Stack.Screen name='MyReservationConfirmedScreen' component={MyReservationConfirmedScreen} />
  <Stack.Screen name='MyReservationUnconfirmedScreen' component={MyReservationUnconfirmedScreen} />
  <Stack.Screen name='WineDetailsScreen' component={WineDetailsScreen} />
  <Stack.Screen name='WineReviewScreen' component={WineReviewScreen} />
  <Stack.Screen name='RecommendationScreen' component={RecommendationScreen} />
  <Stack.Screen name='WineriesListScreen' component={WineriesListScreen} />
  <Stack.Screen name='WineDetailsPurchaseScreen' component={WineDetailsPurchaseScreen} />
  <Stack.Screen name='CartScreenOne' component={CartScreenOne} />
  <Stack.Screen name='CartScreenTwo' component={CartScreenTwo} />          
  <Stack.Screen name='CartScreenThree' component={CartScreenThree} />
</Stack.Navigator>
</NavigationContainer> */}