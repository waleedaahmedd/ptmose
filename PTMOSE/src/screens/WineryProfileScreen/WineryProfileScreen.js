import {
  View,
  Text,
  StyleSheet,
  Image,
  useWindowDimensions,
  ScrollView,
  TextInput,
  Switch,
  Pressable,
  onPress,
} from 'react-native';
import Logo from '../../../assets/images/Logo3.png';
import menu_btn from '../../../assets/images/HeaderMenuBtn.png';
import home_btn from '../../../assets/images/HeaderHomeBtn.png';
import location from '../../../assets/images/LocationLogo.png';
import React, {useState, thisState} from 'react';
import facebook_connect_btn from '../../../assets/images/connect_facebook.png';
import google_connect_btn from '../../../assets/images/connect_google.png';
import inst_btn from '../../../assets/images/ConnectInstagram.png';
import twit_btn from '../../../assets/images/ConnectTwitter.png';
import headPic from '../../../assets/images/WineryProfileHeadPic.png';

import {useNavigation} from '@react-navigation/native';

const WineryProfileScreen = () => {
  const {height} = useWindowDimensions();
  const [isEnabled, setIsEnabled] = useState(false);
  const toggleSwitch = () => setIsEnabled(previousState => !previousState);

  const navigation = useNavigation();

  const onWineChngNameBtn = () => {
    console.warn('onWineChngNameBtn');
  };

  const onChangeLocBtn = () => {
    console.warn('onChangeLocBtn');
  };

  const onConGoogleBtn = () => {
    console.warn('onConGoogleBtn');
  };

  const onConFacebookBtn = () => {
    console.warn('onConFacebookBtn');
  };

  const onConInstBtn = () => {
    console.warn('onConInstBtn');
  };

  const onConTwitterBtn = () => {
    console.warn('onConTwitterBtn');
  };

  const onChangeAccSettBtn = () => {
    console.warn('onChangeAccSettBtn');
  };

  const onPassChngBtn = () => {
    console.warn('onPassChngBtn');
  };

  const onPressDeleteAccBtn = () => {
    console.warn('onPressDeleteAccBtn');
  };

  const onPressMenuBtn = () => {
    navigation.navigate('SideMenuScreen');
    // console.warn('onPressDeleteAccBtn');
  };

  const onPressHomeBtn = () => {
    navigation.navigate('HomeScreen');
    // console.warn('onPressMenuBtn');
  };

  const onPressLocBtn = () => {
    // navigation.navigate('SideMenuScreen');
    console.warn('onPressMenuBtn');
  };

  return (
    <View style={styles.root}>
      <View style={styles.navbar}>
        <Pressable onPress={onPressMenuBtn}>
          <Image
            source={menu_btn}
            style={{height: 14, width: 14, marginHorizontal: 15, resizeMode:'contain'}}></Image>
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

      <ScrollView>
        <View style={{height: 154, width: '100%'}}>
          <Image
            style={{height: 154, width: '100%'}}
            source={headPic}
            resizeMode="stretch"></Image>
        </View>
        <View style={styles.body}>
          <Text style={styles.font_family}>WINERY NAME</Text>
          <View
            style={{
              alignItems: 'center',
              borderWidth: 1,
              borderColor: '#D9D9D9',
              height: 70,
              width: '100%',
              borderRadius: 12,
              marginVertical: 10,
              display: 'flex',
              flexDirection: 'row',
              justifyContent: 'space-between',
            }}>
            <Text
              style={{
                marginHorizontal: 20,
                fontSize: 18,
                color: '#CDA15C',
                fontFamily: 'MontaguSlab_120pt-Regular',
              }}>
              Vinous Reverie Winery
            </Text>
            <Pressable onPress={onWineChngNameBtn}>
              <Text
                style={{
                  marginHorizontal: 10,
                  fontSize: 12,
                  color: '#3F0321',
                  fontFamily: 'Inter-Regular',
                }}>
                CHANGE
              </Text>
            </Pressable>
          </View>
          <Text style={styles.font_family}>ABOUT THE WINERY</Text>

          <TextInput
            multiline={true}
            placeholder="We would love to know you..."
            numberOfLines={7}
            style={{
              borderWidth: 1,
              flex: 1,
              alignSelf: 'stretch',
              borderColor: '#D9D9D9',
              borderRadius: 12,
              marginVertical: 10,
              paddingHorizontal: 20,
              fontFamily: 'Inter-Regular',
              textAlignVertical: 'top',
            }}></TextInput>

          <Text style={styles.font_family}>TAGS</Text>
          <View
            style={{
              alignItems: 'center',
              borderWidth: 1,
              borderColor: '#D9D9D9',
              height: 70,
              width: '100%',
              borderRadius: 12,
              marginVertical: 10,
              display: 'flex',
              flexDirection: 'row',
              justifyContent: 'space-between',
              padding: 10,
            }}>
            <TextInput
              placeholder="Cabernet Sauvignon, Pinot Noir, Chardon..."
              style={{
                fontSize: 16,
                color: '#CDA15C',
                fontFamily: 'Inter-Regular',
              }}></TextInput>
          </View>

          <Text style={styles.font_family}>LOCATION</Text>
          <View
            style={{
              alignItems: 'center',
              borderWidth: 1,
              borderColor: '#D9D9D9',
              height: 70,
              width: '100%',
              borderRadius: 12,
              marginVertical: 10,
              display: 'flex',
              flexDirection: 'row',
              justifyContent: 'space-between',
            }}>
            <Text
              style={{
                marginHorizontal: 20,
                fontSize: 18,
                color: '#CDA15C',
                fontFamily: 'MontaguSlab_120pt-Regular',
              }}>
              Napa County
            </Text>
            <Pressable onPress={onChangeLocBtn}>
              <Image
                source={location}
                style={{height: 16, width: 14, marginHorizontal: 15}}></Image>
            </Pressable>
          </View>
          <Text style={styles.font_family}>CONNECT SOCIAL</Text>
          <View style={styles.cnt_btn}>
            <Pressable onPress={onConGoogleBtn}>
              <Image
                source={google_connect_btn}
                style={[styles.ggl_btn]}
                resizeMode="contain"
              />
            </Pressable>

            <Pressable onPress={onConFacebookBtn}>
              <Image
                source={facebook_connect_btn}
                style={[styles.fb_btn]}
                resizeMode="contain"
              />
            </Pressable>

            <Pressable onPress={onConInstBtn}>
              <Image
                source={inst_btn}
                style={[styles.fb_btn]}
                resizeMode="contain"
              />
            </Pressable>

            <Pressable onPress={onConTwitterBtn}>
              <Image
                source={twit_btn}
                style={[styles.fb_btn]}
                resizeMode="contain"
              />
            </Pressable>
          </View>
          <View>
            <Text style={styles.font_family}>ACCOUNT SETTINGS</Text>
            <View
              style={{
                alignItems: 'center',
                borderWidth: 1,
                borderColor: '#D9D9D9',
                height: 70,
                width: '100%',
                borderRadius: 12,
                marginVertical: 10,
                display: 'flex',
                flexDirection: 'row',
                justifyContent: 'space-between',
              }}>
              <View>
                <Text
                  style={{
                    marginHorizontal: 20,
                    fontSize: 16,
                    color: '#939393',
                    fontFamily: 'Inter-Regular',
                  }}>
                  Username
                </Text>
                <Text
                  style={{
                    marginHorizontal: 20,
                    fontSize: 18,
                    color: '#CDA15C',
                    fontFamily: 'MontaguSlab_120pt-Regular',
                  }}>
                  vrwinemerchant
                </Text>
              </View>
              <Pressable onPress={onChangeAccSettBtn}>
                <Text
                  style={{
                    marginHorizontal: 20,
                    fontSize: 12,
                    color: '#3F0321',
                    fontFamily: 'Inter-Regular',
                  }}>
                  CHANGE
                </Text>
              </Pressable>
            </View>

            <View
              style={{
                alignItems: 'center',
                borderWidth: 1,
                borderColor: '#D9D9D9',
                height: 70,
                width: '100%',
                borderRadius: 12,
                marginVertical: 10,
                display: 'flex',
                flexDirection: 'row',
                justifyContent: 'space-between',
              }}>
              <View>
                <Text
                  style={{
                    marginHorizontal: 20,
                    fontSize: 16,
                    color: '#939393',
                    fontFamily: 'Inter-Regular',
                  }}>
                  Password
                </Text>
                <Text
                  style={{
                    marginHorizontal: 20,
                    fontSize: 18,
                    color: '#CDA15C',
                    fontFamily: 'MontaguSlab_120pt-Regular',
                  }}>
                  **********
                </Text>
              </View>
              <Pressable onPress={onPassChngBtn}>
                <Text
                  style={{
                    marginHorizontal: 20,
                    fontSize: 12,
                    color: '#3F0321',
                    fontFamily: 'Inter-Regular',
                  }}>
                  CHANGE
                </Text>
              </Pressable>
            </View>
          </View>

          <Text style={styles.font_family}>NOTIFICATION</Text>
          <View
            style={{
              alignItems: 'center',
              borderWidth: 1,
              borderColor: '#D9D9D9',
              height: 70,
              width: '100%',
              borderRadius: 12,
              marginVertical: 10,
              display: 'flex',
              flexDirection: 'row',
              justifyContent: 'space-between',
            }}>
            <Text
              style={{
                marginHorizontal: 20,
                fontSize: 18,
                color: '#CDA15C',
                fontFamily: 'MontaguSlab_120pt-Regular',
              }}>
              All Notifications
            </Text>
            <Switch
              trackColor={{false: '#D9D9D9', true: '#3F0321'}}
              thumbColor={isEnabled ? '#D9D9D9' : '#f4f3f4'}
              ios_backgroundColor="#3e3e3e"
              onValueChange={toggleSwitch}
              value={isEnabled}
              style={{height: 26, width: 50, marginHorizontal: 10}}
            />
          </View>

          <Pressable onPress={onPressDeleteAccBtn}>
            <View
              style={{
                alignItems: 'center',
                borderWidth: 2,
                borderColor: '#F00303',
                height: 70,
                width: '100%',
                borderRadius: 12,
                marginVertical: 10,
                display: 'flex',
                flexDirection: 'row',
                justifyContent: 'center',
              }}>
              <Text
                style={{
                  marginHorizontal: 16,
                  fontSize: 18,
                  color: '#F00303',
                  fontFamily: 'Inter-Bold',
                }}>
                DELETE ACCOUNT
              </Text>
            </View>
          </Pressable>
        </View>
      </ScrollView>
    </View>
  );
};

const styles = StyleSheet.create({
  root: {
    height: '100%',
    backgroundColor: '#FFFFFF',
  },
  navbar: {
    alignItems: 'center',
    borderWidth: 1,
    backgroundColor: '#FFFFFF',
    borderColor: '#EAEAEA',
    shadowRadius: 'EAEAEA',
    shadowColor: 'red',
    display: 'flex',
    flexDirection: 'row',
    justifyContent: 'space-between',
  },
  logo: {
    width: '45%',
    maxWidth: 300,
    maxHeight: 200,
  },
  body: {
    margin: 20,
  },
  font_family: {
    fontFamily: 'Inter-Bold',
    fontSize: 15,
    color: '#3F0321',
    letterSpacing: 2,
  },
  text_input: {
    width: 200,
    borderBottomColor: 'red',
    borderBottomWidth: 1,
  },
  cnt_btn: {
    marginTop: 35,
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
});
export default WineryProfileScreen;
