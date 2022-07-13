import {
  StyleSheet,
  Text,
  View,
  Pressable,
  onPress,
  Image,
  useWindowDimensions,
  ScrollView,
  TouchableOpacity,
  TextInput,
} from 'react-native';
import React, {useState, useRef} from 'react';

import WineReview from '../../components/WineReview';
import menu_btn from '../../../assets/images/HeaderMenuBtn.png';
import home_btn from '../../../assets/images/HeaderHomeBtn.png';
import Logo from '../../../assets/images/Logo3.png';
import backBtn from '../../../assets/images/backBtn.png';
import wineBtlePic from '../../../assets/images/WineBottles/WineBottlePic9.png';

import { useNavigation } from '@react-navigation/native';

const WineReviewScreen = () => {
  const navigation = useNavigation();

  const {height} = useWindowDimensions();

  const onPressMenuBtn = () => {
    navigation.navigate('SideMenuScreen');
  };

  const onPressHomeBtn = () => {
    navigation.navigate('HomeScreen');
  };

  const onPressBackBtn = () => {
    navigation.navigate('WineDetailsScreen');
  };

  const onPressSubmitBtn = () => {
    navigation.navigate('RecommendationScreen');
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

      <ScrollView>
        <View style={{backgroundColor: '#FFFFFF', width: '100%', marginTop: 5}}>
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

          <View style={styles.wineDetailContainer}>
            <View style={styles.wineDetailsContainerChild}>
              <View>
                <Image
                  source={wineBtlePic}
                  style={{height: 102, width: 41, marginLeft: 20}}
                />
              </View>

              <View>
                <Text
                  style={{
                    fontFamily: 'MontaguSlab_120pt-Regular',
                    fontSize: 18,
                    color: '#CDA15C',
                    marginLeft: 20,
                    marginRight: 50,
                  }}>
                  Cline Family Cellars Farmhouse Red
                </Text>
                <Text
                  style={{
                    marginLeft: 20,
                    fontFamily: 'Inter-Bold',
                    fontSize: 14,
                    color: '#3F0321',
                    marginLeft: 20,
                    marginRight: 20,
                    marginTop: 10,
                  }}>
                  Sonoma, CA 2018
                </Text>
              </View>
            </View>
          </View>

          <View style={styles.reviewContainer}>
            <Text
              style={{
                fontFamily: 'MontaguSlab_120pt-Regular',
                fontSize: 35,
                color: '#CDA15C',
              }}>
              Review
            </Text>
            <WineReview />
          </View>
        </View>

        <View>
          <Text
          style={{
            fontFamily: 'Inter-Bold',
            fontSize: 14,
            color: '#3F0321',
            letterSpacing: 2,
            marginTop: 20,
            marginHorizontal: 20,
          }}>DETAIL REVIEW OF WINES AND WINERY EXPERIENCE.</Text>

            <TextInput
            multiline={true}
            placeholder="PLEASE ANSWER HERE"
            numberOfLines={15}
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
              marginHorizontal: 20
            }}></TextInput>
        </View>
        
        <View style={[styles.btnContainer, {width: '100%', alignItems: 'center'}]}>
          <Pressable onPress={onPressSubmitBtn} ><View style={[styles.submitBtn, {}]}>
            <Text style={{color: '#FFFFFF', fontFamily: 'Inter-Bold', fontSize: 16, letterSpacing: 1}}>SUBMIT REVIEW</Text>
          </View></Pressable>
        </View>
        <View>
        </View>
      </ScrollView>
    </View>
  );
};

export default WineReviewScreen;

const styles = StyleSheet.create({
  root: {
    flex: 1,
    backgroundColor: '#FFFFFF',
  },
  Header: {
    alignItems: 'center',
    borderWidth: 1,
    backgroundColor: '#FFFFFF',
    borderColor: '#EAEAEA',
    shadowRadius: '#EAEAEA',
    shadowColor: 'red',
    display: 'flex',
    flexDirection: 'row',
    justifyContent: 'space-between',

    shadowColor: '#000',
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
    marginTop: 20,
    marginLeft: 20,
  },
  wineDetailContainer: {
    width: '100%',
    alignItems: 'center',
  },
  wineDetailsContainerChild: {
    width: 368,
    height: 144,
    display: 'flex',
    flexDirection: 'row',
    alignItems: 'center',
    borderRadius: 12,
    marginVertical: 20,
    borderWidth: 1,
    borderColor: '#D9D9D9',
  },
  reviewContainer: {
    marginHorizontal: 20,
    marginBottom: 40,
  },
  submitBtn:{
    height: 62, 
    width: 368, 
    backgroundColor: '#3F0321', 
    borderRadius: 12, 
    marginBottom: 100, 
    alignItems: 'center', 
    justifyContent: 'center',
  },
});