import { StyleSheet, Text, View } from 'react-native'
import React from 'react'

const HomeTastingTest = () => {
  return (
    <View style={styles.root}>
      <Text>HomeTastingTest</Text>
    </View>
  );
};

export default HomeTastingTest;

const styles = StyleSheet.create({
  root:{
    height: '100%',
    width: '100%',
    alignItems: 'center',
    justifyContent: 'center',
  }
});