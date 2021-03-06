
import React from 'react';
import { AppRegistry } from 'react-native';
import { Provider } from 'react-redux';
import { createStore } from 'redux';

import AppReducer from './app/reducers';
import AppWithNavigationState from './app/navigators/AppNavigator';

export default class frontend extends React.Component {
  store = createStore(AppReducer)

  render() {
    return (
      <Provider store={this.store}>
        <AppWithNavigationState />
      </Provider>
    );
  }
}

AppRegistry.registerComponent('frontend', () => frontend);