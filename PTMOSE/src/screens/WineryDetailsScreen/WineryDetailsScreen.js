import { StyleSheet, Text, View, Pressable, onPress, Image, useWindowDimensions, ScrollView } from 'react-native';
import React, { useState, useRef} from 'react';

import menu_btn from '../../../assets/images/HeaderMenuBtn.png';
import home_btn from '../../../assets/images/HeaderHomeBtn.png';
import Logo from '../../../assets/images/Logo3.png';
import headPic from '../../../assets/images/WineryProfileHeadPic.png';
import calendar from '../../../assets/images/calendar3.png';
import watch from '../../../assets/images/watch2.png';
import LocationLogo from '../../../assets/images/LocationLogo2.png';

import WineriesTastingsSlider from './WineriesTastingsSlider';
import ShopWinesSlider from './ShopWinesSlider';

import { useNavigation } from '@react-navigation/native';

const WineryDetailsScreen = () => {

    const navigation = useNavigation();

    const {height} = useWindowDimensions();

    const onPressMenuBtn = () => {
        navigation.navigate('SideMenuScreen');
      };

      const onPressHomeBtn = () => {
        navigation.navigate('HomeScreen');
      };
      

      const onPressShopWineBtn = () => {
        console.warn('onPressShopWineBtn');
      };

      const onPressBookmarkBtn = () => {
        console.warn('onPressBookmarkBtn');
      };


  return (
    <View style={styles.root}>

        <View style={styles.navbar}>
            
            <Pressable onPress={onPressMenuBtn}>
                <Image source={menu_btn} style={{height: 14, width: 14, marginHorizontal: 15, resizeMode:'contain'}}></Image>
            </Pressable>
            
            <Image source={Logo} style={[styles.logo, {height: height * 0.1}]} resizeMode="contain"/>
            
            <Pressable onPress={onPressHomeBtn}>
                <Image source={home_btn} style={{height: 16, width: 16, marginHorizontal: 15}}></Image>
            </Pressable>
        </View>

        <ScrollView>
            <View style={{height: 154, width: '100%'}}>
                <Image style={{height: 154, width: '100%'}} source={headPic} resizeMode="stretch"></Image>
            </View>

            <View style={{width: '100%', alignItems: 'center'}}>
                <View style={{height: 212, width: 368, backgroundColor: '#3F0321', borderRadius: 12, marginTop: -80}}>
                    <Text style={{fontSize: 28, color: '#FFFFFF', fontFamily: 'MontaguSlab_120pt-Regular', marginRight: 80, marginTop: 20, marginLeft: 20,}}>Vinous Reverie Wine Merchant</Text>
                    
                    <View style={{alignItems: 'center',flexDirection: 'row', justifyContent: 'space-evenly'}}>
                        
                        <Pressable onPress={onPressShopWineBtn}>
                        <View style={{height: 62, width: 236, backgroundColor: '#FFFFFF', borderRadius: 12,  marginTop: 20, marginLeft: 20, justifyContent: 'center', alignItems: 'center'}}>
                            <Text style={{fontSize: 18, color: '#CDA15C', fontFamily: 'Inter-Bold',}}>SHOP WINES</Text>
                        </View></Pressable>


                        <Pressable onPress={onPressBookmarkBtn}>
                        <View style={{height: 62, width: 62, backgroundColor: '#FFFFFF', borderRadius: 12,marginTop: 20, alignItems: 'center', justifyContent: 'center'}}>
                            <Image source={calendar} style={{height: 16, width: 16}} resizeMode='contain' />
                        </View></Pressable>

                    </View>

                </View>
            </View>

            <View>
                <Text style={styles.SecondTextStyle}>ABOUT THE WINERY</Text>
                <Text style={styles.SimpleTextStyle}>Vinous Reverie Wine Merchant of Walnut Creek, CA offers a unique inventory of standard and specialty wines for every occasion. If you’re an  experienced wine drinker seeking to elevate your current collection or a beginner looking to establish an affinity for wines, we’re here to assist you.</Text>
                
                <Text style={styles.SecondTextStyle} >KEY DETAILS</Text>
                
                <View style={styles.KeyDetailsContainer}>
            
                    <View style={{alignItems: 'center', flexDirection: 'row', marginTop: 10}}>
                        <Image source={watch} style={{height: 16, width: 16,}} resizeMode='contain' />
                        <Text style={styles.SimpleTextStyle}>8:00 AM - 7:00PM PST</Text>
                    </View>
                    
                    <View style={{alignItems: 'center', flexDirection: 'row',marginTop:10}}>
                        <Image source={LocationLogo} style={{height: 16, width: 14,}} resizeMode='contain'/>
                        <Text style={styles.SimpleTextStyle}>Vinous Revierie Winery Walnut Creek, CA</Text>
                    </View>

                </View>

                <View style={styles.tastingSliderContainer}>
                    <Text style={[styles.PrimaryTextStyle, {marginBottom: 20}]}>Tastings</Text>
                    <WineriesTastingsSlider />
                </View>

                <View>
                    <Text style={[styles.PrimaryTextStyle, {marginLeft: 20, flex: 0.3}]}>Shop Wines</Text>
                    <ShopWinesSlider />
                </View>

            </View>

        </ScrollView>
      
    </View>
  );
};

export default WineryDetailsScreen;

const styles = StyleSheet.create({
    root: {
        height: '100%',
        backgroundColor: '#FFFFFF',
      },
      navbar: {
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
      logo: {
        width: '45%',
        maxWidth: 300,
        maxHeight: 200,
      },
      PrimaryTextStyle:{
        fontFamily: 'MontaguSlab_120pt-Regular',
        fontSize: 35,
        color: '#CDA15C',
        letterSpacing: 1,
        marginTop: 30,
      },
     SecondTextStyle:{
        fontFamily: 'Inter-Bold',
        fontSize: 16,
        color: '#CDA15C',
        marginTop: 20,
        marginLeft: 20
      },
      SimpleTextStyle:{
        fontFamily: 'Inter-Regular',
        fontSize: 14,
        color: '#3F0321',
        marginHorizontal: 20,
      },
      KeyDetailsContainer:{
          marginLeft: 20,
      },
      tastingSliderContainer:{
          marginLeft: 20,
      }
});