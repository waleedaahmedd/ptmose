import { StyleSheet, Text, View, FlatList, Pressable, onPress, Button, ScrollView, Animated } from 'react-native';
import React, { useState, useRef} from 'react';
import OnBoardingCrouselScreenItem from './OnBoardingCrouselScreenItem';
import slides from './slides';
import { useNavigation } from '@react-navigation/native';
import Paginator from './Paginator';

export default OnBoardingCrouselScreen = () => {
  const navigation = useNavigation();

  const [currentIndex, setCurrentIndex] = useState(0);
  const scrollX = useRef(new Animated.Value(0)).current;
  const slidesRef = useRef(null);
 
  const onClickFunc = () => {
    if(slides.id == "5"){
      navigation.navigate('HomeScreen');
    }
  };

  const viewableItemChanged = useRef (({ viewableItems }) => {
    setCurrentIndex(viewableItems[0].index);
  }).current

  const viewConfig = useRef({ viewAreaCoveragePercentThreshold: 50}).current

  return (
    <View style={styles.rootView } >
      <View style={{ flex:3 }}>
      <FlatList data={slides} renderItem={({item}) => <OnBoardingCrouselScreenItem item={item} />} 
      horizontal
      showsHorizontalScrollIndicator={false}
      pagingEnabled
      bounces={false}
      keyExtractor={(item) => item.id} 
      onScroll={Animated.event([{ nativeEvent: { contentOffset: { x: scrollX } } }],{
          useNativeDriver: false,
      })}
      scrollEventThrottle={32}
      onViewableItemsChanged={viewableItemChanged}
      viewabilityConfig={viewConfig}
      ref={slidesRef}
      />
      </View>
      <Paginator data={slides} scrollX={scrollX}/>
    </View>
  );
};

const styles = StyleSheet.create({
  rootView: {
    width: '100%',
    height: '100%',
    backgroundColor: '#3F0321',
    alignItems: 'center'
  },

});