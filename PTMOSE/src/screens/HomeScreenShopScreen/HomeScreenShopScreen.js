import { 
  StyleSheet, 
  Text, 
  View, 
  useWindowDimensions, 
  Image, 
  ImageBackground,
  ScrollView,
  Pressable,
  onPress } from 'react-native'
import React, { useState, useRef} from 'react';
import Logo3 from '../../../assets/images/Logo3.png';
import HeaderMenuBtn from '../../../assets/images/HeaderMenuBtn.png';
import home_btn from '../../../assets/images/HeaderHomeBtn.png';
import search_btn from '../../../assets/images/search_btn.png';
import LocationBoxImg from '../../../assets/images/LocationBoxImg.png';
import LocImgGredient from '../../../assets/images/LocImgGredient.png';
import MiniArrow from '../../../assets/images/miniArrowThemClr.png';
import FeaturedEventCrousel from './FeatureEventsCrousel/FeaturedEventsCrousel';
import HomeScreenWinerySlider from './HomeScreenWinerySlider';
import calendar from '../../../assets/images/calendar3.png';
import vine from '../../../assets/images/vine2.png';
import { SafeAreaView } from 'react-native-safe-area-context';

import {useNavigation} from '@react-navigation/native';

const HomeScreenShopScreen = () => {
  const {height} = useWindowDimensions();
  const toggleSwitch = () => setIsEnabled(previousState => !previousState);

  const navigation = useNavigation();

  const onPressMenuBtn = () => {
    navigation.navigate('SideMenuScreen');
  };

  const onPressSrchBtn = () => {
    console.warn('onPressSrchBtn');
  };

  const onPressLocChngBtn = () => {
    // navigation.navigate('SignUpScreen');
    console.warn('onPressLocChngBtn');
  };

  const onPressSeeAllBtn = () => {
    navigation.navigate('WineriesListScreen');
  };

  return (
    
    
    <View style={styles.root}>
      
      <View style={styles.headAndNameContainer}>
        
        <View style={styles.head}>
          <Pressable
          onPress={onPressMenuBtn}>
          <Image source={HeaderMenuBtn} style={{height: 14, width: 14, marginLeft: 20}}></Image></Pressable>
          <Image source={Logo3} style={[styles.logo, {height: height * 0.15, marginLeft: -20}]} resizeMode="contain"/>
          <Image source={home_btn} style={{height: 0, width: 0, marginHorizontal: 0}}></Image>
        </View>
      </View>
      <ScrollView style={styles.scrollView}>
      <View style={styles.body}>
      
        <View style={styles.innerbody}>
        
          <View style={styles.TextBoxHeadings}>
            <View><Text style={styles.bodyHeadings}>LOCATION</Text></View>
            <Pressable
            onPress={onPressLocChngBtn}><View><Text style={styles.bodyHeadingChng}>CHANGE</Text></View></Pressable>
          </View>
            
            <View style={styles.locationMainView}>
                <View style={styles.locationTextArea}>
                  <Text style={styles.locationText}> Napa County </Text>
                </View>
                <View style={styles.locationPicArea}>
                  <ImageBackground source={LocationBoxImg} style={styles.locationPicBG} resizeMode='cover' imageStyle={{borderTopRightRadius: 12, borderBottomRightRadius: 12,}}>
                    <Image source={LocImgGredient} style={styles.locationPicFRT} resizeMode='cover'></Image>
                  </ImageBackground>
                </View>
            </View>

            <View style={[styles.locationMainView, {marginTop: 20,}]}>
                <View style={styles.locationTextArea}>
                  <Text style={styles.locationText}> Search Wines </Text>
                </View>
                <View style={styles.locationPicArea}>
                  <Image source={search_btn} resizeMod='cover' style={{height: 20, width: 20, marginRight: 25}}></Image>
                </View>
            </View>
          
          <View style={styles.FeatureEventHeding}>
            <View><Text style={styles.bodyHeadings}>RECOMMENDED WINERIES</Text></View>
            <View style={styles.SeeAllBtnArea}>
              <View>
                  <Pressable
                  onPress={onPressSeeAllBtn}><Text style={styles.SeeAllHeading}>SEE ALL</Text></Pressable>
              </View>
              <View style={styles.SeeAllHeadingArrow}>
                <Pressable
                  onPress={onPressSeeAllBtn}><View style={styles.ArrowContainer}><Image source={MiniArrow} resizeMode= 'center' style={styles.nextArrow}></Image></View></Pressable>
              </View>
            </View>
          </View>

        <View style={styles.crousel}>
          <FeaturedEventCrousel />
        </View>
           
        <View style={styles.wineriesEventHeding}>
            <Text style={styles.wineriesHeadings}>WINERIES</Text>
        </View>
    
        <View style={styles.HomeScreenWinerySliderContainer}>
            <HomeScreenWinerySlider />
        </View>

        </View>

        
      </View>
      
      </ScrollView>
    </View>
  );
};

export default HomeScreenShopScreen;

const styles = StyleSheet.create({
  root: {
    height: '100%',
    backgroundColor: '#FFFFFF',
  },
  headAndNameContainer: {
    backgroundColor: '#FFFFFF',
    shadowColor: "#EAEAEA",
shadowOffset: {
	width: 0,
	height: 12,
},
shadowOpacity: 0.58,
shadowRadius: 1,

elevation: 1,
  },
  head: {
    alignItems: 'center',
    shadowRadius: 'EAEAEA',
    display: 'flex',
    flexDirection: 'row',
    justifyContent: 'space-between',
  },
  logo: {
    width: '45%',
    maxWidth: 300,
    maxHeight: 200,
  },
  helloNameContainer: {
},
  helloText:{
    marginHorizontal: 20,
    fontSize: 15,
    color: '#3F0321',
    fontFamily: 'Inter-Bold',
  },
  nameHeadndSercBtn: {
    display: 'flex',
    flexDirection: 'row',
    alignItems: 'center',
    justifyContent: 'space-between',
    // marginTop: -15,
    // backgroundColor: 'yellow',
  },
  locEditBoxText: {
    marginHorizontal: 20,
    fontSize: 35,
    color: '#CDA15C',
    fontFamily: 'MontaguSlab_120pt-Light',
    marginBottom: 30,
  },
  nameHeadSrchBtnImg: {
    height: 20,
    width: 20,
    marginHorizontal: 20,
    marginTop: -25,
  },
  scrollView: {
height: '100%',
  },
  body: {
  },
  innerbody: {
    // alignContent: 'center',
    width: '100%',
    height: '100%',
    marginTop: 30,
    backgroundColor: '#FFFFFF',
  },
  TextBoxHeadings: {
    display: 'flex',
    flexDirection: 'row',
    alignItems: 'center',
    justifyContent: 'space-between',
    marginHorizontal: 30,
  },
  bodyHeadings: {
    fontFamily: 'Inter-Bold',
    fontSize: 15,
    color: '#3F0321',
    letterSpacing: 2,
  },
  bodyHeadingChng: {
    fontFamily: 'Inter-Regular',
    fontSize: 15,
    color: '#3F0321',
  },
  locationMainView: {
    backgroundColor: '#FFFFFF',
    alignItems: 'center',
    borderWidth: 1,
    borderColor: '#D9D9D9',
    height: 72,
    width: '90%',
    borderRadius: 12,
    marginHorizontal: 20,
    display: 'flex',
    flexDirection: 'row',
    justifyContent: 'space-between',
  },
  locationTextArea: {
    marginHorizontal: 20,
  },
  locationText: {
    fontSize: 18,
    color: '#CDA15C',
    fontFamily: 'MontaguSlab_120pt-Regular',
  },
  locationPicArea: {
    alignItems: 'center',
  },
  locationPicBG: {
    width: 120,
    height: '100%',
    borderRadius: 12,
  },
  locationPicFRT: {
    width: 150,
    height: 70,
  },
  FeatureEventHeding: {
    marginHorizontal: 30,
    marginTop: 20,
    display: 'flex',
    flexDirection: 'row',
    alignItems: 'center',
    justifyContent: 'space-between',
  },
  SeeAllBtnArea: {
    display: 'flex',
    flexDirection: 'row',
    alignItems: 'center',
    justifyContent: 'center',
    // marginHorizontal: 30,
  },
  SeeAllHeading: {
    fontFamily: 'Inter-Regular',
    fontSize: 12,
    color: '#3F0321',
  },
  ArrowContainer:{
    display: 'flex',
    flexDirection: 'row',
    alignItems: 'center',
    width: 8,
    height: 15,
    
    // marginHorizontal: 10,
  },
  SeeAllHeadingArrow: {
  },
  nextArrow: {
  },
  crousel: {
  },
  wineriesEventHeding: {
    // display: 'flex',
    flexDirection: 'column',
    // alignItems: 'center',
    justifyContent: 'space-between',
  },
  wineriesHeadings: {
    marginLeft: 20,
    fontFamily: 'Inter-Bold',
    fontSize: 15,
    color: '#3F0321',
    letterSpacing: 2,
    // marginLeft: 20,
  },

  TabNavArea: {
    height: 90,
    // width: '90%',
    // backgroundColor: '#FFFFFF',
    borderRadius: 12,
    display: 'flex',
    flexDirection: 'row',
    justifyContent: 'space-between',
  },
  TabNavLeft:{
    backgroundColor: '#FFFFFF',
    width: '50%',
    borderRadius: 20,
    marginLeft: 10,
    flexDirection: 'column',
    alignItems: 'center',
    justifyContent: 'center'
  },
  TabNavRight:{
    backgroundColor: '#3F0321',
    width: '50%',
    borderRadius: 20,
    marginRight: 10,
    flexDirection: 'column',
    alignItems: 'center',
    justifyContent: 'center'
  },
  HomeScreenWinerySliderContainer:{
    height: 2950,
  }
});
