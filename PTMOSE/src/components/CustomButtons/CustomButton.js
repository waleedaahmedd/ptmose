import { View, Text, StyleSheet } from 'react-native'
import React from 'react'
import Pressable from 'react-native/Libraries/Components/Pressable/Pressable';
import { Controller } from 'react-hook-form';

const CustomButton = ({ onPress, text, type }) => {
    return (
      <Pressable 
      onPress={onPress} 
      style={[styles.container, styles[`container_${type}`]]}>
        <Text style={[styles.text , styles[`text_${type}`]]}>{text}</Text>
      </Pressable>
    );
  };
    const styles = StyleSheet.create({
    container: {        
        width: '100%',
        padding: 5,
        // marginVertical: 5,
        alignItems: 'center',
        borderRadius: 5,
    },
    container_PRIMARY: {
        backgroundColor: '#3B71F3',
        
    },
    container_TERTIARY: {
        color:'#3F0321',
        alignItems: 'flex-end',
        fontSize: 16,
    },
    text: {
        color: 'white',
    },
    text_TERTIARY: {
        fontFamily: 'Inter-Bold',
        fontSize: 16,
        textAlign: 'right',
        color:'#3F0321',
        marginRight: -12,
    },
})

export default CustomButton;