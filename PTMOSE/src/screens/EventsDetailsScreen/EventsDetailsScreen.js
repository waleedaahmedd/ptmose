import { StyleSheet, Text, View, Pressable, onPress, Image, useWindowDimensions, ScrollView } from 'react-native';
import React, { useState, useRef} from 'react';

import menu_btn from '../../../assets/images/HeaderMenuBtn.png';
import home_btn from '../../../assets/images/HeaderHomeBtn.png';
import Logo from '../../../assets/images/Logo3.png';
import EventsHeadPic from '../../../assets/images/EventsHeadPic.png';
import bookmarkBtnImg from '../../../assets/images/bookmarkBtnImg.png';
import calendar from '../../../assets/images/calendar3.png';
import watch from '../../../assets/images/watch2.png';
import location from '../../../assets/images/LocationLogo2.png';
import attendees from '../../../assets/images/Attendees.png';

import { useNavigation } from '@react-navigation/native';

import Slider from './ReviewTheWinesSlider';

import { useForm, Controller } from 'react-hook-form';

const EventsDetailsScreen = () => {

    const {
        control, 
        handleSubmit, 
        formState: {error}
      } = useForm();

    const navigation = useNavigation();

    const {height} = useWindowDimensions();

    const onPressMenuBtn = () => {
        navigation.navigate('SideMenuScreen');
        // console.warn('onPressMenuBtn');
      };
    
      const onPressHomeBtn = () => {
        navigation.navigate('HomeScreen');
        // console.warn('onPressHomeBtn');
      };

      const onPressReserveBtn = () => {
        console.warn('onPressReserveBtn');
      };

      const onPressBookmarkBtn = () => {
        console.warn('onPressBookmarkBtn');
        // navigation.navigate('HomeScreenTastingScreen');
      };


  return (
    <ScrollView > 
    <View style={styles.root}>
      <View style={styles.header}>
            <View style={styles.navbar}>
            <Pressable onPress={onPressMenuBtn}>
            <Image
                source={menu_btn}
                style={{height: 14, width: 14, marginHorizontal: 15, resizeMode:'contain'}}></Image>
            </Pressable>
            <Image
            source={Logo}
            style={[styles.logo, {height: height * 0.1}]}
            resizeMode="contain"
            />
            <Pressable onPress={onPressHomeBtn}>
            <Image
                source={home_btn}
                style={{height: 16, width: 16, marginHorizontal: 15}} />
            </Pressable>
            </View>
        
            <View style={styles.headImage}>
                <Image source={EventsHeadPic} style={{height: '100%', width: '100%'}} resizeMode="cover"></Image>
            </View>

            <View style={styles.HeadEventTitleSec}>
                <Text style={styles.HeadMerchantName}>Vinous Reverie Wine Merchant</Text>
                <Text style={styles.HeadMerchantTitle}>Alsace Grand Cru Tasting</Text>
                
                <View style={styles.HeadEventButtonsSec}>
                    <Pressable
                    onPress={onPressReserveBtn}>
                    <View style={styles.HeadMerchantReserveBtn}><Text style={{fontSize: 12, color: '#FFFFFF', fontFamily: 'Inter-Bold', letterSpacing: 1,}}>RESERVE</Text></View></Pressable>
                    <Pressable
                    onPress={onPressBookmarkBtn}>
                    <View style={styles.HeadMerchantbookmrkBtn}><Image source={bookmarkBtnImg} resizeMode='contain' style={{height: 18, width: 16}}></Image></View></Pressable>
                </View>

            </View>
      </View>

      <View>
          <Text style={{fontSize: 16, color: '#3F0321', fontFamily: 'Inter-Bold', letterSpacing: 1, marginBottom: 10, marginLeft: 20}}>Review The Wines</Text>
        <Slider />
      </View>

      <View style={styles.EventDetailsSection}>
            <Text style={styles.aboutTheEventText}>ABOUT THE EVENT</Text>
            <Text style={styles.eventDescriptionText}>We will be tasting Rieslings from 5 different Alsatian Grand Crus! These wines come from privileged terroirs where geology, climate and exposure form an exceptional harmony. And the great Riesling grape is the ideal catalyst to showcase how each individual site differs. Great opportunity to experience Alsace! </Text>

            <View style={styles.eventDetails}>
                
                <View style={styles.detailsItems}>
                    <Image source={calendar} resizeMode='contain' style={{height: 16, width: 16, marginRight: 10}}></Image>
                    <View><Text style={{fontFamily: 'Inter-Regular', fontSize: 14, color: '#FFFFFF'}}>FEB 3</Text></View>
                </View>

                <View style={styles.detailsItems}>
                <Image source={watch} resizeMode='contain' style={{height: 16, width: 16, marginRight: 10}}></Image>
                <View><Text style={{fontFamily: 'Inter-Regular', fontSize: 14, color: '#FFFFFF'}}>5:00 PM - 7:00 PM PST</Text></View>
                </View>

                <View style={styles.detailsItems}>
                <Image source={location} resizeMode='contain' style={{height: 16, width: 16, marginRight: 10}}></Image>
                <View><Text style={{fontFamily: 'Inter-Regular', fontSize: 14, color: '#FFFFFF'}}>Vinous Reverie Winery Walnut Creek, CA</Text></View>
                </View>

                <View style={styles.detailsItems}>
                <Image source={attendees} resizeMode='contain' style={{height: 16, width: 16, marginRight: 10}}></Image>
                <View><Text style={{fontFamily: 'Inter-Regular', fontSize: 14, color: '#FFFFFF'}}>45 Attendees</Text></View>
                </View>

            </View>
      </View>


    </View>
    </ScrollView>
  )
}

export default EventsDetailsScreen

const styles = StyleSheet.create({
    root:{
        width: '100%',
        height: '100%',
        backgroundColor: '#D9D9D9',
    },
    header:{
        backgroundColor: '#FFFFFF',
        marginBottom: 20,
    },
    navbar:{
        alignItems: 'center',
        borderWidth: 1,
        backgroundColor: '#FFFFFF',
        borderColor: '#EAEAEA',
        shadowRadius: 'EAEAEA',
        shadowColor: 'red',
        display: 'flex',
        flexDirection: 'row',
        justifyContent: 'space-between',
    },
    logo:{
        width: '45%',
        maxWidth: 300,
        maxHeight: 200,
    },
    headImage:{
        height: 200,
        width: '100%',
    },
    HeadEventTitleSec:{
        // alignItems: 'center',
        paddingHorizontal: 20,
        width: '90%'
    },
    HeadMerchantName:{
        marginTop: 20,
        color: '#3F0321',
        fontFamily: 'Inter-Bold',
        fontSize: 16,
    },
    HeadMerchantTitle:{
        fontFamily: 'MontaguSlab_120pt-Regular',
        fontSize: 28,
        color: '#CDA15C',
    },
    HeadMerchantReserveBtn:{
        width: 315,
        height: 43,
        backgroundColor: '#3F0321',
        alignItems: 'center',
        justifyContent: 'center',
        borderRadius: 12,
        marginRight: 10,
    
    },
    HeadMerchantbookmrkBtn:{
        width: 43,
        height: 43,
        backgroundColor: '#3F0321',
        alignItems: 'center',
        justifyContent: 'center',
        borderRadius: 12,
    },
    HeadEventButtonsSec:{
        display: 'flex',
        flexDirection: 'row',
        justifyContent: 'space-between',
        marginBottom: 20,
        marginTop: 5,
    },
    EventDetailsSection: {
        width: '100%',
        height: '100%',
        backgroundColor: '#3F0321',
        marginTop: 30,
    },
    aboutTheEventText: {
        fontFamily: 'Inter-Bold',
        fontSize: 16,
        color: '#CDA15C',
        marginTop: 20,
        marginLeft: 20,
        letterSpacing: 1,
    },
    eventDescriptionText:{
        color: '#FFFFFF',
        fontFamily: 'Inter-Regular',
        fontSize: 14,
        paddingLeft: 20,
        paddingRight: 10,
    },
    eventDetails: {
        height: '100%',
        width: '100%',
        marginTop: 20,
        display: 'flex',
        flexDirection: 'column',
        marginBottom: 30,
    },
    detailsItems: {
        display: 'flex',
        flexDirection: 'row',
        alignItems: 'center',
        marginTop: 10,
        marginHorizontal: 20,
    }
})