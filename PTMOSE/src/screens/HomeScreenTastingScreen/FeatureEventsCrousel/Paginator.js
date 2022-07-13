import { StyleSheet, View, Animated, useWindowDimensions } from 'react-native'
import React from 'react'


export default Paginator = ({ data, scrollX }) => {
    const { width } = useWindowDimensions();

  return (
    <View style={{flexDirection: 'row', height: 64}}>
        {data.map((_, i) => {
            const inputRange = [( i - 1 ) * width, i * width, (i + 1) * width];

            const dotWidht = scrollX.interpolate({
                inputRange,
                outputRange: [10,20,10],
                extrapolate: 'clamp',
            })
            return <View style={[styles.dot, { width: 10 }]} key={i.toString()}/>;
            
        })}
      {/* <Text>Paginator</Text> */}
    </View>
  );
};

// export default Paginator;

const styles = StyleSheet.create({
    dot: {
        height: 10,
        borderRadius: 5,
        backgroundColor: '#493d8s',
        marginHorizontal: 8,
    }
});