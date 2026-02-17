/**
 * Sample React Native App
 * @format
 */

import { useCallback, useState } from 'react';
import {
  Button,
  StatusBar,
  StyleSheet,
  TextInput,
  useColorScheme,
  View,
} from 'react-native';
import { SafeAreaProvider } from 'react-native-safe-area-context';
import NativeToast from './specs/NativeToast';

function App() {
  const isDarkMode = useColorScheme() === 'dark';
  const [message, setMessage] = useState('Olá do módulo nativo!');

  const showToast = useCallback(() => {
    NativeToast.showToast(message || 'Toast');
  }, [message]);

  return (
    <SafeAreaProvider>
      <StatusBar barStyle={isDarkMode ? 'light-content' : 'dark-content'} />
      <View style={styles.container}>
        <TextInput
          style={styles.input}
          value={message}
          onChangeText={setMessage}
          placeholder="Mensagem do toast"
          placeholderTextColor="#999"
        />
        <Button title="Mostrar Toast" onPress={showToast} />
      </View>
    </SafeAreaProvider>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    padding: 24,
    gap: 16,
  },
  input: {
    borderWidth: 1,
    borderColor: '#ccc',
    borderRadius: 8,
    padding: 12,
    fontSize: 16,
  },
});

export default App;
