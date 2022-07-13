import { StatusBar } from 'expo-status-bar';
import React from 'react';
import {
  StyleSheet,
  Text,
  View,
  SectionList,
  SafeAreaView,
  Image,
  useWindowDimensions,
  Pressable,
  onPress
} from 'react-native';

import SliderItems from './ReviewTheWinesSliderItems';

import { useNavigation } from '@react-navigation/native';

import { useForm, Controller } from 'react-hook-form';


  const ListItem = ({ item }) => {

    const {
      control, 
      handleSubmit, 
      formState: {error}
    } = useForm();

    const navigation = useNavigation();

    const onPressWineSliderItem = () => {
      // navigation.navigate('WineDetailsScreen');
      console.warn('onPressMenuBtn');
    };

    const onPressReviewTheWinesSliderItems = () => {
      navigation.navigate('WineDetailsScreen');
      // console.warn('onPressReviewTheWinesSliderItems');
    };
    
  
    const { width } = useWindowDimensions();
    return (
  
  <View style={styles.root}>

        <Pressable onPress={onPressReviewTheWinesSliderItems}>
        <View style={styles.containerChild}>
        <Image source={item.image} style={[styles.image,{resizeMode: 'cover', height: 148, width: 60, marginTop:10 }]}/>
        <Text style={{fontSize: 14, fontFamily: 'MontaguSlab_120pt-Regular', color: '#CDA15C', marginHorizontal: 20, textAlign: 'center'}}>{item.title}</Text>
        </View></Pressable>
  
  </View>
    );
  };

    export default () => {
      return (
        <View>
          <StatusBar />
            <SectionList
              horizontal={true}
              sections={SliderItems}
              showsHorizontalScrollIndicator={false}
              renderSectionHeader={({ section }) => (
                <Text style={styles.sectionHeader}></Text>
              )}
              renderItem={({ item, section }) => {
                return <ListItem item={item} />;
              }}
            />
        </View>
      );
    };

const styles = StyleSheet.create({
  root: {
    alignItems: 'center',
    backgroundColor: '#D9D9D9',
},
containerChild:{
height: 240,
width: 210,
borderRadius: 12,
backgroundColor: '#FFFFFF',
marginLeft: 20,
alignItems: 'center',

shadowColor: "#D9D9D9",
shadowOffset: {
  width: 0,
  height: 12,
},
shadowOpacity: 0.58,
shadowRadius: 16.00,
elevation: 24,
},

image: {
height: 148,
width: 60,
},
})