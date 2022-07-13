import { StyleSheet, Text, View } from 'react-native';
import React from 'react';

import { NavigationContainer } from '@react-navigation/native';
import Tabs from '../../components/TabNav/tabs';

const TabNavigation = () => {
  return (
   <NavigationContainer>
       <Tabs />
   </NavigationContainer>
  );
};

export default TabNavigation;

const styles = StyleSheet.create({});