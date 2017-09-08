import React from 'react';
import { StyleSheet, Text, View, Button } from 'react-native';

import AuthButton from './AuthButton';

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: '#F5FCFF',
  },
  welcome: {
    fontSize: 20,
    textAlign: 'center',
    margin: 10,
  },
});

const DealsScreen = ({ logout }) => (
  <View style={styles.container}>
    <Text style={styles.welcome}>
      Deals Screen
    </Text>
    <AuthButton />
  </View>
);

export default DealsScreen;