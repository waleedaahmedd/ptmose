import { StatusBar } from 'expo-status-bar';
import React from 'react';
import {
  StyleSheet,
  Text,
  View,
  SectionList,
  Image,
  Pressable,
  onPress,
} from 'react-native';
import ShopWineSlides from './ShopWineSlides';

import { useNavigation } from '@react-navigation/native';

const ListItem = ({ item }) => {

  const navigation = useNavigation();

  const onPressShopWineSliderEliments = () => {
    // console.warn('onPressShopWineSliderEliments');
    navigation.navigate('WineDetailsPurchaseScreen');
  };


  return (

    <Pressable onPress={onPressShopWineSliderEliments}>
    <View style={styles.root}>
    
    <View style={styles.containers}>
      
      <View style={styles.containerChild}>
        
        <View style={{marginLeft: 20,alignItems: 'center', justifyContent: 'center', backgroundColor: '#FFFFFF', borderTopLeftRadius: 12, borderBottomLeftRadius: 12}}>
          <Image source={item.image} style={[styles.image,{resizeMode:'cover' }]}/>
        </View>
      
        <View style={styles.eventInfoPort}> 
            <View>
                <Text style={{fontSize: 18, fontFamily: 'MontaguSlab_120pt-Regular', color: '#CDA15C'}}>{item.title}</Text>
                <Text style={{fontSize: 14, fontFamily: 'Inter-Bold', color: '#3F0321', marginTop: 10}}>{item.winery}</Text>
                <Text style={{fontSize: 14, fontFamily: 'Inter-Regular', color: '#3F0321'}}>{item.year}</Text>
            </View>
        </View>

        <View View style={{display: 'flex', flexDirection: 'column', justifyContent: 'flex-end'}}>
            <View style={{height: 56, width: 75, backgroundColor: '#CDA15C', alignItems: 'center', justifyContent: 'center', borderBottomRightRadius: 12}}>
               <Text style={{fontSize: 14, fontFamily: 'Inter-Bold', color: '#000000'}}>${item.price}</Text>
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
          sections={ShopWineSlides}
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
  },
  containerChild:{
    backgroundColor: '#FFFFFF',
    borderRadius: 12,
    flexDirection: 'row',
    marginBottom: 20,
    height: 144,
    width: 368,
    shadowColor: "#D9D9D9",
    justifyContent: 'space-between',
    
    
    shadowOffset: {
    width: 0,
    height: 12,
},
    shadowOpacity: 0.58,
    shadowRadius: 16.00,
    elevation: 24,
},

image: {
    height: 102,
    width: 41,
  },
  eventInfoPort: {
    marginLeft: 20,
    width: '55%'
  },
});