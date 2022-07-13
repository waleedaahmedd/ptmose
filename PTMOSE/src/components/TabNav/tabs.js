import { StyleSheet, Text, View, Image, TouchableOpacity } from 'react-native';
import React from 'react';
import { createBottomTabNavigator } from '@react-navigation/bottom-tabs';

import HomeScreenTastingScreen from '../../screens/HomeScreenTastingScreen';
import HomeScreenShopScreen from '../../screens/HomeScreenShopScreen';

import { Controller } from 'react-hook-form';

const Tab = createBottomTabNavigator();

const Tabs = () => {
    return(
        <Tab.Navigator
        screenOptions={{
            headerShown: false,
            tabBarShowLabel: false,
            tabBarStyle:{
                position: 'absolute',
                height: 110,
                width: '100%',
                borderTopLeftRadius: 12,
                borderTopRightRadius: 12,
                backgroundColor: '#FFFFFF',
                elevation: 0,
                ...styles.shadow,
            }
        }}>
            <Tab.Screen name='HomeScreenTastingScreen' component={HomeScreenTastingScreen} 
            options={{
                tabBarIcon: ({focused}) => (
                    <View style={[styles.BTabLeftBtn, { backgroundColor: focused?   '#3F0321' : '#FFFFFF'}]} >
                        <Image source={focused? require('../../../assets/images/calendar2.png') : require('../../../assets/images/calendar3.png')} resizeMode='contain' style={{height: 16, width: 16}}/>
                        <Text style={{
                            fontFamily: 'Inter-Bold', 
                            color: focused?   '#FFFFFF' : '#CBA123',
                            }}>TASTING</Text>
                    </View>
                ),
            }}/>
            
            <Tab.Screen 
            name='HomeScreenShopScreen' 
            component={HomeScreenShopScreen}
            options={{
                tabBarIcon: ({focused}) => (
                    <View style={[styles.BTabLeftBtn, { backgroundColor: focused?   '#3F0321' : '#FFFFFF'}]} >
                        <Image source={focused? require('../../../assets/images/vine2.png') : require('../../../assets/images/vine.png')} resizeMode='contain' style={{height: 16, width: 16}}/>
                        <Text style={{
                            fontFamily: 'Inter-Bold', 
                            color: focused?   '#FFFFFF' : '#CBA123'
                            }}>SHOP</Text>
                    </View>
                ),
            }}/>
        </Tab.Navigator>
    );
}

const styles = StyleSheet.create({
    shadow:{
        shadowColor: '#D9D9D9',
        shadowOffset: {
            width: 0,
            height: 10,
        },
        shadowOpacity: 0.25,
        shadowRadius: 3.5,
        elevation: 5,
    },
    BTabLeftBtn:{
        height: 80,
        width: 190,
        alignItems: 'center',
        justifyContent: 'center',
        borderRadius: 12,
        marginLeft: 10,
        marginRight: 10,
    }
});

export default Tabs;