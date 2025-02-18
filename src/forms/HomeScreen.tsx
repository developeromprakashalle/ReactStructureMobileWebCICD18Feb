import React from 'react';
import { View, Text, StyleSheet, Image } from 'react-native';
// Import image
import logo from '../../assets/images/logo.png';


const HomeScreen = () => {
  return (
    <View style={styles.container}>
      <Image source={logo} style={styles.logo} />
      <Text style={styles.title}>Welcome to Home Page!</Text>
    </View>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: '#f5f5f5',
  },
  title: {
    fontSize: 24,
    fontWeight: 'bold',
    color: '#333',
  },
  logo: {
    width: 200, // Adjust size as needed
    height: 200,
    resizeMode: 'contain',
  },
});

export default HomeScreen;
