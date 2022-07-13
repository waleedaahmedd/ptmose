import { StyleSheet, Text, View, Pressable, onPress, Image, useWindowDimensions, ScrollView } from 'react-native';
import React, { useState, useRef} from 'react';

import menu_btn from '../../../assets/images/HeaderMenuBtn.png';
import shopChard from '../../../assets/images/shopChard.png';
import Logo from '../../../assets/images/Logo3.png';
import backBtn from '../../../assets/images/backBtn.png';
import miniMinusBtn from '../../../assets/images/mini_minus.png';
import miniPlusBtn from '../../../assets/images/mini_plus.png';

import wineBtlePic from '../../../assets/images/WineBottles/WineBottlePic9.png';

import {useNavigation} from '@react-navigation/native';

import { useForm, Controller } from 'react-hook-form';


const CartScreenOne = () => {

const {
    control, 
    handleSubmit, 
    formState: {error}
} = useForm();
    
const navigation = useNavigation();

const {height} = useWindowDimensions();

const onPressMenuBtn = () => {
    navigation.navigate('SideMenuScreen');
};
    
const onPressShopCardBtn = () => {
console.warn('onPressShopCardBtn');
// navigation.navigate('HomeScreenTastingScreen');
};

const onPressBackBtn = () => {
    console.warn('WineDetailsPurchaseScreen');
};

const onPressChkoutBtn = () => {
    navigation.navigate('CartScreenTwo');
};

const [SingleVinePrice, setSingleVinePrice] = useState(46.20);

const [num, setNum] = useState(1);

const [vinePrice, setWinePrice] = useState(46.20);

const onPressIncreamentBtn = () => {
    setNum ( num + 1);
    setWinePrice ( vinePrice + 46.20 );
};

const onPressDecrimentBtn = () => {
    if (num > 0){
        setNum(num - 1);
        setWinePrice ( vinePrice - 46.20 );
    }
    else{
        setNum(0);
        setWinePrice (0);
}
};
  return (
    <View style={styles.root}>
        
        <View style={styles.Header}>
            <Pressable onPress={onPressMenuBtn}>
            <Image source={menu_btn} style={{height: 14, width: 14, marginHorizontal: 15, resizeMode:'contain'}} /></Pressable>
            <Image source={Logo} style={[styles.logo, {height: height * 0.1}]} resizeMode="contain"/>
            <Pressable onPress={onPressShopCardBtn}>
                <Image source={shopChard} style={{height: 16, width: 16, marginHorizontal: 15}} />
            </Pressable>
        </View>

        <View style={{alignItems: 'center', backgroundColor: '#FFFFFF', height: '100%'}}>
        <View style={{backgroundColor: '#FFFFFF', width: '100%', marginTop: 5,}}>
            <View style={styles.backBtnStyle}>
                <View style={{flexDirection: 'row', alignItems: 'center'}}>
                    <Pressable onPress={onPressBackBtn}><Image source={backBtn} resizeMode='contain'  style={{width: 10, height: 10, marginRight: 5}}/></Pressable>
                    <Pressable onPress={onPressBackBtn}><View><Text style={{fontSize: 12, color: '#3F0321'}}>BACK</Text></View></Pressable>
                </View>

                <View>
                    <Text style={{fontFamily: 'MontaguSlab_120pt-Regular', fontSize: 28, color: '#CDA15C', marginRight: 20}}>CART</Text>
                </View>
            </View> 
        </View> 

        <View style={styles.wineDetailContainer}>
            <View style={styles.wineDetailsContainerChild}>
              
              <View style={{display: 'flex', flexDirection: 'column'}}>
                
                <View style={{flexDirection: 'row'}}>
                    <View >
                        <Image source={wineBtlePic} style={{height: 102, width: 41, marginLeft: 20}}/>
                    </View>

                    <View>
                        <Text style={{ fontFamily: 'MontaguSlab_120pt-Regular', fontSize: 18, color: '#CDA15C', marginLeft: 20, marginRight: 50, }}> Cline Family Cellars Farmhouse Red </Text>
                        <Text style={{ marginLeft: 20, fontFamily: 'Inter-Bold', fontSize: 14, color: '#3F0321', marginLeft: 20, marginRight: 20, marginTop: 10, }}> Sonoma, CA 2018</Text> 
                    </View>
                </View>

                <View style={{flexDirection: 'row', backgroundColor: '#FFFFFF', alignItems: 'center', marginTop: 20}}>
                    <View style={{width: 216,height: 44, alignItems: 'center', flexDirection: 'row', justifyContent: 'space-between',backgroundColor: '#D8CBD1',borderRadius: 12, marginLeft: 20}}>
                        <Pressable onPress={onPressDecrimentBtn}><View style={{height: 44, width: 44, backgroundColor: '#3F0321', alignItems: 'center', justifyContent: 'center', borderRadius: 12}}><Image source={miniMinusBtn} resizeMode='cover'  style={{height: 2, width: 10}}/></View></Pressable>
                        <Text style={{fontFamily: 'Inter-Bold', fontSize: 16, color: '#3F0321'}}>{num}</Text>
                        <Pressable onPress={onPressIncreamentBtn}><View style={{height: 44, width: 44, backgroundColor: '#3F0321', alignItems: 'center', justifyContent: 'center', borderRadius: 12}}><Image source={miniPlusBtn} resizeMode='cover'  style={{height: 10, width: 10}}/></View></Pressable>
                        
                    </View>
                   
                    <View>
                        <Text style={{ marginLeft: 20, fontFamily: 'Inter-Bold', fontSize: 16, color: '#3F0321'}}>$ {vinePrice.toFixed(2)}</Text>
                    </View>
                        
                </View>
                
              </View>
            </View> 
        </View>
        
        <Pressable onPress={onPressChkoutBtn}>
        <View style={{height: 62, width: 368, backgroundColor: '#3F0321', alignItems: 'center', justifyContent: 'center', borderRadius: 12, marginTop: 280}}>
            <Text style={{fontFamily: 'Inter-Bold', fontSize: 16, color: '#FFFFFF'}}>CHECKOUT</Text>
        </View></Pressable>
        </View>
</View>
  );
};

export default CartScreenOne;

const styles = StyleSheet.create({
    root:{
        flex: 1,
        backgroundColor: '#FFFFFF',
        // alignItems: 'center',
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
        justifyContent: 'space-between',
        marginTop: 20,
        marginLeft: 20,
    },
    wineDetailContainer: {
        width: '100%',
        alignItems: 'center',
        backgroundColor: '#FFFFFF',
      },
      wineDetailsContainerChild: {
        width: 368,
        height: 213,
        backgroundColor: '#FFFFFF',
        flexDirection: 'row',
        alignItems: 'center',
        borderRadius: 12,
        marginVertical: 20,

        shadowColor: "#D9D9D9",
shadowOffset: {
	width: 0,
	height: 5,
},
shadowOpacity: 0.34,
shadowRadius: 6.27,

elevation: 10,
      },
      reviewContainer: {
        marginHorizontal: 20,
        marginBottom: 40,
      },

});