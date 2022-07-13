import {
  StyleSheet,
  Text,
  View,
  Image,
  useWindowDimensions,
  Pressable,
  onPress,
} from 'react-native';
import React, {useState} from 'react';
import Logo from '../../../assets/images/Logo.png';
import {useNavigation} from '@react-navigation/native';

const SplashTwoScreen = () => {
  const {height} = useWindowDimensions();

  const navigation = useNavigation();

  const onClick = () => {
    navigation.navigate('SignInScreen');
  };

  return (
    <Pressable onPress={onClick}>
      <View style={styles.main}>
        <Image
          source={Logo}
          style={[styles.logo, {height: height * 0.25}]}
          resizeMode="contain"
        />
      </View>
    </Pressable>
  );
};

export default SplashTwoScreen;

const styles = StyleSheet.create({
  main: {
    backgroundColor: '#3F0321',
    justifyContent: 'center',
    alignItems: 'center',
    height: '100%',
  },
  logo: {
    backgroundColor: '#3F0321',
    width: '60%',
    maxWidth: 300,
    maxHeight: 200,
  },
});
