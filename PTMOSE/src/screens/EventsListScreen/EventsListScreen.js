import { StyleSheet, Text, View, useWindowDimensions, Image, Pressable } from 'react-native';
import React from 'react';
import TastingSlider from './TastingSlider';

import menu_btn from '../../../assets/images/HeaderMenuBtn.png';
import home_btn from '../../../assets/images/HeaderHomeBtn.png';
import Logo from '../../../assets/images/Logo3.png';

import { useNavigation } from '@react-navigation/native';
import { useForm, Controller } from 'react-hook-form';

const EventsListScreen = () => {

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
  
    const onPressHomeBtn = () => {
      navigation.navigate('HomeScreen');
    };

  return (
    <View style={styles.root}>
    <View style={styles.navbar}>
        <Pressable onPress={onPressMenuBtn}>
            <Image source={menu_btn} style={{height: 14, width: 14, marginHorizontal: 15, resizeMode:'contain'}}></Image>
        </Pressable>
            
        <Image
            source={Logo}
            style={[styles.logo, {height: height * 0.1}]}
            resizeMode="contain"
        />
        
        <Pressable onPress={onPressHomeBtn}>
            <Image
                source={home_btn}
                style={{height: 16, width: 16, marginHorizontal: 15}}></Image>
        </Pressable>
    </View>

    <View style={{height: '100%'}} > 
        
        <Text style={styles.tastingHeadingText}>Tastings</Text>
        <View style={styles.sliderPortion}>
        <TastingSlider />
        </View>
       
    </View>
    
</View>
  );
};

export default EventsListScreen;

const styles = StyleSheet.create({
  root:{
    backgroundColor: '#FFFFFF',
},
navbar:{
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
tastingHeadingText: {
    marginTop: 10,
    marginLeft: 20,
    fontFamily: 'MontaguSlab_120pt-Regular',
    fontSize: 35,
    color: '#CDA15C',
},
sliderPortion:{
    // backgroundColor: 'yellow',
    flex: 0.82,
}
});