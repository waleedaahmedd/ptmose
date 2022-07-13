import { StyleSheet, Text, View, Pressable, onPress, useWindowDimensions, Image, ScrollView, TextInput } from 'react-native';
import React from 'react';

import menu_btn from '../../../assets/images/HeaderMenuBtn.png';
import home_btn from '../../../assets/images/HeaderHomeBtn.png';
import Logo from '../../../assets/images/Logo3.png';
import backBtn from '../../../assets/images/backBtn.png';

import { useNavigation } from '@react-navigation/native';



const RecommendationScreen = () => {

  const navigation = useNavigation();

    const {height} = useWindowDimensions();

    const onPressMenuBtn = () => {
      navigation.navigate('SideMenuScreen');
    };
  
    const onPressHomeBtn = () => {
      navigation.navigate('HomeScreen');
    };

    const onPressBackBtn = () => {
        console.warn('onPressBackBtn');
      };

      const onPressBuyThisWineBtn = () => {
        navigation.navigate('WineDetailsPurchaseScreen');
      };

      

  return (
    <View style={styles.root}>
      <View style={styles.Header}>
        <Pressable onPress={onPressMenuBtn}>
          <Image
            source={menu_btn}
            style={{
              height: 14,
              width: 14,
              marginHorizontal: 15,
              resizeMode: 'contain',
            }}
          />
        </Pressable>

        <Image
          source={Logo}
          style={[styles.logo, {height: height * 0.1}]}
          resizeMode="contain"
        />

        <Pressable onPress={onPressHomeBtn}>
          <Image
            source={home_btn}
            style={{height: 16, width: 16, marginHorizontal: 15}}
          />
        </Pressable>
      </View>

        <View style={{backgroundColor: '#FFFFFF', width: '100%',marginTop: 5}}>
          <View style={styles.backBtnStyle}>
            <Pressable onPress={onPressBackBtn}>
              <Image
                source={backBtn}
                resizeMode="contain"
                style={{width: 10, height: 10, marginRight: 5}}
              />
            </Pressable>
            <Pressable onPress={onPressBackBtn}>
              <View>
                <Text style={{fontSize: 12, color: '#3F0321'}}>BACK</Text>
              </View> 
            </Pressable>
          </View>
          <Text style={{fontFamily: 'MontaguSlab_120pt-Regular', fontSize: 28, color: '#CDA15C', marginHorizontal: 20, marginTop: 30}}>Thank you for submitting your review!</Text>
          
          <View style={{width: '100%', height: '100%', alignItems: 'center', backgroundColor: '#FFFFFF', marginTop: 30}}>
            <View style={styles.ReccContainerChildStyle}>
              <Text style={{color: '#3F0321', fontFamily: 'Inter-Bold', fontSize: 16, letterSpacing: 1, marginTop: 20, marginLeft: 20}}>RECOMMENDED FOR YOU </Text>
              <Text style={{fontFamily: 'MontaguSlab_120pt-Regular', fontSize: 24, color: '#CDA15C', marginTop: 20, marginLeft: 20}}>Cline Family Cellars Farmhouse Red</Text>
              <Text style={{color: '#3F0321', fontFamily: 'Inter-Bold', fontSize: 16, letterSpacing: 1, marginTop: 10, marginLeft: 20}}>Sanoma, CA 2018</Text>
              
              <Pressable onPress={onPressBuyThisWineBtn}>
              <View style={{width: '100%', alignItems: 'center'}}>
                <View style={{height: 62, width: 308, backgroundColor: '#3F0321', borderRadius: 12, alignItems: 'center', justifyContent: 'center', marginTop: 20, marginBottom: 100}}><Text style={{color: '#FFFFFF', fontFamily: 'Inter-Bold', fontSize: 16, letterSpacing: 1}}>BUY THIS WINE</Text></View>
              </View></Pressable>
            
            </View>
          </View>
          
        </View>

    </View>
  );
};

export default RecommendationScreen;

const styles = StyleSheet.create({
    root: {
        height: '100%',
        width: '100%',
        backgroundColor: '#FFFFFF',
    },
    Header: {
        alignItems: 'center',
        borderWidth: 1,
        backgroundColor: '#FFFFFF',
        borderColor: '#D9D9D9',
        shadowRadius: '#D9D9D9',
        shadowColor: 'red',
        display: 'flex',
        flexDirection: 'row',
        justifyContent: 'space-between',
    
        shadowColor: '#D9D9D9',
        shadowOffset: {
          width: 0,
          height: 1,
        },
        shadowOpacity: 0.18,
        shadowRadius: 1.0,
        elevation: 1,
      },
      logo: {
        width: '45%',
        maxWidth: 300,
        maxHeight: 200,
      },
      backBtnStyle: {
        display: 'flex',
        flexDirection: 'row',
        alignItems: 'center',
        marginTop: 30,
        marginLeft: 20,
      },
      ReccContainerChildStyle:{
        width: 368, 
        height: 284,
        borderRadius: 12,
        backgroundColor: '#FFFFFF',

        shadowColor: "#D9D9D9",
        shadowOffset: {
          width: 0,
          height: 6,
        },
        shadowOpacity: 0.37,
        shadowRadius: 7.49,
        
        elevation: 12,

      }
});