import React, {useState} from 'react';
import {
  View,
  Text,
  Image,
  StyleSheet,
  useWindowDimensions,
  Pressable,
  onPress,
} from 'react-native';
import Logo from '../../../assets/images/Logo.png';
import CustomInput from '../../components/CustomInput/CustomInput';
import {useNavigation} from '@react-navigation/native';

import {useForm} from 'react-hook-form';
import {Auth} from 'aws-amplify';


const CreatePassScreen = () => {
  const {height} = useWindowDimensions();

  const {control, handleSubmit, watch} = useForm();
  const pwd = watch('newpass');


  const navigation = useNavigation();

  const onCreatePassBtn = async data => {
    try {
      await Auth.forgotPasswordSubmit(data.username, data.code, data.password, data.repeatpass);
      navigation.navigate('SignInScreen');
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
            CREATE PASSWORD
          </Text>
          
          
          <CustomInput
            name="username"
            placeholder="USERNAME"
            control={control}
            rules={{required: 'Username is required'}}
            setsource={require('../../../assets/images/profile_close_1.png')}
          />

          <CustomInput
            name="code"
            control={control}
            placeholder="CODE"
            setsource={require('../../../assets/images/lock_2.png')}
            secureTextEntry
            rules={{required:'Code is required'}} 
          />
          
          <CustomInput
            name="password"
            control={control}
            placeholder="NEW PASSWORD"
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

          {/* <CustomInput
            name='password'
            control={control}
            placeholder="CONFIRMED PASSWORD"
            setsource={require('../../../assets/images/lock_2.png')}
            secureTextEntry
            rules={{
              validate: value => value === pwd || 'Password do not match',
            }}
          /> */}

          <Pressable onPress={handleSubmit(onCreatePassBtn)}>
            <View style={styles.sendCodeButton}>
              <Text style={styles.sendCodeButtonText}>CREATE PASSWORD</Text>
            </View>
          </Pressable>
        </View>
      </View>
    </View>
  );
};

export default CreatePassScreen;

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
  ForgPass: {},
  sendCodeButton: {
    backgroundColor: '#3F0321',
    height: 62,
    width: '100%',
    borderRadius: 12,
    alignItems: 'center',
    justifyContent: 'center',
    marginVertical: 5,
    marginBottom: -8,
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
  signUpBtnArrow: {},
  arrowBtn: {
    marginLeft: 30,
    height: 15,
    width: 9,
  },
});
