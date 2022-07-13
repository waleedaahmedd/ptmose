import { StyleSheet, Text, View, Pressable, onPress, Image, useWindowDimensions, ScrollView, TextInput } from 'react-native';
import React, { useState, useRef} from 'react';

import CustomInput from '../../components/CustomInput/CustomInput';

import menu_btn from '../../../assets/images/HeaderMenuBtn.png';
import shopChard from '../../../assets/images/shopChard.png';
import Logo from '../../../assets/images/Logo3.png';
import backBtn from '../../../assets/images/backBtn.png';
import CardVisaIcon from '../../../assets/images/CardVisaIcon.png';

import iconlyBoldCalendar from '../../../assets/images/Iconly-Bold-Calendar.png';
import iconlyBoldLock from '../../../assets/images/Iconly-Bold-Lock.png';
import iconlyBoldProfile from '../../../assets/images/Iconly-Bold-Profile.png';
import IconsMultimediacreditcard from '../../../assets/images/Icons-Multimedia-credit-card.png';

import {useNavigation} from '@react-navigation/native';

import { useForm, Controller } from 'react-hook-form';

const CartScreenTwo = () => {

    const {
        control, 
        handleSubmit, 
        formState: {error}
      } = useForm();

    const navigation = useNavigation();

    const {height} = useWindowDimensions();

    const onPressMenuBtn = () => {
        navigation.navigate('SideMenuScreen');
    };
        
    const onPressShopCardBtn = () => {
    console.warn('onPressShopCardBtn');
    };

    const onPressBackBtn = () =>{
        navigation.navigate('CartScreenOne');
    } 

    
    const onPressPlaceOrderBtn = () =>{
        navigation.navigate('CartScreenThree');
    } 

  return (
    <View style={styles.root}>
      
      
      <View style={styles.Header}>
            <Pressable onPress={onPressMenuBtn}>
            <Image source={menu_btn} style={{height: 14, width: 14, marginHorizontal: 15, resizeMode:'contain'}} /></Pressable>
            <Image source={Logo} style={[styles.logo, {height: height * 0.1}]} resizeMode="contain"/>
            <Pressable onPress={onPressShopCardBtn}>
                <Image source={shopChard} style={{height: 16, width: 16, marginHorizontal: 15}} />
            </Pressable>
        </View>

        <View style={{backgroundColor: '#FFFFFF', width: '100%', marginTop: 5,}}>
            <View style={styles.backBtnStyle}>
                <View style={{flexDirection: 'row', alignItems: 'center'}}>
                    <Pressable onPress={onPressBackBtn}><Image source={backBtn} resizeMode='contain'  style={{width: 10, height: 10, marginRight: 5}}/></Pressable>
                    <Pressable onPress={onPressBackBtn}><View><Text style={{fontSize: 12, color: '#3F0321'}}>BACK</Text></View></Pressable>
                </View>

                <View>
                    <Text style={{fontFamily: 'MontaguSlab_120pt-Regular', fontSize: 35, color: '#CDA15C', marginRight: 20}}>Billing</Text>
                </View>
            </View> 
        </View> 

        <View style={{width: '100%', alignItems: 'center', marginTop: 40}}>
            <View style={{height:173, width: 308, backgroundColor: '#3F0321', borderRadius: 8}}>
                <Text style={{fontFamily: 'MontaguSlab_120pt-Regular', fontSize: 20, color: '#FFFFFF', marginTop: 20, marginLeft: 20}}>4123 4567 8901 2345</Text>
                <Text style={{fontFamily: 'MontaguSlab_120pt-Regular', fontSize: 20, color: '#FFFFFF', marginLeft: 20}}>12 / 22</Text>
                
                <View style={{flexDirection: 'row', alignItems: 'center', justifyContent: 'space-between', marginTop: 30}}>
                <Text style={{fontFamily: 'MontaguSlab_120pt-Regular', fontSize: 20, color: '#FFFFFF', marginLeft: 20}}>Paul Wilkins</Text>
                <Image source={CardVisaIcon} resizeMode='contain' style={{opacity: 0.5, marginRight: 20, height: 30.89, width: 46.7}}/></View>
            </View>
        </View>

        <View style={{marginTop: 30}}>
            <Text style={{fontFamily: 'Inter-Bold', color: '#3F0321', fontSize: 14,marginLeft: 20, }}>CARD HOLDER </Text>
            <View style={{flexDirection: 'row', alignItems: 'center', marginTop: 10}}>
            <View style={{height: 24, width: 24, marginHorizontal: 20}}><Image source={iconlyBoldProfile} style={{height: 20, width: 16,}} resizeMod='contain' /></View>
            <TextInput 
                style={{fontSize: 16, fontFamily: 'Inter-Regular', backgroundColor: '#FFFFFF',}}
                underlineColorAndroid = "transparent"
                // numberOfLines={1}
                width={'80%'}
                placeholder = "Oguz Bulbul"
                placeholderTextColor = "#3F0321"
                autoCapitalize = "none"
            /></View>

            <Text style={{fontFamily: 'Inter-Bold', color: '#3F0321', fontSize: 14,marginLeft: 20, marginTop: 20}}>CARD NUMBER</Text>
            <View style={{flexDirection: 'row', alignItems: 'center', marginTop: 10}}>
            <View style={{height: 24, width: 24, marginHorizontal: 20}}><Image source={IconsMultimediacreditcard} style={{height: 18, width: 24,}} resizeMod='contain'/></View>
            <TextInput 
                style={{fontSize: 16, fontFamily: 'Inter-Regular', backgroundColor: '#FFFFFF',}}
                underlineColorAndroid = "transparent"
                width={'80%'}
                keyboardType={'numeric'}
                maxLength={16}
                placeholder = "4123 4567 8901 2345"
                placeholderTextColor = "#3F0321"
                autoCapitalize = "none"
            /></View>
     


            <View style={{flexDirection: 'row', alignItems: 'center',}}>
            <View>
            <Text style={{fontFamily: 'Inter-Bold', color: '#3F0321', fontSize: 14,marginLeft: 20, marginTop: 20}}>EXPIRY DATE</Text>
            <View style={{flexDirection: 'row', alignItems: 'center', marginTop: 10}}>
            <View style={{height: 24, width: 24, marginHorizontal: 20}}><Image source={iconlyBoldCalendar} style={{height: 20, width: 18,}} resizeMod='contain'/></View>
            <TextInput
                style={{fontSize: 16, fontFamily: 'Inter-Regular', backgroundColor: '#FFFFFF',}}
                underlineColorAndroid = "transparent"
                keyboardType= 'phone-pad'
                placeholder = "01/2022"
                width={80}
                maxLength={7}
                placeholderTextColor = "#3F0321"
                autoCapitalize = "none"
            /></View></View>
            
          
            <View style={{marginLeft: 50}}>
            <Text style={{fontFamily: 'Inter-Bold', color: '#3F0321', fontSize: 14, marginLeft: 20, marginTop: 20}}>CCV</Text>
            <View style={{flexDirection: 'row', alignItems: 'center'}}>
            <View style={{height: 24, width: 24, marginHorizontal: 20}}><Image source={iconlyBoldLock} style={{height: 20, width: 17,}} resizeMod='contain'/></View>
            <TextInput
                style={{fontSize: 16, fontFamily: 'Inter-Regular', backgroundColor: '#FFFFFF',}}
                underlineColorAndroid = "transparent"
                placeholder = "000"
                keyboardType={'numeric'}
                maxLength={3}
                width={80}
                placeholderTextColor = "#3F0321"
                autoCapitalize = "none"
            /></View></View>

            </View>
            <View style={{width: '100%', alignItems: 'center'}}>
            <Pressable onPress={onPressPlaceOrderBtn}>
                
        <View style={{height: 62, width: 368, backgroundColor: '#3F0321', alignItems: 'center', justifyContent: 'center', borderRadius: 12, marginTop: 10}}>
            <Text style={{fontFamily: 'Inter-Bold', fontSize: 16, color: '#FFFFFF'}}>PLACE ORDER</Text>
        </View></Pressable></View>
            
          
        </View>




    </View>
  );
};

export default CartScreenTwo;

const styles = StyleSheet.create({
    root:{
        flex: 1,
        backgroundColor: '#FFFFFF',
        // alignItems: 'center',
    },
    Header:{
        alignItems: 'center',
        borderWidth: 1,
        backgroundColor: '#FFFFFF',
        borderColor: '#EAEAEA',
        shadowRadius: '#EAEAEA',
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
    backBtnStyle:{
        display: 'flex',
        flexDirection:'row',
        alignItems: 'center',
        justifyContent: 'space-between',
        marginTop: 20,
        marginLeft: 20,
    },
});