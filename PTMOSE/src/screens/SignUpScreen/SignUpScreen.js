import React, {useState} from 'react';
import {
  View,
  Text,
  Image,
  StyleSheet,
  useWindowDimensions,
  ScrollView,
  Pressable,
  onPress,
  Alert,
} from 'react-native';
import Logo2 from '../../../assets/images/Logo2.png';
import facebook_connect_btn from '../../../assets/images/connect_facebook.png';
import google_connect_btn from '../../../assets/images/connect_google.png';
import MiniArrow from '../../../assets/images/mini_arrow_shack.png';
import CustomInput from '../../components/CustomInput/CustomInput';
import {useNavigation} from '@react-navigation/native';

import {useForm} from 'react-hook-form';
import { Auth } from 'aws-amplify';

const EMAIL_REGEX = /^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/;

const SignUpScreen = () => {

  const {control, handleSubmit, watch} = useForm();
  const pwd = watch('password');

  const navigation = useNavigation();

  const {height} = useWindowDimensions();

  const onRegBtnPress = async(data) => {
    
    const {username, password, email, name} = data;
    try{
      await Auth.signUp({
        username,
        password,
        attributes:{email, name, preferred_username: username},
      });
      navigation.navigate('ConfirmEmailScreen', {username});
    } catch (e){
      Alert.alert('Oops', e.message)
    }
    // navigation.navigate('SignInScreen');
  };

  const onPressGoogleBtn = () => {
    console.warn('onPressGoogleBtn');
  };

  const onPressFacebookBtn = () => {
    console.warn('onPressFacebookBtn');
  };
  const onLoginPress = () => {
    // console.warn('onLoginPress');
    navigation.navigate('SignInScreen');
  };



  return (
    <ScrollView>
      <View style={styles.root}>
        <View style={styles.main}>
          <View style={styles.head}>
            <Image
              source={Logo2}
              style={[styles.logo, {height: height * 0.15}]}
              resizeMode="contain"
            />
          </View>

          <Text
            style={{
              color: '#CDA15C',
              fontSize: 35,
              fontFamily: 'MontaguSlab_120pt-Light',
            }}>
            Sign Up
          </Text>

          <CustomInput
            name="name"
            control={control}
            placeholder="NAME"
            setsource={require('../../../assets/images/profile_close_1.png')}
            rules={{
              required: 'Name is required'}}
          />

          <CustomInput
            name="email"
            control={control}
            placeholder="EMAIL ADDRESS"
            setsource={require('../../../assets/images/mail_tag.png')}
            rules={{
              required: 'Email is required',
              pattern: {value: EMAIL_REGEX, message: 'Email is invalid'},
            }}
          />

          <CustomInput
            name="username"
            control={control}
            placeholder="USERNAME"
            setsource={require('../../../assets/images/profile_close_1.png')}
            rules={{
              required: 'Username is required',
              minLength: {
                value: 8,
                message: 'Username should be at least 8 characters long',
              },
              maxLength: {
                value: 24,
                message: 'Username should be max 24 characters long',
              },
            }}
          />

          <CustomInput
            name="password"
            control={control}
            placeholder="PASSWORD"
            setsource={require('../../../assets/images/lock_2.png')}
            secureTextEntry
              rules={{
                required: 'Password is required',
                  minLength: {
                  value: 8,
                  message: 'Password should be at least 8 characters long',
            },
          }}
          />

          <CustomInput
            name="confirmpassword"
            control={control}
            placeholder="CONFIRMED PASSWORD"
            setsource={require('../../../assets/images/lock_2.png')}
            secureTextEntry
            rules={{
              validate: value => value === pwd || 'Password do not match',
            }}
          />

          <Pressable onPress={handleSubmit(onRegBtnPress)}>
            <View style={styles.RegButton}>
              <Text style={styles.RegButtonText}>REGISTER</Text>
            </View>
          </Pressable>

          <Text
            style={{
              color: '#3F0321',
              fontFamily: 'Inter-Bold',
              fontSize: 16,
              textAlign: 'left',
            }}>
            OR USE:
          </Text>

          <View style={styles.cnt_btn}>
            <Pressable onPress={onPressGoogleBtn}>
              <Image
                source={google_connect_btn}
                style={[styles.ggl_btn]}
                resizeMode="contain"
              />
            </Pressable>

            <Pressable onPress={onPressFacebookBtn}>
              <Image
                source={facebook_connect_btn}
                style={[styles.fb_btn]}
                resizeMode="contain"
              />
            </Pressable>
          </View>

          <View style={styles.loginHere}>
            <Text
              style={{
                color: '#3F0321',
                fontWeight: 'bold',
                fontSize: 16,
                fontFamily: 'Inter-Bold',
                textAlign: 'left',
              }}>
              ALREADY HAVE AN ACCOUNT?
            </Text>

            <View style={styles.loginBtn}>
              <View style={styles.loginBtnText}>
                <Text
                  style={{
                    color: '#CDA15C',
                    fontSize: 35,
                    fontFamily: 'MontaguSlab_120pt-Light',
                  }}
                  onPress={onLoginPress}>
                  Login
                </Text>
              </View>

              <View style={styles.loginBtnArrow}>
                <Pressable onPress={onLoginPress}>
                  <Image
                    source={MiniArrow}
                    style={styles.arrowBtn}
                    onPress={onLoginPress}
                    resizeMode='contain'></Image>
                </Pressable>
              </View>
            </View>
          </View>
        </View>
      </View>
    </ScrollView>
  );
};

const styles = StyleSheet.create({
  root: {
    backgroundColor: '#3F0321',
    alignItems: 'center',
  },
  head: {
    alignItems: 'center',
  },
  logo: {
    width: 219.1,
    height: 43.28,
    maxWidth: 300,
    maxHeight: 200,
    display: 'flex',
    alignItems: 'center',
  },
  main: {
    paddingHorizontal: 25,
    flexDirection: 'column',
    backgroundColor: 'white',
    fontSize: 35,
    height: '100%',
    width: '100%',
  },
  RegButton: {
    backgroundColor: '#3F0321',
    height: 62,
    width: '100%',
    borderRadius: 12,
    alignItems: 'center',
    justifyContent: 'center',
    marginVertical: 5,
  },
  RegButtonText: {
    fontSize: 16,
    fontFamily: 'Inter-Bold',
    color: '#ffffff',
    padding: 15,
    letterSpacing: 1,
  },
  cnt_btn: {
    //   marginTop: 35,
    display: 'flex',
    flexDirection: 'row',
    justifyContent: 'center',
    marginBottom: 50,
  },
  ggl_btn: {
    width: 70,
    height: 70,
    marginHorizontal: 10,
  },
  fb_btn: {
    width: 70,
    height: 70,
    marginHorizontal: 10,
  },
  loginHere: {
    marginBottom: 30,
  },
  loginBtn: {
    flexDirection: 'row',
    alignItems: 'center',
  },
  loginBtnArrow: {},
  arrowBtn: {
    marginLeft: 30,
    height: 15,
    width: 9,
  },
});
export default SignUpScreen;
