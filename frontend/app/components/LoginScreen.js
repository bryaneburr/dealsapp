import React from 'react';
import PropTypes from 'prop-types';
import { StyleSheet } from 'react-native';
import { TextInput, Title, Subtitle, Button, Text, Divider, View, Icon } from '@shoutem/ui';

const styles = {
  container: {
    flex: 1,
    justifyContent: 'center'
  },
  title: {
    textAlign: 'center',
    fontWeight: '700'
  },
  subtitle: {
    textAlign: 'center',
    fontStyle: 'italic'
  }
}

const LoginScreen = ({ navigation }) => (
  <View style={styles.container} styleName="lg-gutter-horizontal">
    <Icon name="pin" />
    <Title style={styles.title}>
      Gachu
    </Title>
    <Subtitle style={styles.subtitle}>
      Easy Local Deals
    </Subtitle>
    <Divider />
    <TextInput
      placeholder={'Email or Phone Number'}
      autoCapitalize={'none'}
    />
    <Divider />
    <TextInput
      placeholder={'Password'}
      secureTextEntry
    />
    <Divider />
    <Button 
      styleName="dark"
      onPress={() => navigation.dispatch({ type: 'Login' })}>
      <Text>
        Login
      </Text>
    </Button>
    <Divider />
    <Button 
      styleName="clear action">
      <Text>
        Sign Up
      </Text>
    </Button>
  </View>
);

LoginScreen.propTypes = {
  navigation: PropTypes.object.isRequired,
};

LoginScreen.navigationOptions = {
  title: 'Log In',
};

export default LoginScreen;