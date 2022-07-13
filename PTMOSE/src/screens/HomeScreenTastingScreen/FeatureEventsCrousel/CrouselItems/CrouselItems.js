import { StyleSheet, Text, View, FlatList, useWindowDimensions, Image, Pressable, onPress } from 'react-native'
import React from 'react';
import slides from '../slides';
import {useNavigation} from '@react-navigation/native';

import calendar from '../../../../../assets/images/calendar.png';
import watch from '../../../../../assets/images/watch.png';
import location from '../../../../../assets/images/LocationLogo.png';
// import Pressable from 'react-native/Libraries/Components/Pressable/Pressable';

export default CrouselItems = ({ item }) => {

  const navigation = useNavigation();

  const { width } = useWindowDimensions();
  

  const onPressEvent = () => {
    navigation.navigate('EventsDetailsScreen');
  };


  return (
    
  <View style={[styles.root, { width }]}>
    <View style={styles.SliderContainer}>
      
      
      <Image source={item.image} style={[styles.image, {resizeMode: 'cover' }]} />
      
      <Pressable
      onPress={onPressEvent}>
      <View style={styles.TextContainer}>
      <Text style={styles.marchant}>{item.marchant}</Text>
      <Text style={styles.title}>{item.title}</Text>
     
      
      <View style={styles.textandPicCollider}>
        <View style={styles.calendarIMG}>
          <Image source={calendar} resizeMode='stretch' style={styles.imgSize}/>
        </View>

        <View>
          <Text style={styles.calendarText}>{item.date}</Text>
        </View>
      </View>
      
      <View style={styles.textandPicCollider}>
        <View style={styles.timeIMG}>
          <Image source={watch} resizeMode= 'stretch' style={styles.imgSize}/>
        </View>
          
        <View>
          <Text style={styles.timetext}>{item.time}</Text>
        </View>
      </View>


      <View style={styles.textandPicCollider}>
        <View style={styles.locationIMG}>
          <Image source={location}  resizeMode='stretch' style={styles.imgSize}/>
        </View>
        
        <View>
          <Text style={styles.locationtext}>{item.location}</Text>
        </View>


        
      </View>
      <View style={styles.locationtextmarginonly}></View>
      </View></Pressable>
      
    </View>
   
  </View> 
    );
};

const styles = StyleSheet.create({
  root: {
    alignItems: 'center',
  },
  SliderContainer: {
    alignItems: 'center',
    backgroundColor: '#FFFFFF',
    marginTop: 10,
    width: '90%',
    marginBottom: 20,
    borderRadius: 20,

    shadowColor: "#000",
      shadowOffset: {
        width: 0,
        height: 6,
        },
    shadowOpacity: 0.37,
    shadowRadius: 7.49,
    elevation: 12,
},
  image: {
    width: '100%',
    height: 200,
    borderTopRightRadius: 20,
    borderTopLeftRadius: 20,
    // borderRadius: 20,
  },
  TextContainer: {
    marginLeft: 30,
  },
  marchant:{
    fontFamily: 'Inter-Bold',
    fontSize: 16,
    color: '#3F0321',
    marginTop: 10,
  },
  title: {
    fontSize: 28,
    marginBottom: 10,
    color: '#CDA15C',
    fontFamily: 'MontaguSlab_120pt-Regular',
    // paddingRight: 80,
  },
  textandPicCollider: {
    display: 'flex',
    flexDirection: 'row',
    alignItems: 'center',
    marginBottom: 5,
    marginRight: 60,
  },
  calendarIMG: {
    paddingRight: 10,
  },
  imgSize:{
    width:  14,
    height: 14,
  },
  calendarText:{
    fontFamily: 'Inter-Regular',
    fontSize: 14,
    color: '#777080',
  },
  timeIMG: {
    paddingRight: 10,
  },
  timetext:{
    fontFamily: 'Inter-Regular',
    fontSize: 14,
    color: '#777080',
  },
  locationIMG: {
    paddingRight: 10,
  },
  locationtext:{
    fontFamily: 'Inter-Regular',
    fontSize: 14,
    color: '#777080',
  },
  locationtextmarginonly:{
    marginBottom: 10,
  }
});