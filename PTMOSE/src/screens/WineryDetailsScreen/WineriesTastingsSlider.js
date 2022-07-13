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
import calendar from '../../../assets/images/calendar.png';
import watch from '../../../assets/images/watch.png';
import bookmarkBtnImg from '../../../assets/images/bookmarkBtnImg.png';

import SectionSlides from './SectionSlides';

import { useNavigation } from '@react-navigation/native';

const ListItem = ({ item }) => {

  const navigation = useNavigation();

    const { width } = useWindowDimensions();

    const onPressWineryDetailsTastingSliderEliments = () => {
      // console.warn('onPressWineryDetailsTastingSliderEliments');
      navigation.navigate('EventsDetailsScreen');
    };


    const onPressTastingSliderReserveBtn = () => {
      console.warn('onPressTastingSliderReserveBtn');
      // navigation.navigate('HomeScreen');
    };

    const onPressTastingSliderBookmarkBtn = () => {
      // console.warn('onPressTastingSliderBookmarkBtn');
      navigation.navigate('EventsDetailsScreen');
    };

    
    return (
  

      <Pressable onPress={onPressWineryDetailsTastingSliderEliments}>
      <View style={styles.root}>
      <View style={styles.containers}>
        <View style={styles.containerChild}>
        <View>

        
          <Image source={item.image} style={[styles.image,{resizeMode: 'cover' }]}/></View> 
        
        <View style={styles.eventInfoPort}>
          
          <View><Text style={{fontSize: 18, fontFamily: 'MontaguSlab_120pt-Regular', color: '#CDA15C', marginTop: 20}}>{item.title}</Text></View>
          
           <View style={styles.timeEvent}>
                <View><Image source={calendar} resizeMode= 'contain' style={styles.timeImage}></Image></View>
                <View><Text style={{fontSize: 14, fontFamily: 'Inter-Regular',}}>{item.date}</Text></View>
            </View>

          <View style={styles.timeEvent}>
            <View><Image source={watch} resizeMode= 'contain' style={styles.timeImage}></Image></View>
            <View><Text style={{fontSize: 14, fontFamily: 'Inter-Regular',}}>{item.time}</Text></View>
          </View>

          <View style={styles.SliderBtnContainer}>

            <Pressable onPress={onPressTastingSliderReserveBtn}>
              <View style={styles.reserveBtnContainer}>
                  <Text style={{fontFamily: 'Inter-Bold',fontSize: 12, color: '#FFFFFF', letterSpacing: 1}}>RESERVE</Text>
              </View>
            </Pressable>

            <Pressable onPress={onPressTastingSliderBookmarkBtn}>
              <View style={styles.bookmarkBtnContainer}>
                  <Image source={bookmarkBtnImg}  style={{height: 16, width: 14}} resizeMode='contain' />
              </View>
            </Pressable>

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
      <View>
        <StatusBar style="light" />
          <SectionList
            contentContainerStyle={{ paddingHorizontal: 0 }}
            stickySectionHeadersEnabled={false}
            showsHorizontalScrollIndicator={false}
            sections={SectionSlides}
            horizontal={true}
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
          // alignItems: 'center',
          backgroundColor: '#FFFFFF',
      },
  containers:{
      alignItems: 'center',
      marginTop: -5,
      borderRadius: 12,
    },
    containerChild:{
      borderRadius: 12,
      backgroundColor: '#FFFFFF',
      margin: 10,
      width: '90%',
      display: 'flex',
      height: 314,
      width: 287,
     
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
      height: 104,
      width: 287,
      borderTopLeftRadius: 12,
      borderTopRightRadius: 12,
    },
    eventInfoPort: {
        marginHorizontal: 20,
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
    SliderBtnContainer:{
        alignItems: 'center',
        flexDirection: 'row',
        justifyContent: 'space-around',
        marginTop: 20,
    },
    reserveBtnContainer:{
        height: 43,
        width: 194,
        backgroundColor: '#3F0321',
        borderRadius: 12,
        alignItems: 'center',
        justifyContent: 'center',
    },
    bookmarkBtnContainer:{
        height: 43,
        width: 43,
        backgroundColor: '#3F0321',
        borderRadius: 12,
        alignItems: 'center',
        justifyContent: 'center',
    }
  });