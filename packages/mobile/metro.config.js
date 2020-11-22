/**
 * Metro configuration for React Native
 * https://github.com/facebook/react-native
 *
 * @format
 */
const {resolve} = require('path');
module.exports = {
  projectRoot: resolve(__dirname, '.'),
  watchFolders: [resolve(__dirname, '../../node_modules')],
  transformer: {
    getTransformOptions: async () => ({
      transform: {
        experimentalImportSupport: false,
        inlineRequires: false,
      },
    }),
  },
};
