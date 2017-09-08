import React from 'react';
import PropTypes from 'prop-types';
import { connect } from 'react-redux';
import { addNavigationHelpers, StackNavigator } from 'react-navigation';

import LoginScreen from '../components/LoginScreen';
import MainScreen from '../components/MainScreen';
import DealsScreen from '../components/DealsScreen';

export const AppNavigator = StackNavigator({
  Login: { 
    path: 'login',
    screen: LoginScreen,
  },
  Main: { 
    path: 'main',
    screen: MainScreen 
  },
  Deals: {
    path: 'deals',
    screen: DealsScreen 
  },
}, {
  headerMode: 'none'
});

const AppWithNavigationState = ({ dispatch, nav }) => (
  <AppNavigator navigation={addNavigationHelpers({ dispatch, state: nav })} />
);

AppWithNavigationState.propTypes = {
  dispatch: PropTypes.func.isRequired,
  nav: PropTypes.object.isRequired,
};

const mapStateToProps = state => ({
  nav: state.nav,
});

export default connect(mapStateToProps)(AppWithNavigationState);