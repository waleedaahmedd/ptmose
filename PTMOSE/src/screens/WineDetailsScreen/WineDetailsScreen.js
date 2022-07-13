import { StyleSheet, Text, View, Pressable, onPress, Image, useWindowDimensions, ScrollView } from 'react-native';
import React, { useState, useRef} from 'react';

import menu_btn from '../../../assets/images/HeaderMenuBtn.png';
import home_btn from '../../../assets/images/HeaderHomeBtn.png';
import Logo from '../../../assets/images/Logo3.png';
import backBtn from '../../../assets/images/backBtn.png'
import wineBtlePic from '../../../assets/images/WineBottles/WineBottlePic9.png'

import { useNavigation } from '@react-navigation/native';


const WineDetailsScreen = () => {

    const navigation = useNavigation();

    const {height} = useWindowDimensions();

    const onPressMenuBtn = () => {
        navigation.navigate('SideMenuScreen');
      };
    
      const onPressHomeBtn = () => {
        navigation.navigate('HomeScreen');
      };

      const onPressYouLikeBtn =() =>{
        navigation.navigate('WineReviewScreen');
      }

      const onPressBuyThisWineBtn =() => {
        navigation.navigate('WineDetailsPurchaseScreen');
      }

      const onPressBackBtn = () =>{
        navigation.navigate('EventsDetailsScreen');
      } 

      
  return (
    <View style={styles.root}>
        <View style={styles.Header}>
            <Pressable onPress={onPressMenuBtn}>
                <Image source={menu_btn} style={{height: 14, width: 14, marginHorizontal: 15, resizeMode:'contain'}} />
            </Pressable>
            
            <Image source={Logo} style={[styles.logo, {height: height * 0.1}]} resizeMode="contain"/>
            
            <Pressable onPress={onPressHomeBtn}>
                <Image source={home_btn} style={{height: 16, width: 16, marginHorizontal: 15}} />
            </Pressable>
        </View>

        <ScrollView>
            <View style={{backgroundColor: '#FFFFFF', width: '100%', marginTop: 5,}}>
            
                <View style={styles.backBtnStyle}>
                    <Pressable onPress={onPressBackBtn}><Image source={backBtn} resizeMode='contain'  style={{width: 10, height: 10, marginRight: 5}}/></Pressable>
                    <Pressable onPress={onPressBackBtn}><View><Text style={{fontSize: 12, color: '#3F0321'}}>BACK</Text></View></Pressable>
                </View>
                
                <View style={styles.winePicContainer}>
                <View><Image source={wineBtlePic} style={{height: 228, width: 92}}/></View>
                </View>

                <View>
                    <Text style={{fontFamily: 'MontaguSlab_120pt-Regular', fontSize: 28, color: '#CDA15C', marginLeft: 20}}>Cline Family Cellars Farmhouse Red </Text>
                    <Text style={{marginLeft: 20, fontFamily: 'Inter-Bold', fontSize: 16, color: '#3F0321',}}>Sonoma, CA 2018</Text>
                    <Text style={{marginLeft: 20, fontFamily: 'Inter-Bold', fontSize: 16, color: '#3F0321', marginTop: 20,}}>ABOUT THE WINE</Text>
                    <Text style={{marginLeft: 20, marginRight: 30,fontFamily: 'Inter-Regular', fontSize: 14,}}>Two distinct vineyards combine in this vintage of Farmhouse. The Oakley vineyards run along the shores of the San Joaquin and Sacramento Rivers. The vines root deep in the sand-soil and produce intense fruit. The Sonoma Coast vineyards experience foggy mornings and sunny afternoons bringing out the bright fruit flavors and deep color. We start with handpicked grapes. Must is pumped to our temperature-controlled, stainless-steel tanks.</Text>
                    
                    <Pressable
                    onPress={onPressYouLikeBtn} >
                    <View style={styles.howYouLikeBtn}>
                        <Text style={{fontFamily: 'Inter-Bold', fontSize: 16, color: '#CDA15C', letterSpacing: 1}}>HOW'D YOU LIKE IT?</Text>
                    </View></Pressable>

                    <Pressable
                    onPress={onPressBuyThisWineBtn}>
                    <View style={styles.butThisWineBtn}>
                        <Text style={{fontFamily: 'Inter-Bold', fontSize: 16, color: '#FFFFFF', letterSpacing: 1}}>BUY THIS WINE</Text>
                    </View></Pressable>
                </View> 
            </View>
        </ScrollView>
    </View>

  );
};

export default WineDetailsScreen;

const styles = StyleSheet.create({
    root:{
        flex: 1,
        backgroundColor: '#FFFFFF',
    },
    Header:{
        alignItems: 'center',
        borderWidth: 1,
        backgroundColor: '#FFFFFF',
        borderColor: '#EAEAEA',
        shadowRadius: '#EAEAEA',
        shadowColor: 'red',
        display: 'flex',
        flexDirection: 'row',
        justifyContent: 'space-between',
    },
    logo:{
        width: '45%',
        maxWidth: 300,
        maxHeight: 200,
    },
    backBtnStyle:{
        display: 'flex',
        flexDirection:'row',
        alignItems: 'center',
        marginTop: 20,
        marginLeft: 20,
    },
    winePicContainer:{
        alignItems: 'center',
        marginVertical: 20,
    },
    howYouLikeBtn:{
        height: 62,
        width: 368,
        marginHorizontal: 20,
        marginVertical: 20,
        borderRadius: 12,
        display: 'flex',
        alignItems: 'center',
        justifyContent: 'center',
        backgroundColor: '#FFFFFF',

        shadowColor: "#000",
shadowOffset: {
	width: 0,
	height: 1,
},
shadowOpacity: 0.18,
shadowRadius: 1.00,

elevation: 1,
},
    butThisWineBtn:{
        height: 62,
        width: 368,
        marginHorizontal: 20,
        borderRadius: 12,
        display: 'flex',
        alignItems: 'center',
        justifyContent: 'center',
        backgroundColor: '#3F0321',
        marginBottom: 20,

        shadowColor: "#000",
shadowOffset: {
	width: 0,
	height: 2,
},
shadowOpacity: 0.23,
shadowRadius: 2.62,

elevation: 4,
    }
});