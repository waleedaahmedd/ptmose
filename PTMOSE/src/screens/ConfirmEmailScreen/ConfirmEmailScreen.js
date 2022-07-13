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
import Logo from '../../../assets/images/Logo.png';
import CustomInput from '../../components/CustomInput/CustomInput';
import MiniArrow from '../../../assets/images/mini_arrow_shack.png';
import {useNavigation} from '@react-navigation/native';
import { useRoute } from '@react-navigation/native';

import {useForm} from 'react-hook-form';
import { Auth } from 'aws-amplify';

const ConfirmEmailScreen = () => {
  const route = useRoute();

  const {control, handleSubmit, watch} = useForm({
    defaultValues: {username: route?.params?.username},
  });

  const username = watch('username');

  const {height} = useWindowDimensions();
  const navigation = useNavigation();

  const EMAIL_REGEX = /^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/;

    const onPressVerifyBtn = async (data) => {
    try{
      await Auth.confirmSignUp(data.username, data.confirmemailpass);
      navigation.navigate('SignInScreen')
    } catch (e){
      Alert.alert("Oops", e.message);
    }
  };

  const onPressSignUpBtn = () => {
    navigation.navigate('SignUpScreen');
  };

  const onPressResendCodeBtn = async() => {
  try {
    await Auth.resendSignUp(username);
    Alert.alert('Success', 'Code was resent to your email');
  } catch (e) {
    Alert.alert('Oops', e.message);
  } 
  };

  return (
    <View style={styles.main}>
      <View style={styles.head}>
        <Image
          source={Logo}
          style={[styles.logo, {height: height * 0.25}]}
          resizeMode="contain"
        />
      </View>

      <View style={styles.body}>
        <View style={styles.ForgPass}>
          <Text
            style={{
              color: '#CDA15C',
              fontSize: 35,
              fontFamily: 'MontaguSlab_120pt-Light',
              marginTop: 20,
            }}>
            Check email
          </Text>


          <CustomInput
            name='confirmemailpass'
            control={control}
            placeholder="CONFIRMATION CODE"
            setsource={require('../../../assets/images/mail_tag.png')}
          />

          <Pressable onPress={handleSubmit(onPressVerifyBtn)}>
            <View style={styles.sendCodeButton}>
              <Text style={styles.sendCodeButtonText}>VERIFY</Text>
            </View>
          </Pressable>

          <Pressable onPress={handleSubmit(onPressResendCodeBtn)}>
            <View style={styles.sendCodeButton}>
              <Text style={styles.sendCodeButtonText}>RESEND CODE</Text>
            </View>
          </Pressable>
        </View>

        <View style={styles.signupHere}>
          <Text
            style={{
              color: '#3F0321',
              fontWeight: 'bold',
              fontSize: 16,
              fontFamily: 'Inter-Bold',
              textAlign: 'left',
            }}>
            NEW HERE?
          </Text>

          <View style={styles.signUpBtn}>
            <View style={styles.signUpBtnText}>
              <Text
                style={{
                  color: '#CDA15C',
                  fontSize: 35,
                  fontFamily: 'MontaguSlab_120pt-Light',
                }}
                onPress={onPressSignUpBtn}>
                Sign Up
              </Text>
            </View>

            <View style={styles.signUpBtnArrow}>
              <Pressable onPress={onPressSignUpBtn}>
                <Image
                  source={MiniArrow}
                  style={styles.arrowBtn}
                  onPress={onPressSignUpBtn}></Image>
              </Pressable>
            </View>
            
          </View>
        </View>
      </View>
    </View>
  );
};

const styles = StyleSheet.create({
  main: {
    backgroundColor: '#FFFFFF',
    height: '100%',
  },
  head: {
    alignItems: 'center',
    backgroundColor: '#3F0321',
  },
  logo: {
    width: '55%',
    maxWidth: 300,
    maxHeight: 200,
  },
  body: {
    marginHorizontal: 20,
    flex: 1,
    flexDirection: 'column',
    justifyContent: 'space-between',
  },
  ForgPass: {
    // flexDirection: 'row',
  },
  sendCodeButton: {
    backgroundColor: '#3F0321',
    height: 62,
    width: '100%',
    borderRadius: 12,
    alignItems: 'center',
    justifyContent: 'center',
    marginVertical: 5,
    marginBottom: 10,
  },
  sendCodeButtonText: {
    fontSize: 16,
    fontFamily: 'Inter-Bold',
    color: '#ffffff',
    padding: 15,
    letterSpacing: 1,
  },
  text_dec: {
    fontSize: 16,
    fontFamily: 'Inter-Regular',
    color: '#939393',
    opacity: 0.8,
    marginTop: 25,
  },
  signupHere: {
    marginBottom: 50,
  },
  signUpBtn: {
    flexDirection: 'row',
    alignItems: 'center',
  },
  signUpBtnArrow: {

  },
  arrowBtn: {
    marginLeft: 30,
    height: 15,
    width: 9,
  },
});
export default ConfirmEmailScreen;
