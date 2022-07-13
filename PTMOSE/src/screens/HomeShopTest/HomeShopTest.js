import { StyleSheet, Text, View } from 'react-native'
import React from 'react'

const HomeShopTest = () => {
  return (
    <View style={styles.root}>
      <Text>HomeShopTest</Text>
    </View>
  );
};

export default HomeShopTest;

const styles = StyleSheet.create({
  root:{
    height: '100%',
    width: '100%',
    alignItems: 'center',
    justifyContent: 'center',
  }
});