/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 *
 * Generated with the TypeScript template
 * https://github.com/react-native-community/react-native-template-typescript
 *
 * @format
 */

import { NavigationContainer } from "@react-navigation/native";
import React from "react";
import { StatusBar, View } from "react-native";
import Route from "./router/index.route";

const App = () => {
  return (
    <NavigationContainer>
      <StatusBar barStyle="light-content" backgroundColor="#000000" />
      <View style={{ flex: 1, backgroundColor: "#ffffff" }}>
        <Route />
      </View>
    </NavigationContainer>
  );
};

export default App;
