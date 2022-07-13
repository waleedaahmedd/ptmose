import { StyleSheet, Text, View } from 'react-native'
import React from 'react'
import { Controller } from 'react-hook-form';

const CustomInput = () => {
  return (
    <View style={styles.container}>
      <TextInput
      values={values}
      onChangeText={setValues}
      placeholder={placeholder}
      style={styles.input}
      secureTextEntry={secureTextEntry} 
    />
    </View>
  );
};

const styles = StyleSheet.create({
    container:{
        backgroundColor: '#FFFFFF',
        width: '100%',
        borderColor: '#D9D9D9',
        borderWidth: 1,
        borderRadius: 12,
        paddingHorizontal: 10,
        marginVertical: 10,
      },
    input:{
      padding: 15,
      fontFamily: 'Inter-Bold',
      fontSize: 16 ,
      letterSpacing: 1,
    },
})
export default CustomInput;