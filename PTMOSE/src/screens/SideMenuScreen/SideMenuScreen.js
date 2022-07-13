import {
  StyleSheet,
  Text,
  View,
  Image,
  useWindowDimensions,
  ScrollView,
  Pressable,
  onPress,
} from 'react-native';
import React, {useState, thisState} from 'react';
import Logo from '../../../assets/images/Logo.png';
import close_btn from '../../../assets/images/close_1.png';
import home_btn from '../../../assets/images/HeaderHomeBtn.png';
import location from '../../../assets/images/LocationLogo.png';
import pen_1 from '../../../assets/images/pen_1.png';
import mic from '../../../assets/images/mic.png';
import star from '../../../assets/images/star_2.png';
import vine from '../../../assets/images/vine.png';
import about from '../../../assets/images/about.png';
import setting_btn from '../../../assets/images/setting_btn.png';
import logout_btn from '../../../assets/images/logout_btn.png';

import { useNavigation } from '@react-navigation/native';

import { Auth } from 'aws-amplify';

const SideMenuScreen = () => {
  const {height} = useWindowDimensions();
  const [isEnabled, setIsEnabled] = useState(false);
  const toggleSwitch = () => setIsEnabled(previousState => !previousState);

  const navigation = useNavigation();

  const onPressCloseBtn = () => {
    // console.warn('onPressCloseBtn');
    navigation.navigate('HomeScreen');
  };

  const onPressEditProfile = () => {
    navigation.navigate('UserProfileScreen');
  };

  const onPressMyReviews = () => {
    // console.warn('onPressMyReviews');
    navigation.navigate('WineReviewScreen');
  };

  const onPressShop = () => {
    navigation.navigate('HomeScreenShopScreen');
  };

  const onPressAboutPTMOSEBtn = () => {
    console.warn('onPressAboutPTMOSEBtn');
  };

  const onPressSettingBtn = () => {
    navigation.navigate('WineryProfileScreen');
  };

  const onPressLogoutBtn = () => {
    Auth.signOut;
    navigation.navigate('SignInScreen');
  }; 
 
  const  onPressMyReservarionBtn = () => {
    navigation.navigate('MyReservationConfirmedScreen');
  }; 


  

  return (
    <View style={styles.root}>
      <View style={styles.head}>

      <Pressable
      onPress={onPressCloseBtn}>
        <Image
          source={close_btn}
          style={{height: 12, width: 12, marginHorizontal: 15}}></Image></Pressable>
        
        
        <Image
          source={Logo}
          style={[styles.logo, {height: height * 0.15}]}
          resizeMode="contain"
        />
        <Image
          source={home_btn}
          style={{height: 16, width: 16, marginHorizontal: 15}}></Image>
      </View>

      <View>
        <Text
          style={{
            marginHorizontal: 20,
            fontSize: 15,
            color: '#FFFFFF',
            fontFamily: 'Inter-Bold',
          }}>
          HELLO,
        </Text>
        <View
          style={{
            alignItems: 'center',
            width: '100%',
            display: 'flex',
            flexDirection: 'row',
            justifyContent: 'space-between',
          }}>
          <Text
            style={{
              marginHorizontal: 20,
              fontSize: 35,
              color: '#FFFFFF',
              fontFamily: 'MontaguSlab_120pt-Light',
            }}>
            Paul Wilkins
          </Text>
          <Pressable
          onPress={onPressEditProfile}>
          <Image
            source={pen_1}
            style={{height: 18, width: 18, marginHorizontal: 15}}></Image></Pressable>
        </View>
      </View>

      <View style={styles.body}>
        <View style={styles.linkBody}>
          <Pressable onPress={onPressMyReservarionBtn}>
           <View style={styles.menuLinks}>
           <Image source={mic} style={styles.linkImg} resizeMode="contain" />
          <Text style={styles.linkText}>MY RESERVATION</Text>
          </View></Pressable>

          <Pressable onPress={onPressMyReviews}>
          <View style={styles.menuLinks}>
            <Image source={star} style={styles.linkImg} resizeMode="contain" />
            <Text style={styles.linkText}>MY REVIEWS</Text>
          </View></Pressable>

          <Pressable onPress={onPressShop}>
          <View style={styles.menuLinks}>
          <Image source={vine} style={styles.linkImg} resizeMode="contain" />
          <Text style={styles.linkText}>SHOP</Text>
          </View></Pressable>

          <Pressable onPress={onPressAboutPTMOSEBtn}>
          <View style={styles.menuLinks}> 
          <Image source={about} style={styles.linkImg} resizeMode="contain" />
          <Text style={styles.linkText}>ABOUT PTMOSE</Text>
          </View></Pressable>

          <Pressable onPress={onPressSettingBtn}>
          <View style={styles.menuLinks}>
          <Image source={setting_btn} style={styles.linkImg} resizeMode="contain"/>
          <Text style={styles.linkText}>SETTINGS</Text>
          </View></Pressable>

        </View>

        <View style={styles.menulogout}>
          <Pressable
          onPress={onPressLogoutBtn}>
          <Image
            source={logout_btn}
            style={styles.linkImg}
            resizeMode="contain"
          /></Pressable>
          <Pressable
          onPress={onPressLogoutBtn}>
          <Text style={styles.linkText}>LOGOUT</Text></Pressable>
        </View>
      </View>
    </View>
  );
};

const styles = StyleSheet.create({
  root: {
    backgroundColor: '#3F0321',
    height: '100%',
  },
  body: {
    // height: '100%',
    display: 'flex',
    flexDirection: 'column',
    justifyContent: 'flex-end',
  },
  head: {
    alignItems: 'center',
    backgroundColor: '#3F0321',
    shadowRadius: 'EAEAEA',
    shadowColor: 'red',
    display: 'flex',
    flexDirection: 'row',
    justifyContent: 'space-between',
  },
  logo: {
    width: '40%',
    maxWidth: 300,
    maxHeight: 200,
  },
  linkBody: {
    marginTop: 60,
    marginHorizontal: 20,
  },
  menuLinks: {
    display: 'flex',
    flexDirection: 'row',
    alignItems: 'center',
    marginBottom: 30,
  },
  linkImg: {
    width: 25,
    height: 20,
    marginHorizontal: 20,
  },
  linkText: {
    color: '#FFFFFF',
    fontSize: 15,
    fontFamily: 'MontaguSlab_120pt-Light',
    letterSpacing: 2,
  },
  menulogout: {
    display: 'flex',
    flexDirection: 'row',
    alignItems: 'center',
    marginTop: 100,
  },
});

export default SideMenuScreen;
