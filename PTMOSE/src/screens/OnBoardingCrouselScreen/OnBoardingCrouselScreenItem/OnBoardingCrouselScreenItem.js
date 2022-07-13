import { StyleSheet, Text, View, Image, useWindowDimensions, ImageBackground, TouchableOpacity, Pressable, onPress } from 'react-native'
import React from 'react'
// import ImageOverlay from 'react-native-image-overlay';
import { useNavigation } from '@react-navigation/native';
import clsBtn from '../../../../assets/images/OnBoardClosebtn.png';

export default OnBoardingCrouselScreenItem = ( { item }) => {
  const { width } = useWindowDimensions();

  const navigation = useNavigation();

  const onPressClsBtn = () => {
    navigation.navigate('HomeScreen');
    // console.warn('onPressClsBtn');
  };

  return (
    <View style={[styles.ItemRoot, { width, }]}>

      
        <ImageBackground source={item.image} style={[styles.imageStyle, {width, resizeMode: 'stretch'}]}>
          <Pressable onPress={onPressClsBtn}>
            <Image source={clsBtn} resizeMode='contain' style={styles.closeBtn}></Image>
          </Pressable>
        </ImageBackground>
        
    </View>
    
  );
};
const styles = StyleSheet.create({
  ItemRoot: {
    width: '100%',
    height: '100%',

  },
  imageStyle: {
    width: '100%',
    height: '100%',
  },
  closeBtnCont: {
    display: 'flex',
    flexDirection: 'row',
    alignItems: 'flex-end',
  },
  closeBtn: {
    marginTop: 20,
    height: 40,
  },
});