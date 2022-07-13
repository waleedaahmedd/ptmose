import { StyleSheet, Text, View } from 'react-native'
import React from 'react'
import { Controller } from 'react-hook-form';

import MyReservationConfirmedScreen from '../../screens/MyReservationConfirmedScreen';
import MyReservationUnconfirmedScreen from '../../screens/MyReservationUnconfirmedScreen';

const ReservationScreen = () => {
  return (
    <View style={styles.root}>
      <View style={styles.ReservationSlectorMainBody}>
          <View style={styles.ConfirmedBtn}></View>
          <View style={styles.UnconfirmedBtn}></View>
      </View>
    </View>
  )
}

export default ReservationScreen

const styles = StyleSheet.create({
    root:{
        height: '100%',
        height: '100%',
        backgroundColor:'#FFFFFF',
        alignItems: 'center',
    },
    ReservationSlectorMainBody:{
        height: 62,
        width: 368,
        backgroundColor: '#C3B2BA',
        borderRadius: 12,
        marginTop: 20,
    }
})
