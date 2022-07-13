import { StyleSheet, Text, View, FlatList, Animated, TouchableOpacity, Pressable, onPress } from 'react-native'
import React, { useState, useRef} from 'react';
import CrouselItems from './CrouselItems';
import featureItemSlides from './slides';

import {useNavigation} from '@react-navigation/native';
// import Pressable from 'react-native/Libraries/Components/Pressable/Pressable';


export default FeaturedEventsCrousel = () => {

  const navigation = useNavigation();

  const [currentIndex, setCurrentIndex] = useState(0);

    const scrollX = useRef (new Animated.Value(0)).current;
    const featureItemSlidesref =useRef(null);

    const viewableItemsChange = useRef(({ viewableItems }) => {
        setCurrentIndex(viewableItems[0].index);
    }).current;

    const viewConfig = useRef({ viewAreaCoveragePercentageThreshold: 50 }).current;



  return (
    
    <View style={styles.root}>
      <FlatList 
      data={featureItemSlides} 
      renderItem= {({ item }) => <CrouselItems item={item} />}
      horizontal
      showsHorizontalScrollIndicator={false}
      pagingEnabled
      bounces={false}
      keyExtractor = {(item) => item.id}
      onScroll = {Animated.event([{ nativeEvent: { contentOffset: { x: scrollX } } } ] , {
          useNativeDriver: false,
      })}
      scrollEventThrottle={32}
      // onViewableItemsChanged={viewableItemsChange}
      viewabilityConfig={viewConfig}
      ref={featureItemSlidesref}
      />
    </View>
  );
 };


const styles = StyleSheet.create({
    root: {
      },
});