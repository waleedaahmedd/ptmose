import { StyleSheet, Text, View, Pressable, onPress, Image, useWindowDimensions, ScrollView, TextInput } from 'react-native';
import React, { useState, useRef} from 'react';

import menu_btn from '../../../assets/images/HeaderMenuBtn.png';
import shopChard from '../../../assets/images/shopChard.png';
import Logo from '../../../assets/images/Logo3.png';
import orderCompleteBox from '../../../assets/images/orderCompleteBox.png';

import {useNavigation} from '@react-navigation/native';
import { useForm, Controller } from 'react-hook-form';

const CartScreenThree = () => {

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
    
    const onPressHomeBtn = () => {
        navigation.navigate('HomeScreen');
    };

    


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

        <View style={styles.body}>
            <Image source={orderCompleteBox} resizeMode="contain" style={{height: 120, width: 104.5}} />
            <Text style={{fontFamily: 'MontaguSlab_120pt-Regular', fontSize: 25, color: '#CDA15C', textAlign: 'center'}}>Your order is complete.</Text>
            <Text style={{fontFamily: 'Inter-Regular', color: '#000000', fontSize: 16, textAlign: 'center' }}>An invoice has been emailed to you.</Text>
        </View>

        
        <View style={{width: '100%', alignItems: 'center', marginBottom: 20}}>
            <Pressable onPress={onPressHomeBtn}>
                <View style={{height: 62, width: 368, backgroundColor: '#3F0321', alignItems: 'center', justifyContent: 'center', borderRadius: 12, marginTop: 10}}>
                    <Text style={{fontFamily: 'Inter-Bold', fontSize: 16, color: '#FFFFFF'}}>Home</Text>
                </View>
            </Pressable>
        </View>

    </View>
  );
};

export default CartScreenThree;

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
    body:{
        height: '75%',
        width: '100%',
        display: 'flex',
        alignItems: 'center',
        justifyContent: 'center',
    }
});