import React, {useState} from 'react';
import {
  View,
  Text,
  Image,
  StyleSheet,
  useWindowDimensions,
  Pressable,
  onPress,
  ScrollView,
  TextInput,
  Alert,
} from 'react-native';
import Logo from '../../../assets/images/Logo.png';
import facebook_connect_btn from '../../../assets/images/connect_facebook.png';
import google_connect_btn from '../../../assets/images/connect_google.png';
import MiniArrow from '../../../assets/images/mini_arrow_shack.png';
import CustomInput from '../../components/CustomInput/CustomInput';
import CustomButton from '../../components/CustomButton/CustomButton';
import { useNavigation } from '@react-navigation/native';
import { useForm, Controller } from 'react-hook-form';
import { Auth } from 'aws-amplify';




const SignInScreen = () => {
  // const [username, setUsername] = useState('');
  // const [password, setPassword] = useState('');
  const {height} = useWindowDimensions();

  const {
    control, 
    handleSubmit, 
    formState: {error}
  } = useForm();

  const navigation = useNavigation();
  const [loading, setLoading] =useState(false);

  const onForgotPasswordPressed = () => {
    navigation.navigate('ForgotPassScreen');
  };

  const onLoginBtnPress = async data => {
    // navigation.navigate('OnBoardingCrouselScreen');

    if(loading) {
      return;
    };
    setLoading(true);
    try{
      const response = await Auth.signIn(data.username, data.password);
      // console.warn(response);
      navigation.navigate('OnBoardingCrouselScreen');
    }
    catch(e){
      Alert.alert('Oops', e.message);
    }
    setLoading(false);
  };

  const onPressSignUpBtn = () => {
    navigation.navigate('SignUpScreen');
  };

  const onPressGoogleBtn = () => {
    navigation.navigate('OnBoardingCrouselScreen');
  };

  const onPressFacebookBtn = () => {
    navigation.navigate('OnBoardingCrouselScreen');
  };

  const onPressLoginGuessBtn = () =>{
    navigation.navigate('OnBoardingCrouselScreen');
  }

  return (
    
      <View style={styles.root}><ScrollView>
        <View style={styles.head}>
          <Image
            source={Logo}
            style={[styles.logo, {height: height * 0.24}]}
            resizeMode="contain"
          />
        </View>


        <View style={styles.main}>
          <Text style={styles.primaryHeadingsTextStyle}>Login</Text>
          
          
          <CustomInput
            name="username"
            placeholder="USERNAME"
            control={control}
            rules={{required: 'Username is required'}}
            setsource={require('../../../assets/images/profile_close_1.png')}
          />
          <CustomInput
            name="password"
            placeholder="PASSWORD"
            secureTextEntry={true}
            control={control}
            setsource={require('../../../assets/images/eye_2.png')}
            rules={{
              required: 'Password is required',
                minLength: {
                value: 8,
                message: 'Password should be at least 8 characters long',
          },
        }}
          />

          <CustomButton
            text="FORGET PASSWORD?"
            onPress={onForgotPasswordPressed}
            type="TERTIARY"
            style={styles.frgtpassbtn}
          />
          
          <View>
            <Pressable onPress={handleSubmit(onLoginBtnPress)} >
              <View style={styles.loginButton}>
                <Text style={styles.loginButtonText}
                  text = { loading ? 'loading...' : 'Sign In' }> SIGN IN 
                  </Text>
              </View>
            </Pressable>
          </View>
          
          <View style={{width: '100%', alignItems: 'center', marginBottom: 10}}>
            <Text
              style={styles.secondaryHeadingStyle}>
              OR USE:
            </Text>
          </View>

          <View style={styles.cnt_btn}>
            <Pressable onPress={onPressGoogleBtn}>
              <Image
                source={google_connect_btn}
                style={[styles.ggl_btn]}
                resizeMode="contain"
                onPress={onPressGoogleBtn}
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

          <View>
            <Pressable onPress={onPressLoginGuessBtn} >
              <View style={styles.loginButton}>
                <Text style={styles.loginButtonText}>LOG IN AS GUEST</Text>
              </View>
            </Pressable>
          </View>

          <View style={styles.signupHere}>
            <Text
              style={styles.secondaryHeadingStyle}>
              NEW HERE?
            </Text>

              <View style={styles.signUpBtn}>
                <View style={styles.signUpBtnText}>
                  <Text
                    style={styles.primaryHeadingsTextStyle}
                    onPress={onPressSignUpBtn}>
                    Sign Up
                  </Text>
                </View>

                <View style={styles.signUpBtnArrow}>
                  <Pressable onPress={onPressSignUpBtn}>
                    <Image
                      source={MiniArrow}
                      style={styles.arrowBtn}
                      onPress={onPressSignUpBtn}
                    />
                  </Pressable>
                </View>
              </View>
            
          </View>
        </View></ScrollView>
      </View>

  );
};

const styles = StyleSheet.create({
  root: {
    fontFamily: 'MontaguSlab_120pt-Regular',
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
  main: {
    paddingHorizontal: 20,
    borderTopLeftRadius: 12,
    borderTopRightRadius: 12,
    backgroundColor: '#FFFFFF',
    height: '100%',
  },
  frgtpassbtn:{

  },
  primaryHeadingsTextStyle:{
    color: '#CDA15C',
    fontSize: 35,
    fontFamily: 'MontaguSlab_120pt-Light',
    fontWeight: '400',
  },
  secondaryHeadingStyle:{
    fontFamily: 'Inter-Bold',
    color: '#3F0321',
    fontSize: 16,
    textAlign: 'left',
  },
  loginButton: {
    backgroundColor: '#3F0321',
    height: 62,
    width: '100%',
    borderRadius: 12,
    alignItems: 'center',
    justifyContent: 'center',
    marginVertical: 10,
    marginBottom: 20,
    // marginBottom: -8,
  },
  loginButtonText: {
    fontSize: 16,
    fontFamily: 'Inter-Bold',
    color: '#ffffff',
    padding: 15,
    letterSpacing: 1,
  },
  cnt_btn: {
    display: 'flex',
    flexDirection: 'row',
    justifyContent: 'center',
    marginBottom: 20,
    // marginBottom: 50,
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
  signupHere: {

  },
  signUpBtn: {
    flexDirection: 'row',
    alignItems: 'center',
    marginBottom: 30,
  },
  signUpBtnArrow: {
    // paddingBottom: 30,
    // marginBottom: 30,
  },
  arrowBtn: {
    marginLeft: 30,
    height: 15,
    width: 9,
  },
});
export default SignInScreen;
