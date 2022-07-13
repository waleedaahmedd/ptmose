import {StyleSheet, Text, View, Image, Pressable, onPress} from 'react-native';
import React from 'react';
import SplashOne from '../../../assets/images/SplashOne.png';
import {useNavigation} from '@react-navigation/native';

const SplashOneScreen = () => {
  const navigation = useNavigation();

  const onClick = () => {
    navigation.navigate('SplashTwoScreen');
  };

  return (
    <Pressable onPress={onClick}>
      <View style={styles.main}>
        <Image source={SplashOne} style={styles.imagesection}></Image>
      </View>
    </Pressable>
  );
};

export default SplashOneScreen;

const styles = StyleSheet.create({
  main: {},
  imagesection: {
    resizeMode: 'stretch',
    height: '100%',
    width: '100%',
  },
});