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
import watch from '../../../assets/images/watch.png';
import SectionSlides from './SectionSlides';

import {useNavigation} from '@react-navigation/native';

const ListItem = ({ item }) => {
  const { width } = useWindowDimensions();

  const navigation = useNavigation();

  const onPressWineriesSliderElements = () => {
    navigation.navigate('WineryDetailsScreen');
    // console.warn('onPressWineriesSliderElements');
  };

  return (

    <Pressable onPress={onPressWineriesSliderElements}>
    <View style={styles.root}>
    <View style={styles.containers}>
      <View style={styles.containerChild}>
      <View><Image source={item.image} style={[styles.image,{resizeMode: 'cover' }]}/></View>
      <View style={styles.eventInfoPort}>
        <View><Text style={{fontSize: 18, fontFamily: 'MontaguSlab_120pt-Regular', color: '#CDA15C', marginRight: 170,}}>{item.title}</Text></View>
        <View><Text style={{fontSize: 14, fontFamily: 'Inter-Regular',marginRight: 150, marginTop: 10,}}>{item.decs}</Text></View>
        <View style={styles.timeEvent}>
          <View><Image source={watch} resizeMode= 'contain' style={styles.timeImage}></Image></View>
          <View><Text style={{fontSize: 14, fontFamily: 'Inter-Regular',}}>{item.time}</Text></View>
          </View>
      </View>
      </View>
    </View>
</View>
</Pressable>
  );
};

export default () => {
  return (
    <View style={styles.root}>
      <StatusBar style="light" />
        <SectionList
          contentContainerStyle={{ paddingHorizontal: 0 }}
          stickySectionHeadersEnabled={false}
          sections={SectionSlides}
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
        backgroundColor: '#FFFFFF',
    },
containers:{
    alignItems: 'center',
    width: '100%',
    marginTop: -5,
    borderRadius: 12,
  },
  containerChild:{
    borderRadius: 12,
    backgroundColor: '#FFFFFF',
    margin: 10,
    width: '90%',
    display: 'flex',
    flexDirection: 'row',
   
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
    marginRight: 15,
    height: 170,
    width: 100,
    borderTopLeftRadius: 12,
    borderBottomLeftRadius: 12,
  },
  eventInfoPort: {
    display: 'flex',
    flexDirection: 'column',
  },
  timeEvent: {
    marginTop: 10,
    display: 'flex',
    flexDirection: 'row',
    alignItems: 'center',
  },
  timeImage: {
    height: 18,
    width: 18,
    marginRight: 20,
  },
});