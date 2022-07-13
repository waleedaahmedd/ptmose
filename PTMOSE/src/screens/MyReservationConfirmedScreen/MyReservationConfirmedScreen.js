import { 
  StyleSheet, 
  Text, 
  View, 
  useWindowDimensions, 
  Image, 
  Pressable,
  onPress,
  SafeAreaView } from 'react-native'
import React, { useState, useRef} from 'react';
import MyReservation from './ConfirmedReservationSlides';

import HeaderMenuBtn from '../../../assets/images/HeaderMenuBtn.png';
import Logo3 from '../../../assets/images/Logo3.png';
import home_btn from '../../../assets/images/HeaderHomeBtn.png';
import search_btn from '../../../assets/images/search_btn.png';

import { useNavigation } from '@react-navigation/native';

const MyReservationConfirmedScreen = () => {

  const {height} = useWindowDimensions();

  const navigation = useNavigation();

  const onPressMenuBtn = () => {
    navigation.navigate('SideMenuScreen');
    // console.warn('onPressMenuBtn');
  };

  const onPressSrchBtn = () => {
    // navigation.navigate('UserProfileScreen');
    console.warn('onPressSrchBtn');
  };

  const onPressConfirmedBtn = () => {
    navigation.navigate('MyReservationConfirmedScreen');
  };

  const onPressUnConfirmedBtn = () => {
    navigation.navigate('MyReservationUnconfirmedScreen');
  };




  return (
    <View style={styles.root}>

      <View style={styles.headAndNameContainer}>

        <View style={styles.head}>
          <Pressable
          onPress={onPressMenuBtn}>
          <Image source={HeaderMenuBtn} style={{height: 14, width: 14, marginLeft: 20}}></Image></Pressable>
          <Image source={Logo3} style={[styles.logo, {height: height * 0.15, marginLeft: -20}]} resizeMode="contain"/>
          <Image source={home_btn} style={{height: 0, width: 0, marginHorizontal: 0}}></Image>
        </View>


        <View style={styles.helloNameContainer}>
          <Text style={styles.helloText}>HELLO,</Text>
          
            <View style={styles.nameHeadndSercBtn}>
              <View><Text style={styles.locEditBoxText}>Paul Wilkins</Text></View>
              <Pressable
              onPress={onPressSrchBtn}
              ><View><Image source={search_btn} style={styles.nameHeadSrchBtnImg} resizeMode="contain" /></View></Pressable>
            </View>
        </View>

      </View>

      <View style={styles.body}>
      
        <View style={{alignItems: 'center'}}>
          <View style={styles.ReservationSlectorMainBody}>
              
                <Pressable onPress={onPressConfirmedBtn}>
                <View style={styles.ConfirmedBtn}>
                  <Text style={styles.ConfirmedBtnTextStyle}>CONFIRMED</Text>
                </View></Pressable>
                
                <Pressable onPress={onPressUnConfirmedBtn}>
                <View style={styles.UnconfirmedBtn}>
                  <Text style={styles.UnconfirmedBtnTextStyle}>UNCONFIRMED</Text>
                </View></Pressable>
                
                
          </View>
        </View>

        <Text style={{marginLeft: 20,marginTop: 20, fontSize: 15, color: '#3F0321', fontFamily: 'Inter-Bold',}} >MY RESERVATIONS</Text>

          <View style={{flex: 0.5}}>
            <MyReservation/>
          </View>
        
      </View>
      

    </View>
  );
};

export default MyReservationConfirmedScreen;

const styles = StyleSheet.create({
  root:{
    width:'100%',
    backgroundColor:'#FFFFFF',
},
headAndNameContainer: {
  backgroundColor: '#FFFFFF',
  
  shadowColor: "#000000",
  shadowOffset: {
  width: 0,
  height: 12,
  },
  shadowOpacity: 0.58,
  shadowRadius: 1,
  elevation: 1,
},

head: {
  alignItems: 'center',
  shadowRadius: 'EAEAEA',
  display: 'flex',
  flexDirection: 'row',
  justifyContent: 'space-between',
},
logo: {
  width: '45%',
  maxWidth: 300,
  maxHeight: 200,
},
helloNameContainer: {
},
helloText:{
  marginHorizontal: 20,
  fontSize: 15,
  color: '#3F0321',
  fontFamily: 'Inter-Bold',
},
nameHeadndSercBtn: {
  display: 'flex',
  flexDirection: 'row',
  alignItems: 'center',
  justifyContent: 'space-between',
},
locEditBoxText: {
  marginHorizontal: 20,
  fontSize: 35,
  color: '#CDA15C',
  fontFamily: 'MontaguSlab_120pt-Light',
  marginBottom: 30,
},
nameHeadSrchBtnImg: {
  height: 20,
  width: 20,
  marginHorizontal: 20,
  marginTop: -25,
},
body:{
  height: '100%',
  width:'100%',
},
  ReservationSlectorMainBody:{
    height: 62,
    width: 368,
    backgroundColor: '#C3B2BA',
    borderRadius: 12,
    marginTop: 20,
    alignItems: 'center',
    flexDirection: 'row',
    justifyContent: 'space-between'
},
  ConfirmedBtn:{
    height: 52,
    width: 178,
    backgroundColor: '#3F0321',
    borderRadius: 12,
    alignItems: 'center',
    justifyContent: 'center',
    marginLeft: 10,
},
ConfirmedBtnTextStyle:{
    color: '#FFFFFF',
    fontFamily: 'Inter-Bold',
    fontSize: 16,
},
  UnconfirmedBtn:{
    height: 52,
    width: 178,
    backgroundColor: '#C3B2BA',
    borderRadius: 12,
    alignItems: 'center',
    justifyContent: 'center',
},
UnconfirmedBtnTextStyle:{
  color: '#FFFFFF',
  fontFamily: 'Inter-Bold',
  fontSize: 16,
},
});

































// import { 
//     StyleSheet, 
//     Text, 
//     View, 
//     useWindowDimensions, 
//     Image, 
//     ImageBackground,
//     ScrollView,
//     Pressable,
//     onPress } from 'react-native'
//   import React, { useState, useRef} from 'react';

// import {useNavigation} from '@react-navigation/native';

// import Logo3 from '../../../assets/images/Logo3.png';
// import HeaderMenuBtn from '../../../assets/images/HeaderMenuBtn.png';
// import home_btn from '../../../assets/images/HeaderHomeBtn.png';
// import search_btn from '../../../assets/images/search_btn.png';
// import LocationBoxImg from '../../../assets/images/LocationBoxImg.png';
// // import Tabs from '../../components/TabNav/tabs';
// // import Tabs from '../../components/TabNav/tabs';
// import ReservationScreen from '../../components/ReservationScreen/ReservationScreen';

// const MyReservationConfirmedScreen = () => {

//     const {height} = useWindowDimensions();

//     const navigation = useNavigation();

//     const onPressMenuBtn = () => {
//         navigation.navigate('SideMenuScreen');
//         // console.warn('onPressMenuBtn');
//       };
    
//       const onPressSrchBtn = () => {
//         navigation.navigate('UserProfileScreen');
//         // console.warn('onPressSrchBtn');
//       };


//   return (
//     <View style={styles.root}>
      
//       <View style={styles.headAndNameContainer}>
//         <View style={styles.head}>
//         <Pressable
//         onPress={onPressMenuBtn}>
//         <Image source={HeaderMenuBtn} style={{height: 14, width: 14, marginLeft: 20}}></Image></Pressable>
//         <Image source={Logo3} style={[styles.logo, {height: height * 0.15, marginLeft: -20}]} resizeMode="contain"/>
//         <Image source={home_btn} style={{height: 0, width: 0, marginHorizontal: 0}}></Image>
//         </View>


//         <View style={styles.helloNameContainer}>
//         <Text style={styles.helloText}>HELLO,</Text>
        
//             <View style={styles.nameHeadndSercBtn}>
//             <View><Text style={styles.locEditBoxText}>Paul Wilkins</Text></View>
//             <Pressable
//             onPress={onPressSrchBtn}
//             ><View><Image source={search_btn} style={styles.nameHeadSrchBtnImg} resizeMode="contain" /></View></Pressable>
//             </View>
//         </View>
//         </View>
        
//         <View>
//         <ReservationScreen />
//         </View>

//     </View>
//   );
// };

// export default MyReservationConfirmedScreen;

// const styles = StyleSheet.create({
// root: {
//   backgroundColor: '#FFFFFF',
//   height: '100%',
// },
// headAndNameContainer:{
//   backgroundColor: '#FFFFFF',
//   shadowColor: "#D9D9D9",
//   shadowOffset: {
//     width: 0,
//     height: 3,
// },
//   shadowOpacity: 0.27,
//   shadowRadius: 4.65,
//   elevation: 6,
// },
// head: {
//   alignItems: 'center',
//   shadowRadius: 'EAEAEA',
//   display: 'flex',
//   flexDirection: 'row',
//   justifyContent: 'space-between',
// },
// logo: {
//   width: '45%',
//   maxWidth: 300,
//   maxHeight: 200,
// },
// helloNameContainer: {
// },
// helloText:{
//   marginHorizontal: 20,
//   fontSize: 15,
//   color: '#3F0321',
//   fontFamily: 'Inter-Bold',
// },
// nameHeadndSercBtn: {
//   display: 'flex',
//   flexDirection: 'row',
//   alignItems: 'center',
//   justifyContent: 'space-between',
//   // marginTop: -15,
//   // backgroundColor: 'yellow',
// },
// locEditBoxText: {
//   marginHorizontal: 20,
//   fontSize: 35,
//   color: '#CDA15C',
//   fontFamily: 'MontaguSlab_120pt-Light',
//   marginBottom: 30,
// },
// nameHeadSrchBtnImg: {
//   height: 20,
//   width: 20,
//   marginHorizontal: 20,
//   marginTop: -25,
// },
// });