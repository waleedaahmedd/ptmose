import { View, Text, StyleSheet, TextInput, Image } from 'react-native'
import React from 'react'
import { Controller } from 'react-hook-form';

const CustomInput = ({
  control, 
  name, 
  rules = {},
  placeholder, 
  secureTextEntry, 
  setsource
}) => {
  return (
    

          <Controller 
            control={control}
            name={name}
            rules={rules}
            render={({field: {value, onChange, onBlur}, fieldState: {error}}) => (
              <>
              <View 
                style={[
                  styles.container, 
                  {borderColor: error ? 'red' : '#D9D9D9'},
                  ]}>
                <Image source={setsource}
                  style={styles.ImageStyle}/>
              <TextInput 
                value={value}
                onChangeText={onChange}
                onBlur={onBlur}
                placeholder={placeholder}
                style={styles.input}
                secureTextEntry={secureTextEntry} 
                />
                </View>
                {error && (
                  <Text style={{color: 'red', alignSelf: 'stretch'}}>{error.message || 'Error'}</Text>
                )}
                </>
              )}
          />
         
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
        marginVertical: 5,
        underlineColorAndroid: "transparent",
        flexDirection: 'row',
        justifyContent: 'center',
        alignItems: 'center',
      },
    input:{
      padding: 15,
      fontFamily: 'Inter-Bold',
      fontSize: 14 ,
      letterSpacing: 1,
      flex: 1,
    },
    ImageStyle: {
      margin: 15,
      height: 18,
      width: 18,
      resizeMode: 'contain',
  },
});

export default CustomInput;